<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${post.title}</title>
    <!--
    <link href="/css/main.css" rel="stylesheet">
    -->

    <link rel="stylesheet" type="text/css" href="/static/css/iview.css">
    <link rel="stylesheet" type="text/css" href="/static/css/github.css">
    <link rel="stylesheet" type="text/css" href="/static/third-party/iconfont/iconfont.css">

    <!--
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
    -->
    <!-- 下载到本地后不可用 -->
    <!--
    <link rel='stylesheet' href='/static/css/fontawesome.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
-->
    <script type="text/javascript" src="/static/js/vue.min.js"></script>
    <script type="text/javascript" src="/static/js/iview.min.js"></script>
    <script type="text/javascript" src="/static/js/highlight.js"></script>
    <script type="text/javascript" src="/static/js/jquery.min.js"></script>

    <link rel="stylesheet" type="text/css" href="/static/css/post.css" charset="UTF-8">

    <#import "layout-macros.ftl" as layoutMacros/>

</head>
<body>

<div id="app">

    <@layoutMacros.mainNav/>


    <div id="main" class="main">
        <div id="left-side" class="left-side">
            <div id="left-toc" class="left-toc">
                <aside>
                    ${post.toc}
                </aside>
            </div>
        </div>

        <div id="main-container" class="main-container">

            <main>
                <article>
                    <header id="post-title" class="post-title">
                        <h1><i class='iconfont icon-edit'></i>${post.title}</h1>
                        <ul class="main-container-post-stat">
                            <li class="main-container-post-stat-item">阅读: 692</li>
                            <li class="main-container-post-stat-item">收藏: 126</li>
                            <li class="main-container-post-stat-item">喜欢: 3</li>
                            <li class="main-container-post-stat-item">创建时间: ${post.createTime?string('yyyy-MM-dd HH-mm:ss')}</li>
                        <#--
                        <li class="main-container-post-stat-item">最后更新: ${post.updateTime?string('yyyy-MM-dd HH-mm:ss')}</li>
                        -->
                        </ul>
                    </header>

                    <div id="post-body" class="post-body">
                        ${post.htmlBody}
                    </div>

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
        });


        $(document).ready(function () {
            console.log(window.screen.width);

        });

    </script>

</body>
</html>