<%--
  Created by IntelliJ IDEA.
  User: Destine.Yuri
  Date: 2020/7/24
  Time: 9:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%--<script type="text/javascript">
        function browserRedirect() {
            var sUserAgent = navigator.userAgent.toLowerCase();
            if (/ipad|iphone|midp|rv:1.2.3.4|ucweb|android|windows ce|windows mobile/.test(sUserAgent)) {
                //跳转移动端页面
            } else {
                //跳转pc端页面
                window.location.href="../desktopServer/main.jsp";
            }
        }
        browserRedirect();


    </script>--%>

    <link rel="stylesheet" href="https://cdn.bootcss.com/material-design-icons/3.0.1/iconfont/material-icons.css">
    <script src="//unpkg.com/vue/dist/vue.js"></script>
    <script src="//unpkg.com/muse-ui@3.0.2/dist/muse-ui.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,400italic">
    <link rel="stylesheet" href="https://cdn.bootcss.com/material-design-icons/3.0.1/iconfont/material-icons.css">

</head>
<style>
    @import url("//unpkg.com/muse-ui@3.0.2/dist/muse-ui.css");
    #nagivator
    {
      margin-bottom: 0px;
    }
</style>
<body>

<div id="app">
    <mu-appbar style="width: 100%;" color="primary">
        Case100

        <mu-button value="USA" >
            美国
        </mu-button>

        <mu-button  >
            英国
        </mu-button>

        <mu-button >
            香港
        </mu-button>

        <mu-button >
            新加坡
        </mu-button>


        <mu-button flat slot="right">LOGIN</mu-button>
    </mu-appbar>


    <mu-container id="nagivator">
        <mu-bottom-nav>
            <mu-bottom-nav-item title="档案库" icon="book"></mu-bottom-nav-item>
            <mu-bottom-nav-item title="联系人" icon="people"></mu-bottom-nav-item>
            <mu-bottom-nav-item title="对比" icon="offline_pin"></mu-bottom-nav-item>
            <mu-bottom-nav-item title="留学圈" icon="school"></mu-bottom-nav-item>
            <mu-bottom-nav-item title="个人" icon="person"></mu-bottom-nav-item>
        </mu-bottom-nav>
    </mu-container>
</div>

</body>
<script>
    var app1 = new Vue({
        el:"#app",
        data:{},
        methods:{

        }
    })
    new Vue().$mount('#app')
</script>
</html>
