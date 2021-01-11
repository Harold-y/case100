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
            url:"/stuInfo/selectStuScoreByStuId",
            datatype:"json",
            methpd:"post",
            success:function (data) {
                addTab_Score("tbody_editScore",data);
                editScore();
            }
        })
    }
    function editScore()
    {
        $("button[name='Edit']").click(function () {
            $(this).attr("data-toggle","modal").attr("data-target","#modal_edit");
            var id = $(this).parent().parent().children(":first").html();
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
            url:"/stuInfo/updateStuExamSub",
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
        var examsubid = $("#add_examSubId").val();
        var stuexamsubscore = $("#add_stuexamsubscore").val();
        var testdate = $("#add_testdate").val();
        $.ajax({
            url:"/stuInfo/insertIntostuExamSub",
            method:"post",
            datatype:"json",
            data:{"examsubid":examsubid,"stuexamsubscore":stuexamsubscore,"testdate":testdate},
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
    $(function () {
        $.ajax({
            url:"/stuInfo/selectExamGenreAll",
            method:"post",
            datatype:"json",
            success:function (data) {
                addOption_Score_Genre(data);
            }
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
        <legend><i class="layui-icon layui-icon-read"></i>${stuUsername}的考试成绩</legend>
    </fieldset>

    <hr class="layui-bg-red">
    <div class="layui-card layui-bg-green" id="div_signUpSuccess" v-show="ReviseSuccess1">
        <div class="layui-card-header">提示</div>
        <div class="layui-card-body">
            您已经操作成功！
        </div>
    </div>
    <button class="layui-btn layui-btn-radius" id="btn_addShow">添加成绩</button>
    <table class="layui-table">
        <colgroup>
            <col width="150">
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
                                    ID(不可编辑):
                                </td>
                                <td>
                                    <input class="layui-input" name="stuexamsubid" type="text" v-model="selectScore.stuExamSubId" readonly="readonly">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    考试名称(不可编辑):
                                </td>
                                <td>
                                    <input class="layui-input" name="examname" type="text" v-model="selectScore.examname" readonly="readonly">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    考试子科目(不可编辑):
                                </td>
                                <td>
                                    <input class="layui-input" name="examsubname" type="text" v-model="selectScore.examSubName" readonly="readonly">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    成绩:
                                </td>
                                <td>
                                    <input class="layui-input" name="stuexamsubscore" type="text" v-model="selectScore.stuExamSubScore">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    时间:
                                </td>
                                <td>
                                    <input class="layui-input" name="testdate"  type="date" v-model="selectScore.testDate">
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
                                    考试名称:
                                </td>
                                <td>
                                        <select name="subid" id="add_examid" @mouseout="add_selectSub" class="form-control">
<%--                                            <option value="1">TOEFL托福</option>
                                            <option value="2">IELTS雅思</option>
                                            <option value="3">SAT1</option>
                                            <option value="4">SAT2</option>
                                            <option value="5">AP</option>
                                            <option value="6">IB</option>
                                            <option value="7">A-Level</option>
                                            <option value="8">ACT</option>
                                            <option value="9">Duolingo</option>
                                            <option value="10">GRE</option>
                                            <option value="11">GMAT</option>--%>
                                        </select>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    考试子科目:
                                </td>
                                <td>
                                        <select  id="add_examSubId" name="examsubid" class="form-control" >
                                        </select>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    成绩:
                                </td>
                                <td>
                                    <input class="layui-input" id="add_stuexamsubscore" name="stuexamsubscore" type="text">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    时间:
                                </td>
                                <td>
                                    <input class="layui-input" id="add_testdate" name="testdate"  type="date" >
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
                    url:"/stuInfo/selectStuScoreByStuId_Edit",
                    method:"post",
                    datatype:"json",
                    data:{"stuExamSubId1":id},
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
            add_selectSub:function () {
                var id = $("#add_examid").val();
                $.ajax({
                    url:"/stuInfo/selectSub",
                    method:"post",
                    datatype:"json",
                    data:{"examid":id},
                    success:function (data) {
                        addOption_Score(data);
                    }
                })
            }
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
