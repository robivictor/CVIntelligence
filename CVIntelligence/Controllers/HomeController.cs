using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CVIntelligence.Indexer;
using CVIntelligence.Models;
using HtmlAgilityPack;
using Newtonsoft.Json.Schema;

namespace CVIntelligence.Controllers
{
    public class ViewDataUploadFilesResult
    {
        public string Name { get; set; }
        public int Length { get; set; }
        public string Content { get; set; }
        public string Type { get; set; }
    }

    
    public class HomeController : Controller
    {
        private readonly IIndexingService _indexingService;

        public HomeController(IIndexingService indexingService)
        {
            this._indexingService = indexingService;
        }

        public ActionResult Index()
        {
            return View();
        }

        public JsonResult GenerateCv(string url)
        {
            var emails = new List<string>();
            emails.Add("blessededethio@gmail.com");

            var phones = new List<string>();
            phones.Add("251935226393");
            phones.Add("251929001353");

            var s = new PredefinedCvModel()
            {
                FirstName = "Robel",
                LastName = "Tessema",
                MiddleName = "Herarso",
                Gender = "Male",
                Email = emails,
                //Email.Add("blessedethio@gmail.com"),
                Headline = "Enthusiasit computer engineer",
                Education = null,
                Experience = null,
                Languages = null,
                Phone = phones,
                Projects = null,
                SocialProfiles = null,
                Summary = "The best engineer ever existed"
            };
             
            return Json(s, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult UploadFile()
        {
            var r = new List<ViewDataUploadFilesResult>();

            foreach (string file in Request.Files)
            {
                var hpf = Request.Files[file];
                if (hpf != null && hpf.ContentLength == 0)
                    continue;

                var savedFileName = Path.Combine(
                   AppDomain.CurrentDomain.BaseDirectory,
                   Path.GetFileName(hpf.FileName));

                hpf.SaveAs(savedFileName);

                r.Add(new ViewDataUploadFilesResult()
                {
                    Name = savedFileName,
                    Length = hpf.ContentLength,
                    Type = hpf.ContentType,
                    Content = new StreamReader(hpf.InputStream).ReadToEnd()
                });
            }

            var html = r.First().Content;            
            var p = new PredefinedCvModel();

            p.FirstName = _indexingService.Search(html, Constants.FIRSTNAME);
            p.MiddleName = _indexingService.Search(html, Constants.MIDDLENAME);
            p.LastName = _indexingService.Search(html, Constants.LASTNAME);

            return Json(p, JsonRequestBehavior.AllowGet);
        }

        public ActionResult html()
        {
            return View();
        }
    }
}