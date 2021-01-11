<%--
  Created by IntelliJ IDEA.
  User: Destine.Yuri
  Date: 2020/7/20
  Time: 5:14
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
<script>
    function deleteCollege()
    {
        $("button[name='Delete']").click(function () {
            var r = confirm("Please verify Delete");
            if(r)
            {
                    var id = $(this).parent().parent().children(":first").html();
                    realDelete_college(id);
            }
        })
    }
    function editCollege()
    {
        $("button[name='Edit']").click(function () {
            var id = $(this).parent().parent().children(":first").html();
            $(this).attr("data-toggle","modal").attr("data-target","#modal_edit");
            $.ajax({
                url:"/college/selectById",
                method:"post",
                datatype: "json",
                data:{"collegeid":id},
                success:function (college) {
                    addInfo_College("form_editinformation",college);
                }
            })
        })
    }
    function editImg() {
        $("button[name='ChangeIMG']").click(function () {
            var id = $(this).parent().parent().children(":first").html();
            $(this).attr("data-toggle","modal").attr("data-target","#modal_editimg");
            $("#changeimg_id").val(id);
        })
    }
    function queryall()
    {
        $.ajax({
            url:"/college/selectPanel",
            method:"post",
            dataType:"json",
            success:function (list) {
                addTab_College("tbody_only",list);
                deleteCollege();
                editCollege();
                editImg();
            }
        })
    }
    $(function () {
        $("#btn_queryall1").click(function () {
            queryall();
        })
    })
    //search
    $(function () {
        $("#btn_searchsubmit").click(function () {
            $.ajax({
                url:"/college/selectByName",
                method:"post",
                dataType: "json",
                data:$("#form1").serialize(),
                success:function (list) {
                    addTab_College("tbody_only",list);
                    deleteCollege();
                    editCollege();
                    editImg();
                }
            })
        })
    })
    //insert
    $(function () {
        $("#btn_modeladd").click(function () {

            var collegeId = $.trim($('#add_collegeId').val());
            var collegeName = $.trim($('#add_collegeName').val());
            var collegeChineseName = $.trim($('#add_collegeChineseName').val());
            var collegeArea = $.trim($('#add_collegeArea').val());
            var collegeTuition = $.trim($('#add_collegeTuition').val());
            var collegeExpense = $.trim($('#add_collegeExpense').val());
            var collegeAcceptanceRate = $.trim($('#add_collegeAcceptanceRate').val());
            var collegeCampSize = $.trim($('#add_collegeCampSize').val());
            var collegeMenWomanRadio = $.trim($('#add_collegeMenWomanRadio').val());
            var collegeEarlyDecision = $.trim($('#add_collegeEarlyDecision').val());
            var collegeRegularDecision = $.trim($('#add_collegeRegularDecision').val());
            var collegeIntroduction = $.trim($('#add_collegeIntroduction').val());
            var collegeAvgFreshmanRetention = $.trim($('#collegeAvgFreshmanRetention').val());

            var collegeEarlyAction = $.trim($('#add_collegeEarlyActionDate').val());
            var collegeStudentCount = $.trim($('#add_collegeStudentCount').val());
            var collegeTeacherStudentRatio = $.trim($('#add_collegeTeacherStudentRatio').val());
            var collegeAdvanSubject = $.trim($('#add_collegeAdvanSubject').val());
            var gv = $('#add_collegeIsPublic option:selected') .val();
            var collegeIsPublic = gv;
            var collegeCity = $.trim($('#add_collegeCity').val());
            var collegeInternationalStuCount = $.trim($('#add_InternationalStuCount').val());
            var collegeAudition = $.trim($('#add_collegeAudition').val());
            var collegeStuFeeling = $.trim($('#add_collegeStuFeeling').val());
            var collegeFuture = $.trim($('#add_collegeFuture').val());
            var formData = new FormData();

            formData.append("collegeId",collegeId);
            formData.append("collegeName",collegeName);
            formData.append("collegeChineseName",collegeChineseName);
            formData.append("collegeArea",collegeArea);
            formData.append("collegeTuition",collegeTuition);
            formData.append("collegeExpense",collegeExpense);
            formData.append("collegeAcceptanceRate",collegeAcceptanceRate);
            formData.append("collegeCampSize",collegeCampSize);
            formData.append("collegeMenWomanRadio",collegeMenWomanRadio);
            formData.append("collegeEarlyDecision",collegeEarlyDecision);
            formData.append("collegeRegularDecision",collegeRegularDecision);
            formData.append("collegeIntroduction",collegeIntroduction);
            formData.append("collegeAvgFreshmanRetention",collegeAvgFreshmanRetention);

            formData.append("collegeEarlyAction",collegeEarlyAction);
            formData.append("collegeStudentCount",collegeStudentCount);
            formData.append("collegeTeacherStudentRatio",collegeTeacherStudentRatio);
            formData.append("collegeAdvanSubject",collegeAdvanSubject);
            formData.append("collegeIsPublic",collegeIsPublic);
            formData.append("collegeCity",collegeCity);
            formData.append("collegeInternationalStuCount",collegeInternationalStuCount);
            formData.append("collegeAudition",collegeAudition);
            formData.append("collegeStuFeeling",collegeStuFeeling);
            formData.append("collegeFuture",collegeFuture);

            formData.append("college_img",$("#addupload")[0].files[0]);



            $.ajax({
                url:"/college/insert",
                type:"post",
                cache: false,
                datatype:"json",
                data:formData,
                processData : false, // 使数据不做处理
                contentType : false,
                success: function (index) {
                    if(index==1)
                    {
                        $("#form_addinformation").find('input[type=text],select,input[type=hidden],input[type=file],textarea').each(function() {
                            if($(this).attr('id')=="add_collegeIsPublic")
                            {
                            }else
                            {
                                $(this).val('');
                            }
                                 });
                        $("#modal_add").modal("hide");
                        showSuccess();
                        queryall();
                    }else
                    {
                        alert("Failed!");
                    }
                }
            })
        })
    })
    //edit
    $(function () {
        $("#btn_modeledit").click(function () {
            $.ajax({
                url:"/college/update",
                method:"post",
                datatype:"json",
                data:$("#form_editinformation").serialize(),
                success:function (index) {
                    $("#modal_edit").modal("hide");
                    showSuccess();
                    queryall();
                }
            })
        })
    })
    //change img
    $(function () {
        $("#change_img").click(function () {
            var id =$("#changeimg_id").val();
            var formData = new FormData();
            formData.append("college_img",$("#editupload")[0].files[0]);
            formData.append("collegeId",id);
            $.ajax({
                url:"/college/changeIMG",
                type:"post",
                cache: false,
                datatype:"json",
                data:formData,
                processData : false, // 使数据不做处理
                contentType : false,
                success:function (college) {
                    $("#modal_editimg").modal("hide");
                    $("#modal_editimg").find('input[type=file]').each(function() {
                            $(this).val('');
                    });
                    showSuccess();
                    queryall();
                }
            })
        })
    })
    //clear
    $(function () {
        $("#btn_clear").click(
            function()
            {
                $("#tbody_only").empty();
                showSuccess();
            }
        )
    })
</script>

<body>
    <div id="maindiv">

        <div id="topdiv">

            <form id="form1">

                <input type="text" class="layui-input searchs" placeholder="University Name" name="collegename" id="input_search">
                <input type="button" class="layui-btn layui-btn-radius layui-btn-normal searchs" id="btn_searchsubmit" value="Search">
                <input type="button" class="layui-btn layui-btn-radius layui-btn-primary searchs" id="btn_queryall1"value="Query All Info">
                Indicator:<span class="layui-badge layui-bg-green layui-anim-scale" id="indicator_success" v-show="indicator_success">Success</span>
            </form>
            <button  class="layui-btn searchs" id="btn_add" data-toggle="modal" data-target="#modal_add">Add</button>
            <button  class="layui-btn searchs" id="btn_clear" >Clear First Table</button>
        </div>

        <div id="middlediv">

            <table class="layui-table" lay-even lay-skin="nob" id="onlytable">
                <thead>
                <tr>
                    <th>College ID</th>
                    <th>English Name</th>
                    <th>CHN Name</th>
                    <th>Country/Region</th>
                    <th>Tuition</th>
                    <th>Expense</th>
                    <th>Action</th>
                    <%--<th>Image</th>--%>
                </tr>
                </thead>
                <tbody id="tbody_only">

                </tbody>
            </table>
                <hr class="layui-bg-blue">
                <p>分页表↓</p>
                <table class="layui-table" lay-skin="line" id="sectable">

                </table>
        </div>

        <div class="modal fade"id="modal_edit"tabindex="-1"role="dialog"aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                <div class="modal-content">
                <div class="modal-header">
            <button type="button"class="close"data-dismiss="modal"aria-hidden="true">&times;</button>
                </div>
                    <div class="modal-body">
                        <form id="form_editinformation">
                    <table id="edittable">
                        <tr>
                            <td>
                                College ID:
                            </td>

                            <td>
                                <input type="hidden"name="collegeid" readonly="readonly">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                College English Name:
                            </td>

                            <td>
                                <input type="text"name="collegename"class="form-control"id="edit_collegeName">
                            </td>
                        </tr>

                        <tr>
                            <td>
                                College Chinese Name:
                            </td>

                            <td>
                                <input type="text"name="collegeChineseName"class="form-control"id="edit_collegeChineseName">
                            </td>
                        </tr>

                        <tr>
                            <td>
                                Country/Region:
                            </td>

                            <td>
                                <input type="text"name="collegearea"class="form-control"id="edit_collegeArea">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                State/City:
                            </td>

                            <td>
                                <input type="text"name="collegecity"class="form-control"id="edit_collegeCity">
                            </td>
                        </tr>

                        <tr>
                            <td>
                                Tuition:
                            </td>

                            <td>
                                <input type="text"name="collegetuition"class="form-control"id="edit_collegeTuition">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Expense:
                            </td>

                            <td>
                                <input type="text"name="collegeexpense"class="form-control"id="edit_collegeExpense">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Acceptance Rate:
                            </td>

                            <td>
                                <input type="text"name="collegeacceptancerate"class="form-control"id="edit_collegeAcceptanceRate">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Campus Size:
                            </td>

                            <td>
                                <input type="text"name="collegecampsize"class="form-control"id="edit_collegeCampSize">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Student Number:
                            </td>

                            <td>
                                <input type="text"name="collegestudentcount"class="form-control"id="edit_collegeStudentCount">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                International Student Number:
                            </td>

                            <td>
                                <input type="text"name="collegeinternationalstucount"class="form-control"id="edit_InternationalStuCount">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Male/Female Ratio:
                            </td>

                            <td>
                                <input type="text"name="collegemenwomanradio"class="form-control"id="edit_collegeMenWomanRadio">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Teacher/Student Ratio:
                            </td>

                            <td>
                                <input type="text"name="collegeteacherstudentratio"class="form-control"id="edit_collegeTeacherStudentRatio">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Early Decision Date:
                            </td>

                            <td>
                                <input type="text"name="collegeearlydecision"class="form-control"id="edit_collegeEarlyDecision">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Early Action Date:
                            </td>

                            <td>
                                <input type="text"name="collegeearlyaction"class="form-control"id="edit_collegeEarlyActionDate">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Regular DecisionDate:
                            </td>

                            <td>
                                <input type="text"name="collegeregulardecision"class="form-control"id="edit_collegeRegularDecision">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                college Introduction:
                            </td>

                            <td>
                                <textarea name="collegeintroduction"class="form-control"id="edit_collegeIntroduction"rows="3"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                college Audition:
                            </td>

                            <td>
                                <textarea name="collegeaudition"class="form-control"id="edit_collegeAudition"rows="3"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                college Student Feeling:
                            </td>

                            <td>
                                <textarea name="collegestufeeling"class="form-control"id="edit_collegeStuFeeling"rows="3"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Future Information(graduate and job):
                            </td>

                            <td>
                                <textarea name="collegefuture"class="form-control"id="edit_collegeFuture"rows="3"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Freshman Retention:
                            </td>

                            <td>
                                <input type="text"name="collegeavgfreshmanretention"class="form-control"id="edit_collegeAvgFreshmanRetention">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                college Advanced Subject:
                            </td>

                            <td>
                                <input type="text"name="collegeadvansubject"class="form-control"id="edit_collegeAdvanSubject">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                college is public( 0:private ; 1:public):
                            </td>

                            <td>
                                <select class="form-control searchs" id="edit_collegeIsPublic" name="collegeispublic">
                                    <option value=1>Public</option>
                                    <option value=0>Private</option>
                                </select>
                            </td>
                        </tr>
                    </table>

                    <br>
                    <br>
                </form>

            </div>
                    <div class="modal-footer">
                    <button type="button"class="btn btn-primary"id="btn_modeledit"onclick="">Edit</button>
                    <button type="button"class="btn btn-default"data-dismiss="modal">Close</button>
                </div>
            </div><!--/.modal-content-->
        </div><!--/.modal-->
    </div>

        <div class="modal fade"id="modal_add"tabindex="-1"role="dialog"aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button"class="close"data-dismiss="modal"aria-hidden="true">&times;</button>
                        <h4 class="modal-title"id="modal_add_label"style="">Add Information</h4>
                    </div>
                    <div class="modal-body">
                        <form id="form_addinformation">
                            <table id="addtable">
                                <tr>
                                    <td>
                                        <span class="layui-badge-dot layui-bg-blue"></span>注意：蓝点标注为非空字段:
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <hr class="layui-bg-red">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="layui-badge-dot layui-bg-blue"></span>College English Name:
                                    </td>

                                    <td>
                                        <span class="layui-badge layui-bg-orange" id="add_exist" v-show="add_exist">This May Already Exist</span>
                                        <input type="text"name="collegeName"class="form-control"id="add_collegeName" @mouseout="checkduplica">
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <span class="layui-badge-dot layui-bg-blue"></span>College Chinese Name:
                                    </td>

                                    <td>
                                        <input type="text"name="collegeChineseName"class="form-control"id="add_collegeChineseName">
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <span class="layui-badge-dot layui-bg-blue"></span>Country/Region:
                                    </td>

                                    <td>
                                        <input type="text"name="collegeArea"class="form-control"id="add_collegeArea">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        State/City:
                                    </td>

                                    <td>
                                        <input type="text"name="collegeCity"class="form-control"id="add_collegeCity">
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        Tuition:
                                    </td>

                                    <td>
                                        <input type="text"name="collegeTuition"class="form-control"id="add_collegeTuition">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Expense:
                                    </td>

                                    <td>
                                        <input type="text"name="collegeExpense"class="form-control"id="add_collegeExpense">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Acceptance Rate:
                                    </td>

                                    <td>
                                        <input type="text"name="collegeAcceptanceRate"class="form-control"id="add_collegeAcceptanceRate">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Campus Size:
                                    </td>

                                    <td>
                                        <input type="text"name="collegeCampSize"class="form-control"id="add_collegeCampSize">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Student Number:
                                    </td>

                                    <td>
                                        <input type="text"name="collegeStudentCount"class="form-control"id="add_collegeStudentCount">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        International Student Number:
                                    </td>

                                    <td>
                                        <input type="text"name="InternationalStuCount"class="form-control"id="add_InternationalStuCount">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Male/Female Ratio:
                                    </td>

                                    <td>
                                        <input type="text"name="collegeMenWomanRadio"class="form-control"id="add_collegeMenWomanRadio">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Teacher/Student Ratio:
                                    </td>

                                    <td>
                                        <input type="text"name="collegeTeacherStudentRatio"class="form-control"id="add_collegeTeacherStudentRatio">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Early Decision Date:
                                    </td>

                                    <td>
                                        <input type="text"name="collegeEarlyDecision"class="form-control"id="add_collegeEarlyDecision">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Early Action Date:
                                    </td>

                                    <td>
                                        <input type="text"name="collegeEarlyActionDate"class="form-control"id="add_collegeEarlyActionDate">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Regular DecisionDate:
                                    </td>

                                    <td>
                                        <input type="text"name="collegeRegularDecision"class="form-control"id="add_collegeRegularDecision">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        college Introduction:
                                    </td>

                                    <td>
                                        <textarea name="collegeIntroduction"class="form-control"id="add_collegeIntroduction"rows="3"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        college Audition:
                                    </td>

                                    <td>
                                        <textarea name="collegeAudition"class="form-control"id="add_collegeAudition"rows="3"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        college Student Feeling:
                                    </td>

                                    <td>
                                        <textarea name="collegeStuFeeling"class="form-control"id="add_collegeStuFeeling"rows="3"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Future Information(graduate and job):
                                    </td>

                                    <td>
                                        <textarea name="collegeFuture"class="form-control"id="add_collegeFuture"rows="3"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Freshman Retention:
                                    </td>

                                    <td>
                                        <input type="text"name="collegeAvgFreshmanRetention"class="form-control"id="collegeAvgFreshmanRetention">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        college Advanced Subject:
                                    </td>

                                    <td>
                                        <input type="text"name="collegeAdvanSubject"class="form-control"id="add_collegeAdvanSubject">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="layui-badge-dot layui-bg-blue"></span>college is public( 0:private ; 1:public):
                                    </td>

                                    <td>
                                        <select class="form-control searchs" id="add_collegeIsPublic" name="add_collegeIsPublic">
                                            <option value=1>Public</option>
                                            <option value=0>Private</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="layui-badge-dot layui-bg-blue"></span>Image:
                                    </td>

                                    <td>
                                        <input type="file"id="addupload"name="add_uploadphoto"class="form-control">
                                    </td>
                                </tr>
                            </table>
                            <input type="hidden"name="collegeId">
                            <br>
                            <br>
                        </form>

                    </div>
                    <div class="modal-footer">
                        <button type="button"class="btn btn-primary"id="btn_modeladd"onclick="">Add</button>
                        <button type="button"class="btn btn-default"data-dismiss="modal">Close</button>
                    </div>
                </div><!--/.modal-content-->
            </div><!--/.modal-->
        </div>

        <div class="modal fade"id="modal_editimg"tabindex="-1"role="dialog"aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button"class="close"data-dismiss="modal"aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <form id="form_editimg">
                            <table id="editimg">
                                <tr>
                                    <td>
                                        Image:
                                    </td>

                                    <td>
                                        <input type="file"id="editupload"name="add_uploadphoto"class="form-control">
                                    </td>
                                </tr>
                            </table>
                            <input type="hidden"name="collegeId" id="changeimg_id">
                            <br>
                            <br>
                        </form>

                    </div>
                    <div class="modal-footer">
                        <button type="button"class="btn btn-primary" id="change_img">Add</button>
                        <button type="button"class="btn btn-default"data-dismiss="modal">Close</button>
                    </div>
                </div><!--/.modal-content-->
            </div><!--/.modal-->
        </div>



    </div>
<script>
    layui.use('table', function(){
        var table = layui.table;

        //第一个实例
        table.render({
            elem: '#sectable'
            ,height: 600
            ,skin:"line"
            ,url: '/college/selectCollegeAll' //数据接口
            ,page: true //开启分页
            ,parseData:function (res) {
            return{
                "code":0,
                "msg":"",
                "count":1000,
                data:res
            }
        }
            ,cols: [[ //表头
                {field: 'collegeid', title: 'College ID', width:120, sort: true, fixed: 'left'}
                ,{field: 'collegename', title: 'College Name', width:250}
                ,{field: 'collegeChineseName', title: 'College Chinese Name', width:250, sort: true}
                ,{field: 'collegearea', title: 'Country/Region', width:80}
                ,{field: 'collegetuition', title: 'Tuition', width: 80}
                ,{field: 'collegeexpense', title: 'Expense', width: 80, sort: true}
                ,{field: 'collegeacceptancerate', title: 'Acceptance Rate', width: 80, sort: true}
                ,{field: 'collegecampsize', title: 'Camp Size', width: 80}
                ,{field: 'collegemenwomanradio', title: 'M/FM Ratio', width: 80, sort: true}
                ,{field: 'collegeearlydecision', title: 'ED Date', width: 135, sort: true}
                ,{field: 'collegeregulardecision', title: 'RD Date', width: 135, sort: true}
                ,{field: 'collegeavgfreshmanretention', title: 'Freshman Retention Rate', width: 80, sort: true}
                ,{field: 'collegeintroduction', title: 'Introduction', width: 200, sort: true}
                ,{field: 'collegecity', title: 'State/City', width: 200, sort: true}
            ]]
        });

    });


    /*var app222 = new Vue({
        el:"#maindiv",
        data:{
            add_show:false
        },
        methods:{
            changeAddShow:function () {
                this.add_show = !this.add_show;
            }
        }
    })
    */
</script>
<script>
    var exist = false;

    function checkNumber() {
        v1.add_exist=exist;
    }
    function showSuccess() {
        v1.indicator_success=true;
        setTimeout(hideSuccess,3000);
    }
    function hideSuccess() {
        v1.indicator_success=false;
    }
    var v1 = new Vue({
        el:"#maindiv",
        data:{
            add_exist:false,
            indicator_success:false
        },
        methods:{
            checkduplica:function () {
                var collegename = $("#add_collegeName").val();
                $.ajax({
                    url:"/college/selectByName_Count",
                    methods:"post",
                    data:{"collegename":collegename},
                    datatype:"json",
                    success:function (index) {
                        exist=index;
                        checkNumber();
                    }
                })

            }
        }
    })


</script>

</body>
</html>
