

字段
#foreach($Item in $TableColumns.Rows)
${Item.ColumnDesc}
#end

#foreach($Item in $TableColumns.Rows)
${Item.ColumnName}
#end

#foreach($Item in $TableColumns.Rows)
${Item.csType}
#end


查询输入
{
    ServiceName:"${TableName}Service",
    Method:"Get${TableName}List",
    JsonData:{
    pageIndex: 1,
  	pageSize : 20,
    #foreach($Item in $TableColumns.Rows)
    ${Item.ColumnName}:"${Item.ColumnDesc}",
    #end
    }
}

查询输出
{
  	"Code" : "40",
    "Msg" : "成功",
    "pageIndex" : 1,
    "pageSize" : 10,
   	"total":123,
  	"data" : [{
    #foreach($Item in $TableColumns.Rows)
    ${Item.ColumnName}:"${Item.ColumnDesc}",
    #end
    },
    ]
}

入库输入
{
    ServiceName:"${TableName}Service",
    Method:"Add${TableName}",
    JsonData:{
    #foreach($Item in $TableColumns.Rows)
     ${Item.ColumnName}:"${Item.ColumnDesc}",
    #end
    }
}
入库输出
{"Code":10,"Msg":"成功","data":null}