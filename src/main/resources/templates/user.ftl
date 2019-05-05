<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Binglog</title>

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

                <div class="main-container-user-info">
                    <div class="main-container-user-image-wrap">
                        <img src="/static/image/apple-icon.png" alt="图片" class="main-container-user-image">
                    </div>

                    <div class="main-container-user-detail">
                        <p class="main-container-user-name">yang</p>
                        <ul class="main-container-user-stat">
                            <li class="main-container-user-stat-item">关注: 692</li>
                            <li class="main-container-user-stat-item">粉丝: 126</li>
                            <li class="main-container-user-stat-item">文章: 3</li>
                            <li class="main-container-user-stat-item">赞: 247</li>
                        </ul>
                    </div>
                </div>

                <main>
                    <#list posts as post>

                        <section id="post-digest-listitem" class="post-digest-listitem">

                            <header id="post-title" class="post-title">
                                <div>
                                    <a href="/p/${post.id}" target="_blank">
                                        <h2>${post.title}</h2>
                                    </a>
                                </div>

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


                            <p>${post.sampleText}......</p>

                        </section>

                    </#list>
                </main>

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