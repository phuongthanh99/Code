using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBH_BANDIENTHOAI.Client
{
    public partial class shopping_cart : System.Web.UI.Page
    {
        public List<CartItem> MyShoppingCart
        {
            get
            {
                return Session["shoppingcart"] as List<CartItem>;
            }
            set
            {
                Session["shoppingcart"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] == null)
            {
                return;
            }
            if (HttpContext.Current.Session["shoppingcart"] == null)
            {
                Session.Add("shoppingcart", new List<CartItem>());
            }
            string maSanPham = Request.QueryString["id"].ToString();
            CartItem newItem = MyShoppingCart.FirstOrDefault(m => m.MaHangHoa == maSanPham);
            if (newItem != null)
            {
                newItem.SoLuongTon++;
            }
            else
            {
                Response.Redirect("./AddProducToCart.aspx");
                QLBHEntities db = new QLBHEntities();
                HangHoa sanPham = db.HangHoa.Find(maSanPham);
                newItem = new CartItem()
                {
                    MaHangHoa = sanPham.MaHangHoa,
                    TenHangHoa = sanPham.TenHangHoa,
                    // DonGia = sanPham.DonGia,
                    // Hinh = sanPham.Hinh,
                    SoLuongTon = 1
                };
                MyShoppingCart.Add(newItem);


            }
             Response.Redirect("./shopping-cart.aspx");
           

        }
       
    }
}