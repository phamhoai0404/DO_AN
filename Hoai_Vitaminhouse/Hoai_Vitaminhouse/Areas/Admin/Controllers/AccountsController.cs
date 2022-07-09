using Hoai_Vitaminhouse.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Hoai_Vitaminhouse.Areas.Admin.Controllers
{
    public class AccountsController : Controller
    {
        private Vitaminhouse db = new Vitaminhouse();
        public ActionResult Index()
        {
            if (Session["admin"] != null)
            {
                Account taiKhoan = Session["admin"] as Account;
                return View(taiKhoan);
            }
            else
            {
                return Redirect("/Admin/Access/Login");
            }
        }

        public ActionResult ChangeInfo()
        {
            if (Session["admin"] != null)
            {
                Account taiKhoan = Session["admin"] as Account;
                return View(taiKhoan);
            }
            return Redirect("/Admin/Access/Login");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ChangeInfo([Bind(Include = "AccountId,AccountName,AccountPhone,AccountEmail,AccountPassword,AccountAddress, AccountRole, AccountStatus")] Account taiKhoan)
        {
            try
            {
                var tkcheck = db.Accounts.Where(tk => (tk.AccountEmail == taiKhoan.AccountEmail) && tk.AccountId != taiKhoan.AccountId);
                if (tkcheck.Count() == 0)
                {
                    db.Entry(taiKhoan).State = EntityState.Modified;
                    db.Configuration.ValidateOnSaveEnabled = false;
                    db.SaveChanges();

                    Session["admin"] = taiKhoan;//Lưu lại thông tin của khi cập nhật

                    return RedirectToAction("Index");
                }
                else
                {
                    ViewBag.ErrorChangeInforAccountBE = "Email đã được tài khoản khác sử dụng! ";
                    return View(taiKhoan);
                }
            }
            catch (Exception ex)
            {
                ViewBag.ErrorChangeInforAccountBE = "Lỗi " + ex.Message;
                return View(taiKhoan);
            }
        }

        public ActionResult ChangePassword()
        {
            if (Session["admin"] != null)
            {
                Account taiKhoan = Session["admin"] as Account;
                return View(taiKhoan);
            }
            return Redirect("/Admin/Access/Login");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ChangePassword(Account taiKhoan)
        {
            try
            {
                string cu = Request["passwordOldBE"];
                string moi = Request["passwordNewBE"];
                string xacnhan = Request["confirmPasswordBE"];

                if (cu != null && moi != null && xacnhan != null)
                {
                    if (cu != "" && moi != "" && xacnhan != "")
                    {
                        if (moi == xacnhan)
                        {
                            if (moi.Length >= 3 && moi.Length <= 30)
                            {
                                Account tk = Session["admin"] as Account;//Lấy dữ liệu admin đang lưu ở session
                                if (cu == tk.AccountPassword + "")
                                {
                                    taiKhoan.AccountPassword = moi;
                                    db.Entry(taiKhoan).State = EntityState.Modified;
                                    Session["admin"] = taiKhoan;
                                    db.SaveChanges();
                                    return RedirectToAction("Index");

                                }
                                else
                                {
                                    ViewBag.ErrorChangePasswordAccount = "Mật khẩu cũ không khớp!";
                                    return View(taiKhoan);
                                }
                            }
                            else
                            {
                                ViewBag.ErrorChangePasswordAccount = "Độ dài mật khẩu mới >=3 và <=30!";
                                return View(taiKhoan);
                            }
                        }
                        else
                        {
                            ViewBag.ErrorChangePasswordAccount = "Mật khẩu mới và xác nhận không khớp!";
                            return View(taiKhoan);
                        }
                    }
                    else
                    {
                        ViewBag.ErrorChangePasswordAccount = "Không được để trống trường dữ liệu nào!";
                        return View(taiKhoan);
                    }
                }
                else
                {
                    ViewBag.ErrorChangePasswordAccount = "Không được để trống trường dữ liệu nào!";
                    return View(taiKhoan);
                }
            }
            catch (Exception ex)
            {
                ViewBag.ErrorChangePasswordAccount = "Lỗi " + ex.Message;
                return View(taiKhoan);
            }
        }

    }
}