<%--
  Created by IntelliJ IDEA.
  User: Destine.Yuri
  Date: 2020/7/28
  Time: 17:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Offer Detail</title>
    <link rel="stylesheet" type="text/css" href="https://www.layuicdn.com/layui/css/layui.css" />
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/layui/2.5.6/layui.min.js"></script>
    <script  src="/js/personalCollege.js"></script>
    <%--<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>--%>
</head>
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
#notification
{
    margin-left: 10%;
    margin-top:1%;
}
.panel
{
    width:30%;
    display: inline-block;
}
</style>
<script>
    $(function () {
        offerDetailVue.LoadDetail();
    })
    function setStuInfo() {
        $("#schoolImg").attr("src","http://yeyixuan.top/wp-content/uploads/college/"+offerDetailVue.collegeName+".jpg");
        $("#personalImg1").attr("src","http://yeyixuan.top/wp-content/uploads/stuInfo/"+offerDetailVue.stuId1+".jpg");

    }
    $(function () {
        let stuId = ${stuId};
        $("#personalImg").attr("src","http://yeyixuan.top/wp-content/uploads/stuInfo/"+stuId+".jpg");
    })
    $('#personalImg').on("error", function() {
        $(this).attr('src', '/img/newone.jpg');  // 替换为默认图片
    });
    $(function () {
        let stuId = ${stuId};
        offerDetailVue.stuId = stuId;
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
    function checkStar() {
        $.ajax({
            url:"/stuCollege/selectStuCollegeCollectionByCondition",
            method:"post",
            datatype:"json",
            data:{"stuCollegeId":offerDetailVue.stuCollegeId},
            success:function (data) {
                if(data==null || data=="")
                {
                    offerDetailVue.collectionStarShow = false;
                }else
                {
                    offerDetailVue.collectionStarShow = true;
                }
            }
        })
    }
    $(function checkCollection() {
        setTimeout(checkStar,50);
    })
</script>
<body>
<div id="nagivatorDiv">
    <ul class="layui-nav layui-bg-green">
        <li class="layui-nav-item"><a href="/encryption/desktopServer/main.jsp">Case100</a></li>
        <li class="layui-nav-item layui-this"><a href="/encryption/desktopServer/main.jsp">首页</a></li>
        <li class="layui-nav-item"><a href="http://www.yeyixuan.top/" target="myiframe" onclick="changeFrameHeight3()">留学圈资讯</a></li>
        <li class="layui-nav-item">
            <a href="/encryption/desktopServer/resourceCenter.jsp" target="myiframe" onclick="changeFrameHeight4()">申请档案馆</a>
        </li>
        <li class="layui-nav-item"><a href="/encryption/desktopServer/comparison.jsp" v-show="alreadyLogin" target="myiframe" onclick="changeFrameHeight3()">对比</a></li>
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

<div id="middlediv">
    <%--<iframe src="welcome.jsp" width="100%" id="myiframe" scrolling="no"
            frameborder="0" name="myiframe"></iframe>--%>
        <div id="maindiv">

            <hr class="layui-bg-green">
            <h2>学校信息</h2>

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
                <img src="//t.cn/RCzsdCq" id="schoolImg" onerror="this.src='/img/newone.jpg'" style="border-radius: 140px;
                border:1px solid #eeeeee"  width="200px">
                收藏：
                <i class="layui-icon layui-icon-star" style="font-size: 30px; color: #1E9FFF;"
                   @click="addCollection" v-show="!collectionStarShow"></i>
                <i class="layui-icon layui-icon-star-fill" style="font-size: 30px; color: #1E9FFF;"
                   @click="removeCollection" v-show="collectionStarShow"></i>&nbsp&nbsp&nbsp&nbsp
                对比：
                <i class="layui-icon layui-icon-circle" style="font-size: 30px; color: #1E9FFF;"
                   @click="addComparison" v-show="showComparison"></i>
                <i class="layui-icon layui-icon-radio" style="font-size: 30px; color: #1E9FFF;"
                    v-show="!showComparison"></i>
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
            <h2>学生信息</h2>

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
                <img src="//t.cn/RCzsdCq" id="personalImg1" onerror="this.src='/img/newone.jpg'" style="border-radius: 140px;
                border:1px solid #eeeeee"  width="200px">
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
        </div>
</div>

<hr class="layui-bg">
<%--<div id="bottomDiv1" class="font_Harold">
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
                    <li class="list-group-item"><a href="">打赏</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>--%>
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
        ifm.height=document.documentElement.clientHeight;
    }
    window.onresize=function(){
        changeFrameHeight();
    }
    window.onload = function () {
        changeFrameHeight();
    }
</script>
</body>
<script>
    var offerDetailVue = new Vue({
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
            collectionStarShow:false,
            stuId:"",
            showComparison:true
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
                        offerDetailVue.stuId1 = stuId;
                        offerDetailVue.LoadDetail_collegeId();
                    }
                });
            },
            LoadDetail_collegeId:function () {
                $.ajax({
                    url:"/stuCollege/selectCollegeIdByStuCollegeId",
                    data:{"stuCollegeId":offerDetailVue.stuCollegeId},
                    method:"post",
                    datatype:"json",
                    success:function (collegeId) {
                        offerDetailVue.collegeId = collegeId;
                        offerDetailVue.LoadDetail_stuInfo();
                    }
                });
            },
            LoadDetail_stuInfo:function () {
                var stuId1 = offerDetailVue.stuId1;
                $.ajax({
                    url:"/stuInfo/selectStuInfoByStuId",
                    method:"post",
                    datatype:"json",
                    data:{"stuId":stuId1},
                    success:function (data) {
                        offerDetailVue.stuInfo = data;
                        offerDetailVue.LoadDetail_stuCollege();
                    }
                })
            },
            LoadDetail_stuCollege:function () {
                $.ajax({
                    url:"/stuCollege/selectByPrimaryKey",
                    method:"post",
                    datatype:"json",
                    data:{"stuCollegeId":offerDetailVue.stuCollegeId},
                    success:function (data) {
                        offerDetailVue.stuCollege = data;
                        offerDetailVue.LoadDetail_activity();
                    }
                })
            },
            LoadDetail_activity:function () {
                $.ajax({
                    url:"/stuInfo/selectActivityByStuId_R",
                    method:"post",
                    datatype:"json",
                    data:{"stuId":offerDetailVue.stuId1},
                    success:function (data) {
                        offerDetailVue.stuActivity = data;
                        offerDetailVue.LoadDetail_score();
                    }
                })
            },
            LoadDetail_score:function () {
                $.ajax({
                    url:"/stuCollege/selectScore",
                    method:"post",
                    datatype:"json",
                    data:{"stucollegeid":offerDetailVue.stuCollegeId},
                    success:function (data) {
                        offerDetailVue.stuScore = data;
                        offerDetailVue.LoadDetail_college();
                    }
                })
            },
            LoadDetail_college:function () {
                $.ajax({
                    url:"/college/selectById",
                    method:"post",
                    datatype:"json",
                    data:{"collegeid":offerDetailVue.collegeId},
                    success:function (data) {
                        offerDetailVue.collegeInfo = data;
                        offerDetailVue.collegeName = offerDetailVue.collegeInfo.collegename;
                        setStuInfo();
                    }
                })
            },
            addCollection:function () {
                if(offerDetailVue.collectionStarShow == false)
                {

                    $.ajax({
                        url:"/stuCollege/insertIntoStuCollegeCollection",
                        method:"post",
                        data:{"stuId":offerDetailVue.stuId,"stuCollegeId":offerDetailVue.stuCollegeId},
                        datatype:"json",
                        success:function (index) {
                            if(index>0)
                            {
                                offerDetailVue.collectionStarShow = true;
                            }
                        }
                    })
                }
            },
            removeCollection:function () {
                if(offerDetailVue.collectionStarShow == true)
                {
                    $.ajax({
                        url:"/stuCollege/deleteStuCollegeCollectionById",
                        method:"post",
                        data:{"stuId":offerDetailVue.stuId,"stuCollegeId":offerDetailVue.stuCollegeId},
                        datatype:"json",
                        success:function (index) {
                            if(index>0)
                            {
                                offerDetailVue.collectionStarShow = false;
                            }
                        }
                    })
                }
            },
            addComparison:function () {
                var comparisonList=localStorage.getItem("comparisonList");
                comparisonList+=offerDetailVue.stuCollegeId;
                comparisonList+="-";
                localStorage.removeItem("comparisonList");
                localStorage.setItem("comparisonList",comparisonList);
                this.showComparison=false;
            }

        }
    })
</script>
</html>
