using Hoai_Vitaminhouse.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Hoai_Vitaminhouse.Controllers
{
    public class OrdersController : Controller
    {
        private Vitaminhouse db = new Vitaminhouse();
        public ActionResult Index(int? id)
        {
            if (Session["user"] != null)
            {
                if (id == null)
                {
                    return Redirect("/Accounts/Detail");
                }

                Order donHang = db.Orders.Find(id);

                if (donHang == null)
                {
                    return Redirect("/Accounts/Detail");
                }

                Account taiKhoan = Session["user"] as Account;


                if (donHang.AccountId != taiKhoan.AccountId)
                {
                    return Redirect("/Accounts/Detail");
                }


                List<OrderDetail> chiTietDonHangByID = db.OrderDetails.Where(p => p.OrderId == id).ToList();
                List<Product> dsHang = new List<Product>();

                foreach (var item in chiTietDonHangByID)
                {
                    Product sp = db.Products.Where(p => p.ProductId == item.ProductId).SingleOrDefault();
                    dsHang.Add(sp);
                }

                ViewBag.SanPhamsClient = dsHang;
                ViewBag.ChiTietDHClient = chiTietDonHangByID;

                ViewBag.SumOrderS = chiTietDonHangByID.Sum(p => p.OrderDetailNumber);//Lấy tổng số sản phẩm
                ViewBag.OrderSumPriceFirst = chiTietDonHangByID.Sum(p => p.OrderDetailNumber * p.OrderDetailPrice);//Lấy tổng số tiền ban đầu
                ViewBag.OrderSumPriceDiscount = chiTietDonHangByID.Sum(p => (decimal)p.OrderDetailNumber * (decimal)p.OrderDetailDiscount * p.OrderDetailPrice /100);//Lấy tổng số  tiền được giảm giá
                return View(donHang);
            }
            else
            {
                return Redirect("/Accounts/Login");
            }
        }

        public ActionResult PayDetail(decimal? tongtien)
        {
            if (Session["user"] != null)//Nếu chưa đăng nhập thì chưa được thanh toán phải đăng nhập tài khoản trước
            {
                if (tongtien == null)//Nếu tổng tiền không có thì sẽ về chi tiết giỏ hàng
                {
                    return Redirect("/Cart/Index");
                }
                else
                {
                    Account account = Session["user"] as Account;//Lấy thông tin của người đặt hàng
                    ViewBag.UserPayDetail = account;
                    ViewBag.ListCart = this.Laygiohang();//Lấy giỏ hàng gán vào
                    ViewBag.TongTien = this.TongTien();

                    Order order = new Order();
                    order.OrderRecipientName = account.AccountName;
                    order.OrderRecipientPhone = account.AccountPhone;
                    order.OrderAddress = account.AccountAddress;

                    return View(order);
                }
            }
            else
            {
                return Redirect("/Accounts/Login");
            }
        }

        [HttpPost]
        public ActionResult PayDetail([Bind(Include = "OrderAddress, OrderRecipientName, OrderRecipientPhone")] Order orderL)
        {

            if (Session["user"] != null)//Nếu chưa đăng nhập thì chưa được thanh toán phải đăng nhập tài khoản trước
            {
                Account taiKhoan = Session["user"] as Account;//Lấy ra thông tin người đặt từ session

                Order donhang = new Order();//Tạo một đơn hàng mới 
                donhang.AccountId = taiKhoan.AccountId;//Lưu thông tin người đặt hàng
                donhang.OrderStatus = 1;//Tình trạng đơn hàng mặc định là 1 đang giao
                donhang.OrderDate = DateTime.Now;//Mặc định là thời gian hiện tại là ngày đặt hàng

                donhang.OrderTotalMoney = (decimal)this.TongTien();//Lưu thông tin tổng tiền

                //Lấy từ trong form người nhận
                donhang.OrderAddress = orderL.OrderAddress;
                donhang.OrderRecipientName = orderL.OrderRecipientName;
                donhang.OrderRecipientPhone = orderL.OrderRecipientPhone;

                db.Orders.Add(donhang);//Thực hiện lưu đơn hàng mới

                int maDonHang = donhang.OrderId;//Lấy ra mã đơn hàng mới vừa lưu xong

                List<Cart> list = this.Laygiohang();//Lấy thông tin trong giỏ hàng để bắt đầu lưu chi tiết giỏ hàng


                for (int i = 0; i < list.Count; i++)
                {
                    OrderDetail ct = new OrderDetail();
                    ct.OrderId = maDonHang;
                    ct.ProductId = list[i].iMaHang;
                    ct.OrderDetailPrice = (decimal)list[i].dDonGia;
                    ct.OrderDetailDiscount = list[i].gGiamGia;
                    ct.OrderDetailNumber = list[i].iSoLuong;

                    //Xóa đi ở bảng hàng khi đã vào đơn hàng của khách hàng
                    Product sanpham = db.Products.Single(n => n.ProductId == ct.ProductId);
                    sanpham.ProductNumber = sanpham.ProductNumber - ct.OrderDetailNumber;

                    db.Entry(sanpham).State = EntityState.Modified;//Lưu
                    db.OrderDetails.Add(ct);
                }

                //Xóa giỏ hàng
                List<Cart> lstGioHang = this.Laygiohang();
                lstGioHang.Clear();

                db.Configuration.ValidateOnSaveEnabled = false;
                db.SaveChanges();


                return RedirectToAction("Index", "Orders", new { id = donhang.OrderId});
            }
            else
            {
                return Redirect("/Accounts/Login");
            }

        }






        private double TongTien()
        {
            double iTongTien = 0;
            List<Cart> lstGioHang = Session["GioHang"] as List<Cart>;
            if (lstGioHang != null)
            {
                iTongTien = lstGioHang.Sum(n => n.dThanhTien);
            }
            return iTongTien;
        }

        public List<Cart> Laygiohang()
        {
            if (!(Session["GioHang"] is List<Cart> lstGioHang))
            {
                lstGioHang = new List<Cart>();
                Session["GioHang"] = lstGioHang;
            }
            return lstGioHang;
        }
    }
}