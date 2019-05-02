
<#-- 主navigator的宏定义，可以放在总体布局的顶端-->
<#macro mainNav>

    <nav id="main-nav" class="main-nav">

        <!-- 网站图标 -->


        <ul id="main-nav-left" class="main-nav-left">
            <li class="main-nav-element">
                <!-- 访问推荐页面 -->
                <a href="/">发现</a>
            </li>
            <li class="main-nav-element">
                <!-- 用户关注的文章和人 -->
                <a href="/subscriptions">关注</a>
            </li>
            <li class="main-nav-element">
                <a href="/notifications">消息</a>
            </li>
            <li class="main-nav-element">
                <form target="_blank" action="/search" accept-charset="UTF-8" method="get">
                    <input type="text" name="q" id="q" autocomplete="false" placeholder="个人搜索">
                </form>
            </li>
        </ul>

        <!-- 用户图标 -->

        <!-- 写文章入口 -->
        <a class="main-nav-write" target="_blank" href="/writer">
            <i class="iconfont ic-write"></i><br>写文章
        </a>

    </nav>

</#macro>

<#macro mainFooter>



</#macro>