using StackExchange.Redis;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ideal.Ideal.Redis
{
    public class RedisHelper
    {
        private static ConnectionMultiplexer redis { get; set; }
        private static IDatabase db { get; set; }
        public static string connection { get; set; }

        /// <summary>
        /// 增加/修改
        /// </summary>
        /// <param name="key"></param>
        /// <param name="value"></param>
        /// <returns></returns>
        public static bool SetValue(int dataBase, string key, string value)
        {
            redis = ConnectionMultiplexer.Connect(connection);
            db = redis.GetDatabase(dataBase);
            return db.StringSet(key, value);
        }

        /// <summary>
        /// 查询
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        public static string GetValue(int dataBase, string key)
        {
            redis = ConnectionMultiplexer.Connect(connection);
            db = redis.GetDatabase(dataBase);
            return db.StringGet(key);
        }

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        public static bool DeleteKey(int dataBase, string key)
        {
            redis = ConnectionMultiplexer.Connect(connection);
            db = redis.GetDatabase(dataBase);
            return db.KeyDelete(key);
        }
        /// <summary>
        /// 修改
        /// </summary>
        /// <param name="dataBase"></param>
        /// <param name="key"></param>
        /// <param name="value"></param>
        /// <returns></returns>
        public static bool UpdateValue(int dataBase,string key ,string value)
        {
            redis = ConnectionMultiplexer.Connect(connection);
            db = redis.GetDatabase(dataBase);
            db.KeyDelete(key);
            return db.StringSet(key, value);
        }
    }
}
