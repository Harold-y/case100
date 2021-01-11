<%--
  Created by IntelliJ IDEA.
  User: Destine.Yuri
  Date: 2020/8/2
  Time: 16:08
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
<style>
    .layui-input
    {
        width:400px;
    }
    #div_query
    {
        margin:0 auto;

    }
    .form-control
    {
        width: 130px;
        display: inline-block;
    }
    fieldset{padding:.35em .625em .75em;margin:0 2px;border:1px solid silver}
    legend{padding:.5em;border:0;width:auto}
    /*div{border: 1px solid red}*/
    .controlDiv{
        background-color: #f2f2f2;
        float:left;
        margin-left:20px;
        text-align: center;
        padding:15px;
        border-radius: 30px;

        margin-top: 30px;
        font-family: "lucida grande", "lucida sans unicode",
        lucida, helvetica, "Hiragino Sans GB", "Microsoft YaHei", "WenQuanYi Micro Hei", sans-serif;
        font-size: 15px;
        border: 2px solid #5FB878;
        height:200px;
        width:230px;
        transition-duration: 0.5s;

        box-shadow:-3px 3px 3px rgba(0,0,0,0.6),   /*左边阴影*/
        -6px 6px 6px rgba(0,0,0,0.4),
        -9px 9px 9px rgba(0,0,0,0.2),
        -12px 12px 12px rgba(0,0,0,0.1);
            /*10px 0px 10px #20c997,  !*右边阴影*!*/
        /*0px 10px 10px #3d3d3d;" !*下边阴影*!*/
    }
    .controlDiv:hover
    {
        background-color: #b0c4de;
        color: #F0F0F0;
        border: 2px solid #EAF2D3;
    }
    .controlDiv:hover .btn_checkDetail
    {
        background-color: #01AAED;
        color: #393D49;
    }
    .img_school{
        height: 90%;
        border-radius: 5px;
    }
    .div_img_school
    {
        width: 100%;
        height: 60px;
    }
    .btn_checkDetail
    {
        text-align: center;
        margin:0 auto;
    }
    .div_checkDetail
    {
        height: 12%;
    }
    .left_up_Div
    {
        height:88%;
    }

    #add_div
    {
        overflow: auto;
        height: 850px;
    }
    .div_text
    {
        /*width:200px;*/
        margin-top:10px;
    }
 /*   .schoolName
    {

        width:200px;
    }*/
    #layerDiv
    {
        margin:0px auto;
        text-align: center;
    }
    #maindiv
    {

    }
</style>
<body>
    <div id="maindiv">
        <div id="div_query">
            <label class="layui-form-label"><i class="layui-icon layui-icon-search"></i>查询</label>
            <select  name="stunationality"  class="form-control" v-model="collegeArea">
                <option value="All" selected>所有</option>
                <option value="USA">美国</option>
                <option value="UK">英国</option>
                <option value="AU">澳大利亚</option>
                <option value="TW">台湾</option>
                <option value="HK">香港</option>
                <option value="JP">日本</option>
                <option value="CA">加拿大</option>
                <option value="NZ">新西兰</option>
                <option value="SG">新加坡</option>
                <option value="KOR">韩国</option>
                <option value="ITA">意大利</option>
                <option value="ESP">西班牙</option>
                <option value="RU">俄罗斯</option>
                <option value="CH">瑞士</option>
                <option value="DE">德国</option>
                <option value="FR">法国</option>
                <option value="Other">其它国家地区</option>
            </select>
            <div class="layui-input-inline">
                <input type="text" name="title" required  lay-verify="required" placeholder="中文/英文"
                       autocomplete="off" class="layui-input" v-model="collegeName">
            </div>
            <button class="layui-btn" @click="selectCollegeInfoByName">查询</button>
        </div>
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
            <legend><i class="layui-icon layui-icon-read"></i>档案馆</legend>
        </fieldset>
        <div id="add_div">
            <%--<div class="controlDiv" >
                <div class="layui-row grid-demo">
                    <div class="left_up_Div">
                        <input type='hidden' value='"+collegeId+"'>
                        <div class='div_img_school'>
                            <img src="/static/img/college/Stanford%20University.jpg" class='img_school'>
                        </div>
                        <div class="div_text schoolName">
                            Stanford University
                        </div>
                        <div class="div_text schoolName">
                            斯坦福大学
                        </div>
                    </div>

                        <div class="layui-col-md12 div_checkDetail">
                            <button class="layui-btn layui-btn-sm btn_checkDetail" name='getDetail' >查看</button>
                      </div>

                </div>
            </div>--%>
        </div>

        <div id="layerDiv">

        </div>

    </div>
</body>
<script>
    //Demo
    layui.use('form', function(){
        var form = layui.form;

    });
</script>
<script>
    let tYear;

    $(function () {
        var myDate = new Date();
        tYear = myDate.getFullYear();
    })

    var resourceCenterVue = new Vue({
        el:"#maindiv",
        data:{
            overallCount:"",
            starter:0,
            limit:20,
            overallPage:"",
            currentPage:1,
            selectCountry:"",
            collegeName:"",
            collegeArea:""
        },
        methods:{
            selectCountCollegeAll:function()
            {
                $.ajax({
                    url:"/college/selectCountCollegeAll",
                    method:"post",
                    datatype:"json",
                    success:function (count) {
                        resourceCenterVue.overallCount =  count;
                        resourceCenterVue.overallPage = Math.ceil(count/20);
                        addLayer("layerDiv",resourceCenterVue.overallPage,resourceCenterVue.currentPage);
                    }
                })
            },
            selectCollegeInfoAll:function () {
                    $.ajax({
                        url:"/college/selectCollegeInfoAll",
                        method:"post",
                        datatype:"json",
                        data:{"rankingYear":tYear,"starter":resourceCenterVue.starter,"limit":resourceCenterVue.limit  },
                        success:function (data) {
                            addCollege_resourceCenter("add_div",data);
                            getDetail();
                        }
                    })
            },
            selectCollegeInfoByName:function () {
                $.ajax({
                    url:"/college/selectCollegeInfoByCollegeName",
                    method:"post",
                    datatype:"json",
                    data:{"rankingYear":tYear,"collegeName":resourceCenterVue.collegeName,"collegeArea":resourceCenterVue.collegeArea  },
                    success:function (data) {
                        addCollege_resourceCenter("add_div",data);
                        getDetail();
                    }
                })
            },
        }
    })
    $(function () {
        setTimeout(resourceCenterVue.selectCountCollegeAll(),100);
        setTimeout(resourceCenterVue.selectCollegeInfoAll(),100);

    })
    function getDetail() {
        $("button[name='getDetail']").click(
            function () {
                var collegeId2 = $(this).parent().parent().children(":first").children(":first").val();
                window.open("/encryption/desktopServer/schoolDetail.jsp?collegeId="+collegeId2);
            }
        )
    }
</script>
</html>
