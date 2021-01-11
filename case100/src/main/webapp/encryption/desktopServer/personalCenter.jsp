<%--
  Created by IntelliJ IDEA.
  User: Destine.Yuri
  Date: 2020/7/27
  Time: 16:13
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

</style>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header" style="background-image: linear-gradient(to right,#393D49,#e2e2e2);">
        <div class="layui-logo" style="background-color: #393D49">个人中心</div>
    </div>
    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="javascript:;">个人信息</a>
                    <dl class="layui-nav-child">
                        <dd><a href="personalEdit.jsp" target="personalInfoIframe" onclick="changeFrameHeight()">修改个人信息</a></dd>
                        <dd><a href="personalEditScore.jsp" target="personalInfoIframe" onclick="changeFrameHeight()">添加/修改成绩</a></dd>
                        <dd><a href="personalEditActivity.jsp" target="personalInfoIframe" onclick="changeFrameHeight()">添加/修改活动</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="javascript:;">Offer</a>
                    <dl class="layui-nav-child">
                        <dd><a href="personalCollegeContribution.jsp" target="personalInfoIframe" onclick="changeFrameHeight()">查看已经贡献的Offer</a></dd>
                        <dd><a href="personalCollegeNew.jsp" target="personalInfoIframe" onclick="changeFrameHeight()">创建新的档案</a></dd>
                        <dd><a href="personalCollegeOfferCollection.jsp" target="personalInfoIframe" onclick="changeFrameHeight()">收藏的Offer案例</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="personalCenter.jsp" onclick="changeFrameHeight()">返回个人信息主页</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body" id="maindiv" >
        <!-- 内容主体区域 -->
        <div style="padding: 15px;" >
                <iframe name="personalInfoIframe" id="personalInfoIframe"
                        src="personalWelcome.jsp" width="100%" scrolling="no" frameborder="0"></iframe>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        Case100 @Harold
    </div>
</div>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>
</body>

<script>
    layui.use('element', function(){
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

        //监听导航点击
        element.on('nav(demo)', function(elem){
            //console.log(elem)
            layer.msg(elem.text());
        });
    });
</script>
<script>
    function changeFrameHeight(){
        var ifm= document.getElementById("personalInfoIframe");
        ifm.height=document.documentElement.clientHeight+200;
    }
    window.onresize=function(){
        changeFrameHeight();
    }
    window.onload = function () {
        changeFrameHeight();
    }
</script>
</html>
