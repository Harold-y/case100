<%--
  Created by IntelliJ IDEA.
  User: 11950
  Date: 2020/8/22
  Time: 11:53
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
    #rightDiv
    {
        margin-right:10px;
        float: right;
        padding:5px;
        border-left: 1px solid #e2e2e2;
        height: 90%;
    }
</style>
<body>
<div id="maindiv">
    <div id="rightDiv">
        <div>
                                        <hr class="layui-bg-green">
                                        <h2>学校信息<img  id="schoolImg2" onerror="this.src='/img/newone.jpg'" style="border-radius: 140px;
                                border:1px solid #eeeeee"  width="50px"></h2>

                                        <div id="div_stuCollegeInfo2">

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

                                        <div id="div_stuCollege2">

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
                                        <h2>学生信息<img  id="personalImg2" onerror="this.src='/img/newone.jpg'" style="border-radius: 140px;
                                border:1px solid #eeeeee"  width="50px"></h2>

                                        <div id="div_stuInfo2">

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

                                        <div id="div_stuScore2">
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

                                        <div id="div_activity2">
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

                                        <div id="essay2">
                                            <p v-html="stuCollege.stucollegedistinctessayurl"></p>
                                        </div>
                                    </div>
    </div>

    </div>
</div>
<script>
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
        },
        methods:{
            LoadDetail:function () {
                var Ohref=window.location.href;
                var result=Ohref.split("?stuCollegeId=");
                var stuCollegeId = result[1];
                this.stuCollegeId = stuCollegeId;
                $.ajax({
                    url:"/stuCollege/selectStuIdByStuCollegeId",
                    data:{"stuCollegeId":stuCollegeId},
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
                        $("#schoolImg2").attr("src","http://yeyixuan.top/wp-content/uploads/college/"+comparisonVue.collegeName+".jpg");
                        $("#personalImg2").attr("src","http://yeyixuan.top/wp-content/uploads/stuInfo/"+comparisonVue.stuId1+".jpg");
                    }
                })
            },
        }
    })
    $(function ()
    {
        comparisonVue.LoadDetail();
    })
</script>
</body>
</html>
