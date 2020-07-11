using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBH_BANDIENTHOAI
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnDangNhap_Click(object sender, EventArgs e)
        {
            QLBHEntities db = new QLBHEntities();
            string username = txtTaiKhoan.Text;
            string password = txtMatKhau.Text;
            int soluong = db.NguoiDung.Count(x => x.TaiKhoan == username && x.MatKhau == password);
            if (soluong == 1)
            {
                // Lưu trạng thái đăng nhập vào session
                Session["TaiKhoan"] = username;


                Response.Redirect("./shop.aspx");
                lbThongBao.Text = "Đăng nhập thanh cong!";

            }


            else if (txtTaiKhoan.Text.Trim() == "")
            {
                lbThongBao.Text = "Tai Khoan bạn không được để trống ";

            }

            else if (txtMatKhau.Text.Trim() == "")
            {
                lbThongBao.Text = "Mật khẩu bạn không được để trống ";

            }
        }

    }
}