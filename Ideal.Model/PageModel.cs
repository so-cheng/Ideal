using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ideal.Ideal.Model
{
    public class PageModel<T> : ReturnSummary
    {
        public PageModel()
        {
            DefindedTime = DateTime.Now;
        }

        public PageModel(List<T> lst)
        {
            m_PageList = lst;
        }
        /// <summary>
        /// 实例化时的系统时间
        /// </summary>
        private DateTime DefindedTime = DateTime.Now;

        /// <summary>
        /// 响应时间
        /// </summary>
        public string ResponseTime
        {
            get
            {
                return DateTime.Now.Subtract(DefindedTime).TotalMilliseconds.ToString("F2");
            }
        }
        private List<T> m_PageList = new List<T>();
        ///<summary>
        ///对象列表
        ///</summary>
        public List<T> PageList
        {
            get { return m_PageList; }
            set { m_PageList = value; }
        }
        public string Message { get; set; }
        private int m_PageSize = 10;
        ///<summary>
        ///页码规格
        ///</summary>
        public int PageSize
        {
            get
            {
                return m_PageSize;
            }
            set { m_PageSize = value; }
        }

        private int m_PageIndex = 1;
        ///<summary>
        ///页码规格
        ///</summary>
        public int PageIndex
        {
            get
            {
                return m_PageIndex;
            }
            set { m_PageIndex = value; }
        }
        private int m_CurrentPage = 1;

        ///<summary>
        ///当前页
        ///</summary>
        public int CurrentPage
        {
            get
            {
                if (m_CurrentPage > Total) { m_CurrentPage = Total; }
                return m_CurrentPage;
            }
            set { m_CurrentPage = value; }
        }
        private int m_Total = 0;
        ///<summary>
        ///总记录数
        ///</summary>
        public int Total
        {
            get { return m_Total; }
            set { m_Total = value; }
        }
    }
}
