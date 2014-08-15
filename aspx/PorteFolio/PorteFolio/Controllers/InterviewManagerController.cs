using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PorteFolio.Controllers
{
    public class InterviewManagerController : Controller
    {
        [Route("~/InterviewManager")]
        [Route("~/InterviewManager/Home/{id}")]
        public ActionResult Home(string id)
        {
            return View();
        }

	}
}