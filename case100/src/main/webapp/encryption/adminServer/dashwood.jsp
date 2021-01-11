<%--
  Created by IntelliJ IDEA.
  User: Destine.Yuri
  Date: 2020/7/19
  Time: 20:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.bootcdn.net/ajax/libs/layui/2.5.6/layui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://www.layuicdn.com/layui/css/layui.css" />
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script>
/*        $(function () {
            $("#btn_login").click(
                function () {
                    $.ajax({
                        url:"/login/Authentication",
                        method:"post",
                        dataType:"",
                        data:$("#login_form").serialize()
                    })
                }
            )
        })*/
    </script>
</head>
<style>
    div{
        border: 1px solid transparent;
    }
    #maindiv{
        background-image:url("/img/freljord_splash.jpg");
        height:100%;
    }
    #login{
        background-image: linear-gradient(to right,#33C4FF,#7D33FF);
        opacity: 0.85;
        width:100%;
        margin: 15% auto;
        height: 38%;
    }
    .layui-input
    {
        width:200%;
    }
    #login_form
    {
        margin-left:35%;
        margin-top: 3%;
    }
    .layui-btn
    {
        margin-left:19%;
        margin-top: 3%;
    }
</style>

<body>
    <div id="maindiv">
        <div id="login">
            <form class="layui-form" id="login_form" action="/login/Authentication" method="post">
                <div class="layui-form-item">
                    <label class="layui-form-label">Username</label>
                    <div class="layui-input-inline">
                        <input type="text" name="username" required  lay-verify="required" placeholder="Please insert your username" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">Password</label>
                    <div class="layui-input-inline">
                        <input type="password" name="password" required lay-verify="required" placeholder="Please insert your password" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux"></div>
                </div>
                <input type="submit" value="Login" class="layui-btn" lay-submit lay-filter="formDemo" id="btn_login">
            </form>
        </div>
    </div>
</body>
</html>
