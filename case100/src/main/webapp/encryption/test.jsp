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
</head>
<body>
<script>
    $(function () {
        $("button[name='d1']").click(function () {
            $(this).attr("data-toggle","modal").attr("data-target","#modal_edit");
        })
    })
</script>
<div id="maindiv">
    <button name="d1">11123123121</button>
    <div class="modal fade" aria-hidden="true" id="modal_edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title"id="modal_edit_label"style="">编辑成绩</h4>
                </div>
                <div class="modal-body">
                    <form id="form_editinformation">
                        <table id="addtable">
                            <tr>
                                <td>
                                    <hr class="layui-bg-red">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    ID:
                                </td>
                                <td>
                                    <input class="layui-input" type="text" v-model="selectInfo.stuExamSubId" disabled>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    考试名称:
                                </td>
                                <td>
                                    <input class="layui-input" type="text" v-model="selectInfo.examname">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    考试子科目:
                                </td>
                                <td>
                                    <input class="layui-input" type="text" v-model="selectInfo.examSubName">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    成绩:
                                </td>
                                <td>
                                    <input class="layui-input" type="text" v-model="selectInfo.stuExamSubScore">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    时间:
                                </td>
                                <td>
                                    <input class="layui-input" type="date" v-model="selectInfo.testDate">
                                </td>
                            </tr>
                        </table>

                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button"class="layui-btn" id="btn_modeladd">确认修改</button>
                    <button type="button"class="layui-btn layui-btn-primary" data-dismiss="modal">关闭</button>
                </div>
            </div><!--/.modal-content-->
        </div><!--/.modal-->
    </div>

</div>

   <%-- <script>
        var modelofadd = new Vue({
            el:"#maindiv",
            data:{
                addmodel:false,
                greenlight:false
            },
            methods:{
                changeAddModel:function () {
                    this.addmodel = !this.addmodel;
                },
                closeAddModel:function () {
                    this.addmodel = false;
                }
            }
        })
    </script>--%>
</body>
</html>
