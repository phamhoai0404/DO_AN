using Hoai_Vitaminhouse.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Hoai_Vitaminhouse.Controllers
{
    public class CategoriesController : Controller
    {
        private Vitaminhouse db = new Vitaminhouse();

        // GET: DanhMucs/Details/5
        public ActionResult Details(int? id, int? page)
        {
            if (id == null)
            {
                return Redirect("/NotFound/Index");
            }
            Category danhMuc = db.Categories.Find(id);
            if (danhMuc == null)
            {
                return Redirect("/NotFound/Index");
            }

            //Lấy ra danh sách có số lượng giảm dần
            var listProduct = db.Products.Where(p => p.Category.CategoryId == id).OrderByDescending(p => p.ProductId);
            ViewBag.Category = danhMuc;

            int pageSizeFix = 8; //Kích thước trang
            int pageNumber = (page ?? 1);

            return View(listProduct.ToPagedList(pageNumber, pageSizeFix));

        }
    }
}