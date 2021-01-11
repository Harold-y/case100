<%--
  Created by IntelliJ IDEA.
  User: Destine.Yuri
  Date: 2020/7/27
  Time: 18:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Case100</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script src="https://cdn.bootcdn.net/ajax/libs/layui/2.5.6/layui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://www.layuicdn.com/layui/css/layui.css" />
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!--Automatically Redirect to Mobile Page -->
    <script type="text/javascript">
        function browserRedirect() {
            var sUserAgent = navigator.userAgent.toLowerCase();
            if (/ipad|iphone|midp|rv:1.2.3.4|ucweb|android|windows ce|windows mobile/.test(sUserAgent)) {
                //跳转移动端页面
                window.location.href="../mobileServer/main.jsp";
            }
        }
        browserRedirect();
    </script>
</head>
<style>
    #personalImg
    {
        width:200px;
    }
    fieldset{padding:.35em .625em .75em;margin:0 2px;border:1px solid silver}
    legend{padding:.5em;border:0;width:auto}
</style>
<script>
    $(function () {
        let stuId = ${stuId};
        $("#personalImg").attr("src","http://yeyixuan.top/wp-content/uploads/stuInfo/"+stuId+".jpg"+"?"+Math.random());
    })
    $('#personalImg').on("error", function() {
        $(this).attr('src', '/img/newone.jpg');  // 替换为默认图片
    })
    $(function () {
        $("#changeImg").click(function () {
            var formData = new FormData();
            formData.append("stuInfoImg",$("#stuInfoImg")[0].files[0]);
            $.ajax({
                url:"/stuInfo/updateStuInfoImg",
                datatype:"json",
                method:"post",
                cache: false,
                data:formData,
                processData : false, // 使数据不做处理
                contentType : false,
                success:function (index) {
                    if(index==0)
                    {
                        $("#personalImg").attr("src","http://yeyixuan.top/wp-content/uploads/stuInfo/"+stuId+".jpg"+"?"+Math.random());
                        let parentIframe = $("#personalInfoIframe",parent.document)
                        parentIframe.attr("src","/encryption/desktopServer/personalWelcome.jsp");
                    }
                }
            })
        })
    })

</script>
<body>

    <div id="maindiv">
        <h1>欢迎你,${stuUsername}!</h1>
        <hr class="layui-bg-cyan">
        <img src="//t.cn/RCzsdCq" id="personalImg" onerror="this.src='/img/newone.jpg'">
        <div class="layui-card">
            <div class="layui-card-header">更换头像</div>
            <div class="layui-card-body">
                <input type="file" name="stuInfoImg" id="stuInfoImg">
                <button class="layui-btn layui-btn-radius layui-btn-normal" id="changeImg">更换头像</button>
            </div>
        </div>
        <hr class="layui-bg-blue">
        <h2>祝你饱经祝福</h2>
    </div>
</body>
</html>
