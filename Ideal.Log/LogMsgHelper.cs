using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Threading;

namespace Ideal.Ideal.Log
{
    /// <summary>
    /// 日志消息帮助类  
    /// </summary>
    public static class LogMsgHelper
    {
        private static ReaderWriterLockSlim LogWriteLock = new ReaderWriterLockSlim();//文件读写锁
        public readonly static string basePath = System.IO.Directory.GetCurrentDirectory() + "/wwwroot/Log/";
        /// <summary>
        /// 写入公共日志 只传内容
        /// </summary>
        /// <param name="Msg">内容</param>
        public static void Info(string msg)
        {
            string datestr = DateTime.Now.ToString("yyyy-MM-dd") + ".text";

            var builder = new StringBuilder();
            builder
                .AppendLine("--------------------------------------------")
                .AppendLine(DateTime.Now.ToString() + "：" + msg)
                .AppendLine("--------------------------------------------");

            string path = Path.Combine(basePath, $"Info/{DateTime.Now:yyyy/MM/dd}", datestr);
            AppendText(path, builder.ToString());
        }
        /// <summary>
        /// 错误日志
        /// </summary>
        /// <param name="msg"></param>
        public static void Error(string msg)
        {
            string datestr = DateTime.Now.ToString("yyyy-MM-dd") + ".text";
            var builder = new StringBuilder();
            builder
                .AppendLine("--------------------------------------------")
                .AppendLine(DateTime.Now.ToString() + "：" + msg)
                .AppendLine("--------------------------------------------");
            string path = Path.Combine(basePath, $"ErroLog/{DateTime.Now:yyyy/MM}", datestr);
            AppendText(path, builder.ToString());
        }
        /// <summary>
        /// 报错日志
        /// </summary>
        /// <param name="msg"></param>
        public static void Debug(string msg)
        {
            string datestr = DateTime.Now.ToString("yyyy-MM-dd") + ".text";
            var builder = new StringBuilder();
            builder
                .AppendLine("--------------------------------------------")
                .AppendLine(DateTime.Now.ToString() + "：" + msg)
                .AppendLine("--------------------------------------------");
            string path = Path.Combine(basePath, $"DeBug/{DateTime.Now:yyyy/MM}", datestr);
            AppendText(path, builder.ToString());
        }
        /// <summary>
        /// 写入公共日志 传文件名和内容
        /// </summary>
        /// <param name="fileName">文件名</param>
        /// <param name="Msg">内容</param>
        public static void WriteLog(string fileName, string msg)
        {
            string datestr = fileName + ".text";
            var builder = new StringBuilder();
            builder
                .AppendLine("--------------------------------------------")
                .AppendLine(DateTime.Now.ToString() + "：" + msg)
                .AppendLine("--------------------------------------------");
            string path = Path.Combine(basePath, $"Common/{DateTime.Now:yyyy/MM}", datestr);
            AppendText(path, builder.ToString());
        }
        /// <summary>
        /// 写入制定文件日志 传文件夹名称和内容
        /// </summary>  
        /// <param name="documentName">文件夹名称</param>
        /// <param name="Msg">内容</param>
        public static void WritePathLog(string documentName, string msg)
        {
            string datestr = DateTime.Now.ToString("yyyy-MM-dd") + ".text";
            var builder = new StringBuilder();
            builder
                .AppendLine("--------------------------------------------")
                .AppendLine(DateTime.Now.ToString() + "：" + msg)
                .AppendLine("--------------------------------------------");
            string path = Path.Combine(basePath, $"{documentName}/{DateTime.Now:yyyy/MM}", datestr);
            AppendText(path, builder.ToString());
        }

        /// <summary>
        /// 写入制定文件日志  传文件夹名、文件名、内容
        /// </summary>
        /// <param name="documentName">文件夹名称</param>
        /// <param name="fileName">文件名称</param>
        /// <param name="msg">内容</param>
        public static void WritePathLog(string documentName, string fileName, string msg)
        {
            string datestr = fileName + ".text";
            var builder = new StringBuilder();
            builder
                .AppendLine("--------------------------------------------")
                .AppendLine(DateTime.Now.ToString() + "：" + msg)
                .AppendLine("--------------------------------------------");
            string path = Path.Combine(basePath, $"{documentName}/{DateTime.Now:yyyy/MM}", datestr);
            AppendText(path, builder.ToString());
        }
        /// <summary>
        /// log日志，txt的
        /// </summary>
        /// <param _name="msg">内容</param> 
        private static void Log(string _path, string msg)
        {
            #region 创建日志
            try
            {
                string Msg = msg + "\r\n";
                //生成目录 
                //创建文件夹
                string directoryName = Path.GetDirectoryName(_path);
                if (directoryName.Length > 0 && (!Directory.Exists(directoryName)))//如果不存在就创建file文件夹
                {
                    Directory.CreateDirectory(directoryName);
                }
                // 判断文件是否存在，不存在则创建，否则读取值显示到txt文档
                if (!System.IO.File.Exists(_path))
                {
                    using (FileStream fs1 = new FileStream(_path, FileMode.Create, FileAccess.Write))
                    using (StreamWriter sw = new StreamWriter(fs1))
                    {
                        //sw.WriteLine(Msg);//开始写入值
                        sw.WriteLineAsync(Msg);
                    }
                }
                else
                {
                    using (FileStream fs = new FileStream(_path, FileMode.Append, FileAccess.Write))
                    using (StreamWriter sr = new StreamWriter(fs))
                    {
                        sr.WriteLineAsync(Msg);//开始写入值 
                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("日志报错!" + e.Message.ToString());
            }
            #endregion
        }

        /// <summary>
        /// 为文本文件追加行
        /// </summary>
        /// <param name="filePath">文件相对路径</param>
        /// <param name="str">一条文本</param>
        public static void AppendText(string filePath, string str)
        {

            AppendText(filePath, new List<string>() { str });

        }
        /// <summary>
        /// 设置锁解决多线程IO访问
        /// </summary>
        private static readonly object ObjLock = new object();
        /// <summary>
        /// 批量为文本文件追加行
        /// </summary>
        /// <param name="filePath">文件相对路径</param>
        /// <param name="str">多条文本</param>
        public static void AppendText(string filePath, List<string> str)
        {
            lock (ObjLock)
            {
                try
                {

                    //生成目录 
                    //创建文件夹
                    string directoryName = Path.GetDirectoryName(filePath);
                    if (directoryName.Length > 0 && (!Directory.Exists(directoryName)))//如果不存在就创建file文件夹
                    {
                        Directory.CreateDirectory(directoryName);
                    }
                    // 判断文件是否存在，不存在则创建，否则读取值显示到txt文档
                    if (!System.IO.File.Exists(filePath))
                    {
                        File.Open(filePath, FileMode.OpenOrCreate);
                        //LogWriteLock.EnterWriteLock();
                        File.AppendAllLinesAsync(filePath, str);

                    }
                    else
                    {
                        //LogWriteLock.EnterWriteLock();
                        File.AppendAllLinesAsync(filePath, str);
                    }
                }
                catch (Exception e)
                {
                    Console.WriteLine(e.Message);
                }
                //finally
                //{
                //    LogWriteLock.ExitWriteLock();

                //}
            }

        }

    }
}
