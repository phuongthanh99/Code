using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBH_BANDIENTHOAI.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDangNhap_Click(object sender, EventArgs e)
        {
            QLBHEntities db = new QLBHEntities();
            string username = txtTaiKhoan.Text;
            string password = txtMatKhau.Text;
            int soluong = db.NhanVien.Count(x => x.MaNhanVien == username && x.MatKhau == password);
            if (soluong == 1)
            {
                // Lưu trạng thái đăng nhập vào session
                Session["MaNhanVien"] = username;
                Response.Redirect("QLAdmin.aspx");
                //lbThongBao.Text = "Đăng nhập thành công!";
            }
            else
            {
                lbThongBao.Text = "Đăng nhập thất bại!";
            }
        }
    }
}