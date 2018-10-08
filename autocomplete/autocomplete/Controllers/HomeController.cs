using autocomplete.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;

namespace autocomplete.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
        public JsonResult GetSearchValue(string search)
        {
            intern_1Entities db = new intern_1Entities();
            List<NepaliModel> allsearch = db.nepalis.Where(x => x.न_म.Contains(search)).Select(x => new NepaliModel
            {

                न_म = x.न_म,
                ठ_ग_न_ = x.ठ_ग_न_
            }).ToList();
            return new JsonResult { Data = allsearch, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
            
        }
       
    }
}