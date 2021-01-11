<%--
  Created by IntelliJ IDEA.
  User: Destine.Yuri
  Date: 2020/7/24
  Time: 10:59
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
    div{
        /*border: 1px solid red;*/
    }
    .font_Harold
    {
        font-size: 200%;
        font-family: Lantinghei SC;
    }
    #reasons
    {
        width:100%;
        background-image: linear-gradient(to right,white,#f2f2f2);
        height:600px;
    }
    .reasons_Sub1 div
    {
        display: inline-block;
        margin-left:15%;
        margin-top:5%;
    }
    #flowDiv
    {
        margin:auto;
    }
    #contentDivMiddle
    {
        background-image: linear-gradient(to right,#FFFAFA,#ccffff);
    }
    .flowIMG
    {
        width: 100%;
        height: 100%;
    }
    .layui-icon
    {
        font-size: 100px;
    }
</style>
<body>
    <div id="contentDivMiddle">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
            <legend class="layui-anim" data-anim="layui-anim-up">欢迎来到Case100——留学生信息中心</legend>
        </fieldset>
        <div class="layui-carousel" id="flowDiv" lay-filter="test1">
            <div carousel-item="">
                <div><img src="/static/img/content/Con1.jpg" class="flowIMG"></div>
                <div><img src="/static/img/content/Con2.jpg" class="flowIMG"></div>
                <div><img src="/static/img/content/Con3.jpg" class="flowIMG"></div>
                <div><img src="/static/img/content/Con4.jpg" class="flowIMG"></div>
            </div>
        </div>
    </div>

    <div id="contentDivBottom">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
            <legend>最近录入档案</legend>
        </fieldset>
        <div id="recentDocument">
            在此获取最近的10份档案
        </div>

        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
            <legend>我们的服务100%免费！</legend>
        </fieldset>
        <div class="layui-progress" style="margin-bottom: 20px">
            <div class="layui-progress-bar" lay-percent="100%"></div>
        </div>

        <%--<div id="reasons">
            <div class="reasons_Sub1">
                <div>
                    <i class="layui-icon layui-icon-ok" style="color: #1E9FFF;"></i>
                    <p class="font_Harold">完全免费</p>
                </div>
                <div>
                    <i class="layui-icon layui-icon-password" style="color: #000033;"></i>
                    <p class="font_Harold">信息安全</p>
                </div>
                <div>
                    <i class="layui-icon layui-icon-user" style="color: #C67171;"></i>
                    <p class="font_Harold">用户信赖</p>
                </div>
                <div>
                    <i class="layui-icon layui-icon-list" style="color: #B3EE3A;"></i>
                    <p class="font_Harold">档案丰富</p>
                </div>
            </div>
            <div class="reasons_Sub1">
                <div>
                    <i class="layui-icon layui-icon-windows" style="color: #CD6889;"></i>
                    <p class="font_Harold">多平台</p>
                </div>

                <div>
                    <i class="layui-icon layui-icon-diamond" style="color: #8B5A00;"></i>
                    <p class="font_Harold">平等服务</p>
                </div>
                <div>
                    <i class="layui-icon layui-icon-website" style="color: #9F79EE;"></i>
                    <p class="font_Harold">全球档案</p>
                </div>
                <div>
                    <i class="layui-icon layui-icon-praise" style="color: #CD0000;"></i>
                    <p class="font_Harold">助您留学取得成功</p>
                </div>
            </div>
        </div>--%>

        <hr class="layui-bg">

    </div>

    <script>
        //JavaScript代码区域
        layui.use('element', function(){
            var element = layui.element;

        });
    </script>
    <!--轮播-->
    <script>
        layui.use(['carousel', 'form'], function() {
            var carousel = layui.carousel
                , form = layui.form;

            //常规轮播
            carousel.render({
                elem: '#flowDiv'
                , width: '896'
                , height: '504'
                , interval: 5000
            })
        })
    </script>
</body>
</html>
