<%--
  Created by IntelliJ IDEA.
  User: Destine.Yuri
  Date: 2020/7/24
  Time: 10:59
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
    <script src="https://cdn.bootcdn.net/ajax/libs/echarts/5.0.0-beta.2/echarts.common.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/echarts-gl/1.1.2/echarts-gl.js"></script>
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
    div{
        /*border: 1px solid red;*/
    }
    .font_Harold
    {
        font-size: 200%;
        font-family: Lantinghei SC;
    }
    #reasons
    {
        width:100%;
        background-image: linear-gradient(to right,white,#f2f2f2);
        height:600px;
    }
    .reasons_Sub1 div
    {
        display: inline-block;
        margin-left:15%;
        margin-top:5%;
    }
    #flowDiv
    {
        margin:auto;
    }
    #contentDivMiddle
    {
        background-image: linear-gradient(to right,#FFFAFA,#ccffff);
    }
    .flowIMG
    {
        width: 100%;
        height: 100%;
    }
    .layui-icon
    {
        font-size: 100px;
    }
</style>
<body>
    <div id="contentDivMiddle">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
            <legend class="layui-anim" data-anim="layui-anim-up">欢迎来到Case100——留学生信息中心</legend>
        </fieldset>
        <div class="layui-carousel" id="flowDiv" lay-filter="test1">
            <div carousel-item="">
                <a href="http://www.yeyixuan.top/index.php/2020/12/11/2021%e5%b9%b4%e6%89%98%e7%a6%8f%e9%9b%85%e6%80%9d%e8%80%83%e8%af%95%e6%97%a5%e5%8e%86/"
                target="_blank"><div><img src="/static/img/content/Con1.jpg" class="flowIMG"></div></a>
                <a href="http://williamye.top/" target="_blank"><div><img src="/static/img/content/Con2.jpg" class="flowIMG"></div></a>
                <a href="#"><div><img src="/static/img/content/Con3.jpg" class="flowIMG"></div></a>
                <a href="http://williamye.top/index.php/saving/" target="_blank"><div><img src="/static/img/content/Con4.jpg" class="flowIMG"></div></a>
            </div>
        </div>
    </div>

    <div id="contentDivBottom">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
            <legend>最近录入档案</legend>
        </fieldset>


        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
            <legend>我们的服务100%免费！</legend>
        </fieldset>
        <div class="layui-progress" style="margin-bottom: 20px">
            <div class="layui-progress-bar" lay-percent="100%"></div>
        </div>
            <h2>全站统计数据</h2>
        <div id="statisticsDiv" style="margin-left:10%; margin-top:30px;">
            <div id="statisticsUpperDiv" style="width:90%; margin:0 auto;">
                <div id="sat_chanceDiv" style="width: 500px;height:400px;float:left">

                </div>
                <div id="act_chanceDiv" style="width: 500px;height:400px;float:left">

                </div>
            </div>
            <div id="statisticsMiddleDiv" style="width:90%; margin:0 auto">
                <div id="toefl_chanceDiv" style="width: 500px;height:400px;float:left">

                </div>
                <div id="ielts_chanceDiv" style="width: 500px;height:400px;float:left">

                </div>
            </div>
            <div id="statisticsLowerDiv" style="width:90%; margin:0 auto">
                <div id="gpa_chanceDiv" style="width: 500px;height:400px;float:left">

                </div>
                <div id="sat_toeflDiv" style="width: 500px;height:400px;float:left">

                </div>
            </div>
            <div id="statisticsMuchLowerDiv" style="width:90%; margin:0 auto">
                <div id="act_toeflDiv" style="width: 500px;height:400px;float:left">

                </div>
                <div id="sat_ieltsDiv" style="width: 500px;height:400px;float:left">

                </div>
            </div>
            <div id="statisticsBottomDiv" style="width:90%; margin:0 auto">
                <div id="act_ieltsDiv" style="width: 500px;height:400px;float:left">

                </div>
                <div id="earthDiv" style="width: 500px;height:400px;float:left">

                </div>
            </div>

        </div>

        <%--<div id="reasons">
            <div class="reasons_Sub1">
                <div>
                    <i class="layui-icon layui-icon-ok" style="color: #1E9FFF;"></i>
                    <p class="font_Harold">完全免费</p>
                </div>
                <div>
                    <i class="layui-icon layui-icon-password" style="color: #000033;"></i>
                    <p class="font_Harold">信息安全</p>
                </div>
                <div>
                    <i class="layui-icon layui-icon-user" style="color: #C67171;"></i>
                    <p class="font_Harold">用户信赖</p>
                </div>
                <div>
                    <i class="layui-icon layui-icon-list" style="color: #B3EE3A;"></i>
                    <p class="font_Harold">档案丰富</p>
                </div>
            </div>
            <div class="reasons_Sub1">
                <div>
                    <i class="layui-icon layui-icon-windows" style="color: #CD6889;"></i>
                    <p class="font_Harold">多平台</p>
                </div>

                <div>
                    <i class="layui-icon layui-icon-diamond" style="color: #8B5A00;"></i>
                    <p class="font_Harold">平等服务</p>
                </div>
                <div>
                    <i class="layui-icon layui-icon-website" style="color: #9F79EE;"></i>
                    <p class="font_Harold">全球档案</p>
                </div>
                <div>
                    <i class="layui-icon layui-icon-praise" style="color: #CD0000;"></i>
                    <p class="font_Harold">助您留学取得成功</p>
                </div>
            </div>
        </div>--%>

        <hr class="layui-bg">

    </div>

    <script>
        //JavaScript代码区域
        layui.use('element', function(){
            var element = layui.element;

        });
        var app3 = new Vue({
            el:"#statisticsDiv",
            data:{},
            methods:{
                addStatistics:function() {
                    $.ajax({
                        url:"/college/selectOfferInfo",
                        data:{"collegeid":"-1"},
                        method: "post",
                        datatype:"json",
                        success:function(data){
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
                                    min: 1100,
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
                                    min: 50,
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
                                    min: 3.0,
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
                                    min: 1.5,
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
                },
                addSatToefl:function (){
                    $.ajax({
                        url: "/processedData/presentTOEFLSAT",
                        data:{},
                        method: "post",
                        datatype: "json",
                        success:function (data)
                        {
                            var sat_toeflDiv = echarts.init(document.getElementById('sat_toeflDiv'));
                            var sat_toeflDivOption = {
                                title: {
                                    text: 'SAT - TOEFL 散点图'
                                },
                                xAxis: {
                                    type:'value',
                                    min: 1100,
                                    max: 1600
                                },
                                yAxis: {
                                    type:'value',
                                    min: 50,
                                    max: 120
                                },
                                tooltip: {
                                    /*返回需要的信息*/
                                    formatter: function(param) {
                                        var value = param.value;
                                        return '<div style="border-bottom: 1px solid rgba(255,255,255,.3); font-size: 16px;padding-bottom: 7px;margin-bottom: 7px;">' +
                                            value+'</div>';
                                    }
                                },
                                series: [{
                                    symbolSize: 10,
                                    data:data,
                                    type: 'scatter'
                                }]
                            };
                            sat_toeflDiv.setOption(sat_toeflDivOption);
                        }
                    })
                },
                addActToefl:function (){
                    $.ajax({
                        url: "/processedData/presentTOEFLACT",
                        data:{},
                        method: "post",
                        datatype: "json",
                        success:function (data)
                        {
                            var act_toeflDiv = echarts.init(document.getElementById('act_toeflDiv'));
                            var act_toeflDivOption = {
                                title: {
                                    text: 'ACT - TOEFL 散点图'
                                },
                                xAxis: {
                                    type:'value',
                                    min: 20,
                                    max: 36
                                },
                                yAxis: {
                                    type:'value',
                                    min: 50,
                                    max: 120
                                },
                                tooltip: {
                                    /*返回需要的信息*/
                                    formatter: function(param) {
                                        var value = param.value;
                                        return '<div style="border-bottom: 1px solid rgba(255,255,255,.3); font-size: 16px;padding-bottom: 7px;margin-bottom: 7px;">' +
                                            value+'</div>';
                                    }
                                },
                                series: [{
                                    symbolSize: 10,
                                    data:data,
                                    type: 'scatter'
                                }]
                            };
                            act_toeflDiv.setOption(act_toeflDivOption);
                        }
                    })
                },
                addSatIelts:function (){
                    $.ajax({
                        url: "/processedData/presentIELTSSAT",
                        data:{},
                        method: "post",
                        datatype: "json",
                        success:function (data)
                        {
                            var sat_ieltsDiv = echarts.init(document.getElementById('sat_ieltsDiv'));
                            var sat_ieltsDivOption = {
                                title: {
                                    text: 'SAT - IELTS 散点图'
                                },
                                xAxis: {
                                    type:'value',
                                    min: 1100,
                                    max: 1600
                                },
                                yAxis: {
                                    type:'value',
                                    min: 3.0,
                                    max: 9
                                },
                                tooltip: {
                                    /*返回需要的信息*/
                                    formatter: function(param) {
                                        var value = param.value;
                                        return '<div style="border-bottom: 1px solid rgba(255,255,255,.3); font-size: 16px;padding-bottom: 7px;margin-bottom: 7px;">' +
                                            value+'</div>';
                                    }
                                },
                                series: [{
                                    symbolSize: 20,
                                    data:data,
                                    type: 'scatter'
                                }]
                            };
                            sat_ieltsDiv.setOption(sat_ieltsDivOption);
                        }
                    })
                },
                addActIelts:function (){
                    $.ajax({
                        url: "/processedData/presentIELTSACT",
                        data:{},
                        method: "post",
                        datatype: "json",
                        success:function (data)
                        {
                            var act_ieltsDiv = echarts.init(document.getElementById('act_ieltsDiv'));
                            var act_ieltsDivOption = {
                                title: {
                                    text: 'ACT - IELTS 散点图'
                                },
                                xAxis: {
                                    type:'value',
                                    min: 20,
                                    max: 36
                                },
                                yAxis: {
                                    type:'value',
                                    min: 3.0,
                                    max: 9.0
                                },
                                tooltip: {
                                    /*返回需要的信息*/
                                    formatter: function(param) {
                                        var value = param.value;
                                        return '<div style="border-bottom: 1px solid rgba(255,255,255,.3); font-size: 16px;padding-bottom: 7px;margin-bottom: 7px;">' +
                                            value+'</div>';
                                    }
                                },
                                series: [{
                                    symbolSize: 20,
                                    data:data,
                                    type: 'scatter'
                                }]
                            };
                            act_ieltsDiv.setOption(act_ieltsDivOption);
                        }
                    })
                },
                addEarth:function (){
                    var earthDiv = echarts.init(document.getElementById('earthDiv'));
                    var earthDivOption = {
                        backgroundColor: '#000',
                        globe: {
                            baseTexture: "./world.jpg",
                            heightTexture: "./world.jpg",
                            displacementScale: 0.04,
                            shading: 'realistic',
                            environment: './starfield.jpg',
                            realisticMaterial: {
                                roughness: 0.9
                            },
                            postEffect: {
                                enable: true
                            },
                            light: {
                                main: {
                                    intensity: 5,
                                    shadow: true
                                },
                                ambientCubemap: {
                                    texture: './pisa.hdr',
                                    diffuseIntensity: 0.2
                                }
                            }
                        }
                    };
                    if (option && typeof option === "object") {
                        myChart.setOption(option, true);
                    }
                    earthDiv.setOption(earthDivOption);
                }
            }
        })
        $(function (){
            app3.addStatistics();
            app3.addSatToefl();
            app3.addActToefl();
            app3.addSatIelts();
            app3.addActIelts();
        })
    </script>
    <!--轮播-->
    <script>
        layui.use(['carousel', 'form'], function() {
            var carousel = layui.carousel
                , form = layui.form;

            //常规轮播
            carousel.render({
                elem: '#flowDiv'
                , width: '896'
                , height: '504'
                , interval: 5000
            })
        })
    </script>
</body>
</html>
