using Hoai_Vitaminhouse.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Hoai_Vitaminhouse.Controllers
{
    public class NewspapersController : Controller
    {
        private Vitaminhouse db = new Vitaminhouse();
        // GET: Newspapers
        public ActionResult Index(int? page)
        {
            //Lấy ra danh sách có số lượng giảm dần
            List<Newspaper> listNewspaper = db.Newspapers.OrderByDescending(p => p.NewspaperDate).ToList();
            
            if(listNewspaper.Count > 0)
            {
                ViewBag.NewspaperLast = listNewspaper[0];
            }
            else
            {
                ViewBag.NewspaperLast = null;
            }
            listNewspaper.RemoveAt(0);

            int pageSizeFix = 4; //Kích thước trang
            int pageNumber = (page ?? 1);

            return View(listNewspaper.ToPagedList(pageNumber, pageSizeFix));
        }

        // GET: Newspapers/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(System.Net.HttpStatusCode.BadRequest);
            }
            Newspaper newspapser = db.Newspapers.Find(id);
            if (newspapser == null)
            {
                return Redirect("/NotFound/Index");
            }
            return View(newspapser);
        }
    }
}