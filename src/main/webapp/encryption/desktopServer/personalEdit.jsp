<%--
  Created by IntelliJ IDEA.
  User: Destine.Yuri
  Date: 2020/7/27
  Time: 19:02
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
    #personalImg
    {
        width:200px;
    }
    .layui-form-label
    {
        width:150px;
    }
    #div_btns
    {
        margin:auto;
    }
    .layui-input
    {
        width:190px;
    }
    fieldset{padding:.35em .625em .75em;margin:0 2px;border:1px solid silver}
    legend{padding:.5em;border:0;width:auto}
</style>
<script>
    $(function () {
        app4.selectById();
    })
    $(function () {
        $("#btn_edit").click(function () {
            app4.updateInfo();
            setTimeout(app4.hideSuccess,3000);
        })
    })
</script>
<body>
    <div id="maindiv">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
            <legend><i class="layui-icon layui-icon-edit"></i>编辑信息-${stuUsername}要做哪些修改呢？</legend>
        </fieldset>
        <hr class="layui-bg-blue">
        普通信息
        <div id="div_edit">
            <div class="layui-card" style="background-color: #5FB878" v-show="editSuccess">
                <div class="layui-card-body">
                    修改成功！
                </div>
            </div>
            <form class="" action="" id="form_signin">
                <div class="layui-form-item">
                    <div class="layui-input-inline">
                        <input type="hidden" name="" required  lay-verify="required" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">Case ID</label>
                    <div class="layui-input-inline">
                        <input type="text" name="stucaseid" required  lay-verify="required"
                               v-model="selectInfo.stucaseid" autocomplete="off" class="layui-input" disabled>
                    </div>
                    <div class="layui-form-mid layui-word-aux">暂时不能修改呢...</div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-inline">
                        <input type="text" name="stuusername" id="firstPassword" required lay-verify="required"
                               v-model="selectInfo.stuusername" autocomplete="off" class="layui-input">
                    </div>
                    <%--<div class="layui-form-mid layui-word-aux">辅助文字</div>--%>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">手机号码</label>
                    <div class="layui-input-inline">
                        <input type="text" name="stutelephone" required lay-verify="required"
                               v-model="selectInfo.stutelephone" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">请输入区号，大陆请以+86开头</div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-inline">
                        <input type="text" name="stupassword" required lay-verify="required"
                               v-model="selectInfo.stupassword" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">邮箱地址</label>
                    <div class="layui-input-inline">
                        <input type="text" name="stuemail" required lay-verify="required"
                               v-model="selectInfo.stuemail" autocomplete="off" class="layui-input" disabled>
                    </div>
                    <div class="layui-form-mid layui-word-aux">暂时不能修改呢...</div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">大陆居住省份</label>
                    <div class="layui-input-inline">
                        <%--<input type="text" name="stuprovince" required lay-verify="required"
                               v-model="selectInfo.stuprovince" autocomplete="off" class="layui-input">--%>
                        <select  name="stuprovince" v-model="selectInfo.stuprovince" class="form-control">
                            <option value="">请选择</option>
                            <option value="北京">北京市</option>
                            <option value="浙江省">浙江省</option>
                            <option value="天津市">天津市</option>
                            <option value="安徽省">安徽省</option>
                            <option value="上海市">上海市</option>
                            <option value="福建省">福建省</option>
                            <option value="重庆市">重庆市</option>
                            <option value="江西省">江西省</option>
                            <option value="山东省">山东省</option>
                            <option value="河南省">河南省</option>
                            <option value="湖北省">湖北省</option>
                            <option value="湖南省">湖南省</option>
                            <option value="广东省">广东省</option>
                            <option value="海南省">海南省</option>
                            <option value="山西省">山西省</option>
                            <option value="青海省">青海省</option>
                            <option value="江苏省">江苏省</option>
                            <option value="辽宁省">辽宁省</option>
                            <option value="吉林省">吉林省</option>
                            <option value="河北省">河北省</option>
                            <option value="贵州省">贵州省</option>
                            <option value="四川省">四川省</option>
                            <option value="云南省">云南省</option>
                            <option value="陕西省">陕西省</option>
                            <option value="甘肃省">甘肃省</option>
                            <option value="黑龙江省">黑龙江省</option>
                            <option value="广西壮族自治区">广西壮族自治区</option>
                            <option value="宁夏回族自治区">宁夏回族自治区</option>
                            <option value="新疆维吾尔自治区">新疆维吾尔自治区</option>
                            <option value="内蒙古自治区">内蒙古自治区</option>
                            <option value="西藏自治区">西藏自治区</option>
                        </select>
                    </div>
                    <div class="layui-form-mid layui-word-aux">境外用户不用填写</div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">居住城市</label>
                    <div class="layui-input-inline">
                        <input type="text" name="stucity" required lay-verify="required"
                               v-model="selectInfo.stucity" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">国家/地区</label>
                    <div class="layui-input-inline">
                        <%--<input type="text" name="stunationality" required lay-verify="required"
                               v-model="selectInfo.stunationality" autocomplete="off" class="layui-input">--%>
                        <select  name="stunationality" v-model="selectInfo.stunationality" class="form-control">
                            <option value="中国大陆">中国大陆</option>
                            <option value="美国">美国</option>
                            <option value="英国">英国</option>
                            <option value="澳大利亚">澳大利亚</option>
                            <option value="台湾">台湾</option>
                            <option value="香港">香港</option>
                            <option value="日本">日本</option>
                            <option value="加拿大">加拿大</option>
                            <option value="新西兰">新西兰</option>
                            <option value="新加坡">新加坡</option>
                            <option value="韩国">韩国</option>
                            <option value="意大利">意大利</option>
                            <option value="西班牙">西班牙</option>
                            <option value="俄罗斯">俄罗斯</option>
                            <option value="瑞士">瑞士</option>
                            <option value="德国">德国</option>
                            <option value="法国">法国</option>
                            <option value="其它国家地区">其它国家地区</option>
                        </select>
                    </div>
                </div>
                <hr class="layui-bg-orange">学业信息
                <div class="layui-form-item">
                    <label class="layui-form-label">高中名称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="stuhighschool" required lay-verify="required"
                               v-model="selectInfo.stuhighschool" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">GPA</label>
                    <div class="layui-input-inline">
                        <input type="text" name="stugpa" required lay-verify="required"
                               v-model="selectInfo.stugpa" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">性取向</label>
                    <div class="layui-input-inline">
                        <%--<input type="text" name="stusexualorientation" required lay-verify="required"
                               v-model="selectInfo.stusexualorientation" autocomplete="off" class="layui-input">--%>
                    <select class="form-control" name="stusexualorientation" required lay-verify="required"
                            v-model="selectInfo.stusexualorientation">
                        <option value="异性恋">异性恋</option>
                        <option value="同性恋">同性恋</option>
                        <option value="双性恋">双性恋</option>
                        <option value="无性恋">无性恋</option>
                        <option value="泛性恋">泛性恋</option>
                    </select>
                    </div>
                </div>
                <hr class="layui-bg-cyan">其他信息
                <div class="layui-form-item">
                    <label class="layui-form-label">个人介绍</label>
                    <div class="layui-input-inline">
                        <textarea name="stuotherinfo" class="layui-textarea" v-model="selectInfo.stuotherinfo"></textarea>
                    </div>
                </div>
            </form>
            <div class="layui-form-item" id="div_btns">
                <div class="layui-input-block">
                    <button class="layui-btn" id="btn_edit">确定修改</button>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
    var app4 = new Vue({
        el:"#maindiv",
        data:{
            selectInfo : "",
            editSuccess:false
        },
        methods:{
            selectById:function () {
                $.ajax({
                    url:"/stuInfo/selectById",
                    type:"post",
                    datatype:"json",
                    success:function (data) {
                        app4.selectInfo = data;
                    }
                })
            },
            updateInfo:function () {
                $.ajax({
                    url:"/stuInfo/updateByPrimaryKey",
                    type:"post",
                    data:app4.selectInfo,
                    datatype: "json",
                    success:function (index) {
                        if(index==1)
                        {
                            app4.editSuccess = true;
                        }else
                        {
                            app4.editSuccess = false;
                        }
                    }
                })
            },
            hideSuccess:function () {
                this.editSuccess = false;
            }
        }
    })
</script>
<%--<script>
    layui.use(['form'], function () {
        var form = layui.form;
    });
</script>--%>
</html>
