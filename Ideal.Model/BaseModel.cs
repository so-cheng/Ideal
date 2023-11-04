
using Ideal.Ideal.Common.Enums;

namespace Ideal.Ideal.Model
{
    /// <summary>
    /// 公共数据模型基类
    /// </summary>
    public class BaseModel
    {
        private string m_Owner_DB_Name = "";
        /// <summary>
        /// 当前模型影射的数据库名称
        /// </summary>
        [DbFieldAttribute(DbFieldMode.NEVER_SAVE)]
        public string Owner_DB_Name
        {
            get
            {
                return m_Owner_DB_Name;
            }
            set { m_Owner_DB_Name = value; }
        }

        private string m_Owner_DB_TableName = string.Empty;
        /// <summary>
        /// 当前模型影射的数据库表名
        /// </summary>
        [DbFieldAttribute(DbFieldMode.NEVER_SAVE)]
        public string Owner_DB_TableName
        {
            get
            {
                return m_Owner_DB_TableName;
            }
            set { m_Owner_DB_TableName = value; }
        }

        private int m_ID = 0;
        /// <summary>
        /// 自增ID
        /// </summary>
        [DbFieldAttribute(DbFieldMode.NEVER_SAVE)]
        public int ID
        {
            get { return m_ID; }
            set { m_ID = value; }
        }

        private string m_UID = string.Empty;

        private string m_CreateTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
        /// <summary>
        /// 数据创建时间
        /// </summary>
        [DbFieldAttribute(DbFieldMode.ONLY_INSERT)]
        public string CreateTime
        {
            get { return m_CreateTime; }
            set { m_CreateTime = value; }
        }


        private string m_Creator = "";
        /// <summary>
        /// 数据创建人
        /// </summary>
        [DbFieldAttribute(DbFieldMode.ONLY_INSERT)]
        public string Creator
        {
            get { return m_Creator; }
            set { m_Creator = value; }
        }

        private string m_CreatorName = "";
        /// <summary>
        /// 数据创建人
        /// </summary>
        [DbFieldAttribute(DbFieldMode.NEVER_SAVE)]
        public string CreatorName
        {
            get { return m_CreatorName; }
            set { m_CreatorName = value; }
        }

        [DbFieldAttribute(DbFieldMode.NEVER_SAVE)]
        public int _parentId { get; set; }
        /// <summary>
        /// Model操作模式
        /// </summary>
        [DbFieldAttribute(DbFieldMode.NEVER_SAVE)]
        public ExecuteType ExecuteType { get; set; }

    }
}