
<sql id = "" func="新增${TableName}">
INSERT dbo.${TableName}
(
#foreach($Item in $TableColumns.Rows)
    ${Item.ColumnName},
#end
)
VALUES
(
#foreach($Item in $TableColumns.Rows)
    @${Item.ColumnName},
#end
)
</sql>
    
<sql id = "" func="修改${TableName}">
    UPDATE dbo.${TableName} SET
#foreach($Item in $TableColumns.Rows)
#if(${Item.PrimaryKey}!= "true")
	${Item.ColumnName}=@${Item.ColumnName},
#end
#end
    WHERE #foreach($Item in $TableColumns.Rows)#if(${Item.PrimaryKey} == "true")${Item.ColumnName}#end#end = @#foreach($Item in $TableColumns.Rows)#if(${Item.PrimaryKey} == "true")${Item.ColumnName}#end#end

</sql>

<sql id = "" func="删除${TableName}">
DELETE dbo.${TableName} WHERE #foreach($Item in $TableColumns.Rows)#if(${Item.PrimaryKey} == "true")${Item.ColumnName}#end#end = @#foreach($Item in $TableColumns.Rows)#if(${Item.PrimaryKey} == "true")${Item.ColumnName}#end#end

</sql>