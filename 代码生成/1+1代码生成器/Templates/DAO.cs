// <copyright file="${TableName}DAO.cs" company=" Pvirtech Information Technology , Inc.">
//    Copyright (c) 2019 Pvirtech Information Technology , Inc. 
//    All Rights Reserved.
//    @文件名: ${TableName}DAO.cs
//    @功能描述: 
// 
//    @版本: 1.0
//    @创建人: 宋诚
//    @创建日期: 
// </copyright>
using sail.zhang.core.dao;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using ${modelnamespace};

namespace ${DAOnamespace}
{
    public class ${TableName}DAO
    {
		#region 自定义业务实现



        #endregion
		


        #region 简单业务实现
        
        #region 查询

        /// <summary>
        /// 查询 信息
        /// </summary>
        /// <param name="#foreach($Item in $TableColumns.Rows)#if(${Item.PrimaryKey} == "true")${Item.ColumnName}#end#end">主键</param>
        /// <param name="code">错误码</param>
        /// <param name="msg">消息</param>
        public DataTable Get${TableName}Detail(string #foreach($Item in $TableColumns.Rows)#if(${Item.PrimaryKey} == "true")${Item.ColumnName}#end#end, out string code, out string msg)
        {
            DataTable dt = new DataTable();
            code = "42";
            msg = "查询失败!";
            string sqlid = "";
            try
            {
                string sqlstr = ConfigClass.DicConfig[sqlid].ToString();
                List<SqlParameter> paramslist = new List<SqlParameter>()
                {
                    new SqlParameter("#foreach($Item in $TableColumns.Rows)#if(${Item.PrimaryKey} == "true")${Item.ColumnName}#end#end", #foreach($Item in $TableColumns.Rows)#if(${Item.PrimaryKey}=="true")${Item.ColumnName}#end#end)
                };
                sqlstr += " AND #foreach($Item in $TableColumns.Rows)#if(${Item.PrimaryKey} == "true")${Item.ColumnName}#end#end = @#foreach($Item in $TableColumns.Rows)#if(${Item.PrimaryKey} == "true")${Item.ColumnName}#end#end";
                DataSet ds = SqlHelper.ExecuteDataset(CommandType.Text, sqlstr, paramslist.ToArray());
                if (ds.Tables.Count > 0)
                {
                    dt = ds.Tables[0];
                    if (dt.Rows.Count == 0)
                    {
                        code = "41";
                        msg = "无数据！";
                    }
                    else
                    {
                        code = "40";
                        msg = "查询成功！";
                    }
                }
            }
            catch (Exception e)
            {
                code = "42";
                msg += "|" + e.Message;
            }
            return dt;
        }
        /// <summary>
        /// 查询 分页
        /// </summary>
        /// <param name="query">${TableName}查询类</param>
        /// <param name="code">是否成功</param>
        /// <param name="msg">消息(例如:成功)</param>
        /// <param name="total">总行数</param>
        /// <returns></returns>
        public DataTable Get${TableName}List(${TableName}Query query, out string code, out string msg, out int total)
        {
            DataTable dt = new DataTable();
            code = "42";
            msg = "查询失败!";
            string sqlid = "";
            int Outtotalpage = 0;
            total = 1;
            string sqlstr = string.Empty;
            try
            {
                sqlstr = ConfigClass.DicConfig[sqlid].ToString();
                List<SqlParameter> paramslist = new List<SqlParameter>();
                //非空判断
        #foreach($Item in $TableColumns.Rows)
        if (!string.IsNullOrEmpty(query.${Item.ColumnName}))
                {
                    SqlParameter ${Item.ColumnName}SqlParameter = new SqlParameter("${Item.ColumnName}", query.${Item.ColumnName});
                    paramslist.Add(${Item.ColumnName}SqlParameter);
                    sqlstr += " AND ${Item.ColumnName} = @${Item.ColumnName}";
                }
        #end

       
                sqlstr = SqlHelper.PageSql(sqlstr, "#foreach($Item in $TableColumns.Rows)#if(${Item.PrimaryKey} == "true")${Item.ColumnName}#end#end DESC", query.pageIndex, query.pageSize, ref Outtotalpage, ref total, paramslist.ToArray());
                DataSet ds = SqlHelper.ExecuteDataset(CommandType.Text, sqlstr, paramslist.ToArray());
                if (ds.Tables.Count > 0)
                {
                    dt = ds.Tables[0];
                    if (dt.Rows.Count == 0)
                    {
                        code = "41";
                        msg = "无数据！";
                    }
                    else
                    {
                        code = "40";
                        msg = "查询成功！";
                    }
                }
            }
            catch (Exception e)
            {
                code = "42";
                msg += "|" + e.Message;
            }
            return dt;
        }

        /// <summary>
        /// 不分页查询
        /// </summary>
        /// <param name="query">${TableName}类型</param>
        /// <param name="code">是否成功</param>
        /// <param name="msg">消息(例如:成功)</param>
        /// <returns></returns>
        public DataTable GetAll${TableName}List(${TableName}Query query, out string code, out string msg)
        {
            DataTable dt = new DataTable();
            code = "42";
            msg = "查询失败!";
            string sqlid = "";
            string sqlstr = string.Empty;
            try
            {
                sqlstr = ConfigClass.DicConfig[sqlid].ToString();
                List<SqlParameter> paramslist = new List<SqlParameter>();
                //非空判断
        #foreach($Item in $TableColumns.Rows)
        if (!string.IsNullOrEmpty(query.${Item.ColumnName}))
                {
                    SqlParameter ${Item.ColumnName}SqlParameter = new SqlParameter("${Item.ColumnName}", query.${Item.ColumnName});
                    paramslist.Add(${Item.ColumnName}SqlParameter);
                    sqlstr += " AND ${Item.ColumnName} = @${Item.ColumnName}";
                }
        #end
                DataSet ds = SqlHelper.ExecuteDataset(CommandType.Text, sqlstr, paramslist.ToArray());
                if (ds.Tables.Count > 0)
                {
                    dt = ds.Tables[0];
                    if (dt.Rows.Count == 0)
                    {
                        code = "41";
                        msg = "无数据！";
                    }
                    else
                    {
                        code = "40";
                        msg = "查询成功！";
                    }
                }
            }
            catch (Exception e)
            {
                code = "42";
                msg += "|" + e.Message;
            }
            return dt;
        }

        #endregion

        #region 增删改
        /// <summary>
        /// 添加(DAO层)
        /// </summary>
        /// <param name="model">${TableName}Model实体类</param>
        /// <param name="msg">消息(例如:成功)</param>
        /// <returns></returns>
        public bool Add${TableName}(${TableName}Model model, out string msg)
        {
            bool flag = false;
            msg = "保存失败！";
            string sqlid = "";
            string sqlstr = string.Empty;
            try
            {
                sqlstr = ConfigClass.DicConfig[sqlid].ToString();
                List<SqlParameter> paramslist = new List<SqlParameter>()
                {
        #foreach($Item in $TableColumns.Rows)
            new SqlParameter("${Item.ColumnName}", model.${Item.ColumnName}),
        #end
        };
                int count = SqlHelper.ExecuteNonQuery(CommandType.Text, sqlstr, paramslist.ToArray());
                if (count > 0)
                {
                    flag = true;
                    msg = "保存成功！";
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                msg = "|" + ex.ToString();
                return false;
            }
            return flag;
        }
                /// <summary>
        /// 修改 (DAO层)
        /// </summary>
        /// <param name="model">${TableName}Model实体类</param>
        /// <param name="msg">消息(例如:成功)</param>
        /// <returns></returns>
        public bool Update${TableName}(${TableName}Model model, out string msg)
        {
            bool flag = false;
            msg = "修改失败!";
            string sqlid = "";
            string sqlstr = string.Empty;
            try
            {
                sqlstr = ConfigClass.DicConfig[sqlid].ToString();
                List<SqlParameter> paramslist = new List<SqlParameter>()
                {
        #foreach($Item in $TableColumns.Rows)
            new SqlParameter("${Item.ColumnName}", model.${Item.ColumnName}),
        #end
        };
                int count = SqlHelper.ExecuteNonQuery(CommandType.Text, sqlstr, paramslist.ToArray());
                if (count > 0)
                {
                    flag = true;
                    msg = "修改成功!";
                }
            }
            catch (Exception ex)
            {
                msg = "|" + ex.ToString();
            }
            return flag;
        }
        /// <summary>
        /// 删除 (DAO层)
        /// </summary>
        /// <param name="#foreach($Item in $TableColumns.Rows)#if(${Item.PrimaryKey} == "true")${Item.ColumnName}#end#end">主键</param>
        /// <param name="msg"></param>
        /// <returns></returns>
        public bool Del${TableName}(string #foreach($Item in $TableColumns.Rows)#if(${Item.PrimaryKey} == "true")${Item.ColumnName}#end#end, out string msg)
        {
            bool flag = false;
            msg = "删除失败！";
            string sqlid = "";
            string sqlstr = string.Empty;
            sqlstr = ConfigClass.DicConfig[sqlid].ToString();
            List<SqlParameter> paramslist = new List<SqlParameter>()
            {
                new SqlParameter("#foreach($Item in $TableColumns.Rows)#if(${Item.PrimaryKey} == "true")${Item.ColumnName}#end#end",#foreach($Item in $TableColumns.Rows)#if(${Item.PrimaryKey} == "true")${Item.ColumnName}#end#end)
            };
            int count = SqlHelper.ExecuteNonQuery(CommandType.Text, sqlstr, paramslist.ToArray());
            if (count > 0)
            {
                flag = true;
                msg = "删除成功！";
            }
            return flag;
        }
        #endregion

        #endregion
    }
}
