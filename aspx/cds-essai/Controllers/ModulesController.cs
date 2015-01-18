using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace cds_essai.Controllers
{
    public class ModulesController : ApiController
    {
        public IDictionary<string, object> Get()
        {
            var ret = new Dictionary<string, object>();

            ret.Add("public headers", null);
            ret.Add("NyxBase", null);
            ret.Add("NyxNet", null);
            ret.Add("NyxWebSvr", null);
            ret.Add("Core", null);
            ret.Add("TraceClient", null);

            return ret;
        }
    }
}
