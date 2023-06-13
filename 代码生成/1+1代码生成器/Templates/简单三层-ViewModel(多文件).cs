// <copyright file="${TableName}VM.cs" company=" Pvirtech Information Technology , Inc.">
//    Copyright (c) 2019 Pvirtech Information Technology , Inc. 
//    All Rights Reserved.
//    @文件名: ${TableName}VM.cs
//    @功能描述: 
// 
//    @版本: 1.0
//    @创建人: 宋诚
//    @创建日期: 2020-02-17
// </copyright>
using System;
using System.Collections.Generic;
using System.Text;

namespace ${viewmodelnamespace}
{
	/// <summary>
	/// 视图${TableName}VM
	/// </summary>
	public class ${TableName}VM 
	{
		public ${TableName}VM(){}
#foreach($Item in $TableColumns.Rows)
		/// <summary>
		/// ${Item.ColumnDesc}
		/// </summary>
		public ${Item.csType} ${Item.ColumnName}{get;set;}
#end
	}
}

