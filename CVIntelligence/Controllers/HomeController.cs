using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CVIntelligence.Models;

namespace CVIntelligence.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult GenerateCv(string url)
        {
            return Json(new PredefinedCvModel(), JsonRequestBehavior.AllowGet);
        }

    }
}