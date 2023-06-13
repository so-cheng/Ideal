// <copyright file="${TableName}Model.cs" company=" Pvirtech Information Technology , Inc.">
//    Copyright (c) 2019 Pvirtech Information Technology , Inc. 
//    All Rights Reserved.
//    @文件名: ${TableName}Model.cs
//    @功能描述: 
// 
//    @版本: 1.0
//    @创建人: 宋诚
//    @创建日期: 2023-03-17
// </copyright>
using System;
using System.Collections.Generic;
using System.Text;
using ${ viewmodelnamespace};

namespace ${ViewModelnamespace }
{
	/// <summary>
	///  
	/// </summary>
	public class ${TableName}VM
	{
#foreach($Item in $TableColumns.Rows)
		/// <summary>
		/// ${Item.ColumnDesc}
		/// </summary>	
		public ${Item.csType} ${Item.ColumnName}{get;set;}
#end
	}
}

