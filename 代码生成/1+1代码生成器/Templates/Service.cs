// <copyright file="${TableName}Service.cs" company=" Pvirtech Information Technology , Inc.">
//    Copyright (c) 2019 Pvirtech Information Technology , Inc. 
//    All Rights Reserved.
//    @文件名: ${TableName}Service.cs
//    @功能描述: 
// 
//    @版本: 1.0
//    @创建人: 宋诚
//    @创建日期: 
// </copyright>
using sail.zhang.core.help;
using System;
using System.Collections.Generic;
using System.Text;
using ${viewmodelnamespace};

namespace ${Servicenamespace}
{
    public class ${TableName}Service
    {
		#region 自定义业务实现



        #endregion
		
        #region 简单业务实现
       
        #region 查询
        /// <summary>
        /// 查询 分页
        /// </summary>
        /// <param name="query">查询条件</param>
        /// <param name="code">错误码</param>
        /// <param name="msg">消息</param>
        /// <param name="total">总条数</param>
        /// <returns></returns>
        public List<${TableName}VM> Get${TableName}List(${TableName}Query query, out string code, out string msg, out int total)
        {
            total = 0;
            code = "42";
            msg = "查询失败！";
            List<${TableName}VM> list = new List<${TableName}VM>();
            ${TableName}BLL bll = new ${TableName}BLL();
            list = bll.Get${TableName}List(query, out code, out msg, out total);
            return list;
        }
            /// <summary>
        /// 查询 不分页
        /// </summary>
        /// <param name="query">查询条件</param>
        /// <param name="code">错误码</param>
        /// <param name="msg">消息</param>
        /// <returns></returns>
        public List<${TableName}VM> GetAll${TableName}List(${TableName}Query query,out string code, out string msg)
        {
            code = "42";
            msg = "查询失败！";
            List<${TableName}VM> list = new List<${TableName}VM>();
            ${TableName}BLL bll = new ${TableName}BLL();
            list = bll.GetAll${TableName}List(query, out code, out msg);
            return list;
        }
            /// <summary>
        /// 详情
        /// </summary>
        /// <param name="#foreach($Item in $TableColumns.Rows)#if(${Item.PrimaryKey} == "true")${Item.ColumnName}#end#end">主键</param>
        /// <param name="code">错误码</param>
        /// <param name="msg">消息</param>
        /// <returns></returns>
        public ${TableName}VM Get${TableName}Detail(string #foreach($Item in $TableColumns.Rows)#if(${Item.PrimaryKey} == "true")${Item.ColumnName}#end#end, out string code, out string msg)
        {
            code = "42";
            msg = "查询失败！";
            ${TableName}VM vm = new ${TableName}VM();
            ${TableName}BLL bll = new ${TableName}BLL();
            vm = bll.Get${TableName}Detail(#foreach($Item in $TableColumns.Rows)#if(${Item.PrimaryKey} == "true")${Item.ColumnName}#end#end, out code, out msg);
            return vm;
        }
        #endregion

        #region 增删改
        /// <summary>
        /// 新增
        /// </summary>
        /// <param name="vm">${TableName}VM视图</param>
        /// <param name="code">错误码</param>
        /// <param name="msg">消息</param>
        /// <returns></returns>
        public void Add${TableName}(${TableName}VM vm, out string code, out string msg)
        {
            code = "10";
            msg = "添加失败！";
            ${TableName}BLL bll = new ${TableName}BLL();
            bll.Add${TableName}(vm, out code, out msg);
        }
            /// <summary>
        /// 修改
        /// </summary>
        /// <param name="vm">${TableName}VM视图</param>
        /// <param name="code">错误码</param>
        /// <param name="msg">消息</param>
        /// <returns></returns>
        public void Update${TableName}(${TableName}VM vm, out string code, out string msg)
        {
            code = "21";
            msg = "修改失败！";
            ${TableName}BLL bll = new ${TableName}BLL();
            bll.Update${TableName}(vm, out code, out msg);
        }
            /// <summary>
        /// 删除
        /// </summary>
        /// <param name="#foreach($Item in $TableColumns.Rows)#if(${Item.PrimaryKey} == "true")${Item.ColumnName}#end#end">主键</param>
        /// <param name="code">错误码</param>
        /// <param name="msg">消息</param>
        /// <returns></returns>
        public void Del${TableName}(string #foreach($Item in $TableColumns.Rows)#if(${Item.PrimaryKey} == "true")${Item.ColumnName}#end#end, out string code, out string msg)
        {
            code = "31";
            msg = "删除失败！";
            ${TableName}BLL bll = new ${TableName}BLL();
            bll.Del${TableName}(#foreach($Item in $TableColumns.Rows)#if(${Item.PrimaryKey} == "true")${Item.ColumnName}#end#end, out code, out msg);
        }
        #endregion

        #endregion
    }
}
