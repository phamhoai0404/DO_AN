using Hoai_Vitaminhouse.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Hoai_Vitaminhouse.Areas.Admin.Controllers
{
    public class AccessController : Controller
    {
        private Vitaminhouse db = new Vitaminhouse ();
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(FormCollection frm)
        {
            string email = frm["email"];
            string password = frm["password"];
            email = email.Trim();
            password = password.Trim();
            if (email != "" && password != "")
            {
                Account admin = db.Accounts.Where(s => s.AccountEmail.Equals(email) && s.AccountPassword.Equals(password)).SingleOrDefault();
                if (admin != null)
                {
                    //Nếu là nhân viên hoặc người quản lý đang mở khóa thì có thể truy cập
                    if (((admin.AccountRole == 3) || (admin.AccountRole == 2)) && admin.AccountStatus == true)
                    {
                        Session["admin"] = admin;
                        Session["roleAdmin"] = admin.AccountRole;//Lưu trữ quyền truy cập xem là quản trị hay nhân viên

                        return Redirect("/Admin/Home/Index");
                    }
                    else
                    {
                        ViewBag.ErrorLogin = "Bạn không có quyền truy cập hoặc tài khoản đang bị khóa! ";
                        return View();
                    }
                }
                else
                {
                    ViewBag.ErrorLogin = "Đăng nhập thất bại kiểm tra lại email và password! ";
                    return View();
                }
            }
            else
            {
                ViewBag.ErrorLogin = "Phải nhập đầy đủ Email và Password! ";
                return View();
            }
        }

        public ActionResult Logout()
        {
            Session["admin"] = null;

            return Redirect("/Admin/Access/Login");
        }
    }
}