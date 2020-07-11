using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBH_BANDIENTHOAI.Client
{
    public partial class DeleteCartItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["shoppingcart"] != null && Request.QueryString["id"] != null)
            {
                string maSanPham = Request.QueryString["id"].ToString();

                {
                    List<CartItem> shopppingCart = Session["shoppingcart"] as List<CartItem>;
                    CartItem cardItem = shopppingCart.Single(m => m.MaHangHoa == maSanPham);
                    shopppingCart.Remove(cardItem);
                    Response.Redirect("shopping-cart.aspx");
                }

            }
            Response.Redirect("./shopping-cart.aspx");

        }
    }
}