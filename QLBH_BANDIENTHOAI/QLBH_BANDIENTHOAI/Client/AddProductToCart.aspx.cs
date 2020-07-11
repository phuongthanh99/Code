using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBH_BANDIENTHOAI.Client
{
    public partial class AddProductToCart : System.Web.UI.Page
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
                QLBHEntities db = new QLBHEntities();
                HangHoa sanPham = db.HangHoa.Find(maSanPham);
                //newItem = new CartItem()
                //{
                //    MaHangHoa = sanPham.MaHangHoa,
                //    TenHangHoa = sanPham.TenHangHoa,
                //    // DonGia = sanPham.DonGia,
                //    // Hinh = sanPham.Hinh,
                //    SoLuongTon = 1
                //};
                //MyShoppingCart.Add(newItem);
                HangHoa obj = new HangHoa();
                string MaHangHoa = Request.QueryString["id"].ToString();
                string TenHangHoa = Request.QueryString["id"].ToString();
                //int SoLuongTon = int.Parse(Request.QueryString["id"]);
                //float DonGia = float.Parse(Request.QueryString["id"]);
                obj.MaHangHoa = MaHangHoa;
                obj.TenHangHoa = TenHangHoa;
                //obj.SoLuongTon = SoLuongTon;
                //obj.DonGia = DonGia;
                db.HangHoa.Add(obj);
                db.SaveChanges();
                Response.Redirect("Client/shopping-cart.aspx");



            }

            Response.Redirect("Client/shopping-cart.aspx");

        }
    }
}