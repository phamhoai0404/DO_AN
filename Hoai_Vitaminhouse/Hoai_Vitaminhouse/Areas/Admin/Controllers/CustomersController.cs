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
    public class CustomersController : Controller
    {
        private Vitaminhouse db = new Vitaminhouse();
        public ActionResult Index(int? page)
        {
            if (Session["admin"] != null)
            {
                var listCustomer = db.Accounts.Where(s => s.AccountRole == 1).OrderBy(s => s.AccountId);

                int pageSizeFix = 8; //Kích thước trang
                int pageNumber = (page ?? 1);
                return View(listCustomer.ToPagedList(pageNumber, pageSizeFix));
            }
            else
            {
                return Redirect("/Admin/Access/Login");
            }
        }

        public void ChangeStatus(int? id)
        {
            if (Session["admin"] != null)
            {
                Account user = db.Accounts.Find(id);
                if (user == null)
                {
                    return;
                }

                user.AccountStatus = !user.AccountStatus;

                db.Configuration.ValidateOnSaveEnabled = false;
                db.Entry(user).State = EntityState.Modified;
                db.SaveChanges();

                return;
            }

        }

        public ActionResult Delete(int? id)
        {
            if (Session["admin"] != null)
            {
                Account taiKhoan = Session["admin"] as Account;

                //Đây là phòng trường hợp người dùng nhập từ URL id của tài khoản đang đăng nhập
                if (id == taiKhoan.AccountId)
                {
                    return Redirect("/Admin/Customers/Index");
                }

                if (id == null)
                {
                    return Redirect("/Admin/Customers/Index");
                }

                taiKhoan = db.Accounts.Find(id);
                if (taiKhoan == null)
                {
                    return Redirect("/Admin/Customers/Index");
                }
                return View(taiKhoan);

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
            Account taiKhoan = db.Accounts.Find(id);
            try
            {
                db.Accounts.Remove(taiKhoan);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception)
            {
                ViewBag.ErrorDeleteCustomer = "Lỗi không xóa được khách hàng, tài khoản đã đặt hàng! ";
                return View("Delete", taiKhoan);
            }

        }

        public ActionResult Details(int? id)
        {
            if (Session["admin"] != null)
            {
                if (id == null)
                {
                    return Redirect("/Admin/Customers/Index");
                }

                Account taiKhoan = db.Accounts.Find(id);

                if (taiKhoan == null)
                {
                    return Redirect("/Admin/Customers/Index");
                }

                List<Order> listDonHang = db.Orders.Where(p => p.AccountId == taiKhoan.AccountId)
                                                   .OrderByDescending(p => p.OrderDate).ToList();

                ViewBag.listDonHangByMaTK = listDonHang;

                return View(taiKhoan);
            }
            else
            {
                return Redirect("/Admin/Access/Login");
            }
        }

        public ActionResult ResetPassword(int? id)
        {
            if (Session["admin"] != null)
            {
                Account taiKhoan = Session["admin"] as Account;

                //Đây là phòng trường hợp người dùng nhập từ URL id của tài khoản đang đăng nhập
                if (id == taiKhoan.AccountId)
                {
                    return Redirect("/Admin/Customers/Index");
                }

                if (id == null)
                {
                    return Redirect("/Admin/Customers/Index");
                }

                taiKhoan = db.Accounts.Find(id);
                if (taiKhoan == null)
                {
                    return Redirect("/Admin/Customers/Index");
                }
                return View(taiKhoan);

            }
            else
            {
                return Redirect("/Admin/Access/Login");
            }
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ResetPassword(Account taiKhoan)
        {
            try
            {
                string xacnhan = Request["confirmPasswordBE"];

                if (!string.IsNullOrEmpty(xacnhan))
                {
                    if(xacnhan == taiKhoan.AccountPassword)
                    {
                        db.Entry(taiKhoan).State = EntityState.Modified;
                        db.SaveChanges();
                        return RedirectToAction("Index");
                    }
                    else
                    {
                        ViewBag.ErrorResetPasswordCustomer = "Mật khẩu xác nhận không khớp!";
                        return View(taiKhoan);
                    }
                }
                else
                {
                    ViewBag.ErrorResetPasswordCustomer = "Không được để trống xác nhận mật khẩu!";
                    return View(taiKhoan);
                }
            }
            catch (Exception ex)
            {
                ViewBag.ErrorResetPasswordCustomer = "Có lỗi xảy ra khi thay đổi mật khẩu!" + ex.Message;
                return View(taiKhoan);
            }
        }
    }
}