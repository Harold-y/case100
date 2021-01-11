<%--
  Created by IntelliJ IDEA.
  User: Destine.Yuri
  Date: 2020/8/2
  Time: 16:09
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
    <script src="https://cdn.bootcdn.net/ajax/libs/echarts/5.0.0-beta.2/echarts.common.js"></script>
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
        $("#personalImg").attr("src","http://yeyixuan.top/wp-content/uploads/stuInfo/"+stuId+".jpg");
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
<style>
    .layui-table
    {
        display: inline;
        margin-left:100px ;
        margin-top:50px;

    }
    #personalImg,#schoolImg
    {
        display: inline;
        margin-left:100px;
    }
    #essay
    {
        border: 1px solid #5FB878;
        margin:100px auto;
        width:100%;
    }
    div{
        /*border: 1px solid red;*/
    }
    #bottomDiv1
    {
        width:100%;
        height:300px;
        background-color: #f2f2f2;
    }
    #bottomDiv2
    {
        width:100%;
        height:50px;
        background-color: #F5F5F5;
    }
    .font_Harold
    {
        font-family: Lantinghei SC;
        color: #808080	;
    }
    .font_Harold2
    {
        font-family: Lantinghei SC;
        color: #999999	;
    }
    #imgDiv_top
    {
        width:100%;
        height: 300px;
        background-image: url("/img/strk.png");
        background-position: 100%;
        background-repeat: no-repeat;
        margin:0px auto;
    }
    #topDiv
    {
        width:100%;
        background-color: #324dc7;

    }
    #container_top
    {
        color:#f2f2f2;
        font-family: "lucida grande", "lucida sans unicode",
        lucida, helvetica, "Hiragino Sans GB", "Microsoft YaHei", "WenQuanYi Micro Hei", sans-serif;
        font-size:20px;
        padding:50px;
        width:30%;
        height: 200px;
        /*display: inline-block;*/
        float: left;
    }
    
    #container_top2
    {
        float: left;
        /*display: inline-block;*/
        padding:50px;
        height: 200px;
    }
    #container_top2 img
    {
        width:200px;
    }
    #container_top_sub2
    {
        margin-top:20px;
        font-size:10px;
    }
    #middleDiv
    {
        padding-left:20px;
        padding-right:20px;
    }
    #div_collegeInfo
    {
        padding:50px;
        font-size: 20px;
    }
    #leftDiv
    {
        display: inline-block;
        width: 60%;
        vertical-align:top;
        border-right: 1px solid #e2e2e2;
        border-left: 1px solid #e2e2e2;
    }
    #rightDiv
    {
        display: inline-block;
        width: 30%;
        overflow: auto;
        vertical-align:top;

    }
    .div_addInfo
    {
        margin-left:10%;
        width:40%;
        display: inline-block;
        margin-bottom: 20px;
    }
    .div_addInfo2
    {
        width:40%;
        display: inline-block;
        margin-bottom: 20px;
    }

    .controlDiv{
        background-color: #f2f2f2;
        float:left;
        margin-left:20px;
        text-align: center;
        padding:15px;
        border-radius: 30px;

        margin-bottom: 30px;
        font-family: "lucida grande", "lucida sans unicode",
        lucida, helvetica, "Hiragino Sans GB", "Microsoft YaHei", "WenQuanYi Micro Hei", sans-serif;
        font-size: 15px;
        border: 2px solid #5FB878;
        height:200px;
        width:230px;
    }
    .img_stu{
        height: 90%;
        border-radius: 5px;
    }
    .div_img_stu
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
    }
    .div_text
    {
        /*width:200px;*/
        margin-top:10px;
    }
    /*div{border: 1px solid red}*/
    .img_data_statistics
    {
        height: 300px;

    }
</style>
<body>
    <div id="nagivatorDiv">
        <ul class="layui-nav layui-bg-green">
            <li class="layui-nav-item"><a href="/encryption/desktopServer/main.jsp" >Case100</a></li>
            <li class="layui-nav-item layui-this"><a href="/encryption/desktopServer/main.jsp" >首页</a></li>
            <%--<li class="layui-nav-item"><a href="">留学圈</a></li>--%>
            <li class="layui-nav-item">
                <a href="javascript:;">申请档案馆</a>
            </li>
            <%--<li class="layui-nav-item"><a href="">对比</a></li>--%>
            <%--<li class="layui-nav-item"><a href="">留学申请帮助</a></li>--%>
            <li class="layui-nav-item" v-show="alreadyLogin">
                <a href="/encryption/desktopServer/personalCenter.jsp" target="myiframe">个人中心<span class="layui"></span></a>
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
    <div id="maindiv">
        <div id="topDiv">
            <div id="imgDiv_top">
                <div id="container_top2">
                    <img  v-bind:src="imgSrc">
                </div>
                <div id="container_top">
                    <h1>
                        <p v-text="collegeInfo.collegename"></p>
                        <p v-text="collegeInfo.collegeChineseName"></p>
                    </h1>
                    <div id="container_top_sub2">
                        <i class="layui-icon layui-icon-location" style="display: inline-block"></i>&nbsp<p v-text="collegeInfo.collegearea" style="display: inline-block"> </p><br>
                        <i class="layui-icon layui-icon-website"></i>&nbspUS News World Ranking: <p v-text="collegeranking.rankingusnewsworld" style="display: inline-block"></p>
                    </div>
                </div>

            </div>

        </div>
        <hr>
        <div id="middleDiv">
            <div id="div_collegeInfo">
                College Information:
            </div>
            <div id="leftDiv">

                <div class="div_addInfo">
                    <h2>学校介绍</h2>
                    <div id="collegeIntroductionDiv" v-html="collegeInfo.collegeintroduction">

                    </div>
                </div>


                <hr><br>
                <div class="div_addInfo">
                    <h2>学费</h2>
                    <h5 v-text="collegeInfo.collegetuition"></h5>
                    <hr>
                </div>
                <div class="div_addInfo2">
                    <h2>生活费</h2>
                    <h5 v-text="collegeInfo.collegeexpense"></h5>
                    <hr>
                </div>
                <div class="div_addInfo">
                    <h2>录取率</h2>
                    <h5 v-text="collegeInfo.collegeacceptancerate"></h5>
                    <hr>
                </div>
                <div class="div_addInfo2">
                    <h2>占地面积</h2>
                    <h5 v-text="collegeInfo.collegecampsize"></h5>
                    <hr>
                </div>
                <div class="div_addInfo">
                    <h2>男女比例</h2>
                    <h5 v-text="collegeInfo.collegemenwomanradio"></h5>
                    <hr>
                </div>
                <div class="div_addInfo2">
                    <h2>ED日期</h2>
                    <h5 v-text="collegeInfo.collegeearlydecision"></h5>
                    <hr>
                </div>
                <div class="div_addInfo">
                    <h2>EA日期</h2>
                    <h5 v-text="collegeInfo.collegeearlyaction"></h5>
                    <hr>
                </div>
                <div class="div_addInfo2">
                    <h2>RD日期</h2>
                    <h5 v-text="collegeInfo.collegeregulardecision"></h5>
                    <hr>
                </div>

                <div class="div_addInfo">
                    <h2>新生返校率</h2>
                    <h5 v-text="collegeInfo.collegeavgfreshmanretention"></h5>
                    <hr>
                </div>
                <div class="div_addInfo2">
                    <h2>学生数量</h2>
                    <h5 v-text="collegeInfo.collegestudentcount"></h5>
                    <hr>
                </div>
                <div class="div_addInfo">
                    <h2>国际学生数量</h2>
                    <h5 v-text="collegeInfo.collegeinternationalstucount"></h5>
                    <hr>
                </div>
                <div class="div_addInfo2">
                    <h2>师生比例</h2>
                    <h5 v-text="collegeInfo.collegeteacherstudentratio"></h5>
                    <hr>
                </div>
                <div class="div_addInfo">
                    <h2>是否为公立</h2>
                    <h5 v-text="collegeInfo.collegeispublic"></h5>
                    <hr>
                </div>
                <div class="div_addInfo2">
                    <h2>城市</h2>
                    <h5 v-text="collegeInfo.collegecity"></h5>
                    <hr>
                </div>
                <div class="div_addInfo">
                    <h2>面试</h2>
                    <h5 v-text="collegeInfo.collegeaudition"></h5>
                    <hr>
                </div>
                <div class="div_addInfo2">
                    <h2>优势科目</h2>
                    <h5 v-text="collegeInfo.collegeadvansubject"></h5>
                    <hr>
                </div>

                <hr><br>
                <div class="div_addInfo">
                    <h1 style="margin-bottom: 20px" v-html="year">2020</h1>
                    <h2>US News Local</h2>
                    <h5 v-text="collegeranking.rankingusnewslocal"></h5>
                    <hr>
                </div>
                <div class="div_addInfo2">
                    <h2>上海交大排名(ARWU) World</h2>
                    <h5 v-text="collegeranking.rankingarwuworld"></h5>
                    <hr>
                </div>
                <div class="div_addInfo">
                    <h2>US News World</h2>
                    <h5 v-text="collegeranking.rankingusnewsworld"></h5>
                    <hr>
                </div>
                <div class="div_addInfo2">
                    <h2>QS News World</h2>
                    <h5 v-text="collegeranking.rankingqsworld"></h5>
                    <hr>
                </div>

                <hr><br>
                <div class="div_addInfo">
                    <h2>学生感受</h2>
                    <div id="studentFeelingDiv" v-html="collegeInfo.collegestufeeling">

                    </div>
                </div>
                <hr><br>
                <div class="div_addInfo">
                    <h2>毕业未来</h2>
                    <div id="futureDiv" v-html="collegeInfo.collegefuture">

                    </div>
                </div>
                <hr><br>
                <div class="div_addInfo">
                    <h2>录取分数数据库</h2>
                    <div id="sat_chanceDiv"  style="width: 600px;height:400px;">

                    </div>

                    <div id="act_chanceDiv"  style="width: 600px;height:400px;">

                    </div>

                    <div id="toefl_chanceDiv"  style="width: 600px;height:400px;">

                    </div>

                    <div id="ielts_chanceDiv"  style="width: 600px;height:400px;">

                    </div>
                    <div id="gpa_chanceDiv"  style="width: 600px;height:400px;">

                    </div>
                </div>
                <hr><br>



            </div>
            <div id="rightDiv">
                最近的案例（请登陆后查看）：
                <div id="add_div">
                    <%--<div class="controlDiv" >
                        <div class="layui-row grid-demo">
                            <div class="left_up_Div">
                                <input type='hidden' value='"+collegeId+"'>
                                <div class='div_img_stu'>
                                    <img src="/static/img/stuInfo/18.jpg" class='img_stu'>
                                </div>
                                <div class="div_text stuName">
                                    Harold
                                </div>
                                <div class="div_text schoolName">
                                    SAT:1480<br>
                                    ...
                                </div>
                            </div>

                                <div class="layui-col-md12 div_checkDetail">
                                    <button class="layui-btn layui-btn-sm btn_checkDetail" name='getDetail' >查看</button>
                              </div>

                        </div>
                    </div>--%>
                </div>
            </div>
        </div>
    </div>
<hr class="layui-bg">
<div id="bottomDiv2" class="font_Harold2">
    <div id="beian" style="text-align: center">
        京H132523 Ex.
    </div>
    <div id="maker" style="text-align: center">
        Made By @<a href="http://williamye.top/index.php/2017/01/10/%e4%b8%aa%e4%ba%ba%e4%bb%8b%e7%bb%8dintroduction/"
                    target="_blank">Harold Ye</a>
    </div>
</div>
</body>
<script>
    var Ohref=window.location.href;
    var result=Ohref.split("?collegeId=");
    let collegeId = result[1];
    var myDate = new Date();
    tYear = myDate.getFullYear();
    var schoolDetailVue = new Vue({
        el:"#maindiv",
        data:{
            collegeId:collegeId,
            collegeInfo:"",
            collegeranking:"",
            year:tYear,
            imgSrc:""
        },
        methods:{
            selectCollegeInfo:function () {
                $.ajax({
                    url:"/college/selectById",
                    data:{"collegeid":collegeId},
                    methods:"post",
                    datatype:"json",
                    success:function (data) {
                        schoolDetailVue.collegeInfo = data;
                        schoolDetailVue.imgSrc="http://yeyixuan.top/wp-content/uploads/college/"+schoolDetailVue.collegeInfo.collegename+".jpg";
                    }
                })
            },
            selectCollegeRanking:function () {
                $.ajax({
                    url:"/collegeranking/selectByCollegeId_rk",
                    data:{"collegeid":collegeId,"rankingYear":tYear},
                    methods:"post",
                    datatype:"json",
                    success:function (data) {
                        schoolDetailVue.collegeranking = data;
                    }
                })
            },
            addStu:function () {
                $.ajax({
                    url:"/stuCollege/selectStudentOfferByCollegeId",
                    data:{"collegeId":collegeId},
                    methods:"post",
                    datatype:"json",
                    success:function (data) {
                        addStudentOffer("add_div",data);
                        getDetail();
                    }
                })
            },
            addStatistics:function() {
                $.ajax({
                    url:"/college/selectOfferInfo",
                    data:{"collegeid":collegeId},
                    method: "post",
                    datatype:"json",
                    success:function(data){
                        console.log(data)
                        var sat_myChart = echarts.init(document.getElementById('sat_chanceDiv'));
                        var sat_option = {
                            title: {
                                text: '学校录取统计信息-SAT'
                            },
                            tooltip: {},
                            legend: {
                                data:['分数']
                            },
                            xAxis: {
                                data: ["SAT平均数","SAT中位数","SAT最大值","SAT最小值"]
                            },
                            yAxis: {
                                type:'value',
                                min: 1200,
                                max: 1600
                            },
                            series: [{
                                name: '分数',
                                type: 'bar',
                                data: [data['sat_mean'],data['sat_median'],data['sat_max'],data['sat_min']],
                                color: ['#83e1eb','#548bf0','#8f9ecf','#9cc6ac'],
                            }]
                        };

                        // 使用刚指定的配置项和数据显示图表。
                        sat_myChart.setOption(sat_option);

                        var act_myChart = echarts.init(document.getElementById('act_chanceDiv'));
                        var act_option = {
                            title: {
                                text: '学校录取统计信息-ACT'
                            },
                            tooltip: {},
                            legend: {
                                data:['分数']
                            },
                            xAxis: {
                                data: ["ACT平均数","ACT中位数","ACT最大值","ACT最小值"]
                            },
                            yAxis: {
                                type:'value',
                                min: 14,
                                max: 36
                            },
                            series: [{
                                name: '分数',
                                type: 'bar',
                                data: [data['act_mean'],data['act_median'],data['act_max'],data['act_min']],
                                color: ['#4371c6','#617ab7','#68aec0','#9cc6ac'],
                            }]
                        };

                        // 使用刚指定的配置项和数据显示图表。
                        act_myChart.setOption(act_option);

                        var toefl_myChart = echarts.init(document.getElementById('toefl_chanceDiv'));
                        var toefl_option = {
                            title: {
                                text: '学校录取统计信息-TOEFL'
                            },
                            tooltip: {},
                            legend: {
                                data:['分数']
                            },
                            xAxis: {
                                data: ["TOEFL平均数","TOEFL中位数","TOEFL最大值","TOEFL最小值"]
                            },
                            yAxis: {
                                type:'value',
                                min: 60,
                                max: 120
                            },
                            series: [{
                                name: '分数',
                                type: 'bar',
                                data: [data['toefl_mean'],data['toefl_median'],data['toefl_max'],data['toefl_min']],
                                color: ['#34175d','#5c1caa','#4e45bf','#4e4389'],
                            }]
                        };

                        // 使用刚指定的配置项和数据显示图表。
                        toefl_myChart.setOption(toefl_option);

                        var ielts_myChart = echarts.init(document.getElementById('ielts_chanceDiv'));
                        var ielts_option = {
                            title: {
                                text: '学校录取统计信息-IELTS'
                            },
                            tooltip: {},
                            legend: {
                                data:['分数']
                            },
                            xAxis: {
                                data: ["IELTS平均数","IELTS中位数","IELTS最大值","IELTS最小值"]
                            },
                            yAxis: {
                                type:'value',
                                min: 4.5,
                                max: 9
                            },
                            series: [{
                                name: '分数',
                                type: 'bar',
                                data: [data['ielts_mean'],data['ielts_median'],data['ielts_max'],data['ielts_min']],
                                color: ['#ab949b','#b4aaaf','#b7acb1','#ceccce'],
                            }]
                        };

                        // 使用刚指定的配置项和数据显示图表。
                        ielts_myChart.setOption(ielts_option);

                        var gpa_myChart = echarts.init(document.getElementById('gpa_chanceDiv'));
                        var gpa_option = {
                            title: {
                                text: '学校录取统计信息-GPA'
                            },
                            tooltip: {},
                            legend: {
                                data:['分数']
                            },
                            xAxis: {
                                data: ["GPA平均数","GPA中位数","GPA最大值","GPA最小值"]
                            },
                            yAxis: {
                                type:'value',
                                min: 3.0,
                                max: 4
                            },
                            series: [{
                                name: '分数',
                                type: 'bar',
                                data: [data['gpa_mean'],data['gpa_median'],data['gpa_max'],data['gpa_min']],
                                color: ['#5c88e7','#5e96e0','#67a8de','#80d8da'],
                            }]
                        };

                        // 使用刚指定的配置项和数据显示图表。
                        gpa_myChart.setOption(gpa_option);
                    }
                })
            }
        }
    })
    $(function   () {
        schoolDetailVue.selectCollegeInfo();
        schoolDetailVue.selectCollegeRanking();
        schoolDetailVue.addStu();
        schoolDetailVue.addStatistics();
    })
    function getDetail() {
        $("button[name='getDetail']").click(function () {
            if(app3.alreadyLogin==false)
            {

            }else
            {
                let stuCollegeId = $(this).parent().parent().children(":first").children(":first").val();
                window.open("/encryption/desktopServer/offerDetail.jsp?stuCollegeId="+stuCollegeId);
            }

        })
    }
</script>
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
</html>
