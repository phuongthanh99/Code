using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBH_BANDIENTHOAI.Admin
{
    public partial class QLAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                //trước khi Load nội dung của trang web , kiểm tra đăng  nhập của phiên làm việc
                if (Session["MaNhanVien"] == null || Session["MaNhanVien"].ToString() == "")
                {
                    //chưa đăng nhập chuyển về trang Login
                    Response.Redirect("Login.aspx");
                }
            }
        }
    }
}