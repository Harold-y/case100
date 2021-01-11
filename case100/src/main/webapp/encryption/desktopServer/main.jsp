<%--
  Created by IntelliJ IDEA.
  User: Destine.Yuri
  Date: 2020/7/24
  Time: 9:20
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
    <script src="/js/header_footer.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/header_footer.css">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
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

<script>
    $(function () {
        let stuId = ${stuId};
        $("#personalImg").attr("src","http://yeyixuan.top/wp-content/uploads/stuInfo/"+stuId+".jpg"+"?"+Math.random());
    })
    $('#personalImg').on("error", function() {
        $(this).attr('src', '/img/newone.jpg');  // 替换为默认图片
    });
    $(function () {
        let stuId = ${stuId};
        if(stuId!=null)
        {
            app3.alreadyLogin = true;
        }else
        {
            app3.alreadyLogin = false;
        }
    })
    $(function changeSrc() {
        var Ohref=window.location.href;
        var result=Ohref.split("?stuCollegeId=");
        var stuCollegeId = result[1];
        this.stuCollegeId = stuCollegeId;
    })
</script>
<body>
<div id="nagivatorDiv">
    <ul class="layui-nav layui-bg-green">
        <li class="layui-nav-item"><a href="/encryption/desktopServer/main.jsp">Case100</a></li>
        <li class="layui-nav-item layui-this"><a href="/encryption/desktopServer/main.jsp">首页</a></li>
        <li class="layui-nav-item"><a href="/encryption/desktopServer/comparison.jsp" v-show="alreadyLogin" target="myiframe" onclick="changeFrameHeight2()">对比</a></li>
        <%--<li class="layui-nav-item"><a href="">留学圈</a></li>--%>
        <li class="layui-nav-item">
            <a href="/encryption/desktopServer/resourceCenter.jsp" target="myiframe" onclick="changeFrameHeight()">申请档案馆</a>
            <%--<a href="javascript:;">申请档案馆</a>--%>
            <%--<dl class="layui-nav-child">
                <dd><a href="">美国</a></dd>
                <dd><a href="">英国</a></dd>
                <dd><a href="">加拿大</a></dd>
                <dd><a href="">澳大利亚</a></dd>
                <dd><a href="">新西兰</a></dd>
                <dd><a href="">香港</a></dd>
                <dd><a href="">新加坡</a></dd>
                <dd><a href="">日本</a></dd>
            </dl>--%>
        </li>
        <%--<li class="layui-nav-item"><a href="">对比</a></li>--%>
        <%--<li class="layui-nav-item"><a href="">留学申请帮助</a></li>--%>
        <li class="layui-nav-item" v-show="alreadyLogin">
            <a href="/encryption/desktopServer/personalCenter.jsp" target="myiframe" onclick="changeFrameHeight()">个人中心<span class="layui"></span></a>
        </li>



        <li class="layui-nav-item" style="float: right">
            <a href="/encryption/desktopServer/signin.jsp" target="myiframe" v-show="!alreadyLogin">登录</a>
        </li>
        <li class="layui-nav-item" style="float: right">
            <a href="/encryption/desktopServer/signup.jsp" target="myiframe" v-show="!alreadyLogin">注册</a>
        </li>

        <li class="layui-nav-item" style="float: right" id="alreadyLogin" v-show="alreadyLogin">
            <img src="//t.cn/RCzsdCq" class="layui-nav-img" id="personalImg" onerror="this.src='/img/newone.jpg'">${stuUsername}
            <dl class="layui-nav-child">
                <%--<dd><a href="javascript:;">好友</a></dd>--%>
                <dd><a href="javascript:;" @click="logOut">登出</a></dd>
            </dl>
        </li>

    </ul>
</div>

<div id="middlediv">
    <iframe src="welcome.jsp" width="100%" id="myiframe" scrolling="no"
            frameborder="0" name="myiframe"></iframe>
</div>

<hr class="layui-bg">
<div id="bottomDiv1" class="font_Harold">
    <div id="notification" style="">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">Offer档案资料</h3>
            </div>
            <div class="panel-body">
                <ul class="list-group">
                    <li class="list-group-item"><a href="">X同学</a> </li>
                    <li class="list-group-item"><a href="">A同学</a></li>
                    <li class="list-group-item"><a href="">H同学</a></li>
                    <li class="list-group-item"><a href="">B同学</a></li>
                    <li class="list-group-item"><a href="">C同学</a></li>
                </ul>
            </div>
        </div>
        <div class="panel panel-success">
            <div class="panel-heading">
                <h3 class="panel-title">最近更新</h3>
            </div>
            <div class="panel-body">
                <ul class="list-group">
                    <li class="list-group-item"><a href="">托福最新考位！</a> </li>
                    <li class="list-group-item"><a href="">申请季如何写文书？</a></li>
                    <li class="list-group-item"><a href="">托福和雅思该考哪个？</a></li>
                    <li class="list-group-item"><a href="">查询帮助</a></li>
                    <li class="list-group-item"><a href="">SAT考试时间一览</a></li>
                </ul>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">其它</h3>
            </div>
            <div class="panel-body">
                <ul class="list-group">
                    <li class="list-group-item"><a href="">意见反馈</a> </li>
                    <li class="list-group-item"><a href="">免责声明</a></li>
                    <li class="list-group-item"><a href="">隐私条例</a></li>
                    <li class="list-group-item"><a href="">关于我们</a></li>
                    <li class="list-group-item"><a href="http://williamye.top/index.php/saving/" target="_blank">打赏</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<hr class="layui-bg">
<div id="bottomDiv2" class="font_Harold2">
    <div id="beian" style="text-align: center">
        豫ICP备18024715号 Ex.
    </div>
    <div id="maker" style="text-align: center">
        Made By @<a href="http://williamye.top/index.php/2017/01/10/%e4%b8%aa%e4%ba%ba%e4%bb%8b%e7%bb%8dintroduction/"
                    target="_blank">Harold Ye</a>
    </div>
</div>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
    var app3 = new Vue({
        el:"#nagivatorDiv",
        data:{
            alreadyLogin : false
        },
        methods:{
            logOut:function () {
                $.ajax({
                    url:"/stuInfo/removeSession",
                    method:"post",
                    success:function (index) {
                        if(index==1)
                        {
                            parent.location.reload();
                        }
                    }
                });
                /* let parentIframe = $("#myiframe",parent.document)
                 parentIframe.attr("src","/encryption/desktopServer/welcome.jsp");*/

            }
        }
    })
</script>
<!--Scroll-->
<script>
    function changeFrameHeight(){
        var ifm= document.getElementById("myiframe");
        ifm.Height=0;
        ifm.height=document.documentElement.clientHeight;
    }
    function changeFrameHeight2(){
        var ifm= document.getElementById("myiframe");
        ifm.Height=0;
        ifm.height=2000;
    }
    window.onresize=function(){
        changeFrameHeight();
    }
    window.onload = function () {
        changeFrameHeight();
    }


</script>
</body>
</html>
