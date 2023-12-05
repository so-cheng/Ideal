using Ideal.Ideal.Common.Enums;
using Ideal.Ideal.Model;
using Ideal.Ideal.WeChat.Cryptography;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ideal.Ideal.WeChat
{
    public class OAuth
    {
        AuthModel authModel = new AuthModel();
        public OAuth(AuthModel model)
        {
            authModel = model;
        }
        public OAuth()
        {
        }
        /// <summary>
        /// 微信后台验证地址（使用Get），微信后台的“接口配置信息”的Url
        /// </summary>
        /// <param name="signature"></param>
        /// <param name="timestamp"></param>
        /// <param name="nonce"></param>
        /// <param name="echostr"></param>
        /// <returns></returns>
        public ReturnSummary Auth()
        {

            ReturnSummary returnSummary = new ReturnSummary();
            var token = authModel.Token;//微信公众平台后台设置的Token
            if (string.IsNullOrEmpty(token))
            {
                returnSummary.StatusCode = 21;
                returnSummary.Message = "请先设置Token！";
                return returnSummary;
            }
            var ent = "";
            if (!BasicAPI.CheckSignature(authModel.Signature, authModel.Timestamp, authModel.Nonce, token, out ent))
            {
                returnSummary.StatusCode = 31;
                returnSummary.Message = "参数错误！";
                return returnSummary;
            }
            returnSummary.StatusCode = 10;
            returnSummary.Message = "接入成功！";
            returnSummary.Data = authModel.Echostr;//返回随机字符串则表示验证通过
            return returnSummary;
        }
        /// <summary>
        /// Post方法获取公众号响应
        /// </summary>
        /// <returns>WeixinMessage Text, //文本  Location, //地理位置  Image, //图片  Voice, //语音  Video, //视频 Link, //连接信息 Event, //事件推送</returns>
        public ReturnSummary GetWeixinMessage()
        {
            ReturnSummary returnSummary = new ReturnSummary();
            WeixinMessage weixinMessage = new WeixinMessage();
            if (authModel.Signature == null) throw new ArgumentNullException(nameof(authModel.Signature));
            var decryptMsg = string.Empty;
            #region 解密
            if (authModel.Encrypt_type)
            {
                var msg_signature = authModel.Msg_signature;
                var wxBizMsgCrypt = new WXBizMsgCrypt(authModel.Token, authModel.EncodingAESKey, authModel.AppID);
                var ret = wxBizMsgCrypt.DecryptMsg(msg_signature, authModel.Timestamp, authModel.Nonce, authModel.BodyMsg, ref decryptMsg);
                if (ret != 0)//解密失败
                {
                    returnSummary.StatusCode = 41;
                    returnSummary.Message = "解密失败！";
                    returnSummary.ExceptionMessage = string.Format("解密消息返回： {0}, 请求数据：", ret, authModel.BodyMsg);
                    returnSummary.Data = weixinMessage;
                    return returnSummary;
                }
            }
            else
            {
                decryptMsg = authModel.BodyMsg;
            }
            #endregion
            weixinMessage = AcceptMessageAPI.Parse(decryptMsg);
            returnSummary.StatusCode = 10;
            returnSummary.Message = "获取响应类型成功！";
            returnSummary.Data = weixinMessage;
            return returnSummary;

        }

        /// <summary>
        /// 获取网站跳转URL(//这里需要完整Redirect_Uri地址，对应Controller里面的OAuthController的Callback)
        /// </summary>
        /// <returns></returns>
        public ReturnSummary GetWeixinOAuth2Url()
        {
            ReturnSummary returnSummary = new ReturnSummary();
            var appId = authModel.AppID;
            var appSecret = authModel.AppSecret;
            var domain = authModel.Domain;
            var redirect_uri = string.Format(authModel.Redirect_Uri);//这里需要完整url地址，对应Controller里面的OAuthController的Callback
            var scope = "snsapi_userinfo";
            var state = Math.Abs(DateTime.Now.ToBinary()).ToString();//state保证唯一即可,可以用其他方式生成

            var weixinOAuth2Url = string.Format(
                     "https://open.weixin.qq.com/connect/oauth2/authorize?appid={0}&redirect_uri={1}&response_type=code&scope={2}&state={3}#wechat_redirect",
                      appId, redirect_uri, scope, state);
            returnSummary.StatusCode = 10;
            returnSummary.Message = "获取OAuth2Url成功！";
            returnSummary.Data = weixinOAuth2Url;
            return returnSummary;
        }
    }
}
