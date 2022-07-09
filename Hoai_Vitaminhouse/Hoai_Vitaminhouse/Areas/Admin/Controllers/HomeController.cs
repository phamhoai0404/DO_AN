using Hoai_Vitaminhouse.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Hoai_Vitaminhouse.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {
        private Vitaminhouse db = new Vitaminhouse();
        // GET: Admin/Home
        public ActionResult Index()
        {
            if (Session["admin"] != null)
            {

                //Đếm toàn bộ tài khoản có trong cơ sở dữ liệu
                ViewBag.SoTaiKhoanKH = db.Accounts.Count(s=>s.AccountRole == 1);

                //Tính số đơn hàng đang giao 
                ViewBag.DonHangDangGiao = db.Orders.Sum(s => s.OrderStatus == 1 ? 1 : 0);

                //Sản phẩm có trong cơ sở dữ liệu
                ViewBag.SanPhamTrongDB = db.Products.Sum(s=>s.ProductNumber);

                //Doanh thu chỉ tính cái đã giao 
                ViewBag.DoanhThu = db.Orders.Sum(s => s.OrderStatus == 3 ? s.OrderTotalMoney : 0);

                return View();
            }
            else
            {
                return Redirect("/Admin/Access/Login");
            }


        }

        public PartialViewResult _HeaderAdmin()
        {
            if (Session["admin"] != null)
            {
                Account taiKhoan = Session["admin"] as Account;
                return PartialView(taiKhoan);
            }
            return PartialView();
        }

    }
}