<%--
  Created by IntelliJ IDEA.
  User: Destine.Yuri
  Date: 2020/7/27
  Time: 10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign In</title>
    <link rel="stylesheet" type="text/css" href="https://www.layuicdn.com/layui/css/layui.css" />
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/layui/2.5.6/layui.min.js"></script>
    <!--Automatically Redirect to Mobile Page -->
    <script type="text/javascript">
        function browserRedirect() {
            var sUserAgent = navigator.userAgent.toLowerCase();
            if (/ipad|iphone|midp|rv:1.2.3.4|ucweb|android|windows ce|windows mobile/.test(sUserAgent)) {
                //跳转移动端页面
                window.location.href="../mobileServer/signup.jsp";
            }
        }
        browserRedirect();
    </script>
</head>
<style>
    .layui-form-label
    {
        width:150px;
    }
    #maindiv
    {
        background-image: url("/img/studyAbroad.jpg");
        /*background-image:url("/img/freljord_splash.jpg");*/
        background-repeat:no-repeat;
        height:100%;
    }
    #div_signin
    {
        background-image: linear-gradient(to right,#f2f2f2,#f2f2f2);
        border: 1px solid #eeeeee;
        margin: 10% auto;
        width:100%;
        height: 40%;
        opacity: 0.85;
    }
    #form_signin
    {
        margin-left:25%;

    }
    #div_btns
    {
        margin-top:20px;
        margin-left:32%;
    }
    #div_signUpSuccess
    {
        margin-left:10%;
        width:30%;
    }
</style>

<script>
    $(function () {
        app2.checkSignUpSuccess();
    })
    $(function () {
        $("#btn_signin").click(function () {
            $.ajax({
                url:"/stuInfo/StuInfoLogin",
                method:"post",
                datatype:"json",
                data:$("#form_signin").serialize(),
                success:function (result) {
                    if(result==true)
                    {
                        var comparisonList ="";
                        localStorage.setItem("comparisonList",comparisonList);
                        window.open("/encryption/desktopServer/main.jsp");
                    }else
                    {
                        app2.signInSuccess=true;
                    }
                }
            })
        })
    })
</script>

<body>
        <div id="maindiv">

            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>登录</legend>
            </fieldset>

            <div class="layui-card layui-bg-green" id="div_signUpSuccess" v-show="signUpSuccess1">
                <div class="layui-card-header">提示</div>
                <div class="layui-card-body">
                    您已经注册成功！
                </div>
            </div>

            <div id="div_signin">

                <form class="layui-form" action="" id="form_signin">
                    <div class="layui-form-item">
                        <div class="layui-input-inline">
                            <input type="hidden" name="" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">请输入登陆邮箱</label>
                        <div class="layui-input-inline">
                            <input type="text" name="stuemail" required  lay-verify="required" placeholder="Email" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">请输入密码</label>
                        <div class="layui-input-inline">
                            <input type="password" name="stupassword" id="firstPassword" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                        </div>
                        <span class="layui-badge layui-bg-orange" v-show="signInSuccess">邮箱账户或密码错误</span>
                        <%--<div class="layui-form-mid layui-word-aux">辅助文字</div>--%>
                    </div>
                </form>
                <div class="layui-form-item" id="div_btns">
                    <div class="layui-input-block">
                        <button class="layui-btn" id="btn_signin">登录</button>
                    </div>
                </div>
            </div>

        <div id="bottomdiv">

        </div>

        </div>
        <script>
            var app2 = new Vue({
                el:"#maindiv",
                data:{
                    signUpSuccess1:false,
                    signInSuccess:false,
                },
                methods:{
                    checkSignUpSuccess:function () {
                        var Ohref=window.location.href;
                        var result=Ohref.split("?signup=");
                        var success = result[1];
                        if(success == "success")
                        {
                            this.signUpSuccess1 = true;
                        }else
                        {
                            this.signUpSuccess1 = false;
                        }
                    }
                }
            })
        </script>
</body>
</html>
