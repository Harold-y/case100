<%--
  Created by IntelliJ IDEA.
  User: Destine.Yuri
  Date: 2020/7/20
  Time: 4:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Admin Server</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script src="https://cdn.bootcdn.net/ajax/libs/layui/2.5.6/layui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://www.layuicdn.com/layui/css/layui.css" />
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header">
            <div class="layui-logo">Case100 Admin Server</div>
            <!-- 头部区域（可配合layui已有的水平导航） -->
            <%--<ul class="layui-nav layui-layout-left">
                <li class="layui-nav-item"><a href="">控制台</a></li>
                <li class="layui-nav-item"><a href="">商品管理</a></li>
                <li class="layui-nav-item"><a href="">用户</a></li>
                <li class="layui-nav-item">
                    <a href="javascript:;">其它系统</a>
                    <dl class="layui-nav-child">
                        <dd><a href="">邮件管理</a></dd>
                        <dd><a href="">消息管理</a></dd>
                        <dd><a href="">授权管理</a></dd>
                    </dl>
                </li>
            </ul>--%>
            <ul class="layui-nav layui-layout-right">
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <img src="http://williamye.top/wp-content/uploads/2020/06/IMG_1949.jpg" class="layui-nav-img">
                        Administrator
                    </a>
                    <%--<dl class="layui-nav-child">
                        <dd><a href="">基本资料</a></dd>
                        <dd><a href="">安全设置</a></dd>
                    </dl>--%>
                </li>
                <li class="layui-nav-item"><a href="/encryption/adminServer/dashwood.jsp">Log Out</a></li>
            </ul>
        </div>

        <div class="layui-side layui-bg-black">
            <div class="layui-side-scroll">
                <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
                <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                    <li class="layui-nav-item layui-nav-itemed">
                        <a class="" href="javascript:;">College Management</a>
                        <dl class="layui-nav-child">
                            <dd><a href="/encryption/adminServer/college.jsp">College</a></dd>
                            <dd><a href="/encryption/adminServer/Ranking.jsp">Ranking</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item">
                        <a href="javascript:;">Examination</a>
                        <dl class="layui-nav-child">
                            <dd><a href="/encryption/adminServer/examgenre.jsp">Exam Genre</a></dd>
                            <dd><a href="/encryption/adminServer/examsub.jsp">Exam Sub</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item"><a href="/encryption/adminServer/welcome.jsp">Admin Tools (unavailable)</a></li>
                    <li class="layui-nav-item"><dd><a href="/encryption/adminServer/welcome.jsp">Return to Welcome Page</a></dd></li>
                    <li class="layui-nav-item"><a href="/encryption/adminServer/dashwood.jsp">Log out</a></li>
                </ul>
            </div>
        </div>

        <div class="layui-body">
            <!-- 内容主体区域 -->
            <div style="padding: 15px;">
                <iframe src="/encryption/adminServer/welcome.jsp" id="onlyiframe" style="width: 100%;height:95%"></iframe>
            </div>
        </div>

        <div class="layui-footer">
            <!-- 底部固定区域 -->
            Case100 Code Task Force ©Harold
        </div>
    </div>
    <script>
        //JavaScript代码区域
        layui.use('element', function(){
            var element = layui.element;
            element.on('tab(demo)', function(data){
                var src=$(".layui-tab-item.layui-show").find("iframe").attr("src");
                $(".layui-tab-item.layui-show").find("iframe").attr("src",src);
            });
        });
        $(document).ready(function(){
            $("dd>a").click(function (e) {
                e.preventDefault();
                $("#onlyiframe").attr("src",$(this).attr("href"));
            });
        });
    </script>
</body>
</html>
