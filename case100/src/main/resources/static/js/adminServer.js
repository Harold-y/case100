


function addTab_College(tbodyid,list)
{
    $("#"+tbodyid).empty();
    for(var index in list)
    {
        var tr = "<tr>";
        var item = list[index];
        var collegeName;
        for(var i in item)
        {
            if(i=="collegename")
            {
                collegeName = item[i];
            }
            if(item[i]!=null && i!="collegeispublic")
            {
                tr+="<td>"+item[i]+"</td>";
            }
        }
        tr+="<td><button name='Edit' class='layui-btn layui-btn-normal'>Edit</button>";
        tr+="<button name='ChangeIMG' class='layui-btn'>Change IMG</button>";
        tr+="<button name='Delete' class='layui-btn layui-btn-danger'>Delete</button></td>";
        //tr+="<td><img src='http://localhost:8080/static/img/college/"+collegeName+".jpg' height='40px'/> </td>";//Windows
        //tr+="<td><img src='http://localhost:8080/static/img/college/"+collegeName+".jpg' height='40px'/> </td>";
        tr+="</tr>";
        $("#"+tbodyid).append($(tr));
    }
}

function addTab_CollegeRanking(tbodyid,list)
{
    $("#"+tbodyid).empty();
    for(var index in list)
    {
        var tr = "<tr>";
        var item = list[index];
        for(var i in item)
        {
            if(item[i]!=null && i!="collegeispublic")
            {
                tr+="<td>"+item[i]+"</td>";
            }
        }
        tr+="<td><button name='addRk' class='layui-btn layui-btn-radius layui-btn-normal'>Add Ranking Record</button>";
        tr+="<button name='editRk' class='layui-btn layui-btn-radius layui-btn-warm'>Edit Record</button></td>";
        tr+="</tr>";
        $("#"+tbodyid).append($(tr));
    }
}

function CollegeRanking_dealWithThem(list) {
    $("#tbody_third").empty();
    for(var index in list)
    {
        var tr = "<tr>";
        var item = list[index];
        for(var i in item)
        {
            tr+="<td>"+item[i]+"</td>";
        }
        tr+="<td><button name='deleteRk' class='layui-btn layui-btn-radius layui-btn-danger'>Delete Record</button></td>";
        tr+="</tr>";
        $("#tbody_third").append($(tr));
    }
}

function realDelete_college(id)
{
    $.ajax({
        url:"/college/delete",
        method:"post",
        dataType:"json",
        data:{"collegeid":id},
        success:function (int) {
            showSuccess();
            queryall();
        }
    })
}


function addInfo_College(formid,info)
{
    $("#"+formid+" :input[name]").each(
        function()
        {
            $(this).val(info[this.name]);
        }
    )
}
