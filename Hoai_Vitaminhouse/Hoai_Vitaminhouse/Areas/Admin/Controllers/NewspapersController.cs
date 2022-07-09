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
    public class NewspapersController : Controller
    {
        private Vitaminhouse db = new Vitaminhouse();
        // GET: Admin/Categories
        public ActionResult Index(int? page)
        {
            if (Session["admin"] != null)
            {
                var listNewspaper = db.Newspapers.ToList();
                int pageSizeFix = 5; //Kích thước trang
                int pageNumber = (page ?? 1);

                return View(listNewspaper.ToPagedList(pageNumber, pageSizeFix));

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
                    return Redirect("/Admin/Newspapers/Index");
                }
                Newspaper tinTuc = db.Newspapers.Find(id);
                if (tinTuc == null)
                {
                    return Redirect("/Admin/Newspapers/Index");
                }
                return View(tinTuc);
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
        public ActionResult Create([Bind(Include = "NewspaperTitle, NewspaperDescription, NewspaperDate, NewspaperImage")] Newspaper tinTuc)
        {
            try {
                tinTuc.NewspaperImage = null;
                var f = Request.Files["ImageFilesss"];
                if (f != null && f.ContentLength > 0)
                {
                    string FileName = System.IO.Path.GetFileName(f.FileName);
                    string UploadPath = Server.MapPath("~/wwwroot/img/newspapers/" + FileName);
                    f.SaveAs(UploadPath);
                    tinTuc.NewspaperImage = FileName;

                    tinTuc.NewspaperDate= DateTime.Now;

                    db.Newspapers.Add(tinTuc);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    ViewBag.ErrorCreateNewspaper = "Cần phải upload file ảnh!";
                    return View(tinTuc);
                }

            }
            catch(Exception ex)
            {
                ViewBag.ErrorCreateNewspaper = "Có lỗi xảy ra! "+ ex.Message;
                return View(tinTuc);
            }
        }

        public ActionResult Delete(int? id)
        {
            if (Session["admin"] != null)
            {

                if (id == null)
                {
                    return Redirect("/Admin/Newspapers/Index");
                }
                Newspaper tinTuc = db.Newspapers.Find(id);
                if (tinTuc == null)
                {
                    return Redirect("/Admin/Newspapers/Index");
                }
                return View(tinTuc);
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
            Newspaper tinTuc = db.Newspapers.Find(id);

            try
            {
                db.Newspapers.Remove(tinTuc);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                ViewBag.ErrorDeleteNewspaper = "Lỗi không xóa được tin tức! ";
                return View("Delete", tinTuc);
            }

        }

        public ActionResult Edit(int? id)
        {
            if (Session["admin"] != null)
            {

                if (id == null)
                {
                    return Redirect("/Admin/Newspapers/Index");
                }
                Newspaper tinTuc = db.Newspapers.Find(id);
                if (tinTuc == null)
                {
                    return Redirect("/Admin/Newspapers/Index");
                }
                return View(tinTuc);
            }
            else
            {
                return Redirect("/Admin/Access/Login");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "NewspaperId, NewspaperTitle, NewspaperDescription, NewspaperDate, NewspaperImage")] Newspaper tinTuc)
        {
            try
            {
                var f = Request.Files["ImageFilesss"];
                if (f != null && f.ContentLength > 0)
                {
                    string FileName = System.IO.Path.GetFileName(f.FileName);
                    string UploadPath = Server.MapPath("~/wwwroot/img/newspapers/" + FileName);
                    f.SaveAs(UploadPath);
                    tinTuc.NewspaperImage = FileName;
                }

                db.Entry(tinTuc).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ViewBag.ErrorEditNewspaper = "Có lỗi xảy ra! " + ex.Message;
                return View(tinTuc);
            }
        }
    }
}