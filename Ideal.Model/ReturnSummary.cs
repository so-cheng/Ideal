using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ideal.Ideal.Model
{
    public class ReturnSummary
    {
        private int m_StatusCode = 0;

        ///<summary>
        ///状态码
        ///</summary>
        public int StatusCode
        {
            get { return m_StatusCode; }
            set
            {
                m_StatusCode = value;
            }
        }

        ///<summary>
        ///是否成功
        ///</summary>
        public bool IsSuccess
        {
            get { return m_StatusCode >= 1; }
            set { }
        }

        private string m_ExceptionMessage = "";

        ///<summary>
        ///异常信息
        ///</summary>
        public string ExceptionMessage
        {
            get { return m_ExceptionMessage; }
            set
            {
                m_ExceptionMessage = value;
            }
        }

        private string m_Message = "";

        ///<summary>
        ///返回信息
        ///</summary>
        public string Message
        {
            get
            {
                return m_Message;
            }
            set { m_Message = value; }
        }

        private string m_Level = "info";
        /// <summary>
        /// 提示信息级别 
        /// </summary>
        public string Level
        {
            get
            { return m_Level; }
            set
            { m_Level = value; }
        }

        public object Data { get; set; }


        public int Total { get; set; }
    }
}
