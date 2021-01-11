<%--
  Created by IntelliJ IDEA.
  User: Harry
  Date: 2020/7/28
  Time: 15:24
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
    <script  src="/js/personalCollege.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<script>
    $(function () {
        stuCollegeVue.selectStuCollegeByStuId();
    })
    function checkEssay()
    {
        $("button[name='checkEssay']").click(function () {
            var stucollegeid = $(this).parent().parent().children().eq(1).html();
            $(this).attr("data-toggle","modal").attr("data-target","#modal_essay");
            stuCollegeVue.selectStuCollegeEssay(stucollegeid);
        })
    }
    function checkScore()
    {
        $("button[name='checkScore']").click(function () {
            var stucollegeid = $(this).parent().parent().children().eq(1).html();
            $(this).attr("data-toggle","modal").attr("data-target","#modal_score");
            stuCollegeVue.selectScore(stucollegeid);
        })
    }
    function checkDetails() {
        $("button[name='details']").click(function () {
            var stucollegeid = $(this).parent().parent().children().eq(1).html();
            window.open("/encryption/desktopServer/offerDetail.jsp?stuCollegeId="+stucollegeid);
        })
    }
</script>
<style>
    fieldset{padding:.35em .625em .75em;margin:0 2px;border:1px solid silver}
    legend{padding:.5em;border:0;width:auto}
</style>
<body>
    <div id="maindiv">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">

            <legend><i class="layui-icon layui-icon-share"></i>贡献的Offer</legend>
        </fieldset>
        <h6 style="float:right">修改数据请联系客服</h6>
        <hr class="layui-bg-orange">
        <table class="layui-table">
            <colgroup>
                <col width="150">
                <col width="200">
                <col>
            </colgroup>
            <thead>
            <tr>
                <th>学校图标</th>
                <th>档案ID</th>
                <th>学校名称</th>
                <th>学生ID</th>
                <th>学校ID</th>
                <th>专业</th>
                <th>奖学金</th>
                <th>个人感觉</th>
                <th>申请分数</th>
                <th>文书</th>
                <th>详情</th>
            </tr>
            </thead>
            <tbody id="tbody_showContribution">

            </tbody>
        </table>



        <div class="modal fade" aria-hidden="true" id="modal_essay" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title"id="modal_essay_label"style="">查看文书</h4>
                    </div>
                    <div class="modal-body">
                        <form id="form_essayinformation" class="">
                            <table id="essaytable">
                                <tr>
                                    <td>
                                        <%--<textarea class="layui-textarea"  id="demo" v-model="essay" name="activityname"
                                                rows="16"  readonly style="display:none"></textarea>--%>
                                        <div v-html="essay">

                                        </div>
                                    </td>
                                </tr>
                            </table>

                        </form>

                    </div>
                    <div class="modal-footer">
                        <button type="button"class="layui-btn layui-btn-primary" data-dismiss="modal">关闭</button>
                    </div>
                </div><!--/.modal-content-->
            </div><!--/.modal-->
        </div>

        <div class="modal fade"id="modal_score"tabindex="-1"role="dialog"aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                    </div>
                    <div class="modal-body">
                        <form id="form_editRk">
                            <table id="table_score"class="layui-table" lay-skin="row">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>考试名称</th>
                                    <th>科目名称</th>
                                    <th>成绩</th>
                                    <th>考试日期</th>
                                </tr>
                                </thead>
                                <tbody id="tbody_score">

                                </tbody>
                            </table>

                            <br>
                            <br>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button"class="btn btn-default"data-dismiss="modal">Close</button>
                    </div>
                </div><!--/.modal-content-->
            </div><!--/.modal-->
        </div>

    </div>
</body>
<script>
    var stuCollegeVue = new Vue({
        el:"#maindiv",
        data:{
            essay:""
        },
        methods:{
            selectStuCollegeByStuId:function () {
                $.ajax({
                    url:"/stuCollege/selectStuCollegeByStuId",
                    method:"post",
                    datatype:"json",
                    success:function (data) {
                        addTab_College("tbody_showContribution",data);
                        checkEssay();
                        checkScore();
                        checkDetails();
                    }
                })
            },
            selectStuCollegeEssay:function (id) {

                $.ajax({
                    url:"/stuCollege/selectStuCollegeEssay",
                    method:"post",
                    datatype:"json",
                    data:{"stucollegeid":id},
                    success:function (essay) {
                        stuCollegeVue.essay = essay;
                    }
                })
            },
            selectScore:function (id) {
                $.ajax({
                    url:"/stuCollege/selectScore",
                    method:"post",
                    datatype:"json",
                    data:{"stucollegeid":id},
                    success:function (data) {
                        addTab_Score("tbody_score",data);
                    }
                })
            }

        }
    })
</script>
<script>
    let indexs
    //Demo
    layui.use('form', function () {
        var form = layui.form;

    });
/*    layui.use('layedit', function(){
        var layedit = layui.layedit;
        var $ = layui.$;
        indexs = layedit.build('demo'); //建立编辑器

        $("button[name='checkEssay']").click(function () {
            setTimeout(function () {
                stuCollegeVue.essay = layedit.getContent(indexs);
                layedit.sync(indexs);
            },100)
        })

    });*/
</script>
</html>
