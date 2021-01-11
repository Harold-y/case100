<%--
  Created by IntelliJ IDEA.
  User: Destine.Yuri
  Date: 2020/7/20
  Time: 5:25
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
    $(function () {
        $("#btn_clear").click(function () {
            $("#tbody_only").empty();
            showSuccess();
        })
    })
    $(function () {
        $("#btn_searchsubmit").click(function () {
            var collegeName = $("#input_search").val();
            $.ajax({
                url:"/collegeranking/selectByName",
                method:"post",
                datatype:"json",
                data:{"collegeName":collegeName},
                success:function (list) {
                    addTab_CollegeRanking("tbody_only",list);
                    insertShow();
                    editShow();
                }
            })
        })
    })
    function insertShow() {
        $("button[name='addRk']").click(function () {
            $(this).attr("data-toggle", "modal").attr("data-target", "#modal_addRanking");
            var collegeId = $(this).parent().parent().children(":first").html();
            $("#rk_collegeId").val(collegeId);
        })
    }
//edit
    function editShow() {
        $("button[name='editRk']").click(function () {
            $(this).attr("data-toggle", "modal").attr("data-target", "#modal_editRanking");
            var collegeId = $(this).parent().parent().children(":first").html();
            $.ajax({
                url:"/collegeranking/selectByCollegeId",
                method:"post",
                data:{"collegeId":collegeId},
                datatype:"json",
                success:function (list) {
                    CollegeRanking_dealWithThem(list);
                    $("button[name='deleteRk']").click(function () {
                        var r = confirm("Please verify Delete");
                        if(r)
                        {
                            var rankingId = $(this).parent().parent().children(":first").html();
                            $.ajax({
                                url:"/collegeranking/deleteRankingByRankingId",
                                method:"post",
                                data:{"rankingId":rankingId},
                                datatype:"json",
                                success:function(){
                                    CollegeRanking_dealWithThem(list);
                                    showSuccess();
                                }
                            })
                        }
                    })
                }
            })
        })
    }
//insert
    $(function () {
        $("#rk_add").click(function () {
            $.ajax({
                url:"/collegeranking/insert",
                method:"post",
                datatype:"json",
                data:$("#form_editRanking").serialize(),
                success:function (index) {
                    $("#form_editRanking")[0].reset();
                    $("#modal_addRanking").modal("hide");
                    showSuccess();
                }
            })
        })
    })

</script>
<body>
    <div id="maindiv">
        <div id="topdiv">

            <form id="form1">

                <input type="text" class="layui-input searchs" placeholder="University Name" name="collegename" id="input_search">
                <input type="button" class="layui-btn layui-btn-radius layui-btn-normal searchs" id="btn_searchsubmit" value="Search">
                Indicator:<span class="layui-badge layui-bg-green" id="indicator_success" v-show="indicator_success">Success</span>
            </form>
            <button  class="layui-btn searchs" id="btn_clear" >Clear First Table</button>
        </div>

        <div id="middlediv">

            <table class="layui-table" lay-even lay-skin="nob" id="onlytable">
                <thead>
                <tr>
                    <th>College ID</th>
                    <th>College Name</th>
                    <th>College CN Name</th>
                    <th>Country/Region</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody id="tbody_only">

                </tbody>
            </table>
            <hr class="layui-bg-blue">
            <p>分页表↓</p>
            <table class="layui-table" lay-even lay-skin="nob" id="sectable">

            </table>
        </div>

        <div class="modal fade"id="modal_addRanking"tabindex="-1"role="dialog"aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button"class="close"data-dismiss="modal"aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <form id="form_editRanking">
                            <table id="editRanking">
                                <tr>
                                    <td>
                                        College ID:
                                    </td>

                                    <td>
                                        <input type="text"name="collegeid" id="rk_collegeId" readonly="readonly">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        ranking UsNews Local:
                                    </td>

                                    <td>
                                        <input type="text" name="rankingusnewslocal"class="form-control">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        ranking UsNews World:
                                    </td>

                                    <td>
                                        <input type="text" name="rankingusnewsworld"class="form-control">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        ranking QSNews World:
                                    </td>

                                    <td>
                                        <input type="text" name="rankingqsworld"class="form-control">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        ranking ARWU World:
                                    </td>

                                    <td>
                                        <input type="text" name="rankingarwuworld"class="form-control">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        ranking Year(ex.2020):
                                    </td>

                                    <td>
                                        <span class="layui-badge layui-bg-orange" id="add_exist" v-show="add_exist">Record May Exist</span>
                                        <input type="text" name="rankingyear"class="form-control" id="rk_year" @mouseout="checkduplica">
                                    </td>
                                </tr>
                            </table>

                            <br>
                            <br>
                        </form>

                    </div>
                    <div class="modal-footer">
                        <button type="button"class="btn btn-primary" id="rk_add">Add Ranking</button>
                        <button type="button"class="btn btn-default"data-dismiss="modal">Close</button>
                    </div>
                </div><!--/.modal-content-->
            </div><!--/.modal-->
        </div>

        <div class="modal fade"id="modal_editRanking"tabindex="-1"role="dialog"aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button"class="close"data-dismiss="modal"aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <form id="form_editRk">
                            <table id="table_editRk"class="layui-table" lay-skin="row">
                                <thead>
                                    <tr>
                                        <th>Ranking ID</th>
                                        <th>College ID</th>
                                        <th>US News Local</th>
                                        <th>US News World</th>
                                        <th>QS News World</th>
                                        <th>ARWU World</th>
                                        <th>Ranking Year</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody id="tbody_third">

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
<script>
        layui.use('table', function(){
            var table = layui.table;

            //第一个实例
            table.render({
                elem: '#sectable'
                ,height: 600
                ,url: '/collegeranking/selectAll' //数据接口
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
                    {field: 'rankingId', title: 'Ranking ID', width:120, sort: true, fixed: 'left'}
                    ,{field: 'collegeId', title: 'College ID', width:120}
                    ,{field: 'collegeName', title: 'College Name', width:300}
                    ,{field: 'collegeArea', title: 'College Area', width:200}
                    ,{field: 'rankingUsNewsLocal', title: 'Ranking USNews Local', width:100, sort: true}
                    ,{field: 'rankingUsNewsWorld', title: 'Ranking USNews World', width:100}
                    ,{field: 'rankingQsWorld', title: 'Ranking QSNews World', width: 100}
                    ,{field: 'rankingArwuWorld', title: 'Ranking ARWU World', width: 100}
                    ,{field: 'rankingYear', title: 'Year', width: 80}
                ]]
            });

        });
    </script>
<script>
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
                    var collegeid = $("#rk_collegeId").val();
                    var year = $("#rk_year").val();
                    $.ajax({
                        url:"/collegeranking/selectCollegeRankingByIdAndYear_Count",
                        methods:"post",
                        data:{"collegeid":collegeid,"year":year},
                        datatype:"json",
                        success:function (index) {
                            if(index>0)
                            {
                                v1.add_exist=true;
                            }else
                            {
                                v1.add_exist=false;
                            }
                        }
                    })

                }
            }
        })


</script>
</body>
</html>
