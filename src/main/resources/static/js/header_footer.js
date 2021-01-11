
function addHeader_Footer(headerDivId,footerDivId,stuId,stuUsername)
{
    $("#"+headerDivId).empty();
    $("#"+footerDivId).empty();
    var header = "<div id=\"nagivatorDiv\">\n" +
        "        <ul class=\"layui-nav layui-bg-green\">\n" +
        "            <li class=\"layui-nav-item\"><a href=\"/encryption/desktopServer/main.jsp\">Case100</a></li>\n" +
        "            <li class=\"layui-nav-item layui-this\"><a href=\"/encryption/desktopServer/main.jsp\">首页</a></li>\n" +
        "            <li class=\"layui-nav-item\"><a href=\"/encryption/desktopServer/comparison.jsp\" v-show=\"alreadyLogin\" target=\"myiframe\" onclick=\"changeFrameHeight2()\">对比</a></li>\n" +
        "            <li class=\"layui-nav-item\">\n" +
        "                <a href=\"/encryption/desktopServer/resourceCenter.jsp\" target=\"myiframe\" onclick=\"changeFrameHeight()\">申请档案馆</a>\n" +
        "\n" +
        "            </li>\n" +
        "            <li class=\"layui-nav-item\" v-show=\"alreadyLogin\">\n" +
        "                <a href=\"/encryption/desktopServer/personalCenter.jsp\" target=\"myiframe\" onclick=\"changeFrameHeight()\">个人中心<span class=\"layui\"></span></a>\n" +
        "            </li>\n" +
        "\n" +
        "\n" +
        "\n" +
        "                <li class=\"layui-nav-item\" style=\"float: right\">\n" +
        "                    <a href=\"/encryption/desktopServer/signin.jsp\" target=\"myiframe\" v-show=\"!alreadyLogin\">登录</a>\n" +
        "                </li>\n" +
        "                <li class=\"layui-nav-item\" style=\"float: right\">\n" +
        "                    <a href=\"/encryption/desktopServer/signup.jsp\" target=\"myiframe\" v-show=\"!alreadyLogin\">注册</a>\n" +
        "                </li>\n" +
        "\n" +
        "                <li class=\"layui-nav-item\" style=\"float: right\" id=\"alreadyLogin\" v-show=\"alreadyLogin\">\n" +
        "                    <img src=\"//t.cn/RCzsdCq\" class=\"layui-nav-img\" id=\"personalImg\" onerror=\"this.src='/img/newone.jpg'\">\n" +stuUsername+
        "                    <dl class=\"layui-nav-child\">\n" +
        "                        <dd><a href=\"javascript:;\" @click=\"logOut\">登出</a></dd>\n" +
        "                    </dl>\n" +
        "                </li>\n" +
        "\n" +
        "        </ul>\n" +
        "    </div>";
    var footer = "<hr class=\"layui-bg\">\n" +
        "    <div id=\"bottomDiv1\" class=\"font_Harold\">\n" +
        "        <div id=\"notification\" style=\"\">\n" +
        "            <div class=\"panel panel-primary\">\n" +
        "                <div class=\"panel-heading\">\n" +
        "                    <h3 class=\"panel-title\">Offer档案资料</h3>\n" +
        "                </div>\n" +
        "                <div class=\"panel-body\">\n" +
        "                    <ul class=\"list-group\">\n" +
        "                        <li class=\"list-group-item\"><a href=\"\">X同学</a> </li>\n" +
        "                        <li class=\"list-group-item\"><a href=\"\">A同学</a></li>\n" +
        "                        <li class=\"list-group-item\"><a href=\"\">H同学</a></li>\n" +
        "                        <li class=\"list-group-item\"><a href=\"\">B同学</a></li>\n" +
        "                        <li class=\"list-group-item\"><a href=\"\">C同学</a></li>\n" +
        "                    </ul>\n" +
        "                </div>\n" +
        "            </div>\n" +
        "            <div class=\"panel panel-success\">\n" +
        "                <div class=\"panel-heading\">\n" +
        "                    <h3 class=\"panel-title\">最近更新</h3>\n" +
        "                </div>\n" +
        "                <div class=\"panel-body\">\n" +
        "                    <ul class=\"list-group\">\n" +
        "                        <li class=\"list-group-item\"><a href=\"\">托福最新考位！</a> </li>\n" +
        "                        <li class=\"list-group-item\"><a href=\"\">申请季如何写文书？</a></li>\n" +
        "                        <li class=\"list-group-item\"><a href=\"\">托福和雅思该考哪个？</a></li>\n" +
        "                        <li class=\"list-group-item\"><a href=\"\">查询帮助</a></li>\n" +
        "                        <li class=\"list-group-item\"><a href=\"\">SAT考试时间一览</a></li>\n" +
        "                    </ul>\n" +
        "                </div>\n" +
        "            </div>\n" +
        "            <div class=\"panel panel-info\">\n" +
        "                <div class=\"panel-heading\">\n" +
        "                    <h3 class=\"panel-title\">其它</h3>\n" +
        "                </div>\n" +
        "                <div class=\"panel-body\">\n" +
        "                    <ul class=\"list-group\">\n" +
        "                        <li class=\"list-group-item\"><a href=\"\">意见反馈</a> </li>\n" +
        "                        <li class=\"list-group-item\"><a href=\"\">免责声明</a></li>\n" +
        "                        <li class=\"list-group-item\"><a href=\"\">隐私条例</a></li>\n" +
        "                        <li class=\"list-group-item\"><a href=\"\">关于我们</a></li>\n" +
        "                        <li class=\"list-group-item\"><a href=\"\">打赏</a></li>\n" +
        "                    </ul>\n" +
        "                </div>\n" +
        "            </div>\n" +
        "        </div>\n" +
        "    </div>\n" +
        "    <hr class=\"layui-bg\">\n" +
        "    <div id=\"bottomDiv2\" class=\"font_Harold2\">\n" +
        "        <div id=\"beian\" style=\"text-align: center\">\n" +
        "            豫ICP备18024715号 Ex.\n" +
        "        </div>\n" +
        "        <div id=\"maker\" style=\"text-align: center\">\n" +
        "            Made By @<a href=\"http://williamye.top/index.php/2017/01/10/%e4%b8%aa%e4%ba%ba%e4%bb%8b%e7%bb%8dintroduction/\"\n" +
        "                        target=\"_blank\">Harold Ye</a>\n" +
        "        </div>\n" +
        "    </div>";


    $("#"+headerDivId).append($(header));
    $("#"+footerDivId).append($(footer));
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
    $("#personalImg").attr("src","http://yeyixuan.top/wp-content/uploads/stuInfo/"+stuId+".jpg"+"?"+Math.random());
    $('#personalImg').on("error", function() {
        $(this).attr('src', '/img/newone.jpg');  // 替换为默认图片
    });
        if(stuId!=null || stuId!="")
        {
            app3.alreadyLogin = true;
        }else
        {
            app3.alreadyLogin = false;
        }
    $(function changeSrc() {
        var Ohref=window.location.href;
        var result=Ohref.split("?stuCollegeId=");
        var stuCollegeId = result[1];
        this.stuCollegeId = stuCollegeId;
    })

}