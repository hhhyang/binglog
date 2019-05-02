<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hello ${name}!</title>

    <link rel="shortcut icon" type="image/ico" href="/favicon.ico">

    <link rel="stylesheet" type="text/css" href="/static/css/iview.css">
    <link rel="stylesheet" type="text/css" href="/static/css/github.css">
    <script type="text/javascript" src="/static/js/vue.min.js"></script>
    <script type="text/javascript" src="/static/js/iview.min.js"></script>
    <script type="text/javascript" src="/static/js/highlight.js"></script>

    <link rel="stylesheet" type="text/css" href="/static/css/user.css" charset="UTF-8">

    <#import "layout-macros.ftl" as layoutMacros/>

</head>
<body>
    <div id="app">

        <@layoutMacros.mainNav/>

        <div id="main" class="main">
            <div id="left-side" class="left-side">
                <aside>

                </aside>
            </div>

            <div id="main-container" class="main-container">

                <div>

                    <img src="" alt="图片">
                    <p>yang</p>
                    <ul>
                        <li>关注</li>
                        <li>粉丝</li>
                        <li>文章</li>
                        <li>赞</li>
                    </ul>

                    <main>
                        <#list articles as article>

                            <article>
                                <header>
                                    <a href="/p/${article.id}" target="_blank">
                                        <h1>${article.title}</h1>
                                    </a>
                                </header>

                                <p>${article.sampleText}......</p>

                            </article>

                        </#list>
                    </main>


                </div>



            </div>


            <div id="right-side" class="right-side">
                <aside>

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