
using Ideal.Ideal.Common.Enums;
using Ideal.Ideal.Common.SqlFilter;
using Ideal.Ideal.Log;
using Ideal.Ideal.Model;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Reflection;
using System.Text;

namespace Ideal.Ideal.DB.Base
{
    public static class BaseControl
    {
        public static string constr_str = "";
        private static DbUtility dbHelper = null;
        //public BaseControl(string constr_key)
        //{
        //    if (string.IsNullOrEmpty(constr_key))
        //    {
        //        dbHelper = new DbUtility(constr_str);
        //    }
        //    else
        //    {
        //        dbHelper = new DbUtility(constr_key);
        //    }
        //}

        public static void SetConnton(string constr_key)
        {
            dbHelper = new DbUtility(constr_key);
        }
        /// <summary>
        /// 验证连接字符串是否正确
        /// </summary>
        /// <returns></returns>
        public static bool ValidateDbConnection()
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


        #region 查询
        /// <summary>
        /// 查询分页
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="param"></param>
        /// <returns></returns>
        public static PageModel<T> GetPageModels<T>(PageQueryParam param, out int code, out string msg)
            where T : BaseModel, new()
        {
            PageModel<T> pageModel = new PageModel<T>();
            param.SqlColumn = param.SqlColumn != null ? param.SqlColumn : "*";
            param.OrderMethod = param.OrderMethod == null ? OrderMethod.DESC : param.OrderMethod;
            string body = "";
            if (string.IsNullOrEmpty(param.SqlBody))
            {
                if (string.IsNullOrEmpty(param.Table))
                {
                    body = new T().Owner_DB_TableName;
                }
                else
                {
                    body = param.Table;
                }
                if (param.WithNoLock)
                {
                    body += " WITH(NOLOCK) ";
                }
            }
            else
            {
                body = param.SqlBody;
            }
            if (string.IsNullOrEmpty(param.OrderField))  
            {
                param.OrderField = "CreateTime";
            }
            string sql = string.Format("select {2} from {0} where 1=1 {1}", body, param.SqlWhere, param.SqlColumn);
            StringBuilder sb = new StringBuilder();
            sb.Append("WITH sqlStr AS (");
            sb.Append(sql);
            sb.Append(")");
            sb.Append(string.Format("SELECT TOP {0} * FROM", param.PageSize.ToString()));
            sb.Append("(");
            sb.Append(string.Format("SELECT TOP ({0} * {1}) ROW_NUMBER() OVER(ORDER BY {2} {3} ) AS RowNum, *FROM", param.PageIndex, param.PageSize, param.OrderField, param.OrderMethod));
            sb.Append(") AS tempTable");
            sb.Append(string.Format("WHERE RowNum BETWEEN({0}-1)*{1}+{2} AND {3}*{4}", param.PageIndex, param.PageSize, param.PageIndex, param.PageIndex, param.PageSize));
            sb.Append("ORDER BY RowNum");

            string sqlCount = string.Format("select count(1) from ({0}) as T", sql);
            DataTable rows = dbHelper.ExecuteScalar(sqlCount, out code, out msg);
            int count = 0;
            if (rows.Rows.Count > 0)
            {
                count = int.Parse(rows.Rows[0][0].ToString());
            }
            DataTable dt = dbHelper.ExecuteScalar(sql, out code, out msg);
            List<T> list = new List<T>();
            if (dt != null && dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    DataRow dr = dt.Rows[i];
                    T t = new T();
                    if (param.Table != null)
                    {
                        t.Owner_DB_TableName = param.Table;
                    }
                    foreach (PropertyInfo pro in t.GetType().GetProperties())
                    {
                        if (pro.CanWrite)
                        {
                            string fieldName = getFieldNameByProperty(pro);
                            if (dt.Columns.Contains(fieldName))//排除不包含列的异常
                            {
                                pro.SetValue(t, object2Value(pro, dr, fieldName), null);
                            }
                        }
                    }
                    list.Add(t);
                }
            }
            pageModel.Total = count;
            pageModel.PageSize = param.PageSize;
            pageModel.PageIndex = param.PageIndex;
            pageModel.PageList = list;
            param = null;
            dt = null;
            return pageModel;
        }
        /// <summary>
        /// 查询单条数据
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="param"></param>
        /// <returns></returns>
        public static T GetModel<T>(PageQueryParam param, out int code, out string msg) where T : BaseModel, new()
        {
            T t = new T();
            param.SqlColumn = param.SqlColumn != null ? param.SqlColumn : "*";
            string body = "";
            if (string.IsNullOrEmpty(param.SqlBody))
            {
                if (string.IsNullOrEmpty(param.Table))
                {
                    body = new T().Owner_DB_TableName;
                }
                else
                {
                    body = param.Table;
                }
                if (param.WithNoLock)
                {
                    body += " WITH(NOLOCK) ";
                }
            }
            else
            {
                body = param.SqlBody;
            }
            string sql = string.Format("select {2} from {0} where 1=1 {1}", body, param.SqlWhere, param.SqlColumn);
            DataTable dt = dbHelper.ExecuteScalar(sql, out code, out msg);
            if (dt != null && dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                if (param.Table != null)
                {
                    t.Owner_DB_TableName = param.Table;
                }
                foreach (PropertyInfo pro in t.GetType().GetProperties())
                {
                    if (pro.CanWrite)
                    {
                        string fieldName = getFieldNameByProperty(pro);
                        if (dt.Columns.Contains(fieldName))//排除不包含列的异常
                        {
                            pro.SetValue(t, object2Value(pro, dr, fieldName), null);
                        }
                    }
                }
            }
            param = null;
            dt = null;
            return t;
        }
        public static List<T> GetAllModels<T>(PageQueryParam param, out int code, out string msg)
            where T : BaseModel, new()
        {
            param.SqlColumn = param.SqlColumn != null ? param.SqlColumn : "*";
            param.OrderMethod = param.OrderMethod == null ? OrderMethod.DESC : param.OrderMethod;
            string body = "";
            if (string.IsNullOrEmpty(param.SqlBody))
            {
                if (string.IsNullOrEmpty(param.Table))
                {
                    body = new T().Owner_DB_TableName;
                }
                else
                {
                    body = param.Table;
                }
                if (param.WithNoLock)
                {
                    body += " WITH(NOLOCK) ";
                }
            }
            else
            {
                body = param.SqlBody;
            }
            if (string.IsNullOrEmpty(param.OrderField))
            {
                param.OrderField = "CreateTime";
            }
            string sql = string.Format("select {2} from {0} where 1=1 {1}", body, param.SqlWhere, param.SqlColumn);
            DataTable dt = dbHelper.ExecuteScalar(sql, out code, out msg);
            List<T> list = new List<T>();
            if (dt != null && dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    DataRow dr = dt.Rows[i];
                    T t = new T();
                    if (param.Table != null)
                    {
                        t.Owner_DB_TableName = param.Table;
                    }
                    foreach (PropertyInfo pro in t.GetType().GetProperties())
                    {
                        if (pro.CanWrite)
                        {
                            string fieldName = getFieldNameByProperty(pro);
                            if (dt.Columns.Contains(fieldName))//排除不包含列的异常
                            {
                                pro.SetValue(t, object2Value(pro, dr, fieldName), null);
                            }
                        }
                    }
                    list.Add(t);
                }
            }
            return list;
        }
        #endregion

        #region 执行SQL  增删改

        /// <summary>
        /// 执行多条SQL语句，实现数据库事务。   
        /// </summary>
        /// <param name="sqlStringList">SQL语句的哈希表（key为sql语句，value是该语句的SqlParameter[]）</param>
        /// <returns></returns>
        public static int ExecuteSqlTran(List<string> sqlStringList, out int code, out string msg)
        {
            return dbHelper.ExecuteSqlTran(sqlStringList, out code, out msg);
        }
        /// <summary>
        /// 新增到数据库
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="t"></param>
        /// <returns></returns>
        public static bool InsertDB<T>(T t, out int code, out string msg, string tableName = null)
            where T : BaseModel, new()
        {
            string insertSQL = GetInsert2DBSQL<T>(t, tableName);
            bool flag = dbHelper.ExecuteNonQuery(insertSQL, out code, out msg) == 1;
            return flag;
        }
        /// <summary>
        /// 更新到数据库
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="t"></param>
        /// <returns></returns>
        public static bool UpdateDB<T>(T t, out int code, out string msg, string tableName = null)
            where T : BaseModel, new()
        {
            string insertSQL = GetUpdate2DBSQL<T>(t, tableName);
            bool flag = dbHelper.ExecuteNonQuery(insertSQL, out code, out msg) == 1;
            return flag;
        }
        /// <summary>
        /// 删除数据
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="t"></param>
        /// <returns></returns>
        public static bool Delete2DB<T>(T t, out int code, out string msg, string tableName = null)
            where T : BaseModel, new()
        {
            string insertSQL = GetDeleteFromDBSQL<T>(t, tableName);
            bool flag = dbHelper.ExecuteNonQuery(insertSQL, out code, out msg) == 1;
            return flag;
        }
        #endregion

        #region 生成SQL语句
        /// <summary>
        /// 获取新增到数据库的SQL语句
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="t"></param>
        /// <returns></returns>
        public static string GetInsert2DBSQL<T>(T t, string tableName = null)
            where T : BaseModel, new()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("INSERT INTO ");
            tableName = tableName ?? t.Owner_DB_TableName;
            sb.Append(tableName);
            //声明列
            StringBuilder fields = new StringBuilder();
            //声明值
            StringBuilder values = new StringBuilder();
            t.CreateTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

            foreach (PropertyInfo pro in t.GetType().GetProperties())
            {
                object[] attrs = pro.GetCustomAttributes(typeof(DbFieldAttribute), false);
                DbFieldAttribute attr = attrs.Length > 0 ? (DbFieldAttribute)attrs[0] : null;
                if (attr == null || attr.Mode == DbFieldMode.ALL_SAVE || attr.Mode == DbFieldMode.ONLY_INSERT || attr.Mode == DbFieldMode.PRIMARY_KEY)
                {
                    fields.AppendFormat(",{0}", getFieldNameByProperty(pro));
                    values.AppendFormat(",'{0}'", Filter.FilterInSQL(returnValue(pro, t)));
                }
            }
            GetInsertSQLPart(ref fields, ref values);

            sb.AppendLine(string.Format("({0}) VALUES({1})", fields.ToString().TrimStart(','), values.ToString().TrimStart(',')));
            return sb.ToString();
        }

        /// <summary>
        /// 获取删除数据的SQL
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="t"></param>
        /// <returns></returns>
        public static string GetDeleteFromDBSQL<T>(T t, string tableName = null)
            where T : BaseModel, new()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Delete from ");
            tableName = tableName ?? t.Owner_DB_TableName;
            sb.Append(tableName);
            foreach (PropertyInfo pro in t.GetType().GetProperties())
            {
                object[] attrs = pro.GetCustomAttributes(typeof(DbFieldAttribute), false);
                DbFieldAttribute attr = attrs.Length > 0 ? (DbFieldAttribute)attrs[0] : null;
                if (attr.Mode == DbFieldMode.PRIMARY_KEY)
                {
                    sb.Append(string.Format(" where {0}='{1}'", getFieldNameByProperty(pro), Filter.FilterInSQL(returnValue(pro, t))));
                }
            }
            return sb.ToString();
        }

        /// <summary>
        /// 获取更新到数据库的SQL语句
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="t"></param>
        /// <returns></returns> 
        public static string GetUpdate2DBSQL<T>(T t, string tableName = null)
            where T : BaseModel, new()
        {
            StringBuilder sb = new StringBuilder();
            StringBuilder fields = new StringBuilder();
            sb.Append("UPDATE ");
            tableName = tableName ?? t.Owner_DB_TableName;
            sb.Append(tableName);
            string key = string.Empty;
            string value = string.Empty;
            foreach (PropertyInfo pro in t.GetType().GetProperties())
            {
                object[] attrs = pro.GetCustomAttributes(typeof(DbFieldAttribute), false);
                DbFieldAttribute attr = attrs.Length > 0 ? (DbFieldAttribute)attrs[0] : null;

                if (attr.Mode == DbFieldMode.PRIMARY_KEY)
                {
                    key = getFieldNameByProperty(pro);
                    value = Filter.FilterInSQL(returnValue(pro, t));

                    //sb.AppendFormat(" SET {0} = {1}", key, value);
                    sb.AppendFormat(" SET ", key, value);
                }
                if (attr.Mode == DbFieldMode.ALL_SAVE || attr.Mode == DbFieldMode.ONLY_UPDATE)
                {
                    string cvalue = Filter.FilterInSQL(returnValue(pro, t));
                    //if (value == null)
                    //{
                    //    sb.AppendFormat(",{0} = null", getFieldNameByProperty(pro));
                    //}
                    //else
                    //{
                    fields.AppendFormat("{0} = '{1}',", getFieldNameByProperty(pro).TrimStart(','), cvalue.TrimStart(','));
                    //}
                }
            }
            GetUpdateSQLPart(ref fields);
            sb.AppendLine(fields.ToString().TrimEnd(','));
            sb.AppendLine(string.Format(" WHERE {0}='{1}'", key, value));
            return sb.ToString();
        }
        #endregion

        #region 私有方法
        /// <summary>
        /// 获取扩展SQL的方法
        /// </summary>
        /// <param name="fields"></param>
        /// <param name="values"></param>
        private static void GetInsertSQLPart(ref StringBuilder fields, ref StringBuilder values)
        {

        }
        /// <summary>
        /// 获取扩展SQL的方法
        /// </summary>
        /// <param name="fields"></param>
        /// <param name="values"></param>
        private static void GetUpdateSQLPart(ref StringBuilder fields)
        {

        }
        /// <summary>
        /// 根据属性获取属性对应的字段名 用于查询反射或者insert update语句
        /// </summary>
        /// <param name="pi"></param>
        /// <returns></returns>
        private static string getFieldNameByProperty(PropertyInfo pi)
        {
            string fieldName = pi.Name;
            object[] attrs = pi.GetCustomAttributes(typeof(DbFieldAttribute), false);
            DbFieldAttribute attr = attrs.Length > 0 ? (DbFieldAttribute)attrs[0] : null;
            if (attr != null && attr.FieldName != null && attr.FieldName != "")
            {
                fieldName = attr.FieldName;//发现特性标记时则优先读取特性标记
            }
            return fieldName;
        }
        private static object returnValue(PropertyInfo pro, object obj)
        {
            object value = null;

            if (pro.PropertyType == typeof(int))
            {
                value = pro.GetValue(obj, null);
            }
            else if (pro.PropertyType == typeof(long))
            {
                value = pro.GetValue(obj, null);
            }
            else if (pro.PropertyType == typeof(decimal))
            {
                value = pro.GetValue(obj, null);
            }
            else if (pro.PropertyType == typeof(string))
            {
                value = pro.GetValue(obj, null);
            }
            else if (pro.PropertyType == typeof(DateTime))
            {
                value = pro.GetValue(obj, null);
                if (value.ToString() == "0001-01-01 0:00:00")
                {
                    return null;
                }
            }
            else if (pro.PropertyType == typeof(bool))
            {
                value = pro.GetValue(obj, null);
            }
            else if (pro.PropertyType.IsEnum)
            {
                value = pro.GetValue(obj, null);
                value = Enum.ToObject(pro.PropertyType, value);
                value = (int)value;
            }
            else if (pro.PropertyType == typeof(double))
            {
                value = pro.GetValue(obj, null);
            }
            return value;
        }
        /// <summary>
        /// 对象转换为值
        /// </summary>
        /// <param name="pro"></param>
        /// <param name="dr"></param>
        /// <returns></returns>
        private static object object2Value(PropertyInfo pro, DataRow dr, string fieldName = "")
        {
            object value = null;

            if (pro.PropertyType == typeof(int))
            {
                value = TryEval<int>(dr, fieldName);
            }
            else if (pro.PropertyType == typeof(long))
            {
                value = TryEval<long>(dr, fieldName);
            }
            else if (pro.PropertyType == typeof(decimal))
            {
                value = TryEval<decimal>(dr, fieldName);
            }
            else if (pro.PropertyType == typeof(string))
            {
                value = TryEval<string>(dr, fieldName);
            }
            else if (pro.PropertyType == typeof(DateTime))
            {
                value = TryEval<DateTime>(dr, fieldName);
            }
            else if (pro.PropertyType == typeof(bool))
            {
                value = TryEval<bool>(dr, fieldName);
            }
            else if (pro.PropertyType.IsEnum)
            {
                value = "";
                if (!IsEmpty(dr, fieldName))
                {
                    value = dr[fieldName];
                }
                value = Enum.ToObject(pro.PropertyType, value);

            }
            else if (pro.PropertyType == typeof(double))
            {
                value = TryEval<double>(dr, fieldName);
            }
            return value;
        }
        /// <summary>
        /// 判断否个字段是否为空
        /// </summary>
        /// <param name="dr"></param>
        /// <param name="field"></param>
        /// <returns></returns>
        private static bool IsNull(DataRow dr, string field)
        {
            return dr[field] == null;
        }
        /// <summary>
        /// 判断是否为空或者为空字符
        /// </summary>
        /// <param name="dr"></param>
        /// <param name="field"></param>
        /// <returns></returns>
        private static bool IsEmpty(DataRow dr, string field)
        {
            return IsNull(dr, field) || dr[field].ToString() == "";
        }
        private static T TryEval<T>(DataRow dr, string field)
            where T : IConvertible
        {
            try
            {
                //判断是否为空
                if (!IsEmpty(dr, field))
                {
                    //定义返回值
                    T result;
                    //转换类型并返回
                    return (T)Convert.ChangeType(dr[field], typeof(T));
                }
                return (T)Convert.ChangeType("", typeof(T));
            }
            catch (Exception ex)
            {
                //todo:记录字段读取异常的日志

                //此处应该继续处理 根据泛型传入形参分支返回不同类型的空值 目测当前代码会发生异常 例如空字符串转整型
                return default(T);

            }
        }
        #endregion
    }
}