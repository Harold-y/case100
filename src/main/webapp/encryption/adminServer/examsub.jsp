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
<body>
<table class="layui-table" lay-even lay-skin="nob" id="sectable">

</table>
<script>
    layui.use('table', function(){
        var table = layui.table;

        //第一个实例
        table.render({
            elem: '#sectable'
            ,height: 600
            ,url: '/examsub/selectAll' //数据接口

            ,page: true //开启分页
            ,parseData:function (res) {
                return{
                    "code":0,
                    "msg":"",
                    "count":5,
                    data:res
                }
            }
            ,cols: [[ //表头
                {field: 'examsubid', title: 'Exam Sub ID', width:150, sort: true, fixed: 'left'}
                ,{field: 'examid', title: 'Exam ID', width:120}
                ,{field: 'examsubname', title: 'Exam Sub Name', width:350, sort: true}
                ,{field: 'note', title: 'Note', width:350, sort: true}
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
</body>
</html>
