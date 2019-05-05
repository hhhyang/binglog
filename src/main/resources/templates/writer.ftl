<!DOCTYPE HTML>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <title>ueditor demo</title>

    <!--
    <link rel="shortcut icon" type="image/png" href="/favicon-96x96.png">
    -->

    <style>

        #ue {
            display: inline-block;
            width: 50%
        }

        #app {
            display: inline-block;
        }

        #test1, #test2 {
            display: inline-block;
            width: 40%;
        }

    </style>

</head>
<body>

    <div id="md-contianer">
        <div id="ue">
            <!-- 加载编辑器的容器 -->
            <script id="container" name="content" type="text/plain">这里写你的初始化内容</script>
        </div>

        <div id="app">
            <!-- 使用vue-showdown -->
            <vue-showdown :markdown="md"/>
        </div>

    </div>



    <!-- 配置文件 -->
    <script type="text/javascript" src="/static/third-party/ueditor1_4_3_3-utf8-jsp/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="/static/third-party/ueditor1_4_3_3-utf8-jsp/ueditor.all.js"></script>

    <script src="/static/js/vue.min.js"></script>
    <script src="/static/js/showdown.min.js"></script>
    <script src="/static/js/vue-showdown.min.js"></script>

    <!-- 实例化编辑器 -->
    <script type="text/javascript">

        let bindData = {
            md: ''
        };
        let ready = false;

        let ue = UE.getEditor('container', {
            toolbars: [['fullscreen', 'undo', 'redo']],
            autoHeightEnabled: true
        });

        // 使用vue-showdown
        let vm = new Vue({
            el: '#app',
            data: bindData
        });

        ue.addListener('ready',function(){
            //相关操作
            ready = true;
        });

        ue.addListener('contentChange',function(editor){
            //相关操作
            if (ready == true) {

                console.log("ready: " + ready);

                bindData.md = ue.getPlainTxt();

                console.log("md: " + bindData.md);
            }
        });

    </script>

</body>
</html>