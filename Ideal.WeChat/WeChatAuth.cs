using Ideal.Ideal.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ideal.Ideal.WeChat
{
    public class WeChatAuth
    {
        private AuthModel _model;
        public WeChatAuth(AuthModel model)
        {
            _model = model;
        }
        public ReturnSummary Auth()
        {
            ReturnSummary returnSummary = new ReturnSummary();
            var token = _model.Token;//微信公众平台后台设置的Token
            if (string.IsNullOrEmpty(token))
            {
                returnSummary.StatusCode = 21;
                returnSummary.Message = "请先设置Token！";
                return returnSummary;
            }
            var ent = "";
            if (!BasicAPI.CheckSignature(_model.Signature, _model.Timestamp, _model.Nonce, token, out ent))
            {
                returnSummary.StatusCode = 31;
                returnSummary.Message = "参数错误！";
                return returnSummary;
            }
            returnSummary.StatusCode = 10;
            returnSummary.Message = "接入成功！";
            returnSummary.Data = _model.Echostr;//返回随机字符串则表示验证通过
            return returnSummary;
        }


    }
}
