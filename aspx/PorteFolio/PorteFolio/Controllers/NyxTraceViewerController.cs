﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
//using System.Web.Http;
using System.Web;
using System.Web.Mvc;


namespace PorteFolio.Controllers
{
    public class NyxTraceViewerController : Controller
    {
        [Route("~/NyxTraceViewer/Home/{id}")]
        public ActionResult Home(string id)
        {
            ViewBag.Test = "test";
            var view = View();


            return view;
        }
    }
}
