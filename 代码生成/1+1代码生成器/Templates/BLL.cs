// <copyright file="${TableName}BLL.cs" company=" Pvirtech Information Technology , Inc.">
//    Copyright (c) 2019 Pvirtech Information Technology , Inc. 
//    All Rights Reserved.
//    @文件名: ${TableName}BLL.cs
//    @功能描述: 
// 
//    @版本: 1.0
//    @创建人: 宋诚
//    @创建日期: 
// </copyright>
using sail.zhang.core.help;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using ${modelnamespace};
using ${viewmodelnamespace};

namespace ${BLLnamespace}
{
    public class ${TableName}BLL
    {
		#region 自定义业务实现



        #endregion
		
        #region 简单业务实现
       
        #region 查询
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
            List<${TableName}VM> List = new List<${TableName}VM>();
            try
            {
                ${TableName}DAO dao = new ${TableName}DAO();
                DataTable dt = new DataTable();
                dt = dao.GetAll${TableName}List(query,out code, out msg);
                if (code == "40")
                {
                    List = DataConvert<${TableName}VM>.ConvertToEntityList(dt);
                }
            }
            catch (Exception ex)
            {
                msg = "查询失败!|" + ex.Message;
            }
            return List;
        }

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
            code = "42";
            msg = "查询失败！";
            List<${TableName}VM> List = new List<${TableName}VM>();
            try
            {
                ${TableName}DAO dao = new ${TableName}DAO();
                DataTable dt = new DataTable();
                dt = dao.Get${TableName}List(query, out code, out msg, out total);
                if (code == "40")
                {
                    List = DataConvert<${TableName}VM>.ConvertToEntityList(dt);
                }
            }
            catch (Exception ex)
            {
                msg = "查询失败!|" + ex.Message;
                total = 0;
            }
            return List;
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
            try
            {
                ${TableName}DAO dao = new ${TableName}DAO();
                DataTable dt = new DataTable();
                dt = dao.Get${TableName}Detail(#foreach($Item in $TableColumns.Rows)#if(${Item.PrimaryKey} == "true")${Item.ColumnName}#end#end, out code, out msg);
                if (code == "40")
                {
                    vm = DataConvert<${TableName}VM>.ConvertToEntity(dt.Rows[0]);
                }
            }
            catch (Exception ex)
            {
                msg = "查询失败!|" + ex.Message;
            }
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
            code = "11";
            msg = "添加失败！";
            bool flag = false;
            try
            {
                ${TableName}DAO dao = new ${TableName}DAO();
                ToolClass.HandModelEmptyProp<${TableName}VM>(vm);
                //VM转换Model
                ${TableName}Model model = DataConvert<${TableName}Model>.ConvertToEntity(vm);
                flag = dao.Add${TableName}(model, out msg);
                if (flag)
                {
                    code = "10";
                    msg = "添加成功！";
                }
            }
            catch (Exception e)
            {
                code = "11";
                msg += "|" + e.Message;
            }
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
            bool flag = false;
            try
            {
                //处理空属性
                ${TableName}DAO dao = new ${TableName}DAO();
                ToolClass.HandModelEmptyProp<${TableName}VM>(vm);
                ${TableName}VM ${TableName}vm = Get${TableName}Detail(vm.#foreach($Item in $TableColumns.Rows)#if(${Item.PrimaryKey} == "true")${Item.ColumnName}#end#end, out code, out msg);
                //判断账号是否能修改
                if (code == "40")
                {
                    //VM转换Model
                    ${TableName}Model model = DataConvert<${TableName}Model>.ConvertToEntity(vm);
                    flag = dao.Update${TableName}(model, out msg);
                    if (flag)
                    {
                        code = "20";
                        msg = "修改成功！";
                    }
                }
                if (code == "41")
                {
                    code = "21";
                    msg = "|没有找到此数据！";
                    return;
                }

            }
            catch (Exception e)
            {
                code = "21";
                msg += "|" + e.Message;
            }
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
            bool flag = false;
            try
            {
                //查询账号是否存在
                ${TableName}DAO dao = new ${TableName}DAO();
                ${TableName}VM ${TableName}vm = Get${TableName}Detail(#foreach($Item in $TableColumns.Rows)#if(${Item.PrimaryKey} == "true")${Item.ColumnName}#end#end, out code, out msg);
                //判断账号是否能添加
                if (code != "40")
                {
                    code = "31";
                    msg = "删除失败|此数据不存在！";
                    return;
                }
                //VM转换Model
                flag = dao.Del${TableName}(#foreach($Item in $TableColumns.Rows)#if(${Item.PrimaryKey} == "true")${Item.ColumnName}#end#end, out msg);
                if (flag)
                {
                    code = "30";
                    msg = "删除成功！";
                }
            }
            catch (Exception e)
            {
                code = "31";
                msg += "|" + e.Message;
            }
        }
        #endregion

        #endregion
    }
}
