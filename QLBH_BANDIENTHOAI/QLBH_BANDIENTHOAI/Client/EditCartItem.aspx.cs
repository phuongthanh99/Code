using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBH_BANDIENTHOAI.Client
{
    public partial class EditCartItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["shoppingcart"] != null && Request.QueryString["id"] != null && Request.QueryString["change"] != null)
            {
                string MaHangHoa = Request.QueryString["id"].ToString();



                {
                    List<CartItem> shopppingCart = Session["shoppingcart"] as List<CartItem>;
                    CartItem cardItemEdit = shopppingCart.Single(m => m.MaHangHoa == MaHangHoa);
                    if (Request.QueryString["change"] == "plus")
                    {
                        cardItemEdit.SoLuongTon++;
                    }
                    else if (Request.QueryString["change"] == "minus")
                    {
                        if (cardItemEdit.SoLuongTon > 1)
                        {
                            cardItemEdit.SoLuongTon--;
                        }

                    }
                }
            }
            Response.Redirect("./shopping-cart.aspx");
        }
    }
}