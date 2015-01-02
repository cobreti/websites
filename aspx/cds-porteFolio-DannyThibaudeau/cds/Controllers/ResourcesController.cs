using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;

namespace cds.Controllers
{
    public class ResourcesController : Controller
    {
        [Route("~/Resources/{*file}")]
        //
        // GET: /Resources/
        public ActionResult Index(string file)
        {
            var pathParts = file.Split('/');
            string filePath = BasePath;

            for (int index = 0; index < pathParts.Length - 1; ++index)
            {
                filePath += "/" + pathParts[index];
            }

            filePath += "/file/" + pathParts.Last();

            var fi = new FileInfo(filePath);

            if (fi.Exists)
            {
                return File(filePath, "application/octet-stream");
            }

            var err = new JsonResult();
            err.Data = "error: resource not found";
            err.JsonRequestBehavior = JsonRequestBehavior.AllowGet;
            return err;
        }

        private string BasePath
        {
            get
            {
                return System.Configuration.ConfigurationManager.AppSettings["fileBasePath"];
            }
        }

	}
}
