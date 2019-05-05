<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>upload</title>


    <link rel="stylesheet" type="text/css" href="./css/iview.css">
    <script type="text/javascript" src="./js/vue.min.js"></script>
    <script type="text/javascript" src="./js/iview.min.js"></script>


    <style>
        #upload {
            width: 320px;
            height: 120px;
        }


    </style>


</head>
<body>
<div id="app">
    <div>
        <input type="file" multiple >
    </div>
</div>

<script>
    new Vue({
        el: '#app',
        data: {
            visible: false
        },
        methods: {
            show: function () {
                this.visible = true;
            }
        }
    })
</script>
</body>
</html>