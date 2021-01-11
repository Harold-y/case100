<%--
  Created by IntelliJ IDEA.
  User: Destine.Yuri
  Date: 2020/7/28
  Time: 15:25
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
    <script src="/js/personalCollege.js"></script>
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
    fieldset{padding:.35em .625em .75em;margin:0 2px;border:1px solid silver}
    legend{padding:.5em;border:0;width:auto}
    /*div{border: 1px solid red}*/
    .controlDiv{
        background-color: #eeeeee;
        float:left;
        margin-left:20px;
        text-align: center;
        padding:15px;
        border-radius: 30px;

        margin-bottom: 30px;
        font-family: "lucida grande", "lucida sans unicode",
        lucida, helvetica, "Hiragino Sans GB", "Microsoft YaHei", "WenQuanYi Micro Hei", sans-serif;
        font-size: 12px;
        border: 2px solid #5FB878;
        height:200px;
        width:280px;
    }
    .img_school{
        height: 90%;
        border-radius: 5px;
    }
    .div_img_school
    {
        width: 110px;
        height: 50px;
    }
    .img_user{
        border-radius: 50px;
        height: 75px;
        width: 75px;
    }
    .btn_checkDetail
    {
        text-align: center;
        margin:0 auto;

    }
    .div_checkDetail
    {
        height: 20%;
    }
    .secondDiv
    {
        border-left: 2px solid #d2d2d2;
        margin-left:30px;
        padding-left: 5px;
        float:left;
    }
    .firstDiv
    {
        margin:0px auto;
        padding-left: 5px;
        height: 200px;
        float:left;
    }
    #add_div
    {
        overflow: auto;
    }
    .div_text
    {
        width:100px;
    }
    .div_score
    {
        width:100px;
    }
    .schoolName
    {
        margin-top:10px;
        width:120px;
    }
    .major
    {
        margin-top:15px;
    }
    .left_up_Div
    {
        height:80%;
    }
</style>
<body>
    <div id="maindiv">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
            <legend><i class="layui-icon layui-icon-star-fill"></i>收藏的档案</legend>
        </fieldset>
        <div id="add_div">

        </div>

    </div>
</body>
<script>
    var collectionVue = new Vue({
        el:"#maindiv",
        data:{
            dataList:"",
        },
        methods:{
            searchCollectionFile:function () {
                $.ajax({
                    url:"/stuCollege/selectStuCollegeCollectionByStuId",
                    datatype:"json",
                    methods:"post",
                    success:function (data) {
                        collectionVue.dataList = data;
                        addCollection("add_div",data);
                        checkDetail();
                    }
                })
            }
        }
    })
</script>
<script>
    $(function () {
        setTimeout(collectionVue.searchCollectionFile,100);
    })
    function checkDetail() {
        $("button[name='getDetail']").click(function () {
            var stucollegeid = $(this).parent().parent().children(":first").children(":first").val();
            window.open("/encryption/desktopServer/offerDetail.jsp?stuCollegeId="+stucollegeid);
        })
    }
</script>
</html>
