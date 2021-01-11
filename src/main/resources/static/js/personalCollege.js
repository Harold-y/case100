function addTab_College(tbodyid,list)
{
    $("#"+tbodyid).empty();
    for(var index in list)
    {
        var tr = "<tr>";
        var itemMap = list[index];
        var collegeName = itemMap.collegeName;
        tr+="<td><img src='http://yeyixuan.top/wp-content/uploads/college/"+collegeName+".jpg' width='100px'/> </td>";//Windows
        for(var i in itemMap)
        {
            if(itemMap[i]!=null && itemMap[i]!="" && i!="stuCollegeAlumniRelation" && i!="stuCollegeScoreId")
            {
                tr+="<td>"+itemMap[i]+"</td>";
            }else
            {

                if(i=="stuCollegeScoreId")
                {
                    tr+="<td><button name='checkScore' class=\'layui-btn layui-btn-radius layui-btn-primary\'>查看申请分数</button></td>";
                    tr+="<td><button name='checkEssay' class=\'layui-btn layui-btn-radius layui-btn-primary\'>查看文书</button></td>";
                    tr+="<td><button name='details' class='layui-btn layui-btn-radius layui-btn-normal'>详情</button></td>";
                }else
                {
                    if(i=="stuCollegeAlumniRelation"){

                    }else
                    {
                        tr+="<td>Null</td>";
                    }

                }

            }
        }
        /*tr+="<td><button name='Edit' class='layui-btn layui-btn-normal'>Edit</button>";*/
        /*tr+="<button name='Delete' class='layui-btn layui-btn-danger btn_delete'>Delete</button></td>";*/
        //tr+="<td><img src='http://localhost:8080/static/img/college/"+collegeName+".jpg' height='40px'/> </td>";
        tr+="</tr>";
        $("#"+tbodyid).append($(tr));
    }
}

function addTab_Score(tbodyid,list)
{
    $("#"+tbodyid).empty();
    for(var index in list)
    {
        var tr = "<tr>";
        var itemMap = list[index];
        for(var i in itemMap)
        {
            if(itemMap[i]!=null && itemMap[i]!="")
            {
                tr+="<td>"+itemMap[i]+"</td>";
            }else
            {
                tr+="<td>Null</td>";
            }

            }
        tr+="</tr>";
        $("#"+tbodyid).append($(tr));
    }


}

function addDiv_College(divId,list)
{
    $("#"+divId).empty();
    for(index in list)
    {
        var div = "<div>";
        var collegeName = list[index].collegename;
        var collegeId = list[index].collegeid;
        var btn = "<input type='button' class='btn_college layui-btn layui-btn-normal' value='"+collegeName+"' name='btn_college_add' id='"+collegeId+"'>";
        div+=btn;
        div+="</div>";
        $("#"+divId).append($(div));
    }
}

function addTab_Score2(tbodyid,list)
{
    $("#"+tbodyid).empty();
    for(var index in list)
    {
        var tr = "<tr>";
        var itemMap = list[index];
        for(var i in itemMap)
        {
            if(itemMap[i]!=null && itemMap[i]!="")
            {
                tr+="<td>"+itemMap[i]+"</td>";
            }else
            {
                tr+="<td>Null</td>";
            }

        }
        tr+="<td><input type=\"checkbox\" name='checkbox_addScore' title='添加'></td>";
        tr+="</tr>";
        $("#"+tbodyid).append($(tr));
    }


}


function addOption_Score(list)
{
    $("#add_examSubId").empty();
    for(var index in list)
    {
        var option = "<option>";
        var item = list[index];
        for(var i in item)
        {
            if(i=="examsubid")
            {
                option="<option value='"+item[i]+"'>";
            }
            if(i=="examsubname")
            {
                option+=item[i];
            }
        }
        option+="</option>";
        $("#add_examSubId").append($(option));
    }
}

function addCollection(divId,data)
{
    $("#"+divId).empty();
    for(var index in data)
    {
        var mainDiv = "<div class=\"controlDiv\" > <div class=\"layui-row grid-demo\">";

        var collegeName = "";
        var collegeId = "";
        var stuCollegeId = "";
        var stuUsername = "";
        var stuId = "";
        var examname = "";
        var examSubName = "";
        var stuExamSubScore = "";
        var stuCollegeMajor = "";
        for(var i in data[index])
        {
            for(var itemName in data[index][i])
            {
                if(collegeName=="" || collegeName==null)
                {
                    collegeName = data[index][i].collegeName;
                }
                if(stuCollegeMajor=="" || stuCollegeMajor==null)
                {
                    stuCollegeMajor = data[index][i].stuCollegeMajor;
                }
                if(collegeId=="" || collegeId==null)
                {
                    collegeId =  data[index][i].collegeId;
                }
                if(stuCollegeId=="" || stuCollegeId==null)
                {
                    stuCollegeId =  data[index][i].stuCollegeId;
                }
                if(stuUsername=="" || stuUsername==null)
                {
                    stuUsername = data[index][i].stuUsername;
                }
                if(stuId=="" || stuId==null)
                {
                    stuId = data[index][i].stuId;
                }
                if(examname=="" || examname==null)
                {
                    examname = data[index][i].examname;
                }
                if(examSubName=="" || examSubName==null)
                {
                    examSubName = data[index][i].examSubName;
                }
                if(stuExamSubScore=="" || stuExamSubScore==null)
                {
                    stuExamSubScore = data[index][i].stuExamSubScore;
                }
            }
        }

        var firstDiv = "<div class=\"firstDiv\"><div class='left_up_Div'>\n" +
            "                        <input type='hidden' value='"+stuCollegeId+"'>\n" +
            "                        <div class='div_img_school'><img src=\"http://yeyixuan.top/wp-content/uploads/college/"+collegeName+".jpg\" class='img_school'></div>\n" +
            "                        <div class=\"div_text schoolName\">\n" +
            "                            "+collegeName+"\n" +
            "                        </div>\n" +
            "                        <div class=\"div_text major\">\n" +
            "                            "+stuCollegeMajor+"\n" +
            "                        </div></div>\n" +
            "                        <div class=\"layui-col-md12 div_checkDetail\">\n" +
            "                            <button class=\"layui-btn layui-btn-sm btn_checkDetail\" name='getDetail' >查看</button>\n" +
            "                        </div>\n" +
            "                    </div>";
        var secondDiv = "<div class=\"secondDiv\">\n" +
            "                        <img src=\"http://yeyixuan.top/wp-content/uploads/stuInfo/"+stuId+".jpg\" class='img_user' >\n" +
            "                        <div class='div_text'>"+stuUsername+"</div>\n" +
            "                        <hr>\n" +
            "                        <div class=\"div_score\">\n" +
            "                            分数:<br>\n" +
            "                            "+examname+"  "+examSubName+" "+stuExamSubScore+"<br>\n" +
            "                            ...\n" +
            "                        </div>\n" +
            "                    </div>";
        mainDiv+=firstDiv;
        mainDiv+=secondDiv;
        mainDiv+="</div></div>";
        $("#"+divId).append($(mainDiv));
    }
}

function addCollection_Comparison(divId,data)
{
    $("#"+divId).empty();
    for(var index in data)
    {
        var mainDiv = "<div class=\"controlDiv\" > <div class=\"layui-row grid-demo\">";

        var collegeName = "";
        var collegeId = "";
        var stuCollegeId = "";
        var stuUsername = "";
        var stuId = "";
        var examname = "";
        var examSubName = "";
        var stuExamSubScore = "";
        var stuCollegeMajor = "";
        for(var i in data[index])
        {
            for(var itemName in data[index][i])
            {
                if(collegeName=="" || collegeName==null)
                {
                    collegeName = data[index][i].collegeName;
                }
                if(stuCollegeMajor=="" || stuCollegeMajor==null)
                {
                    stuCollegeMajor = data[index][i].stuCollegeMajor;
                }
                if(collegeId=="" || collegeId==null)
                {
                    collegeId =  data[index][i].collegeId;
                }
                if(stuCollegeId=="" || stuCollegeId==null)
                {
                    stuCollegeId =  data[index][i].stuCollegeId;
                }
                if(stuUsername=="" || stuUsername==null)
                {
                    stuUsername = data[index][i].stuUsername;
                }
                if(stuId=="" || stuId==null)
                {
                    stuId = data[index][i].stuId;
                }
                if(examname=="" || examname==null)
                {
                    examname = data[index][i].examname;
                }
                if(examSubName=="" || examSubName==null)
                {
                    examSubName = data[index][i].examSubName;
                }
                if(stuExamSubScore=="" || stuExamSubScore==null)
                {
                    stuExamSubScore = data[index][i].stuExamSubScore;
                }
            }
        }

        var firstDiv = "<div class=\"firstDiv\"><div class='left_up_Div'>\n" +
            "                        <input type='hidden' value='"+stuCollegeId+"'>\n" +
            "                        <div class='div_img_school'><img src=\"http://yeyixuan.top/wp-content/uploads/college/"+collegeName+".jpg\" class='img_school'></div>\n" +
            "                        <div class=\"div_text schoolName\">\n" +
            "                            "+collegeName+"\n" +
            "                        </div>\n" +
            "                        <div class=\"div_text major\">\n" +
            "                            "+stuCollegeMajor+"\n" +
            "                        </div></div>\n" +
            "                        <div class=\"layui-col-md12 div_checkDetail\">\n" +
            "                            <button class=\"layui-btn layui-btn-sm btn_checkDetail\" name='getDetail' >添加对比</button>\n" +
            "                            <button class=\"layui-btn layui-btn-sm btn_deleteComparison layui-btn-danger\" name='deleteComparison' >删除</button>\n" +
            "                        </div>\n" +
            "                    </div>";
        var secondDiv = "<div class=\"secondDiv\">\n" +
            "                        <img src=\"http://yeyixuan.top/wp-content/uploads/stuInfo/"+stuId+".jpg\" class='img_user' >\n" +
            "                        <div class='div_text'>"+stuUsername+"</div>\n" +
            "                        <hr>\n" +
            "                        <div class=\"div_score\">\n" +
            "                            分数:<br>\n" +
            "                            "+examname+"  "+examSubName+" "+stuExamSubScore+"<br>\n" +
            "                            ...\n" +
            "                        </div>\n" +
            "                    </div>";
        mainDiv+=firstDiv;
        mainDiv+=secondDiv;
        mainDiv+="</div></div>";
        $("#"+divId).append($(mainDiv));
    }
}


function addCollege_resourceCenter(divId,data)
{
    $("#"+divId).empty();
    for(var index in data)
    {
        var collegeId = "";
        var  collegeName ="";
        var  collegeChineseName ="";
        var  collegeArea ="";
        var  rankingUsNewsWorld ="";
        var  rankingYear ="";
        for(var item in data[index])
        {
            if(collegeId=="" ||collegeId!=null)
            {
                collegeId = data[index].collegeId;
            }
            if(collegeName=="" ||collegeName!=null)
            {
                collegeName = data[index].collegeName;
            }
            if(collegeChineseName=="" ||collegeChineseName!=null)
            {
                collegeChineseName = data[index].collegeChineseName;
            }
            if(collegeArea=="" ||collegeArea!=null)
            {
                collegeArea = data[index].collegeArea;
            }
            if(rankingUsNewsWorld=="" ||rankingUsNewsWorld!=null)
            {
                rankingUsNewsWorld = data[index].rankingUsNewsWorld;
            }
            if(rankingYear=="" ||rankingYear!=null)
            {
                rankingYear = data[index].rankingYear;
            }
        }
        var control = "<div class=\"controlDiv\" >\n" +
            "                <div class=\"layui-row grid-demo\">\n" +
            "                    <div class=\"left_up_Div\">\n" +
            "                        <input type='hidden' value='"+collegeId+"'>\n" +
            "                        <div class='div_img_school'>\n" +
            "                            <img src='http://yeyixuan.top/wp-content/uploads/college/"+collegeName+".jpg' class='img_school'>\n" +
            "                        </div>\n" +
            "                        <div class=\"div_text schoolName\">\n" +
            "                            "+collegeName+"\n" +
            "                        </div>\n" +
            "                        <div class=\"div_text schoolName\">\n" +
            "                            "+collegeChineseName+"\n" +
            "                        </div>\n" +
            "                    </div>\n" +
            "\n" +
            "                        <div class=\"layui-col-md12 div_checkDetail\">\n" +
            "                            <button class=\"layui-btn layui-btn-sm btn_checkDetail\" name='getDetail' >查看</button>\n" +
            "                      </div>\n" +
            "\n" +
            "                </div>\n" +
            "            </div>";
        $("#"+divId).append($(control))
    }

}

function addLayer(divId,overallPage,currentPage)
{
    $("#"+divId).empty();
    var YyeLayer  = "<button id='btn_movebackward' class=\"layui-btn layui-btn-sm layui-btn-primary\"  style='margin-right:20px'><i class=\"layui-icon layui-icon-left\"></i></button>";
    YyeLayer+="<span>第"+currentPage+"页，共"+overallPage+"页</span>";
    YyeLayer+="<button  id='btn_moveforward' class=\"layui-btn layui-btn-sm layui-btn-primary\" style='margin-left:20px'><i class=\"layui-icon layui-icon-right\"></i></button>";
    $("#"+divId).append($(YyeLayer));
    $("#btn_movebackward").click(function () {
        if(currentPage==1)
        {

        }else
        {
            resourceCenterVue.starter-=21;
            // resourceCenterVue.limit-=21;
            addLayer(divId,overallPage,currentPage-1);
            /*currentPage-=1;*/
            resourceCenterVue.selectCollegeInfoAll();
        }
    })
    $("#btn_moveforward").click(function () {
        if(currentPage==overallPage)
        {

        }else
        {
            resourceCenterVue.starter+=21;
            // resourceCenterVue.limit+=21;
            addLayer(divId,overallPage,currentPage+1);
            /*currentPage+=1;*/
            resourceCenterVue.selectCollegeInfoAll();
        }
    })
}

function addStudentOffer(divId,data)
{
    $("#"+divId).empty();

    for(var index in data)
    {
        var stuUsername = "";
        var lastScore = "";
        var stuId = "";
        var stuCollegeId = "";
        for(var item in data[index])
        {
            if(stuUsername==null || stuUsername=="")
            {
                stuUsername = data[index].stuUsername;
            }
            if(lastScore==null || lastScore=="")
            {
                lastScore+= data[index].score.examname;
                lastScore+= " ";
                lastScore+= data[index].score.examSubName;
                lastScore+= " ";
                lastScore+= data[index].score.stuExamSubScore;
            }
            if(stuId==null || stuId=="")
            {
                stuId = data[index].stuId;
            }
            if(stuCollegeId==null || stuCollegeId=="")
            {
                stuCollegeId = data[index].stuCollegeId;
            }
        }
        var control = "<div class=\"controlDiv\" >\n" +
            "                        <div class=\"layui-row grid-demo\">\n" +
            "                            <div class=\"left_up_Div\">\n" +
            "                                <input type='hidden' value='"+stuCollegeId+"'>\n" +
            "                                <div class='div_img_stu'>\n" +
            "                                    <img src=\"http://yeyixuan.top/wp-content/uploads/stuInfo/"+stuId+".jpg\" class='img_stu'>\n" +
            "                                </div>\n" +
            "                                <div class=\"div_text stuName\">\n" +
            "                                    "+stuUsername+"\n" +
            "                                </div>\n" +
            "                                <div class=\"div_text schoolName\">\n" +
            "                                    "+lastScore+"<br>\n" +
            "                                    ...\n" +
            "                                </div>\n" +
            "                            </div>\n" +
            "\n" +
            "                                <div class=\"layui-col-md12 div_checkDetail\">\n" +
            "                                    <button class=\"layui-btn layui-btn-sm btn_checkDetail\" name='getDetail' >查看</button>\n" +
            "                              </div>\n" +
            "\n" +
            "                        </div>\n" +
            "                    </div>";
        $("#"+divId).append($(control));
    }


}

function addComparisonLeft(divId)
{
    $("#"+divId).empty();
    var addcontent = "<hr class=\"layui-bg-green\">\n" +
        "                        <h2>学校信息<img src='http://yeyixuan.top/wp-content/uploads/college/"+comparisonVue.collegeName+".jpg' id=\"schoolImg1\" onerror=\"this.src='/img/newone.jpg'\" style=\"border-radius: 140px;\n" +
        "                border:1px solid #eeeeee\"  width=\"50px\"></h2>\n" +
        "\n" +
        "                        <div id=\"div_stuCollegeInfo\">\n" +
        "\n" +
        "                            <table class=\"layui-table\">\n" +
        "                                <colgroup>\n" +
        "                                    <col width=\"400\">\n" +
        "                                    <col width=\"400\">\n" +
        "                                    <col width=\"150\">\n" +
        "                                    <col>\n" +
        "                                </colgroup>\n" +
        "                                <thead>\n" +
        "                                <tr>\n" +
        "                                    <th>中文名</th>\n" +
        "                                    <th>英文名</th>\n" +
        "                                    <th>地区</th>\n" +
        "                                </tr>\n" +
        "                                </thead>\n" +
        "                                <tbody>\n" +
        "                                <tr>\n" +
        "                                    <td v-html=collegeInfo.collegeChineseName></td>\n" +
        "                                    <td v-html=collegeInfo.collegename></td>\n" +
        "                                    <td v-html=collegeInfo.collegearea></td>\n" +
        "                                </tr>\n" +
        "                                </tbody>\n" +
        "                            </table>\n" +
        "\n" +
        "                        </div>\n" +
        "\n" +
        "                        <hr class=\"layui-bg-green\">\n" +
        "                        <h2>学校录取信息</h2>\n" +
        "\n" +
        "                        <div id=\"div_stuCollege\">\n" +
        "\n" +
        "                            <table class=\"layui-table\">\n" +
        "                                <colgroup>\n" +
        "                                    <col width=\"250\">\n" +
        "                                    <col width=\"200\">\n" +
        "                                    <col width=\"500\">\n" +
        "                                    <col>\n" +
        "                                </colgroup>\n" +
        "                                <thead>\n" +
        "                                <tr>\n" +
        "                                    <th>录取专业</th>\n" +
        "                                    <th>奖学金数量</th>\n" +
        "                                    <th>学生感受</th>\n" +
        "                                </tr>\n" +
        "                                </thead>\n" +
        "                                <tbody>\n" +
        "                                <tr>\n" +
        "                                    <td >{{ stuCollege.stucollegemajor}}</td>\n" +
        "                                    <td >{{ stuCollege.stucollegescholarship}}</td>\n" +
        "                                    <td >{{ stuCollege.stucollegeselffeeling}}</td>\n" +
        "                                </tr>\n" +
        "                                </tbody>\n" +
        "                            </table>\n" +
        "\n" +
        "\n" +
        "\n" +
        "                        </div>\n" +
        "\n" +
        "                        <hr class=\"layui-bg-orange\">\n" +
        "                        <h2>学生信息<img src='http://yeyixuan.top/wp-content/uploads/stuInfo/"+comparisonVue.stuId1+".jpg' id=\"personalImg1\" onerror=\"this.src='/img/newone.jpg'\" style=\"border-radius: 140px;\n" +
        "                border:1px solid #eeeeee\"  width=\"50px\"></h2>\n" +
        "\n" +
        "                        <div id=\"div_stuInfo\">\n" +
        "\n" +
        "                            <table class=\"layui-table\">\n" +
        "                                <colgroup>\n" +
        "                                    <col width=\"150\">\n" +
        "                                    <col width=\"70\">\n" +
        "                                    <col width=\"200\">\n" +
        "                                    <col width=\"50\">\n" +
        "                                    <col width=\"100\">\n" +
        "                                    <col width=\"100\">\n" +
        "                                    <col width=\"280\">\n" +
        "                                    <col>\n" +
        "                                </colgroup>\n" +
        "                                <thead>\n" +
        "                                <tr>\n" +
        "                                    <th>昵称</th>\n" +
        "                                    <th>性别</th>\n" +
        "                                    <th>高中</th>\n" +
        "                                    <th>GPA</th>\n" +
        "                                    <th>国家/地区</th>\n" +
        "                                    <th>性取向</th>\n" +
        "                                    <th>简介</th>\n" +
        "                                </tr>\n" +
        "                                </thead>\n" +
        "                                <tbody>\n" +
        "                                <tr>\n" +
        "                                    <td >{{ stuInfo.stuusername}}</td>\n" +
        "                                    <td >{{ stuInfo.stusex}}</td>\n" +
        "                                    <td >{{ stuInfo.stuhighschool}}</td>\n" +
        "                                    <td >{{ stuInfo.stugpa}}</td>\n" +
        "                                    <td >{{ stuInfo.stunationality}}</td>\n" +
        "                                    <td >{{ stuInfo.stusexualorientation}}</td>\n" +
        "                                    <td >{{ stuInfo.stuotherinfo}}</td>\n" +
        "                                </tr>\n" +
        "                                </tbody>\n" +
        "                            </table>\n" +
        "\n" +
        "                        </div>\n" +
        "\n" +
        "                        <hr class=\"layui-bg-blue\">\n" +
        "                        <h2>学生成绩</h2>\n" +
        "\n" +
        "                        <div id=\"div_stuScore\">\n" +
        "                            <table class=\"layui-table\">\n" +
        "                                <colgroup>\n" +
        "                                    <col width=\"150\">\n" +
        "                                    <col width=\"200\">\n" +
        "                                    <col width=\"200\">\n" +
        "                                    <col width=\"200\">\n" +
        "                                    <col width=\"200\">\n" +
        "                                    <col>\n" +
        "                                </colgroup>\n" +
        "                                <thead>\n" +
        "                                <tr>\n" +
        "                                    <th>ID</th>\n" +
        "                                    <th>考试名称</th>\n" +
        "                                    <th>科目名称</th>\n" +
        "                                    <th>分数</th>\n" +
        "                                    <th>日期</th>\n" +
        "                                </tr>\n" +
        "                                </thead>\n" +
        "                                <tbody>\n" +
        "                                <tr v-for=\"item in stuScore\">\n" +
        "                                    <td >{{item.stuExamSubId}}</td>\n" +
        "                                    <td >{{item.examname}}</td>\n" +
        "                                    <td >{{item.examSubName}}</td>\n" +
        "                                    <td >{{item.stuExamSubScore}}</td>\n" +
        "                                    <td >{{item.testDate}}</td>\n" +
        "                                </tr>\n" +
        "                                </tbody>\n" +
        "                            </table>\n" +
        "                        </div>\n" +
        "\n" +
        "                        <hr class=\"layui-bg-cyan\">\n" +
        "                        <h2>活动</h2>\n" +
        "\n" +
        "                        <div id=\"div_activity\">\n" +
        "                            <table class=\"layui-table\">\n" +
        "                                <colgroup>\n" +
        "                                    <col width=\"150\">\n" +
        "                                    <col width=\"200\">\n" +
        "                                    <col width=\"600\">\n" +
        "                                    <col>\n" +
        "                                </colgroup>\n" +
        "                                <thead>\n" +
        "                                <tr>\n" +
        "                                    <th>活动名称</th>\n" +
        "                                    <th>结果</th>\n" +
        "                                    <th>说明/注释/详解</th>\n" +
        "                                </tr>\n" +
        "                                </thead>\n" +
        "                                <tbody>\n" +
        "                                <tr v-for=\"item in stuActivity\">\n" +
        "                                    <td >{{item.activityname}}</td>\n" +
        "                                    <td >{{item.activityresult}}</td>\n" +
        "                                    <td >{{item.activitynote}}</td>\n" +
        "                                </tr>\n" +
        "                                </tbody>\n" +
        "                            </table>\n" +
        "                        </div>\n" +
        "\n" +
        "                        <hr class=\"layui-bg-yellow\">\n" +
        "                        <h2>Essay</h2>\n" +
        "\n" +
        "                        <div id=\"essay\">\n" +
        "                            <p v-html=\"stuCollege.stucollegedistinctessayurl\"></p>\n" +
        "                        </div>";

    $("#"+divId).append($(addcontent));
}

function addComparisonRight(divId)
{
    $("#"+divId).empty();
    var addcontent = "<hr class=\"layui-bg-green\">\n" +
        "                                            <h2>学校信息<img src='http://yeyixuan.top/wp-content/uploads/college/"+comparisonVue.collegeName2+".jpg' id=\"schoolImg2\" onerror=\"this.src='/img/newone.jpg'\" style=\"border-radius: 140px;\n" +
        "                                    border:1px solid #eeeeee\"  width=\"50px\"></h2>\n" +
        "\n" +
        "                                            <div id=\"div_stuCollegeInfo\">\n" +
        "\n" +
        "                                                <table class=\"layui-table\">\n" +
        "                                                    <colgroup>\n" +
        "                                                        <col width=\"400\">\n" +
        "                                                        <col width=\"400\">\n" +
        "                                                        <col width=\"150\">\n" +
        "                                                        <col>\n" +
        "                                                    </colgroup>\n" +
        "                                                    <thead>\n" +
        "                                                    <tr>\n" +
        "                                                        <th>中文名</th>\n" +
        "                                                        <th>英文名</th>\n" +
        "                                                        <th>地区</th>\n" +
        "                                                    </tr>\n" +
        "                                                    </thead>\n" +
        "                                                    <tbody>\n" +
        "                                                    <tr>\n" +
        "                                                        <td >{{ collegeInfo2.collegeChineseName}}</td>\n" +
        "                                                        <td >{{ collegeInfo2.collegename}}</td>\n" +
        "                                                        <td >{{ collegeInfo2.collegearea}}</td>\n" +
        "                                                    </tr>\n" +
        "                                                    </tbody>\n" +
        "                                                </table>\n" +
        "\n" +
        "                                            </div>\n" +
        "\n" +
        "                                            <hr class=\"layui-bg-green\">\n" +
        "                                            <h2>学校录取信息</h2>\n" +
        "\n" +
        "                                            <div id=\"div_stuCollege\">\n" +
        "\n" +
        "                                                <table class=\"layui-table\">\n" +
        "                                                    <colgroup>\n" +
        "                                                        <col width=\"250\">\n" +
        "                                                        <col width=\"200\">\n" +
        "                                                        <col width=\"500\">\n" +
        "                                                        <col>\n" +
        "                                                    </colgroup>\n" +
        "                                                    <thead>\n" +
        "                                                    <tr>\n" +
        "                                                        <th>录取专业</th>\n" +
        "                                                        <th>奖学金数量</th>\n" +
        "                                                        <th>学生感受</th>\n" +
        "                                                    </tr>\n" +
        "                                                    </thead>\n" +
        "                                                    <tbody>\n" +
        "                                                    <tr>\n" +
        "                                                        <td >{{ stuCollege2.stucollegemajor}}</td>\n" +
        "                                                        <td >{{ stuCollege2.stucollegescholarship}}</td>\n" +
        "                                                        <td >{{ stuCollege2.stucollegeselffeeling}}</td>\n" +
        "                                                    </tr>\n" +
        "                                                    </tbody>\n" +
        "                                                </table>\n" +
        "\n" +
        "\n" +
        "\n" +
        "                                            </div>\n" +
        "\n" +
        "                                            <hr class=\"layui-bg-orange\">\n" +
        "                                            <h2>学生信息<img src='http://yeyixuan.top/wp-content/uploads/stuInfo/"+comparisonVue.stuId2+".jpg' id=\"personalImg2\" onerror=\"this.src='/img/newone.jpg'\" style=\"border-radius: 140px;\n" +
        "                                    border:1px solid #eeeeee\"  width=\"50px\"></h2>\n" +
        "\n" +
        "                                            <div id=\"div_stuInfo\">\n" +
        "\n" +
        "                                                <table class=\"layui-table\">\n" +
        "                                                    <colgroup>\n" +
        "                                                        <col width=\"150\">\n" +
        "                                                        <col width=\"70\">\n" +
        "                                                        <col width=\"200\">\n" +
        "                                                        <col width=\"50\">\n" +
        "                                                        <col width=\"100\">\n" +
        "                                                        <col width=\"100\">\n" +
        "                                                        <col width=\"280\">\n" +
        "                                                        <col>\n" +
        "                                                    </colgroup>\n" +
        "                                                    <thead>\n" +
        "                                                    <tr>\n" +
        "                                                        <th>昵称</th>\n" +
        "                                                        <th>性别</th>\n" +
        "                                                        <th>高中</th>\n" +
        "                                                        <th>GPA</th>\n" +
        "                                                        <th>国家/地区</th>\n" +
        "                                                        <th>性取向</th>\n" +
        "                                                        <th>简介</th>\n" +
        "                                                    </tr>\n" +
        "                                                    </thead>\n" +
        "                                                    <tbody>\n" +
        "                                                    <tr>\n" +
        "                                                        <td >{{ stuInfo2.stuusername}}</td>\n" +
        "                                                        <td >{{ stuInfo2.stusex}}</td>\n" +
        "                                                        <td >{{ stuInfo2.stuhighschool}}</td>\n" +
        "                                                        <td >{{ stuInfo2.stugpa}}</td>\n" +
        "                                                        <td >{{ stuInfo2.stunationality}}</td>\n" +
        "                                                        <td >{{ stuInfo2.stusexualorientation}}</td>\n" +
        "                                                        <td >{{ stuInfo2.stuotherinfo}}</td>\n" +
        "                                                    </tr>\n" +
        "                                                    </tbody>\n" +
        "                                                </table>\n" +
        "\n" +
        "                                            </div>\n" +
        "\n" +
        "                                            <hr class=\"layui-bg-blue\">\n" +
        "                                            <h2>学生成绩</h2>\n" +
        "\n" +
        "                                            <div id=\"div_stuScore\">\n" +
        "                                                <table class=\"layui-table\">\n" +
        "                                                    <colgroup>\n" +
        "                                                        <col width=\"150\">\n" +
        "                                                        <col width=\"200\">\n" +
        "                                                        <col width=\"200\">\n" +
        "                                                        <col width=\"200\">\n" +
        "                                                        <col width=\"200\">\n" +
        "                                                        <col>\n" +
        "                                                    </colgroup>\n" +
        "                                                    <thead>\n" +
        "                                                    <tr>\n" +
        "                                                        <th>ID</th>\n" +
        "                                                        <th>考试名称</th>\n" +
        "                                                        <th>科目名称</th>\n" +
        "                                                        <th>分数</th>\n" +
        "                                                        <th>日期</th>\n" +
        "                                                    </tr>\n" +
        "                                                    </thead>\n" +
        "                                                    <tbody>\n" +
        "                                                    <tr v-for=\"item in stuScore2\">\n" +
        "                                                        <td >{{item.stuExamSubId}}</td>\n" +
        "                                                        <td >{{item.examname}}</td>\n" +
        "                                                        <td >{{item.examSubName}}</td>\n" +
        "                                                        <td >{{item.stuExamSubScore}}</td>\n" +
        "                                                        <td >{{item.testDate}}</td>\n" +
        "                                                    </tr>\n" +
        "                                                    </tbody>\n" +
        "                                                </table>\n" +
        "                                            </div>\n" +
        "\n" +
        "                                            <hr class=\"layui-bg-cyan\">\n" +
        "                                            <h2>活动</h2>\n" +
        "\n" +
        "                                            <div id=\"div_activity\">\n" +
        "                                                <table class=\"layui-table\">\n" +
        "                                                    <colgroup>\n" +
        "                                                        <col width=\"150\">\n" +
        "                                                        <col width=\"200\">\n" +
        "                                                        <col width=\"600\">\n" +
        "                                                        <col>\n" +
        "                                                    </colgroup>\n" +
        "                                                    <thead>\n" +
        "                                                    <tr>\n" +
        "                                                        <th>活动名称</th>\n" +
        "                                                        <th>结果</th>\n" +
        "                                                        <th>说明/注释/详解</th>\n" +
        "                                                    </tr>\n" +
        "                                                    </thead>\n" +
        "                                                    <tbody>\n" +
        "                                                    <tr v-for=\"item in stuActivity2\">\n" +
        "                                                        <td >{{item.activityname}}</td>\n" +
        "                                                        <td >{{item.activityresult}}</td>\n" +
        "                                                        <td >{{item.activitynote}}</td>\n" +
        "                                                    </tr>\n" +
        "                                                    </tbody>\n" +
        "                                                </table>\n" +
        "                                            </div>\n" +
        "\n" +
        "                                            <hr class=\"layui-bg-yellow\">\n" +
        "                                            <h2>Essay</h2>\n" +
        "\n" +
        "                                            <div id=\"essay\">\n" +
        "                                                <p v-html=\"stuCollege2.stucollegedistinctessayurl\"></p>\n" +
        "                                            </div>";
    $("#"+divId).append($(addcontent));
}