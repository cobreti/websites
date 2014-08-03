﻿using System;
using System.Collections.Generic;
using System.Linq;
//using System.Web;
using System.Web.Mvc;

namespace PorteFolio.Controllers
{
    public class HomeController : Controller
    {
        //[Route("~/Home/Home")]
        public ActionResult Home()
        {
            return View();
        }

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}