using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace cds_essai.Controllers
{
    public class FilesController : ApiController
    {
        public FilesController()
        {
            _mapping.Add("public headers", "\\Nyx\\include");
            _mapping.Add("NyxBase", "\\NyxBase");
            _mapping.Add("NyxNet", "\\NyxNet");
            _mapping.Add("NyxWebSvr", "\\NyxWebSvr");
            _mapping.Add("Core", "\\NyxTraceViewer\\Core");
            _mapping.Add("TraceClient", "\\NyxTraceViewer\\TraceClient");
        }

        public IDictionary<string, object> Get(string module)
        {
            IDictionary<string, object> ret = null;

            if (!_mapping.ContainsKey(module))
                return null;

            var path = _mapping[module];

            ret = GetFiles(module, null, path);

            return ret;
        }

        public IDictionary<string, object> Get(string module, string path)
        {
            IDictionary<string, object> ret = null;

            if (!_mapping.ContainsKey(module))
                return null;

            ret = GetFiles(module, path, _mapping[module] + '/' + path);

            return ret;
        }

        protected IDictionary<string, object> GetFiles(string module, string relPath, string path)
        {
            var ret = new Dictionary<string, object>();
            string fullPath = BasePath + "\\" + path;

            fullPath = fullPath.Replace('/', '\\');

            var folders = System.IO.Directory.EnumerateFiles(fullPath);
            var middlePath = "/";

            if (relPath != null)
            {
                middlePath = "/" + relPath + "/";
            }

            foreach (var f in folders)
            {
                System.IO.FileInfo fi = new System.IO.FileInfo(f);
                ret.Add(module + middlePath + fi.Name, null);
            }

            return ret;
        }

        private string BasePath
        {
            get
            {
                return System.Configuration.ConfigurationManager.AppSettings["fileBasePath"];
            }
        }

        private Dictionary<string, string> _mapping = new Dictionary<string, string>();
    }
}
