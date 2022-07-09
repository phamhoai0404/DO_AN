using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Hoai_Vitaminhouse.Models
{
    public class Cart
    {
        Vitaminhouse db = new Vitaminhouse();
        public int iMaHang { set; get; }
        public string sTenHang { get; set; }
        public string sAnh { get; set; }
        public double dDonGia { get; set; }

        public double gGiamGia { get; set; }
        public int iSoLuong { get; set; }
        public double dThanhTien
        {
            get { return iSoLuong * (dDonGia - (dDonGia * gGiamGia)/100); }
        }



        public Cart(int MaHang)
        {
            iMaHang = MaHang;
            Product sanpham = db.Products.Single(n => n.ProductId == iMaHang);//tìm ra một sản phẩm có trong csdl với mã bằng mã truyền vào
            sTenHang = sanpham.ProductName;
            sAnh = sanpham.ProductImage;
            dDonGia = double.Parse(sanpham.ProductPrice.ToString());
            
            iSoLuong = 1;


            if(sanpham.ProductDiscount != null)
            {
                gGiamGia = double.Parse(sanpham.ProductDiscount.ToString());
            }
            else
            {
                gGiamGia = 0;
            }

        }
    }
}