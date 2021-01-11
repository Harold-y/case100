<%--
  Created by IntelliJ IDEA.
  User: Destine.Yuri
  Date: 2020/7/27
  Time: 9:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign Up</title>
    <link rel="stylesheet" type="text/css" href="https://www.layuicdn.com/layui/css/layui.css" />
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/layui/2.5.6/layui.min.js"></script>
    <%--<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>--%>
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
        background-image:url("/img/freljord_splash.jpg");
        background-repeat:no-repeat;
        height:100%;
    }
    #div_signup
    {
        background-image: linear-gradient(to right,#33C4FF,#7D33FF);
        width:100%;
        margin: 10% auto;
        height: 45%;
        opacity: 0.85;
    }
    #form_signup
    {
        margin-left:25%;
    }
    #btn_signup
    {
        margin-left:32%;
    }
</style>
<script>
    //Sign UP
    $(function () {
        $("#btn_signup").click(
            function () {
                var checkedEmail = app1.emailWarning;
                var checkedPassword = app1.passwordWarning;
                var emailUsed = app1.emailUsed;
                var password = $("#firstPassword").val();
                var username = $("#username").val();
                if(checkedEmail==false && checkedPassword==false && emailUsed==false && password!=""&& username!="")
                {
                    $.ajax({
                        url:"/stuInfo/insert",
                        method:"post",
                        datatype:"json",
                        data:$("#form_signup").serialize(),
                        success(index) {
                            if(index==1)
                            {
                                let parentIframe = $("#myiframe",parent.document)
                                parentIframe.attr("src","/encryption/desktopServer/signin.jsp?signup=success");
                            }else
                            {
                                alert("注册失败，请联系管理员！");
                            }
                        }
                    })
                }
            }
        )
    })

</script>
<body>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>注册用户</legend>
</fieldset>
    <div id="maindiv">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
            <legend style="color: #ccffff">请输入以下信息</legend>
        </fieldset>
        <div id="div_signup">
            <form class="layui-form" action="" id="form_signup">
                <div class="layui-form-item">
                    <div class="layui-input-inline">
                        <input type="hidden" name="" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">请输入您的用户名</label>
                    <div class="layui-input-inline">
                        <input type="text" name="stuusername" id="username" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">请设置密码</label>
                    <div class="layui-input-inline">
                        <input type="password" name="stupassword" id="firstPassword" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                    </div>
                    <%--<div class="layui-form-mid layui-word-aux">辅助文字</div>--%>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">再次输入密码</label>
                    <div class="layui-input-inline">
                        <input type="password" name="password" id="secondPassword"
                               required lay-verify="required" placeholder="请输入密码" autocomplete="off"
                               class="layui-input" @mouseout="checkPassword">
                    </div>
                    <span class="layui-badge layui-bg-orange" v-show="passwordWarning">密码不一样</span>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">邮箱地址</label>
                    <div class="layui-input-inline">
                        <input type="text" name="stuemail" id="email" required lay-verify="required" placeholder="Email"
                               autocomplete="off" class="layui-input" @mouseout="checkEmail(),checkEmailUsed()">
                    </div>
                    <span class="layui-badge layui-bg-orange" v-show="emailWarning">请输入正确的邮箱地址</span>
                    <span class="layui-badge layui-bg-orange" v-show="emailUsed">邮箱已经使用<a href="/encryption/desktopServer/findPassword.jsp">找回密码</a></span>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-block">
                        <input type="radio" name="stusex" value="男" title="男">
                        <input type="radio" name="stusex" value="女" title="女" checked>
                    </div>
                </div>


            </form>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" id="btn_signup">注册</button>
                </div>
            </div>
        </div>

        <div id="indicator">
            <span class="layui-badge layui-bg-green" v-show="signUpSuccess">注册成功！正在跳转---</span>
        </div>
    </div>
    <script>
        //Demo
        layui.use('form', function(){
            var form = layui.form;
        });
    </script>
    <%--VUE--%>
    <script>
        var app1 = new Vue({
            el:"#maindiv",
            data:{
                passwordWarning: false,
                emailWarning: false,
                signUpSuccess:false,
                emailUsed: false
            },
            methods:{
                checkEmail: function ()
                {
                    let email = $("#email").val();
                    if(email.indexOf("@") != -1 && email.includes("."))
                    {
                        this.emailWarning = false;
                    }else
                    {
                        this.emailWarning = true;
                    }
                },
                checkEmailUsed:function()
                {
                    $.ajax({
                        url:"/stuInfo/checkEmailUsed",
                        method:"post",
                        data:{"stuemail":$("#email").val()},
                        datatype:"json",
                        success:function (index) {
                            app1.emailUsed = index;
                        }
                    })
                },
                checkPassword: function () {
                    let password1 = $("#firstPassword").val();
                    let password2 = $("#secondPassword").val();
                    if(password1==password2)
                    {
                        this.passwordWarning=false;
                    }else
                    {
                        this.passwordWarning=true;
                    }
                }
            },
        })
    </script>

</body>
</html>
