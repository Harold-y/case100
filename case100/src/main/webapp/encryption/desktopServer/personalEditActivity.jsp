<%--
  Created by IntelliJ IDEA.
  User: Destine.Yuri
  Date: 2020/7/20
  Time: 9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="https://www.layuicdn.com/layui/css/layui.css" />
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/layui/2.5.6/layui.min.js"></script>
    <script src="/js/adminServer.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/adminServerCommon.css" />
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script  src="/js/personalEdit.js"></script>
</head>
<body>
<script>
    $(function () {
        queryall();
    })
    function queryall() {
        $.ajax({
            url:"/stuInfo/selectActivityByStuId",
            datatype:"json",
            methpd:"post",
            success:function (data) {
                addActivity("tbody_editScore",data);
                editScore();
            }
        })
    }
    function editScore()
    {
        $("button[name='Edit']").click(function () {
            $(this).attr("data-toggle","modal").attr("data-target","#modal_edit");
            let id = $(this).parent().parent().children(":first").html();
            scoreVue.addInfo(id);
        })
    }
    $(function () {
        $("#btn_modelConfirm").click(function () {
            completeEdit();
        })
    })
    $(function () {
        $("#btn_modelAddConfirm").click(function () {
            completeAdd();
        })
    })
    function completeEdit () {
        $.ajax({
            url:"/stuInfo/updateActivity",
            method:"post",
            datatype:"json",
            data:$("#form_editinformation").serialize(),
            success:function (index) {
                if(index==1)
                {
                    scoreVue.afterComplete();
                }
            }
        })
    }
    function completeAdd()
    {
        $.ajax({
            url:"/stuInfo/insertIntoActivity",
            method:"post",
            datatype:"json",
            data:$("#form_addinformation").serialize(),
            success:function (index) {
                if(index==1)
                {
                    $("#form_addinformation").find('input[type=text],select,input[type=hidden],input[type=date],textarea').each(function() {
                        $(this).val('');
                    })
                    scoreVue.afterComplete();
                }

            }

        })
    }
    $(function () {
        $("#btn_addShow").click(function () {
            $(this).attr("data-toggle","modal").attr("data-target","#modal_add");
        })
    })
</script>
<style>
    .layui-input
    {
        width:200px;
    }
    fieldset{padding:.35em .625em .75em;margin:0 2px;border:1px solid silver}
    legend{padding:.5em;border:0;width:auto}
</style>
<div id="maindiv">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
        <legend><i class="layui-icon layui-icon-release"></i>${stuUsername}的个人活动</legend>
    </fieldset>
    <hr class="layui-bg-red">
    <div class="layui-card layui-bg-green" id="div_signUpSuccess" v-show="ReviseSuccess1">
        <div class="layui-card-header">提示</div>
        <div class="layui-card-body">
            您已经操作成功！
        </div>
    </div>
    <button class="layui-btn layui-btn-radius" id="btn_addShow">添加活动</button>
    <table class="layui-table">
        <colgroup>
            <col width="50">
            <col width="300">
            <col width="300">
            <col>
        </colgroup>
        <thead>
        <tr>
            <th>Activity ID</th>
            <th>活动名称</th>
            <th>活动结果</th>
            <th>注释</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="tbody_editScore">

        </tbody>
    </table>
    <div class="modal fade" aria-hidden="true" id="modal_edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title"id="modal_edit_label"style="">编辑成绩</h4>
                </div>
                <div class="modal-body">
                    <form id="form_editinformation">
                        <table id="edittable">
                            <tr>
                                <td>
                                    Activity ID:
                                </td>
                                <td>
                                    <input class="layui-input"  name="activityid" type="text" v-model="selectScore.activityid" readonly="readonly">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    活动名称:
                                </td>
                                <td>
                                    <input class="layui-input"  name="activityname" type="text" v-model="selectScore.activityname">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    活动结果:
                                </td>
                                <td>
                                    <textarea class="layui-textarea"  name="activityresult" v-model="selectScore.activityresult"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    活动注释:
                                </td>
                                <td>
                                    <textarea class="layui-textarea"  name="activitynote" v-model="selectScore.activitynote"></textarea>
                                </td>
                            </tr>
                        </table>

                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button"class="layui-btn" id="btn_modelConfirm">确认修改</button>
                    <button type="button"class="layui-btn layui-btn-primary" data-dismiss="modal">关闭</button>
                </div>
            </div><!--/.modal-content-->
        </div><!--/.modal-->
    </div>

    <div class="modal fade" aria-hidden="true" id="modal_add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title"id="modal_add_label"style="">添加成绩</h4>
                </div>
                <div class="modal-body">
                    <form id="form_addinformation" class="">
                        <table id="addtable">
                            <tr>
                                <td>
                                    活动名称:
                                </td>
                                <td>
                                    <input class="layui-input"  name="activityname" type="text">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    活动结果:
                                </td>
                                <td>
                                    <textarea class="layui-textarea"  name="activityresult" type="text"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    活动注释:
                                </td>
                                <td>
                                    <textarea class="layui-textarea"  name="activitynote" type="text"></textarea>
                                </td>
                            </tr>
                        </table>

                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button"class="layui-btn" id="btn_modelAddConfirm">确认添加</button>
                    <button type="button"class="layui-btn layui-btn-primary" data-dismiss="modal">关闭</button>
                </div>
            </div><!--/.modal-content-->
        </div><!--/.modal-->
    </div>

</div>

</body>
<script>
    var scoreVue = new Vue({
        el:"#maindiv",
        data:{
            selectScore:"",
            ReviseSuccess1:false
        },
        methods:{
            addInfo:function (id) {
                $.ajax({
                    url:"/stuInfo/selectActivityByActivityId",
                    method:"post",
                    datatype:"json",
                    data:{"activityid":id},
                    success:function (data) {
                        scoreVue.selectScore = data;
                    }
                })
            },

            hideSuccess:function () {
                this.ReviseSuccess1 = false;
            },
            afterComplete:function () {
                $("#modal_edit").modal("hide");
                $("#modal_add").modal("hide");
                scoreVue.ReviseSuccess1 = true;
                setTimeout(scoreVue.hideSuccess,3000);
                queryall();
            },

        }
    })
</script>
<script>
    //Demo
    layui.use('form', function () {
        var form = layui.form;

    });
</script>
</html>
