using Ideal.Ideal.Model;
using Ideal.Ideal.WeChat.JSSDK;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ideal.Ideal.WeChat
{
    public class WeChatToken
    {
        private AuthModel authModel = new AuthModel();
        public WeChatToken(AuthModel model)
        {
            authModel = model;
        }
        public WeChatToken()
        {

        }
        public ReturnSummary GetAccessToken()
        {
            ReturnSummary returnSummary = new ReturnSummary();
            dynamic items = BasicAPI.GetAccessToken(authModel.AppID, authModel.AppSecret);

            string jsonStr = items.ToString();

            if (!string.IsNullOrEmpty(jsonStr) && jsonStr.Contains("errcode"))
            {
                returnSummary.StatusCode = (int)items.errcode;
                returnSummary.Message = "获取AccessToken失败！";
                returnSummary.ExceptionMessage = items.errmsg;
                return returnSummary;
            }
            returnSummary.StatusCode = 10;
            returnSummary.Message = "获取AccessToken成功！";
            returnSummary.Data = items;
            return returnSummary;
        }
        /// <summary>
        /// 获取jsapi_ticket
        /// jsapi_ticket是公众号用于调用微信JS接口的临时票据。
        /// 正常情况下，jsapi_ticket的有效期为7200秒，通过access_token来获取。
        /// 由于获取jsapi_ticket的api调用次数非常有限，频繁刷新jsapi_ticket会导致api调用受限，影响自身业务，开发者必须在自己的服务全局缓存jsapi_ticket 。
        /// </summary>
        /// <returns></returns>
        public ReturnSummary Jsapi_Ticket()
        {
            ReturnSummary returnSummary = new ReturnSummary();
            dynamic items = JSAPI.GetTickect(GetAccessToken().Data.ToString());

            string jsonStr = items.ToString();

            if (!string.IsNullOrEmpty(jsonStr) && jsonStr.Contains("errcode") && items.errcode != 0)
            {
                returnSummary.StatusCode = (int)items.errcode;
                returnSummary.Message = "获取jsapi_ticket失败！";
                returnSummary.ExceptionMessage = items.errmsg;
                return returnSummary;
            }
            returnSummary.StatusCode = 10;
            returnSummary.Message = "获取jsapi_ticket成功！";
            returnSummary.Data = items;
            return returnSummary;
        }

        /// <summary>
        /// 通过code换取网页授权access_token
        /// </summary>
        /// <param name="Code"></param>
        /// <returns></returns>
        public ReturnSummary GetWebAccessToken(string Code)
        {
            ReturnSummary returnSummary = new ReturnSummary();
            dynamic items = OAuth2API.GetAccessToken(Code, authModel.AppID, authModel.AppSecret);
            string jsonStr = items.ToString();
            if (!string.IsNullOrEmpty(jsonStr) && jsonStr.Contains("errcode"))
            {
                returnSummary.StatusCode = items.errcode;
                returnSummary.Message = "获取WebAccessToken失败！";
                returnSummary.ExceptionMessage = items.errmsg;
                return returnSummary;
            }
            returnSummary.StatusCode = 10;
            returnSummary.Message = "获取WebAccessToken成功！";
            returnSummary.Data = items;
            return returnSummary;
        }
        /// <summary>
        /// 刷新access_token（如果需要）
        /// </summary>
        /// <param name="AppID"></param>
        /// <param name="Refresh_token"></param>
        /// <returns></returns>
        public ReturnSummary RefreshAccess_token(string AppID, string Refresh_token)
        {
            ReturnSummary returnSummary = new ReturnSummary();
            dynamic items = OAuth2API.RefreshAccess_token(Refresh_token, AppID);
            string jsonStr = items.ToString();
            if (!string.IsNullOrEmpty(jsonStr) && jsonStr.Contains("errcode"))
            {
                returnSummary.StatusCode = items.errcode;
                returnSummary.Message = "刷新Access_token失败！";
                returnSummary.ExceptionMessage = items.errmsg;
                return returnSummary;
            }
            returnSummary.StatusCode = 10;
            returnSummary.Message = "刷新Access_token成功！";
            returnSummary.Data = items;
            return returnSummary;
        }
        /// <summary>
        /// 网页授权时拉取用户信息
        /// </summary>
        /// <param name="Access_token"></param>
        /// <param name="OpenID"></param>
        /// <returns></returns>
        public ReturnSummary GetUserInfo(string Access_token, string OpenID)
        {
            ReturnSummary returnSummary = new ReturnSummary();
            dynamic items = OAuth2API.GetUserInfo(Access_token, OpenID);
            string jsonStr = items.ToString();
            if (!string.IsNullOrEmpty(jsonStr) && jsonStr.Contains("errcode"))
            {
                returnSummary.StatusCode = items.errcode;
                returnSummary.Message = "获取用户信息失败！";
                returnSummary.ExceptionMessage = items.errmsg;
                return returnSummary;
            }
            returnSummary.StatusCode = 10;
            returnSummary.Message = "获取用户信息成功！";
            returnSummary.Data = items;
            return returnSummary;
        }
    }
}
