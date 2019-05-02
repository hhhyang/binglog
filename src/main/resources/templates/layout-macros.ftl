
<#-- 主navigator的宏定义，可以放在总体布局的顶端-->
<#macro mainNav>


<nav id="main-nav" class="main-nav">

    <!-- 网站图标 -->

    <i-menu mode="horizontal" theme="light">
        <Menu-Item name="1">
            发现
        </Menu-Item>
        <Menu-Item name="2">
            关注
        </Menu-Item>
        <Menu-Item name="3">
            消息
        </Menu-Item>

        <Menu-Item>
            <i-input search enter-button placeholder="搜索..." />
        </Menu-Item>

        <Menu-Item>
            <!-- 用户图标 -->

            <!-- 写文章入口 -->
            <a class="main-nav-write" target="_blank" href="/writer">
                <i class="iconfont ic-write"></i>写文章
            </a>
        </Menu-Item>

    </i-menu>

</nav>



</#macro>

<#macro mainFooter>
<div>

    <Divider></Divider>

    <footer id="main-footer" class="main-footer">
        2011-2016 &copy; Binglog
    </footer>
</div>

</#macro>