using Ideal.Ideal.Common.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ideal.Ideal.Model
{
    /// <summary>
    /// 自定义字段操作方式
    /// </summary>
    public class DbFieldAttribute : Attribute
    {
        private DbFieldMode m_mode = DbFieldMode.ALL_SAVE;
        /// <summary>
        /// 操作模式
        /// </summary>
        public DbFieldMode Mode
        {
            get { return m_mode; }
            set { m_mode = value; }
        }

        private string m_FieldName = string.Empty;
        /// <summary>
        /// 字段名称
        /// </summary>
        public string FieldName
        {
            get { return m_FieldName; }
            set { m_FieldName = value; }
        }

        /// <summary>
        /// 操作模式特性标记
        /// </summary>
        /// <param name="level"></param>
        public DbFieldAttribute(DbFieldMode mode = DbFieldMode.ALL_SAVE)
        {
            m_mode = mode;
        }

        /// <summary>
        /// 操作模式特性标记
        /// </summary>
        /// <param name="level"></param>
        public DbFieldAttribute(string fieldName, DbFieldMode mode = DbFieldMode.ALL_SAVE)
        {
            m_mode = mode;
            if (fieldName != null) m_FieldName = fieldName;
        }

    }
}
