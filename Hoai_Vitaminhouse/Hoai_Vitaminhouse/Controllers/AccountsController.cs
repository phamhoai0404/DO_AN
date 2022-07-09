using Hoai_Vitaminhouse.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Hoai_Vitaminhouse.Controllers
{
    public class AccountsController : Controller
    {
        private Vitaminhouse db = new Vitaminhouse();

        public ActionResult Logout()
        {
            Session["user"] = null;
            return Redirect("/");
        }

        public ActionResult Login()
        {
            if (Session["user"] == null)
            {
                return View();
            }
            return Redirect("/");
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(FormCollection frm)
        {
            if (ModelState.IsValid)
            {
                string email = frm["email"];
                string password = frm["password"];

                Account user = db.Accounts.Where(s => s.AccountEmail.Equals(email) && s.AccountPassword.Equals(password)).SingleOrDefault();
                if (user != null)
                {
                    if (user.AccountStatus)
                    {
                        Session["user"] = user;//Thực hiện gán vào session
                        return Redirect("/");
                    }
                    else
                    {
                        ViewBag.errorLogin = "Tài khoản của bạn đang bị khóa!";
                    }
                }
                else
                {
                    ViewBag.errorLogin = "Vui lòng kiểm tra lại email hoặc mật khẩu! ";
                }

            }
            return View();
        }

        public ActionResult Register()
        {
            if (Session["user"] == null)
            {
                return View();
            }
            return Redirect("/");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register([Bind(Include = "AccountName,AccountPhone,AccountEmail,AccountPassword,AccountAddress")] Account taiKhoan, FormCollection frm)
        {
            try
            {
                string confirmPassword = frm["confirmPassword"];
                if (confirmPassword != taiKhoan.AccountPassword)
                {
                    ViewBag.errorRegister = "Mật khẩu xác nhận không khớp! ";
                    return View(taiKhoan);
                }

                var tkcheck = db.Accounts.Where(tk => tk.AccountEmail == taiKhoan.AccountEmail);
                if (tkcheck.Count() == 0)
                {
                    if (ModelState.IsValid)
                    {
                        taiKhoan.AccountStatus = true;//Tình trạng là đang mở hoạt động bình thường
                        taiKhoan.AccountRole = 1;//Tài khoản mặc định là tài khoản khách hàng
                        db.Accounts.Add(taiKhoan);
                        db.SaveChanges();
                    }
                    return RedirectToAction("Login");
                }
                else
                {
                    ViewBag.errorRegister = "Email đã tồn tại! ";
                    return View(taiKhoan);
                }
            }
            catch (Exception ex)
            {
                ViewBag.errorRegister = "Lỗi " + ex.Message;
                return View(taiKhoan);
            }
        }


        public ActionResult ChangeInfo()
        {
            if (Session["user"] != null)
            {
                Account taiKhoan = Session["user"] as Account;
                return View(taiKhoan);
            }
            return Redirect("/");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ChangeInfo([Bind(Include = "AccountId,AccountName,AccountPhone,AccountEmail,AccountPassword,AccountAddress, AccountRole, AccountStatus")] Account taiKhoan)
        {
            try
            {
                if (taiKhoan.AccountName.Trim() == "")
                {
                    ViewBag.errorUpdateTaikhoan = "Họ tên không được để trống! ";
                    return View(taiKhoan);
                }
                var tkcheck = db.Accounts.Where(tk => (tk.AccountEmail == taiKhoan.AccountEmail) && tk.AccountId != taiKhoan.AccountId);
                if (tkcheck.Count() == 0)
                {
                    db.Entry(taiKhoan).State = EntityState.Modified;
                    db.Configuration.ValidateOnSaveEnabled = false;
                    db.SaveChanges();

                    Session["user"] = taiKhoan;//Lưu lại thông tin của khi cập nhật

                    return RedirectToAction("Detail");
                }
                else
                {
                    ViewBag.errorUpdateTaikhoan = "Email đã được tài khoản khác sử dụng! ";
                    return View(taiKhoan);
                }
            }
            catch (Exception ex)
            {
                ViewBag.errorUpdateTaikhoan = "Lỗi " + ex.Message;
                return View(taiKhoan);
            }
        }

        public ActionResult ChangePassword()
        {
            if (Session["user"] != null)
            {
                Account taiKhoan = Session["user"] as Account;
                return View(taiKhoan);
            }
            return Redirect("/");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ChangePassword([Bind(Include = "AccountId,AccountName,AccountPhone,AccountEmail,AccountPassword,AccountAddress, AccountRole, AccountStatus")] Account taiKhoan)
        {
            try
            {
                string cu = Request["oldPassword"];
                string moi = Request["newPassword"];
                string xacnhan = Request["confirmPassword"];

                if (cu != null && moi != null && xacnhan != null)
                {
                    if (cu != "" && moi != "" && xacnhan != "")
                    {
                        if (moi == xacnhan)
                        {
                            if (moi.Length >= 3 && moi.Length <= 30)
                            {
                                Account tk = Session["user"] as Account;//Lấy dữ liệu user đang lưu ở session
                                if (cu == tk.AccountPassword + "")
                                {
                                    taiKhoan.AccountPassword = moi;
                                    db.Entry(taiKhoan).State = EntityState.Modified;
                                    Session["user"] = taiKhoan;
                                    db.SaveChanges();
                                    return RedirectToAction("Detail");

                                }
                                else
                                {
                                    ViewBag.LoiMatKhau = "Mật khẩu cũ không khớp!";
                                    return View(taiKhoan);
                                }
                            }
                            else
                            {
                                ViewBag.LoiMatKhau = "Độ dài mật khẩu mới >=3 và <=30!";
                                return View(taiKhoan);
                            }
                        }
                        else
                        {
                            ViewBag.LoiMatKhau = "Mật khẩu mới và xác nhận không khớp!";
                            return View(taiKhoan);
                        }
                    }
                    else
                    {
                        ViewBag.LoiMatKhau = "Không được để trống trường dữ liệu nào!";
                        return View(taiKhoan);
                    }
                }
                else
                {
                    ViewBag.LoiMatKhau = "Không được để trống trường dữ liệu nào!";
                    return View(taiKhoan);
                }
            }
            catch (Exception ex)
            {
                ViewBag.LoiMatKhau = "Lỗi " + ex.Message;
                return View(taiKhoan);
            }
        }


        public ActionResult Detail()
        {
            if (Session["user"] != null)
            {
                Account taiKhoan = Session["user"] as Account;
                List<Order> listDonHang = db.Orders.Where(p => p.AccountId == taiKhoan.AccountId)
                                                   .OrderByDescending(p => p.OrderDate).ToList();

                ViewBag.listDonHangByMaTK = listDonHang;

                return View(taiKhoan);
            }
            return RedirectToAction("Login");
        }
    }
}