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
    public class OrdersController : Controller
    {
        private Vitaminhouse db = new Vitaminhouse();


        public ActionResult Index(int? page)
        {
            if (Session["admin"] != null)
            {
                var donHangs = db.Orders.Select(h => h).OrderByDescending(p => p.OrderId);
                int pageSizeFix = 8; //Kích thước trang
                int pageNumber = (page ?? 1);

                return View(donHangs.ToPagedList(pageNumber, pageSizeFix));
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
                    return Redirect("/Admin/Orders/Index");
                }

                Order donHang = db.Orders.Find(id);

                if (donHang == null)
                {
                    return Redirect("/Admin/Orders/Index");
                }

                List<OrderDetail> chiTietDonHangByID = db.OrderDetails.Where(p => p.OrderId == id).ToList();
                List<Product> dsHang = new List<Product>();

                foreach (var item in chiTietDonHangByID)
                {
                    Product sp = db.Products.Where(p => p.ProductId == item.ProductId).SingleOrDefault();
                    dsHang.Add(sp);
                }

                ViewBag.SanPhams = dsHang;
                ViewBag.ChiTietDH = chiTietDonHangByID;

                ViewBag.SumOrderSBE = chiTietDonHangByID.Sum(p => p.OrderDetailNumber);//Lấy tổng số sản phẩm
                ViewBag.OrderSumPriceFirstBE = chiTietDonHangByID.Sum(p => p.OrderDetailNumber * p.OrderDetailPrice);//Lấy tổng số tiền ban đầu
                ViewBag.OrderSumPriceDiscountBE = chiTietDonHangByID.Sum(p => (decimal)p.OrderDetailNumber * (decimal)p.OrderDetailDiscount * p.OrderDetailPrice / 100);//Lấy tổng số  tiền được giảm giá

                return View(donHang);
            }
            else
            {
                return Redirect("/Admin/Access/Login");
            }
        }

        public ActionResult Edit(int? id)
        {

            if (Session["admin"] != null)
            {
                if (id == null)
                {
                    return Redirect("/Admin/Orders/Index");
                }
                Order donHang = db.Orders.Find(id);
                if (donHang == null)
                {
                    return Redirect("/Admin/Orders/Index");
                }

                //Nếu là chờ xử lý hoặc đang giao thì mới có quyền thay đổi
                if (donHang.OrderStatus == 1 || donHang.OrderStatus == 2)
                {
                    List<string> tinhtrangDH = new List<string>
                    {
                          "Chờ xử lý","Đang giao", "Đã giao",  "Đã huỷ"
                    };
                    ViewBag.TinhTrangDH = tinhtrangDH;
                    return View(donHang);
                }
                else // Nếu tình trạng đơn hàng là 3, 4 thì sẽ không click được
                {
                    return Redirect("/Admin/Orders/Index");
                }
            }
            else
            {
                return Redirect("/Admin/Access/Login");
            }
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "OrderId, OrderDate, OrderAddress, OrderStatus, OrderRecipientName, OrderRecipientPhone, OrderTotalMoney, OrderNotes , AccountId")] Order donHang)
        {
            try
            {
                string tinhTrang = Request["TinhTrang"];
                donHang.OrderStatus = int.Parse(tinhTrang);


                if (donHang.OrderStatus == 4)
                {
                    //Lấy ra danh sách các mặt hàng trong đơn hàng mà 
                    List<OrderDetail> chiTietDonHangByID = db.OrderDetails.Where(p => p.OrderId == donHang.OrderId).ToList();
                    for (int i = 0; i < chiTietDonHangByID.Count; i++)
                    {
                        int idProduct = chiTietDonHangByID[i].ProductId;
                        Product sanpham = db.Products.Single(n => n.ProductId == idProduct);
                        sanpham.ProductNumber = sanpham.ProductNumber + chiTietDonHangByID[i].OrderDetailNumber;

                        db.Entry(sanpham).State = EntityState.Modified;//Lưu
                    }
                }
                db.Entry(donHang).State = EntityState.Modified;
                db.Configuration.ValidateOnSaveEnabled = false;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                List<string> tinhtrangDH = new List<string>
                {
                      "Chờ xử lý", "Đang giao", "Đã giao",  "Đã huỷ"
                };
                ViewBag.TinhTrangDH = tinhtrangDH;
                ViewBag.OrderAddressError = ex.Message;
                return View(donHang);
            }

        }
    }
}