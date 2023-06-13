using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ideal.Ideal.Model
{
    public class AuthModel
    {
        public string Signature { get; set; }

        public string Timestamp { get; set; }

        public string Nonce { get; set; }

        public string Echostr { get; set; }

        public string Token { get; set; }

        public string EncodingAESKey { get; set; }

        public string AppID { get; set; }
        public string AppSecret { get; set; }

        public string Domain { get; set; }

        public string Access_token { get; set; }

        public string Redirect_Uri { get; set; }

        public bool Encrypt_type { get; set; }

        public string Msg_signature { get; set; }

        public string BodyMsg { get; set; }
    }
}
