
using Hoai_Vitaminhouse.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Hoai_Vitaminhouse.Controllers
{
    public class BaseController : Controller
    {

        private Vitaminhouse db = new Vitaminhouse();
        public PartialViewResult _Navbar()
        {
           var catogories = db.Categories.Select(n => n);
           ViewBag.SoLuongGioHang = this.TongSoLuong();
            return PartialView(catogories);
        }
        private int TongSoLuong()
        {
            int iTongSoLuong = 0;
            List<Cart> lstGioHang = Session["GioHang"] as List<Cart>;
            if (lstGioHang != null)
            {
                iTongSoLuong = lstGioHang.Sum(n => n.iSoLuong);
            }
            return iTongSoLuong;
        }

    }
}