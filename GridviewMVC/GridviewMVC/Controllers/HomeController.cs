using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Linq.Dynamic;

namespace GridviewMVC.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        public ActionResult Index(string search = "")
        {
           // PaliEntities pe = new PaliEntities();
           // var item = pe.tests.ToList();
           // return View(item);



            int totalRecord = 0;
            var data = GetName(search);
            ViewBag.TotalRows = totalRecord;
            ViewBag.search = search;
            return View(data);
        }

        public List<test> GetName(string search)
        {
            using (PaliEntities dc = new PaliEntities())
            {
                var v = (from a in dc.tests
                         where
                                 a.Name.Contains(search)
                                                             
                         select a
                                );
            
                return v.ToList();
            }
        }

    }
}
