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
                tr+="<td></td>";
            }
        }
        tr+="<td><button name='Edit' class='layui-btn layui-btn-normal'>Edit</button>";
        /*tr+="<button name='Delete' class='layui-btn layui-btn-danger btn_delete'>Delete</button></td>";*/
        //tr+="<td><img src='http://localhost:8080/static/img/college/"+collegeName+".jpg' height='40px'/> </td>";//Windows
        //tr+="<td><img src='http://localhost:8080/static/img/college/"+collegeName+".jpg' height='40px'/> </td>";
        tr+="</tr>";
        $("#"+tbodyid).append($(tr));
    }
}

function addActivity(tbodyid,list)
{
    $("#"+tbodyid).empty();
    for(var index in list)
    {
        var tr = "<tr>";
        var itemMap = list[index];
        for(var i in itemMap)
        {
            if(itemMap[i]!=null &&itemMap[i]!="" && i!="stuid")
            {
                tr+="<td>"+itemMap[i]+"</td>";
            }else
            {
                if(i=="stuid")
                {

                }else
                {
                    tr+="<td></td>";
                }

            }
        }
        tr+="<td><button name='Edit' class='layui-btn layui-btn-normal'>Edit</button>";
        /*tr+="<button name='Delete' class='layui-btn layui-btn-danger btn_delete'>Delete</button></td>";*/
        //tr+="<td><img src='http://localhost:8080/static/img/college/"+collegeName+".jpg' height='40px'/> </td>";//Windows
        //tr+="<td><img src='http://localhost:8080/static/img/college/"+collegeName+".jpg' height='40px'/> </td>";
        tr+="</tr>";
        $("#"+tbodyid).append($(tr));
    }
}

function addOption_Score_Genre(list)
{
    $("#add_examid").empty();
    for(var index in list)
    {
        var option = "<option>";
        var item = list[index];
        for(var i in item)
        {
            if(i=="examid")
            {
                option="<option value='"+item[i]+"'>";
            }
            if(i=="examname")
            {
                option+=item[i];
            }
        }
        option+="</option>";
        $("#add_examid").append($(option));
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