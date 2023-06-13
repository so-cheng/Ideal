using Ideal.Ideal.Common.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ideal.Ideal.Model
{
    public class PageQueryParam
    {
        /// <summary>
        /// 查询条件
        /// </summary>
        public string SqlWhere { get; set; }


        /// <summary>
        /// 查询主体
        /// </summary>
        public string SqlBody { get; set; }


        /// <summary>
        /// 查询列
        /// </summary>
        public string SqlColumn { get; set; }

        private int m_PageSize = 20;
        /// <summary>
        /// 页规格
        /// </summary>
        public int PageSize
        {
            get
            {
                return m_PageSize;

            }
            set { m_PageSize = value; }
        }

        private int m_PageIndex = 1;
        /// <summary>
        /// 页索引
        /// </summary>
        public int PageIndex
        {

            get
            {
                return m_PageIndex;
            }
            set { m_PageIndex = value; }
        }

        /// <summary>
        /// 排序字段
        /// </summary>
        public string OrderField { get; set; }

        /// <summary>
        /// 排序方式
        /// </summary>
        public OrderMethod OrderMethod { get; set; }

        public bool WithNoLock { get; set; }

        public string Table { get; set; }
    }
}
