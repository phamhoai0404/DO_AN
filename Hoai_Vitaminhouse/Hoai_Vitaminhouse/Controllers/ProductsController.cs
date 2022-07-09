using Hoai_Vitaminhouse.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Hoai_Vitaminhouse.Controllers
{
    public class ProductsController : Controller
    {
        private Vitaminhouse db = new Vitaminhouse();

        // GET: Products/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(System.Net.HttpStatusCode.BadRequest);
            }
            Product sp = db.Products.Find(id);
            if (sp == null)
            {
                return Redirect("/NotFound/Index");
            }
            return View(sp);
        }


        public ActionResult FindProducts(string keyword, int? page)
        {
            if (keyword == null)
            {
                keyword = "";
            }
            ViewBag.TukhoaTimkiem = keyword;
            var hangs = db.Products.Where(p => p.ProductName.Contains(keyword)).OrderByDescending(p => p.ProductId);


            int pageSizeFix = 8; //Kích thước trang
            int pageNumber = (page ?? 1);

            return View(hangs.ToPagedList(pageNumber, pageSizeFix));


        }
    }
}