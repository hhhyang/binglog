<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Post</title>
    <!--
    <link href="/css/main.css" rel="stylesheet">
    -->

    <link rel="stylesheet" type="text/css" href="/static/css/iview.css">
    <link rel="stylesheet" type="text/css" href="/static/css/github.css">

    <script type="text/javascript" src="/static/js/vue.min.js"></script>
    <script type="text/javascript" src="/static/js/iview.min.js"></script>
    <script type="text/javascript" src="/static/js/highlight.js"></script>

    <link rel="stylesheet" type="text/css" href="/static/css/post.css" charset="UTF-8">

    <#import "layout-macros.ftl" as layoutMacros/>

</head>
<body>

<div id="app">

    <@layoutMacros.mainNav/>


    <div id="main" class="main">
        <div id="left-side" class="left-side">
            <aside>
                ${article.toc}
            </aside>
        </div>

        <div id="main-container" class="main-container">

            <main>
                <article>
                    <header>
                        <h1>${article.title}</h1>
                    </header>

                    <p>${article.htmlBody}</p>

                </article>

            </main>

        </div>

        <div id="right-side" class="right-side">
            <aside>
                <header><h3></h3></header>
            </aside>
        </div>
    </div>


    <@layoutMacros.mainFooter/>

</div>
    <script>

        hljs.initHighlightingOnLoad();

        new Vue({
            el: '#app'
        })
    </script>

</body>
</html>