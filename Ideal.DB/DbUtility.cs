using Ideal.Ideal.Log;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;

namespace Ideal.Ideal.DB
{
    public class DbUtility
    {
        #region 私有字段
        private static string connectionString = string.Empty;
        private readonly DbProviderFactory providerFactory;
        #endregion
        /// <summary>
        /// 初始化数据库连接字符串
        /// </summary>
        /// <param name="ConnectionString"></param>
        /// <exception cref="ArgumentException"></exception>
        public DbUtility(string ConnectionString)
        {
            connectionString = ConnectionString;
            if (string.IsNullOrEmpty(connectionString))
            {
                throw new ArgumentException("数据库连接字符串不能为空！");
            }
        }
        public DbUtility()
        {
             
        }
        /// <summary>
        /// 验证数据库是否可以连接
        /// </summary>
        /// <param name="connectionString">连接符名称或连接符</param>
        /// <param name="providerType">数据库类型</param>
        /// <returns></returns>
        public bool ValidateDbConnection(string constr_str)
        {

            using (SqlConnection conn = new SqlConnection(constr_str))
            {
                using (SqlCommand cmd = conn.CreateCommand())
                {
                    try
                    {
                        conn.Open();
                        return true;
                    }
                    catch (Exception ex)
                    {
                        StringBuilder sb = new StringBuilder();
                        sb.Append("数据库连接验证错误");
                        sb.Append("错误信息：" + ex.Message);
                        LogMsgHelper.Error(sb.ToString());
                        return false;
                    }
                    finally
                    {
                        conn.Close();
                        cmd.Dispose();
                    }

                }
            }
            return false;
        }
        #region 对数据库执行增删改操作，返回受影响的行数
        /// <summary>
        /// 执行sql语句 带SqlParameter参数
        /// </summary>
        /// <param name="sqlText">SQL语句</param>
        /// <param name="parameters">SqlParameter参数</param>
        /// <returns></returns>
        public int ExecuteNonQuery(string sqlText, SqlParameter[] parameters, out int code, out string msg)
        {
            code = 11;
            msg = string.Empty;
            int count = 0;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = conn.CreateCommand())
                {
                    try
                    {
                        conn.Open();
                        cmd.CommandText = sqlText;
                        cmd.Parameters.AddRange(parameters);
                        count = cmd.ExecuteNonQuery();
                        code = 10;
                        msg = "执行成功！";
                        return count;
                    }
                    catch (Exception ex)
                    {
                        code = 11;
                        msg = ex.Message;
                        StringBuilder sb = new StringBuilder();
                        sb.Append("执行SQL语句错误");
                        sb.Append("SQL语句：" + sqlText);
                        sb.Append("错误信息：" + ex.Message);
                        LogMsgHelper.Error(sb.ToString());
                    }
                    finally
                    {
                        conn.Close();
                        cmd.Dispose();
                    }

                }
            }
            return count;
        }
        /// <summary>
        /// 执行SQL语句 不带参数
        /// </summary>
        /// <param name="sqlText">SQL语句</param>
        /// <returns></returns>
        public int ExecuteNonQuery(string sqlText, out int code, out string msg)
        {

            code = 11;
            msg = string.Empty;
            int count = 0;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = conn.CreateCommand())
                {

                    try
                    {
                        conn.Open();
                        cmd.CommandText = sqlText;
                        cmd.CommandType = CommandType.Text;
                        count = cmd.ExecuteNonQuery();
                        code = 10;
                        msg = "执行成功！";
                        return count;
                    }
                    catch (Exception ex)
                    {
                        code = 11;
                        msg = ex.Message;
                        StringBuilder sb = new StringBuilder();
                        sb.Append("执行SQL语句错误");
                        sb.Append("SQL语句：" + sqlText);
                        sb.Append("错误信息：" + ex.Message);
                        LogMsgHelper.Debug(sb.ToString());
                    }
                    finally
                    {
                        conn.Close();
                        cmd.Dispose();
                    }
                }
            }
            return count;
        }
        public int ExecuteNonQuery(List<KeyValuePair<string, SqlParameter[]>> sqlList, out int code, out string msg)
        {
            code = 11;
            msg = string.Empty;
            int count = 0;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = conn.CreateCommand())
                {
                    SqlTransaction tran = null;
                    try
                    {
                        conn.Open();
                        tran = conn.BeginTransaction();
                        cmd.CommandType = CommandType.Text;
                        cmd.Transaction = tran;
                        foreach (var item in sqlList)
                        {
                            cmd.CommandText = item.Key;
                            cmd.Parameters.Clear();
                            cmd.Parameters.AddRange(item.Value);
                            count += cmd.ExecuteNonQuery();
                        }
                        tran.Commit();
                        code = 10;
                        msg = "执行成功！";
                        return count;
                    }
                    catch (SqlException ex)
                    {
                        code = 11;
                        msg = ex.Message;
                        tran.Rollback();
                        StringBuilder sb = new StringBuilder();
                        sb.Append("执行SQL语句错误");
                        sb.Append("错误信息：" + ex.Message);
                        LogMsgHelper.Debug(sb.ToString());
                    }
                    finally
                    {
                        conn.Close();
                        cmd.Dispose();
                        tran.Dispose();
                    }

                }
            }
            return count;
        }
        /// <summary>
        /// 执行事务  不带参数
        /// </summary>
        /// <param name="sqlList">sql集合</param>
        /// <returns></returns>
        public int ExecuteSqlTran(List<string> sqlList, out int code, out string msg)
        {
            code = 11;
            msg = string.Empty;
            int count = 0;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = conn.CreateCommand())
                {
                    SqlTransaction tran = null;
                    try
                    {
                        conn.Open();

                        tran = conn.BeginTransaction();
                        cmd.Transaction = tran;
                        cmd.CommandType = CommandType.Text;
                        foreach (var item in sqlList)
                        {
                            cmd.CommandText = item;
                            count += cmd.ExecuteNonQuery();
                        }
                        tran.Commit();
                        code = 10;
                        msg = "执行成功！";
                        return count;
                    }
                    catch (SqlException ex)
                    {
                        code = 11;
                        msg = ex.Message;
                        tran.Rollback();
                        StringBuilder sb = new StringBuilder();
                        sb.Append("执行SQL语句错误");
                        sb.Append("错误信息：" + ex.Message);
                        LogMsgHelper.Debug(sb.ToString());
                        throw;
                    }
                    finally
                    {
                        conn.Close();
                        cmd.Dispose();
                        tran.Dispose();
                    }

                }
            }
        }
        #endregion

        #region 对数据库进行查询 ，返回DataTable
        /// <summary>
        /// 执行SQL获取DataTable 带参数
        /// </summary>
        /// <param name="sqlText">Sql语句</param>
        /// <param name="parameters">参数</param>
        /// <returns></returns>
        public DataTable ExecuteScalar(string sqlText, SqlParameter[] parameters, out int code, out string msg)
        {
            code = 21;
            msg = string.Empty;
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = conn.CreateCommand())
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {

                        try
                        {
                            conn.Open();
                            cmd.CommandText = sqlText;
                            da.SelectCommand.Parameters.AddRange(parameters);
                            da.Fill(ds);
                            code = 20;
                            msg = "查询成功！";
                            if (ds != null && ds.Tables.Count > 0)
                            {
                                dt = ds.Tables[0];
                                code = 20; 
                                msg = "查询成功！";
                            }
                            else
                            {
                                code = 21;
                                msg = "查询成功无数据！";
                            }
                        }
                        catch (Exception ex)
                        {
                            code = 21;
                            msg = ex.Message;
                            StringBuilder sb = new StringBuilder();
                            sb.Append("执行SQL语句错误");
                            sb.Append("SQL语句：" + sqlText);
                            sb.Append("错误信息：" + ex.Message);
                            LogMsgHelper.Debug(sb.ToString());
                        }
                        finally
                        {
                            conn.Close();
                            cmd.Dispose();
                        }

                    }
                }
            }
            return dt;
        }
        /// <summary>
        /// 执行SQL获取DataTable  不带参数
        /// </summary>
        /// <param name="sqlText">sql语句</param>
        /// <returns></returns>
        public DataTable ExecuteScalar(string sqlText, out int code, out string msg)
        {
            code = 21;
            msg = string.Empty;
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = conn.CreateCommand())
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        try
                        {
                            conn.Open();
                            cmd.CommandText = sqlText;
                            cmd.CommandType = CommandType.Text;
                            da.Fill(ds);
                            if (ds != null && ds.Tables[0].Rows.Count > 0)
                            {
                                dt = ds.Tables[0];
                                code = 20;
                                msg = "查询成功！";
                            }
                            else
                            {

                                code = 22;
                                msg = "查询成功无数据！";
                            }
                        }
                        catch (Exception ex)
                        {
                            code = 21;
                            msg = ex.Message;
                            StringBuilder sb = new StringBuilder();
                            sb.Append("执行SQL语句错误");
                            sb.Append("SQL语句：" + sqlText);
                            sb.Append("错误信息：" + ex.Message);
                            LogMsgHelper.Debug(sb.ToString());
                        }
                        finally
                        {
                            conn.Close();
                            cmd.Dispose();
                        }
                    }
                }
            }
            return dt;
        }



        #endregion
        #region 私有方法


        #endregion
    }
}
