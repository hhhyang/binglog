package com.binglog.controller;

import com.binglog.domain.Article;
import com.binglog.repo.ArticleRepo;
import com.vladsch.flexmark.ext.anchorlink.AnchorLinkExtension;
import com.vladsch.flexmark.ext.autolink.AutolinkExtension;
import com.vladsch.flexmark.ext.emoji.EmojiExtension;
import com.vladsch.flexmark.ext.gfm.issues.GfmIssuesExtension;
import com.vladsch.flexmark.ext.gfm.strikethrough.StrikethroughExtension;
import com.vladsch.flexmark.ext.gfm.tasklist.TaskListExtension;
import com.vladsch.flexmark.ext.gfm.users.GfmUsersExtension;
import com.vladsch.flexmark.ext.jekyll.tag.JekyllTagExtension;
import com.vladsch.flexmark.ext.tables.TablesExtension;
import com.vladsch.flexmark.ext.toc.SimTocExtension;
import com.vladsch.flexmark.ext.toc.TocExtension;
import com.vladsch.flexmark.html.HtmlRenderer;
import com.vladsch.flexmark.parser.Parser;
import com.vladsch.flexmark.parser.ParserEmulationProfile;
import com.vladsch.flexmark.util.KeepType;
import com.vladsch.flexmark.util.ast.Node;
import com.vladsch.flexmark.util.options.MutableDataSet;
import org.jsoup.Jsoup;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import java.util.Arrays;
import java.util.List;

@Controller
public class BingController {

    private static final Logger LOG = LoggerFactory.getLogger(BingController.class);

    @Autowired
    private ArticleRepo articleRepo;

    private final Parser parser;
    private final HtmlRenderer renderer;

    public BingController() {

        MutableDataSet options = initFlexmarkerOptions();

        parser = Parser.builder(options).build();
        renderer = HtmlRenderer.builder(options).build();

    }

    private MutableDataSet initFlexmarkerOptions() {


        MutableDataSet options = new MutableDataSet();

        // uncomment to set optional extensions
        //options.set(Parser.EXTENSIONS, Arrays.asList(TablesExtension.create(), StrikethroughExtension.create()));

        // uncomment to convert soft-breaks to hard breaks
        //options.set(HtmlRenderer.SOFT_BREAK, "<br />\n");


        options.set(Parser.EXTENSIONS, Arrays.asList(
                TocExtension.create(),
                SimTocExtension.create(),

                AutolinkExtension.create(),
                AnchorLinkExtension.create(),
                EmojiExtension.create(),
                StrikethroughExtension.create(),
                TablesExtension.create(),
                TaskListExtension.create(),
                GfmIssuesExtension.create(),
                GfmUsersExtension.create()
        ));

        options.set(TocExtension.LEVELS, 255);
        options.set(TocExtension.TITLE, "目录");
        options.set(TocExtension.DIV_CLASS, "toc");
        // convert soft-breaks to hard breaks
        // options.set(HtmlRenderer.SOFT_BREAK, "<br />\n");

        // uncomment and define location of emoji images from https://github.com/arvida/emoji-cheat-sheet.com
        // options.set(EmojiExtension.ROOT_IMAGE_PATH, "");

        // Uncomment if GFM anchor links are desired in headings
        // options.set(AnchorLinkExtension.ANCHORLINKS_SET_ID, false);
        // options.set(AnchorLinkExtension.ANCHORLINKS_ANCHOR_CLASS, "anchor");
        // options.set(AnchorLinkExtension.ANCHORLINKS_SET_NAME, true);
        // options.set(AnchorLinkExtension.ANCHORLINKS_TEXT_PREFIX, "<span class=\"octicon octicon-link\"></span>");

        // References compatibility
        options.set(Parser.REFERENCES_KEEP, KeepType.LAST);

        // Set GFM table parsing options
        options.set(TablesExtension.COLUMN_SPANS, false)
                .set(TablesExtension.MIN_HEADER_ROWS, 1)
                .set(TablesExtension.MAX_HEADER_ROWS, 1)
                .set(TablesExtension.APPEND_MISSING_COLUMNS, true)
                .set(TablesExtension.DISCARD_EXTRA_COLUMNS, true)
                .set(TablesExtension.WITH_CAPTION, false)
                .set(TablesExtension.HEADER_SEPARATOR_COLUMN_MATCH, true);

        // Setup List Options for GitHub profile which is kramdown for documents
        options.setFrom(ParserEmulationProfile.GITHUB_DOC);

        return options;
    }

    @GetMapping("/posts")
    public ModelAndView getPosts(Model model) {


        List<Article> articles = articleRepo.findByAuthor("yang");

        for (Article article : articles) {
            updateArticleIfNeeded(article);
        }


        model.addAttribute("articles", articles);
        model.addAttribute("name", "hello");

        return new ModelAndView("user");
    }


    @GetMapping("/p/{id}")
    public ModelAndView getPostById(@PathVariable String id) {

        LOG.error("id: {}", id);
        Article article = articleRepo.findById(id).get();
        LOG.error("id: {}", article.getTitle());
        updateArticleIfNeeded(article);

        return new ModelAndView("post", "article", article);

    }


    private String extractSampleText(final String htmlBody, final int len) {

        String sampleText = Jsoup.parse(htmlBody).text().substring(0, len + 100);
        sampleText = sampleText.replaceAll("\\s+", "").substring(0, len);

        //LOG.info(sampleText);
        return sampleText;

    }

    private String mdTextToHtml(final String mdText) {

        // You can re-use parser and renderer instances
        Node document = parser.parse(mdText);
        String htmlBody = renderer.render(document);  // "<p>This is <em>Sparta</em></p>\n"

        return htmlBody;
    }

    private String extractToc(final String mdText) {

        // You can re-use parser and renderer instances
        // 同时提取目录，解析后的html字符串前面一部分是目录，后面是正文内容
        Node document = parser.parse("[TOC]\n" + mdText);
        String htmlBody = renderer.render(document);  // "<p>This is <em>Sparta</em></p>\n"

        int tocTailPos = htmlBody.indexOf("</div>");
        String toc = htmlBody.substring(0, tocTailPos + 6);

        return toc;


    }

    private Article updateArticleIfNeeded(final Article article) {

        boolean htmlBodyIsEmpty = StringUtils.isEmpty(article.getHtmlBody());
        boolean sampleTextIsEmpty = StringUtils.isEmpty(article.getSampleText());
        boolean tocIsEmpty = StringUtils.isEmpty(article.getToc());
        boolean updated = false;

        htmlBodyIsEmpty = true;
        sampleTextIsEmpty = true;
        tocIsEmpty = true;

        if (htmlBodyIsEmpty) {

            String htmlBody = mdTextToHtml(article.getMdBody());
            article.setHtmlBody(htmlBody);
            updated = true;
        }

        if (sampleTextIsEmpty) {

            String sampleText = extractSampleText(article.getHtmlBody(), 300);
            article.setSampleText(sampleText);

            updated = true;
        }

        if (tocIsEmpty) {

            String toc = extractToc(article.getMdBody());
            article.setToc(toc);

            updated = true;
        }

        if (updated) {
            articleRepo.save(article);
        }

        return article;

    }

}
