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
    public class EmployeesController : Controller
    {
        private Vitaminhouse db = new Vitaminhouse();
        public ActionResult Index(int? page)
        {
            if (Session["admin"] != null)
            {
                Account taiKhoan = Session["admin"] as Account;

                if(taiKhoan.AccountRole == 3)
                {
                    var listEmployee = db.Accounts.Where(s => s.AccountRole != 1).OrderBy(s => s.AccountId).ToList();

                    //Muốn xóa đi tài khoản quản trị đang đăng nhập
                    int idAdmin = taiKhoan.AccountId;
                    for (int i = 0; i < listEmployee.Count(); i++)
                    {
                        if (listEmployee[i].AccountId == idAdmin)
                        {
                            listEmployee.Remove(listEmployee[i]);
                            break;
                        }
                    }

                    int pageSizeFix = 5; //Kích thước trang
                    int pageNumber = (page ?? 1);
                    return View(listEmployee.ToPagedList(pageNumber, pageSizeFix));
                }
                else
                {
                    return Redirect("/Admin/Home/Index");//Nếu không phải tài khoản quản trị thì bay vào home trang thống kê
                }
            }
            else
            {
                return Redirect("/Admin/Access/Login");
            }
        }
        public void ChangeStatus(int? id)
        {
            if (Session["admin"] != null)//Nếu chưa đăng nhập thì dừng luôn
            {
                if(Convert.ToInt32(Session["roleAdmin"]) == 3)//Nếu không phải là tài khoản quản lý thì không có quyền thay đổi nhân viên
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

        }

        public ActionResult Delete(int? id)
        {
            if (Session["admin"] != null)
            {
                if (Convert.ToInt32(Session["roleAdmin"]) == 3)//Nếu không phải là tài khoản quản lý thì không có quyền thay đổi nhân viên
                {
                    Account taiKhoan = Session["admin"] as Account;

                    //Đây là phòng trường hợp người dùng nhập từ URL id của tài khoản đang đăng nhập
                    if (id == taiKhoan.AccountId)
                    {
                        return Redirect("/Admin/Employees/Index");
                    }

                    if (id == null)
                    {
                        return Redirect("/Admin/Employees/Index");
                    }

                    taiKhoan = db.Accounts.Find(id);
                    if (taiKhoan == null)
                    {
                        return Redirect("/Admin/Employees/Index");
                    }

                    return View(taiKhoan);
                }
                else
                {
                    return Redirect("/Admin/Home/Index");//Nếu không phải tài khoản quản lý thì không truy cập được vào quản lý nhân viên
                }

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
                ViewBag.ErrorDeleteEmployee = "Lỗi không xóa tài khoản nhân viên! ";
                return View("Delete", taiKhoan);
            }

        }

        public ActionResult ResetPassword(int? id)
        {
            if (Session["admin"] != null)
            {
                if (Convert.ToInt32(Session["roleAdmin"]) == 3)//Nếu không phải là tài khoản quản lý thì không có quyền thay đổi nhân viên
                {
                    Account taiKhoan = Session["admin"] as Account;

                    //Đây là phòng trường hợp người dùng nhập từ URL id của tài khoản đang đăng nhập
                    if (id == taiKhoan.AccountId)
                    {
                        return Redirect("/Admin/Employees/Index");
                    }

                    if (id == null)
                    {
                        return Redirect("/Admin/Employees/Index");
                    }

                    taiKhoan = db.Accounts.Find(id);
                    if (taiKhoan == null)
                    {
                        return Redirect("/Admin/Employees/Index");
                    }

                    return View(taiKhoan);
                }
                else
                {
                    return Redirect("/Admin/Home/Index");
                }
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
                string xacnhan = Request["confirmPasswordBEEmployee"];

                if (!string.IsNullOrEmpty(xacnhan))
                {
                    if (xacnhan == taiKhoan.AccountPassword)
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


        public ActionResult Edit(int? id)
        {
            if (Session["admin"] != null)
            {
                if (Convert.ToInt32(Session["roleAdmin"]) == 3)//Nếu không phải là tài khoản quản lý thì không có quyền thay đổi nhân viên
                {
                    if (id == null)
                    {
                        return Redirect("/Admin/Employees/Index");
                    }
                    Account taiKhoan = db.Accounts.Find(id);
                    if (taiKhoan == null)
                    {
                        return Redirect("/Admin/Employees/Index");
                    }


                    List<string> cacQuyen = new List<string>
                    {
                            "Nhân viên",  "Quản lý"
                    };
                    ViewBag.CacQuyen = cacQuyen;


                    return View(taiKhoan);
                }
                else
                {
                    return Redirect("/Admin/Home/Index");
                }
            }
            else
            {
                return Redirect("/Admin/Access/Login");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Account taiKhoan)
        {
            try { 
                //Lấy quyền
                string quyen = Request["QuyenTaiKhoan"];

                if (quyen == "0") taiKhoan.AccountRole = 2;//Là nhân viên
                if(quyen=="1") taiKhoan.AccountRole = 3;//Là quản lý

                db.Entry(taiKhoan).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View(taiKhoan);
            }
          
        }

        public ActionResult Create()
        {
            if (Session["admin"] != null)
            {
                if (Convert.ToInt32(Session["roleAdmin"]) == 3)//Nếu không phải là tài khoản quản lý thì không có quyền thay đổi nhân viên
                {
                    Account taiKhoanDemo = new Account();
                    taiKhoanDemo.AccountName = "Phạm Văn A";
                    taiKhoanDemo.AccountPhone = "0123456789";
                    taiKhoanDemo.AccountRole = 2;//Mặc định là nhân viên chứ không phải quản lý
                    taiKhoanDemo.AccountStatus = true;//Mặc định mới tạo là đang hoạt động chứ không khóa
                    taiKhoanDemo.AccountAddress = "Demo: Hoàn Kiếm - Hà Nội - Việt Nam";
                    return View(taiKhoanDemo);
                }
                else
                {
                    return Redirect("/Admin/Home/Index");//Nếu không phải tài khoản quản lý thì không truy cập được vào quản lý nhân viên
                }
            }
            else
            {
                return Redirect("/Admin/Access/Login");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Account taiKhoan)
        {
            try {
                string confirmPassword = Request["confirmPasswordBEEmployee2"];
                if (confirmPassword == taiKhoan.AccountPassword)
                {
                    var tkcheck = db.Accounts.Where(tk => tk.AccountEmail == taiKhoan.AccountEmail);
                    if (tkcheck.Count() == 0)
                    {
                        db.Accounts.Add(taiKhoan);
                        db.SaveChanges();
                        return RedirectToAction("Index");
                    }
                    else
                    {
                        ViewBag.ErrorCreateEmployeeBE = "Email đã được sử dụng trong hệ thống! ";
                        return View("Create", taiKhoan);
                    }
                }
                else
                {
                    ViewBag.ErrorCreateEmployeeBE = "Mật khẩu xác nhận không khớp!";
                    return View("Create", taiKhoan);
                }
            }catch(Exception ex)
            {
                ViewBag.ErrorCreateEmployeeBE = "Có lỗi xảy ra! " + ex.Message;
                return View(taiKhoan);
            }
            
        }
    }
}