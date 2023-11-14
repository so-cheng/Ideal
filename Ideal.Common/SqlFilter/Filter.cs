using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ideal.Ideal.Common.SqlFilter
{
    /// <summary>
    /// SQL过滤器
    /// </summary>
    public class Filter
    {
        /// <summary>
        /// 过滤输入SQL
        /// </summary>
        /// <param name="sqlValue"></param>
        /// <returns></returns>
        public static string FilterInSQL(object sqlValue)
        {
            if (sqlValue == null)
            {
                return "";
            }
            string str = sqlValue.ToString();
            str = str.Replace("\'", "\'\'");
            if (string.IsNullOrEmpty(str)) {
                return null;
            }
            return str;
        }

        public static string FilterInPath(object sqlValue)
        {
            if (sqlValue == null)
            {
                return "";
            }
            string str = sqlValue.ToString();
            str = str.Replace("\\", "");
            str = str.Replace("/", "");
            return str;
        }
    }
}
