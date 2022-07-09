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
    public class ProductsController : Controller
    {
        private Vitaminhouse db = new Vitaminhouse();

        public ActionResult Index(int? page)
        {
            if (Session["admin"] != null)
            {
                var hangs = db.Products.Select(h => h).OrderBy(p => p.ProductId); ;

                int pageSizeFix = 7; //Kích thước trang
                int pageNumber = (page ?? 1);

                return View(hangs.ToPagedList(pageNumber, pageSizeFix));
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
                    return Redirect("/Admin/Products/Index");
                }
                Product hang = db.Products.Find(id);
                if (hang == null)
                {
                    return Redirect("/Admin/Products/Index");
                }
                return View(hang);
            }
            else
            {
                return Redirect("/Admin/Access/Login");
            }
        }

        [HttpGet]
        public ActionResult Create()
        {
            if (Session["admin"] != null)
            {
                ViewBag.CategoryId = new SelectList(db.Categories, "CategoryId", "CategoryName");
                return View();
            }
            else
            {
                return Redirect("/Admin/Access/Login");
            }
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Product hang)
        {
            try
            {
                hang.ProductImage = null;
                var f = Request.Files["ImageFilesss"];
                if (f != null && f.ContentLength > 0)
                {
                    string FileName = System.IO.Path.GetFileName(f.FileName);
                    string UploadPath = Server.MapPath("~/wwwroot/img/sanpham/" + FileName);

                    f.SaveAs(UploadPath);
                    hang.ProductImage = FileName;
                    db.Products.Add(hang);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    ViewBag.CategoryId = new SelectList(db.Categories, "CategoryId", "CategoryName");
                    ViewBag.ErrorCreateHang = "Cần phải upload file ảnh!";
                    return View(hang);
                }
                

            }
            catch (Exception ex)
            {
                ViewBag.CategoryId = new SelectList(db.Categories, "CategoryId", "CategoryName");
                ViewBag.ErrorCreateHang = "Có lỗi xảy ra ! " + ex.Message;
                return View(hang);
            }
        }


        public ActionResult Delete(int? id)
        {
            if (Session["admin"] != null)
            {
                if (id == null)
                {
                    return Redirect("/Admin/Products/Index");
                }
                Product hang = db.Products.Find(id);
                if (hang == null)
                {
                    return Redirect("/Admin/Products/Index");
                }
                return View(hang);
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
            Product hang = db.Products.Find(id);
            try
            {
                db.Products.Remove(hang);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception)
            {
                ViewBag.ErrorDeleteHang = "Lỗi không xóa được sản phẩm! ";
                return View("Delete", hang);
            }

        }

        public ActionResult Edit(int? id)
        {
            if (Session["admin"] != null)
            {

                if (id == null)
                {
                    return Redirect("/Admin/Products/Index");
                }
                Product hang = db.Products.Find(id);
                if (hang == null)
                {
                    return Redirect("/Admin/Products/Index");
                }

                ViewBag.CategoryId = new SelectList(db.Categories, "CategoryId", "CategoryName", hang.CategoryId);
                return View(hang);
            }
            else
            {
                return Redirect("/Admin/Access/Login");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Product hang)
        {
            try
            {
                var f = Request.Files["ImageFilesss"];
                if (f != null && f.ContentLength > 0)
                {
                    string FileName = System.IO.Path.GetFileName(f.FileName);
                    string UploadPath = Server.MapPath("~/wwwroot/img/sanpham/" + FileName);

                    f.SaveAs(UploadPath);
                    hang.ProductImage = FileName;
                }
                db.Entry(hang).State = EntityState.Modified;
                db.SaveChanges();

                return RedirectToAction("Index");
            }
            catch
            {
                ViewBag.ErrorEditHang = "Lỗi sửa sản phẩm!";
                ViewBag.CategoryId = new SelectList(db.Categories, "CategoryId", "CategoryName");
                return View(hang);
            }
        }
    }
}