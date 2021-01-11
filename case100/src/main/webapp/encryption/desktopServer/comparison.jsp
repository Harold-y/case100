<%--
  Created by IntelliJ IDEA.
  User: 11950
  Date: 2020/8/20
  Time: 17:11
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
        height:300px;
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
    #compareDiv
    {
        height: 1500px;
    }
    #upperDiv
    {
        height:80%;
    }
    #bottomDiv
    {
        height: 20%;
    }
    #leftDiv
    {
        width:48%;
        margin-left:10px;
        border-right: 1px solid #e2e2e2;
        float: left;
        height: 90%;
        padding:5px;
    }
    #rightDiv
    {
        width:48%;
        margin-right:10px;
        float: right;
        padding:5px;
        border-left: 1px solid #e2e2e2;
        height: 90%;
    }
    /*div{
        border: 1px solid red;
    }*/
    #leftIframe
    {
        width: 100%;
        height: 100%;
    }
    #rightIframe
    {
        width: 100%;
        height: 100%;
    }
</style>
<script>

</script>
<body>
    <div id="maindiv">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
            <legend><i class="layui-icon layui-icon-template-1"></i>对比</legend>
        </fieldset>
        <div id="add_div">

        </div>
        <hr>
        <div id="compareDiv">
            <div id="upperDiv">
                <div id="leftDiv">
                    <div>
                        <button type="button" class="layui-btn layui-btn-fluid" id="btn_leftDelete">删除</button>
                    </div>
                   <%-- <div>
                        <hr class="layui-bg-green">
                        <h2>学校信息<img src="//t.cn/RCzsdCq" id="schoolImg" onerror="this.src='/img/newone.jpg'" style="border-radius: 140px;
                border:1px solid #eeeeee"  width="50px"></h2>

                        <div id="div_stuCollegeInfo">

                            <table class="layui-table">
                                <colgroup>
                                    <col width="400">
                                    <col width="400">
                                    <col width="150">
                                    <col>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th>中文名</th>
                                    <th>英文名</th>
                                    <th>地区</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td >{{ collegeInfo.collegeChineseName}}</td>
                                    <td >{{ collegeInfo.collegename}}</td>
                                    <td >{{ collegeInfo.collegearea}}</td>
                                </tr>
                                </tbody>
                            </table>

                        </div>

                        <hr class="layui-bg-green">
                        <h2>学校录取信息</h2>

                        <div id="div_stuCollege">

                            <table class="layui-table">
                                <colgroup>
                                    <col width="250">
                                    <col width="200">
                                    <col width="500">
                                    <col>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th>录取专业</th>
                                    <th>奖学金数量</th>
                                    <th>学生感受</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td >{{ stuCollege.stucollegemajor}}</td>
                                    <td >{{ stuCollege.stucollegescholarship}}</td>
                                    <td >{{ stuCollege.stucollegeselffeeling}}</td>
                                </tr>
                                </tbody>
                            </table>



                        </div>

                        <hr class="layui-bg-orange">
                        <h2>学生信息<img src="//t.cn/RCzsdCq" id="personalImg1" onerror="this.src='/img/newone.jpg'" style="border-radius: 140px;
                border:1px solid #eeeeee"  width="50px"></h2>

                        <div id="div_stuInfo">

                            <table class="layui-table">
                                <colgroup>
                                    <col width="150">
                                    <col width="70">
                                    <col width="200">
                                    <col width="50">
                                    <col width="100">
                                    <col width="100">
                                    <col width="280">
                                    <col>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th>昵称</th>
                                    <th>性别</th>
                                    <th>高中</th>
                                    <th>GPA</th>
                                    <th>国家/地区</th>
                                    <th>性取向</th>
                                    <th>简介</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td >{{ stuInfo.stuusername}}</td>
                                    <td >{{ stuInfo.stusex}}</td>
                                    <td >{{ stuInfo.stuhighschool}}</td>
                                    <td >{{ stuInfo.stugpa}}</td>
                                    <td >{{ stuInfo.stunationality}}</td>
                                    <td >{{ stuInfo.stusexualorientation}}</td>
                                    <td >{{ stuInfo.stuotherinfo}}</td>
                                </tr>
                                </tbody>
                            </table>

                        </div>

                        <hr class="layui-bg-blue">
                        <h2>学生成绩</h2>

                        <div id="div_stuScore">
                            <table class="layui-table">
                                <colgroup>
                                    <col width="150">
                                    <col width="200">
                                    <col width="200">
                                    <col width="200">
                                    <col width="200">
                                    <col>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>考试名称</th>
                                    <th>科目名称</th>
                                    <th>分数</th>
                                    <th>日期</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="item in stuScore">
                                    <td >{{item.stuExamSubId}}</td>
                                    <td >{{item.examname}}</td>
                                    <td >{{item.examSubName}}</td>
                                    <td >{{item.stuExamSubScore}}</td>
                                    <td >{{item.testDate}}</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                        <hr class="layui-bg-cyan">
                        <h2>活动</h2>

                        <div id="div_activity">
                            <table class="layui-table">
                                <colgroup>
                                    <col width="150">
                                    <col width="200">
                                    <col width="600">
                                    <col>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th>活动名称</th>
                                    <th>结果</th>
                                    <th>说明/注释/详解</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="item in stuActivity">
                                    <td >{{item.activityname}}</td>
                                    <td >{{item.activityresult}}</td>
                                    <td >{{item.activitynote}}</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                        <hr class="layui-bg-yellow">
                        <h2>Essay</h2>

                        <div id="essay">
                            <p v-html="stuCollege.stucollegedistinctessayurl"></p>
                        </div>
                    </div>--%>
                    <iframe id="leftIframe" name="leftIframe"></iframe>
                </div>
                <div id="rightDiv">
                    <div>
                        <button type="button" class="layui-btn layui-btn-fluid" id="btn_rightDelete">删除</button>
                    </div>
                    <%-- <div>
                                            <hr class="layui-bg-green">
                                            <h2>学校信息<img src="http://yeyixuan.top/wp-content/uploads/college/"+offerDetailVue.collegeName2+".jpg" id="schoolImg2" onerror="this.src='/img/newone.jpg'" style="border-radius: 140px;
                                    border:1px solid #eeeeee"  width="50px"></h2>

                                            <div id="div_stuCollegeInfo">

                                                <table class="layui-table">
                                                    <colgroup>
                                                        <col width="400">
                                                        <col width="400">
                                                        <col width="150">
                                                        <col>
                                                    </colgroup>
                                                    <thead>
                                                    <tr>
                                                        <th>中文名</th>
                                                        <th>英文名</th>
                                                        <th>地区</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <tr>
                                                        <td >{{ collegeInfo2.collegeChineseName}}</td>
                                                        <td >{{ collegeInfo2.collegename}}</td>
                                                        <td >{{ collegeInfo2.collegearea}}</td>
                                                    </tr>
                                                    </tbody>
                                                </table>

                                            </div>

                                            <hr class="layui-bg-green">
                                            <h2>学校录取信息</h2>

                                            <div id="div_stuCollege">

                                                <table class="layui-table">
                                                    <colgroup>
                                                        <col width="250">
                                                        <col width="200">
                                                        <col width="500">
                                                        <col>
                                                    </colgroup>
                                                    <thead>
                                                    <tr>
                                                        <th>录取专业</th>
                                                        <th>奖学金数量</th>
                                                        <th>学生感受</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <tr>
                                                        <td >{{ stuCollege2.stucollegemajor}}</td>
                                                        <td >{{ stuCollege2.stucollegescholarship}}</td>
                                                        <td >{{ stuCollege2.stucollegeselffeeling}}</td>
                                                    </tr>
                                                    </tbody>
                                                </table>



                                            </div>

                                            <hr class="layui-bg-orange">
                                            <h2>学生信息<img src="http://yeyixuan.top/wp-content/uploads/stuInfo/"+offerDetailVue.stuId1+".jpg" id="personalImg2" onerror="this.src='/img/newone.jpg'" style="border-radius: 140px;
                                    border:1px solid #eeeeee"  width="50px"></h2>

                                            <div id="div_stuInfo">

                                                <table class="layui-table">
                                                    <colgroup>
                                                        <col width="150">
                                                        <col width="70">
                                                        <col width="200">
                                                        <col width="50">
                                                        <col width="100">
                                                        <col width="100">
                                                        <col width="280">
                                                        <col>
                                                    </colgroup>
                                                    <thead>
                                                    <tr>
                                                        <th>昵称</th>
                                                        <th>性别</th>
                                                        <th>高中</th>
                                                        <th>GPA</th>
                                                        <th>国家/地区</th>
                                                        <th>性取向</th>
                                                        <th>简介</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <tr>
                                                        <td >{{ stuInfo2.stuusername}}</td>
                                                        <td >{{ stuInfo2.stusex}}</td>
                                                        <td >{{ stuInfo2.stuhighschool}}</td>
                                                        <td >{{ stuInfo2.stugpa}}</td>
                                                        <td >{{ stuInfo2.stunationality}}</td>
                                                        <td >{{ stuInfo2.stusexualorientation}}</td>
                                                        <td >{{ stuInfo2.stuotherinfo}}</td>
                                                    </tr>
                                                    </tbody>
                                                </table>

                                            </div>

                                            <hr class="layui-bg-blue">
                                            <h2>学生成绩</h2>

                                            <div id="div_stuScore">
                                                <table class="layui-table">
                                                    <colgroup>
                                                        <col width="150">
                                                        <col width="200">
                                                        <col width="200">
                                                        <col width="200">
                                                        <col width="200">
                                                        <col>
                                                    </colgroup>
                                                    <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>考试名称</th>
                                                        <th>科目名称</th>
                                                        <th>分数</th>
                                                        <th>日期</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <tr v-for="item in stuScore2">
                                                        <td >{{item.stuExamSubId}}</td>
                                                        <td >{{item.examname}}</td>
                                                        <td >{{item.examSubName}}</td>
                                                        <td >{{item.stuExamSubScore}}</td>
                                                        <td >{{item.testDate}}</td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </div>

                                            <hr class="layui-bg-cyan">
                                            <h2>活动</h2>

                                            <div id="div_activity">
                                                <table class="layui-table">
                                                    <colgroup>
                                                        <col width="150">
                                                        <col width="200">
                                                        <col width="600">
                                                        <col>
                                                    </colgroup>
                                                    <thead>
                                                    <tr>
                                                        <th>活动名称</th>
                                                        <th>结果</th>
                                                        <th>说明/注释/详解</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <tr v-for="item in stuActivity2">
                                                        <td >{{item.activityname}}</td>
                                                        <td >{{item.activityresult}}</td>
                                                        <td >{{item.activitynote}}</td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </div>

                                            <hr class="layui-bg-yellow">
                                            <h2>Essay</h2>

                                            <div id="essay">
                                                <p v-html="stuCollege2.stucollegedistinctessayurl"></p>
                                            </div>
                                        </div>--%>
                        <iframe id="rightIframe" name="rightIframe"></iframe>
                </div>
            </div>
            <%--<hr class="layui-bg-blue">
            <div id="bottomDiv">
                成绩比较<br>
                <div class="layui-progress"  lay-showpercent="true" lay-filter="bar_gpa1">
                    <h4 v-text="stuInfo.stugpa" id="tr_gpa1"></h4>
                    <button class="layui-btn site-demo-active"  data-type="setGpa1">设置50%</button>
                    <div class="layui-progress-bar"id="gpa1" lay-percent="0%" ></div>
                </div>
                <br>
                <div class="layui-progress" lay-showpercent="true">
                    <h4 v-text="stuInfo2.stugpa" id="tr_gpa2"></h4>
                    <div class="layui-progress-bar"id="gpa2" lay-percent="0%"></div>
                </div>
                <div class="layui-progress layui-progress-big" lay-showpercent="true" lay-filter="demo">
                    <div class="layui-progress-bar layui-bg-red" lay-percent="0%"></div>
                </div>

                <div class="site-demo-button" style="margin-top: 20px; margin-bottom: 0;">
                    <button class="layui-btn site-demo-active" data-type="setPercent">设置50%</button>
                    <button class="layui-btn site-demo-active" data-type="loading">模拟loading</button>
                </div>
            </div>--%>

        </div>
    </div>
</body>
<script>
    //VUE Model
    var comparisonVue = new Vue({
        el:"#maindiv",
        data:{
            stuCollegeId:"",
            stuInfo:"",
            stuId1:"",
            stuCollege:"",
            stuActivity:"",
            stuScore:"",
            collegeInfo:"",
            collegeId:"",
            collegeName:"",
            stuId:"",

            stuCollegeId2:"",
            stuInfo2:"",
            stuId2:"",
            stuCollege2:"",
            stuActivity2:"",
            stuScore2:"",
            collegeInfo2:"",
            collegeId2:"",
            collegeName2:"",

            leftOccupied:0,
            rightOccupied:0,

            dataList:{

            },
        },
        methods:{
            searchCollectionFile:function (stuCollegeIdList) {
                $.ajax({
                    url:"/stuCollege/selectStuCollegeByStuCollegeId",
                    data:{"stuCollegeIdList":stuCollegeIdList},
                    datatype:"json",
                    methods:"post",
                    success:function (data) {
                        comparisonVue.dataList = data;
                        addCollection_Comparison("add_div",comparisonVue.dataList);
                        compare_delete();
                    }
                })
            },
            LoadDetail:function (stuCollegeId) {
                comparisonVue.stuCollegeId = stuCollegeId;
                $.ajax({
                    url:"/stuCollege/selectStuIdByStuCollegeId",
                    data:{"stuCollegeId":comparisonVue.stuCollegeId},
                    method:"post",
                    datatype:"json",
                    success:function (stuId) {
                        comparisonVue.stuId1 = stuId;
                        comparisonVue.LoadDetail_collegeId();
                    }
                });
            },
            LoadDetail_collegeId:function () {
                $.ajax({
                    url:"/stuCollege/selectCollegeIdByStuCollegeId",
                    data:{"stuCollegeId":comparisonVue.stuCollegeId},
                    method:"post",
                    datatype:"json",
                    success:function (collegeId) {
                        comparisonVue.collegeId = collegeId;
                        comparisonVue.LoadDetail_stuInfo();
                    }
                });
            },
            LoadDetail_stuInfo:function () {
                var stuId1 = comparisonVue.stuId1;
                $.ajax({
                    url:"/stuInfo/selectStuInfoByStuId",
                    method:"post",
                    datatype:"json",
                    data:{"stuId":stuId1},
                    success:function (data) {
                        comparisonVue.stuInfo = data;
                        comparisonVue.LoadDetail_stuCollege();
                    }
                })
            },
            LoadDetail_stuCollege:function () {
                $.ajax({
                    url:"/stuCollege/selectByPrimaryKey",
                    method:"post",
                    datatype:"json",
                    data:{"stuCollegeId":comparisonVue.stuCollegeId},
                    success:function (data) {
                        comparisonVue.stuCollege = data;
                        comparisonVue.LoadDetail_activity();
                    }
                })
            },
            LoadDetail_activity:function () {
                $.ajax({
                    url:"/stuInfo/selectActivityByStuId_R",
                    method:"post",
                    datatype:"json",
                    data:{"stuId":comparisonVue.stuId1},
                    success:function (data) {
                        comparisonVue.stuActivity = data;
                        comparisonVue.LoadDetail_score();
                    }
                })
            },
            LoadDetail_score:function () {
                $.ajax({
                    url:"/stuCollege/selectScore",
                    method:"post",
                    datatype:"json",
                    data:{"stucollegeid":comparisonVue.stuCollegeId},
                    success:function (data) {
                        comparisonVue.stuScore = data;
                        comparisonVue.LoadDetail_college();
                    }
                })
            },
            LoadDetail_college:function () {
                $.ajax({
                    url:"/college/selectById",
                    method:"post",
                    datatype:"json",
                    data:{"collegeid":comparisonVue.collegeId},
                    success:function (data) {
                        comparisonVue.collegeInfo = data;
                        comparisonVue.collegeName = comparisonVue.collegeInfo.collegename;
                        loadGrade_Left();
                    }
                })
            },

            LoadDetail2:function (stuCollegeId) {
                comparisonVue.stuCollegeId2 = stuCollegeId;
                $.ajax({
                    url:"/stuCollege/selectStuIdByStuCollegeId",
                    data:{"stuCollegeId":comparisonVue.stuCollegeId2},
                    method:"post",
                    datatype:"json",
                    success:function (stuId) {
                        comparisonVue.stuId2 = stuId;
                        comparisonVue.LoadDetail_collegeId2();
                    }
                });
            },
            LoadDetail_collegeId2:function () {
                $.ajax({
                    url:"/stuCollege/selectCollegeIdByStuCollegeId",
                    data:{"stuCollegeId":comparisonVue.stuCollegeId2},
                    method:"post",
                    datatype:"json",
                    success:function (collegeId) {
                        comparisonVue.collegeId2 = collegeId;
                        comparisonVue.LoadDetail_stuInfo2();
                    }
                });
            },
            LoadDetail_stuInfo2:function () {
                var stuId2 = comparisonVue.stuId2;
                $.ajax({
                    url:"/stuInfo/selectStuInfoByStuId",
                    method:"post",
                    datatype:"json",
                    data:{"stuId":stuId2},
                    success:function (data) {
                        comparisonVue.stuInfo2 = data;
                        comparisonVue.LoadDetail_stuCollege2();
                    }
                })
            },
            LoadDetail_stuCollege2:function () {
                $.ajax({
                    url:"/stuCollege/selectByPrimaryKey",
                    method:"post",
                    datatype:"json",
                    data:{"stuCollegeId":comparisonVue.stuCollegeId2},
                    success:function (data) {
                        comparisonVue.stuCollege2 = data;
                        comparisonVue.LoadDetail_activity2();
                    }
                })
            },
            LoadDetail_activity2:function () {
                $.ajax({
                    url:"/stuInfo/selectActivityByStuId_R",
                    method:"post",
                    datatype:"json",
                    data:{"stuId":comparisonVue.stuId2},
                    success:function (data) {
                        comparisonVue.stuActivity2 = data;
                        comparisonVue.LoadDetail_score2();
                    }
                })
            },
            LoadDetail_score2:function () {
                $.ajax({
                    url:"/stuCollege/selectScore",
                    method:"post",
                    datatype:"json",
                    data:{"stucollegeid":comparisonVue.stuCollegeId2},
                    success:function (data) {
                        comparisonVue.stuScore2 = data;
                        comparisonVue.LoadDetail_college2();
                    }
                })
            },
            LoadDetail_college2:function () {
                $.ajax({
                    url:"/college/selectById",
                    method:"post",
                    datatype:"json",
                    data:{"collegeid":comparisonVue.collegeId2},
                    success:function (data) {
                        comparisonVue.collegeInfo2 = data;
                        comparisonVue.collegeName2 = comparisonVue.collegeInfo2.collegename;
                        loadGrade_Right();
                    }
                })
            },
        }
    })
</script>
<script>
    //判断左右对比窗口占用情况
    $(function () {
        let comparisonList = localStorage.getItem("comparisonList");
        comparisonVue.searchCollectionFile(comparisonList);

    })

    function compare_delete() {
        //进行对比
        $("button[name='getDetail']").click(function () {
            var stucollegeid = $(this).parent().parent().children(":first").children(":first").val();
            if(comparisonVue.leftOccupied==0)
            {
                comparisonVue.leftOccupied = 1;
                comparisonVue.LoadDetail(stucollegeid);
                $("#leftIframe").attr("src","/encryption/desktopServer/comparisonDetail.jsp?stuCollegeId="+stucollegeid);
                deleteLeft_Right();
            }else
            {
                if(comparisonVue.rightOccupied==0)
                {
                    comparisonVue.rightOccupied = 1;
                    comparisonVue.LoadDetail2(stucollegeid);
                    $("#rightIframe").attr("src","/encryption/desktopServer/comparisonDetail.jsp?stuCollegeId="+stucollegeid);
                    deleteLeft_Right();
                }else
                {
                    alert("请清空占用后重试");
                }
            }
/*            window.open("/encryption/desktopServer/offerDetail.jsp?stuCollegeId="+stucollegeid);*/
        })
        //删除对比
        $("button[name='deleteComparison']").click(function () {
            let comparisonList = localStorage.getItem("comparisonList");
            var stucollegeid = $(this).parent().parent().children(":first").children(":first").val();
            var stuCollegeIdList = comparisonList.split("-");
            for(var index=0; index< stuCollegeIdList.length;index++)
            {
                if(stuCollegeIdList[index]==stucollegeid)
                {
                    stuCollegeIdList.splice(index,1);
                }
            }
            var newIdList = "";
            for(var id in stuCollegeIdList)
            {
                if(stuCollegeIdList[id]!=null&&stuCollegeIdList[id]!="")
                {
                    newIdList+=stuCollegeIdList[id];
                    if(stuCollegeIdList[id+1]!=null&&stuCollegeIdList[id+1]=="-")
                    {

                    }else
                    {
                        newIdList+="-";
                    }

                }
            }
            localStorage.removeItem("comparisonList");
            localStorage.setItem("comparisonList",newIdList);
            comparisonVue.searchCollectionFile(comparisonList);
            location.reload();
        })
        //删除左右栏
        function deleteLeft_Right()
        {
            $("#btn_leftDelete").click(function (){
                comparisonVue.leftOccupied = 0;
                $("#leftIframe").attr("src","/encryption/desktopServer/middleOfNoWhere.jsp");
            })
            $("#btn_rightDelete").click(function ()
            {
                comparisonVue.rightOccupied = 0;
                $("#rightIframe").attr("src","/encryption/desktopServer/middleOfNoWhere.jsp");
            })
        }
    }
</script>
<script>
    //注意进度条依赖 element 模块，否则无法进行正常渲染和功能性操作
    layui.use('element', function(){
        var $ = layui.jquery
        var element = layui.element;
        var active = {
            setGpa1:function ()
            {
                element.progress('bar_gpa1','50%')
            },
            setPercent: function(){
                //设置50%进度
                element.progress('demo', '50%')
            }
        }
        $('.site-demo-active').on('click', function(){
            var othis = $(this), type = $(this).data('type');
            active[type] ? active[type].call(this, othis) : '';
        });
    });
    //加载进度条
    function loadGrade_Left(){
        var gpa = $("#tr_gpa1").html();
        $("#gpa1").attr("lay-percent","50%")
    }
    function loadGrade_Right()
    {
        var gpa = $("#tr_gpa2").html();
        $("#gpa2").attr("lay-percent",gpa)
    }
</script>
</html>
