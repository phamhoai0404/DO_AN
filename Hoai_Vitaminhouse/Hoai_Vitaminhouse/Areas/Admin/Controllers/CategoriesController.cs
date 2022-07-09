using Hoai_Vitaminhouse.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Hoai_Vitaminhouse.Areas.Admin.Controllers
{
    public class CategoriesController : Controller
    {
        private Vitaminhouse db = new Vitaminhouse();
        // GET: Admin/Categories
        public ActionResult Index(int? page)
        {
            if (Session["admin"] != null)
            {
                var listCategory = db.Categories.ToList();
                int pageSizeFix = 6; //Kích thước trang
                int pageNumber = (page ?? 1);

                return View(listCategory.ToPagedList(pageNumber, pageSizeFix));
                
            }
            else
            {
                return Redirect("/Admin/Access/Login");
            }
        }
        public ActionResult Details(int? id)
        {
            if (Session["admin"] != null)
            {
                if (id == null)
                {
                    return Redirect("/Admin/Categories/Index");
                }
                Category danhMuc = db.Categories.Find(id);
                if (danhMuc == null)
                {
                    return Redirect("/Admin/Categories/Index");
                }
                return View(danhMuc);
            }
            else
            {
                return Redirect("/Admin/Access/Login");
            }
        }

        public ActionResult Create()
        {
            if (Session["admin"] != null)
            {
                return View();
            }
            else
            {
                return Redirect("/Admin/Access/Login");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "CategoryName,CategoryDescription")] Category danhMuc)
        {
            if (ModelState.IsValid)
            {
                var danhMucCheck = db.Categories.Where(tk => tk.CategoryName == danhMuc.CategoryName);
                if (danhMucCheck.Count() == 0)
                {
                    db.Categories.Add(danhMuc);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }

                ViewBag.ErrorCreateDanhMuc = "Tên danh mục này đã tồn tại !";
                return View("Create", danhMuc);
            }
            return View(danhMuc);
        }

        public ActionResult Delete(int? id)
        {
            if (Session["admin"] != null)
            {

                if (id == null)
                {
                    return Redirect("/Admin/Categories/Index");
                }
                Category danhMuc = db.Categories.Find(id);
                if (danhMuc == null)
                {
                    return Redirect("/Admin/Categories/Index");
                }
                return View(danhMuc);
            }
            else
            {
                return Redirect("/Admin/Access/Login");
            }
        }

        
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Category danhMuc = db.Categories.Find(id);

            try
            {
                db.Categories.Remove(danhMuc);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                ViewBag.ErrorDeleteDanhMuc = "Lỗi không xóa được danh mục! ";
                return View("Delete", danhMuc);
            }

        }

        public ActionResult Edit(int? id)
        {
            if (Session["admin"] != null)
            {
                if (id == null)
                {
                    return Redirect("/Admin/Categories/Index");
                }
                Category danhMuc = db.Categories.Find(id);
                if (danhMuc == null)
                {
                    return Redirect("/Admin/Categories/Index");
                }
                return View(danhMuc);
            }
            else
            {
                return Redirect("/Admin/Access/Login");
            }
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CategoryId, CategoryName,CategoryDescription")] Category danhMuc)
        {
            if (ModelState.IsValid)
            {
                var danhMucCheck = db.Categories.Where(tk => tk.CategoryName == danhMuc.CategoryName && tk.CategoryId != danhMuc.CategoryId);
                if (danhMucCheck.Count() == 0)//Nghĩa là nó có thể bằng chính nó ấy
                {
                    db.Entry(danhMuc).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }

                ViewBag.ErrorEditDanhMuc = "Tên danh mục này đã tồn tại!";
                return View("Edit", danhMuc);
            }
            return View(danhMuc);
        }

    }
}