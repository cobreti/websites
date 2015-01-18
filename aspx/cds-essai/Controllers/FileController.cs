using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Text;

namespace cds_essai.Controllers
{
    public class FileController : ApiController
    {
        public FileController()
        {
            _mapping.Add("public headers", "\\Nyx\\include");
            _mapping.Add("NyxBase", "\\NyxBase");
            _mapping.Add("NyxNet", "\\NyxNet");
            _mapping.Add("NyxWebSvr", "\\NyxWebSvr");
            _mapping.Add("Core", "\\NyxTraceViewer\\Core");
            _mapping.Add("TraceClient", "\\NyxTraceViewer\\TraceClient");
        }

        public HttpResponseMessage Get(string module, string path)
        {
            string ret = "";

            if (!_mapping.ContainsKey(module))
                return null;

            ret = GetFile(module, path, _mapping[module] + '/' + path);
            var resp = new HttpResponseMessage(HttpStatusCode.OK);
            resp.Content = new StringContent(ret, Encoding.UTF8, "text/plain");

            return resp;
        }

        protected string GetFile(string module, string relPath, string path)
        {
            string content = "";
            string fullPath = BasePath + "\\" + path;

            int offset = fullPath.LastIndexOf('/');
            fullPath = fullPath.Remove(offset, 1).Insert(offset, ".");
            fullPath = fullPath.Replace('/', '\\');

            try
            {
                content = System.IO.File.ReadAllText(fullPath);
            }
            catch (Exception ex)
            {

            }

            return content;
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
