<%--
  Created by IntelliJ IDEA.
  User: Harold
  Date: 2020/7/19
  Time: 16:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="//unpkg.com/vue-ydui/dist/ydui.rem.css">
<script src="//unpkg.com/vue-ydui/dist/ydui.flexible.js"></script>

<!-- 引入Vue2.x -->
<script src="//vuejs.org/js/vue.min.js"></script>
<!-- 引入组件库 -->
<script src="//unpkg.com/vue-ydui/dist/ydui.rem.js"></script>

<html>
<head>
    <title>Title</title>
</head>
<style>
    #maindiv{
        background-image:url("/img/freljord_splash.jpg");
        height:1000px;
        border: 1px solid red;
    }

</style>
<body>
    <div id="maindiv">

    </div>
    <div id="testDiv">
        <template>
            <yd-tabbar>
                <yd-tabbar-item title="首页" link="#">
                    <yd-icon name="home" slot="icon" size="0.54rem"></yd-icon>
                </yd-tabbar-item>
                <yd-tabbar-item title="购物车" link="#" active>
                    <yd-icon name="shopcart" slot="icon" size="0.54rem"></yd-icon>
                </yd-tabbar-item>
                <yd-tabbar-item title="个人中心" link="#">
                    <yd-icon name="ucenter-outline" slot="icon" size="0.54rem"></yd-icon>
                </yd-tabbar-item>
            </yd-tabbar>
        </template>
    </div>
</body>
<script type="text/babel">
    import Vue from 'vue';
    import {TabBar, TabBarItem} from 'vue-ydui/dist/lib.rem/tabbar';
    /* 使用px：import {TabBar, TabBarItem} from 'vue-ydui/dist/lib.px/tabbar'; */

    Vue.component(TabBar.name, TabBar);
    Vue.component(TabBarItem.name, TabBarItem);
    export default {

    }
</script>
</html>
