using Hoai_Vitaminhouse.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Hoai_Vitaminhouse.Controllers
{
    public class CartController : Controller
    {


        Vitaminhouse db = new Vitaminhouse();
        public List<Cart> Laygiohang()
        {
            if (!(Session["GioHang"] is List<Cart> lstGioHang))
            {
                lstGioHang = new List<Cart>();
                Session["GioHang"] = lstGioHang;
            }
            return lstGioHang;
        }
        // GET: GioHang

        public ActionResult ThemGioHang(int iMaHang, string strURL)
        {
            // lấy session gio hang
            List<Cart> lstGioHang = Laygiohang();
            Cart sanpham = lstGioHang.Find(n => n.iMaHang == iMaHang);
            if (sanpham == null)//Trong giỏ hàng chưa có sản phẩm này
            {
                sanpham = new Cart(iMaHang);
                lstGioHang.Add(sanpham);
                return Redirect(strURL);
            }
            else//Trong giỏ hàng có sản phẩm này rồi
            {
                Product hang = db.Products.Single(n => n.ProductId == iMaHang);
                if (hang.ProductNumber > sanpham.iSoLuong)//Nếu sản phẩm trong giỏ hàng nhỏ hơn sản phẩm có thì tăng lên 1
                {
                    sanpham.iSoLuong++;
                }
                else //Nếu mà không lớn hơn thì nó chỉ bắt buộc là bằng thôi 
                {
                    sanpham.iSoLuong = hang.ProductNumber;
                }

                return Redirect(strURL);
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

        public ActionResult Index()
        {
            List<Cart> lstGioHang = Laygiohang();
            ViewBag.TongTien = TongTien();
            return View(lstGioHang);
        }
        public ActionResult XoaGioHang(int iMaHang)
        {
            // lay gio hang tu session
            List<Cart> lstGioHang = Laygiohang();
            Cart sanpham = lstGioHang.SingleOrDefault(n => n.iMaHang == iMaHang);
            if (sanpham != null)
            {
                lstGioHang.RemoveAll(n => n.iMaHang == iMaHang);
            }
            return RedirectToAction("/Index");
        }

        public ActionResult CapNhatGioHang(int MaHang, FormCollection f)
        {
            List<Cart> lstGioHang = Laygiohang();
            Cart sanpham = lstGioHang.SingleOrDefault(n => n.iMaHang == MaHang);
            if (sanpham != null)
            {
                Product hang = db.Products.Single(n => n.ProductId == MaHang);
              
                int soluongmuon = int.Parse(f["txtSoLuongDat"].ToString());
                if (hang.ProductNumber < soluongmuon)//Nếu số lượng muốn mà nhiều hơn số lượng có thì số lượng sẽ bằng số lượng tối đa
                {
                    sanpham.iSoLuong = hang.ProductNumber;
                }
                else
                {
                    sanpham.iSoLuong = soluongmuon;
                }
                    
            }
            return RedirectToAction("Index");

        }

        public ActionResult TangSPGioHang(int MaHang)
        {
            List<Cart> lstGioHang = Laygiohang();
            Cart sanphamInGio = lstGioHang.SingleOrDefault(n => n.iMaHang == MaHang);
            if (sanphamInGio != null)//Nếu tồn tại sản phẩm
            {
                Product hang = db.Products.Single(n => n.ProductId == MaHang);
                if (hang.ProductNumber > sanphamInGio.iSoLuong)
                {
                    sanphamInGio.iSoLuong++;//Nếu mà nó vẫn đang nhỏ hơn số lượng có thì nó tăng lên 1
                }
            }
            return RedirectToAction("Index");
        }
        public ActionResult GiamSPGioHang(int MaHang)
        {
            List<Cart> lstGioHang = Laygiohang();
            Cart sanphamInGio = lstGioHang.SingleOrDefault(n => n.iMaHang == MaHang);
            if (sanphamInGio != null)//Nếu tồn tại sản phẩm
            {
                Product hang = db.Products.Single(n => n.ProductId == MaHang);
                if (sanphamInGio.iSoLuong > 1)
                {
                    sanphamInGio.iSoLuong--;//Nếu mà nó vẫn lớn hơn 1 thì trừ đi một sản phẩm trong giỏ
                }
            }
            return RedirectToAction("Index");
        }

        public ActionResult XoaTatCaGioHang()
        {
            List<Cart> lstGioHang = Laygiohang();
            lstGioHang.Clear();
            return RedirectToAction("/Index");
        }

    }
}