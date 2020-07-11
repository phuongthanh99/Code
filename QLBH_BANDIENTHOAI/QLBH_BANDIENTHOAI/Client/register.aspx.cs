using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBH_BANDIENTHOAI.Client
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnDangKy_Click(object sender, EventArgs e)
        {
            try
            {
                //Thông báo khi thiếu dữ liệu
                if (txtTaiKhoan.Text == "")
                {
                    lbThongBao.Text = "Nhập vào tên đăng nhập!";

                    return;
                }
                if (txtMatKhau.Text == "")
                {
                    lbThongBao.Text = "Nhập vào mật khẩu!";

                    return;
                }
                if (txtConPass.Text == "")
                {
                    lbThongBao.Text = "Nhắc lại mật khẩu đăng nhập!";

                    return;
                }

                if (txtMatKhau.Text != txtConPass.Text)
                {
                    lbThongBao.Text = "Mật khẩu và mật khẩu nhắc lại chưa khớp nhau!";

                    return;
                }
                QLBHEntities db = new QLBHEntities();                //Exception khi trùng tên đăng nhập
                string select = "SELECT TaiKhoan FROM NguoiDung";
                //SqlCommand cmd = new SqlCommand(select);
                // SqlDataReader dr ;
                //if (dr != null)
                //{
                //    while (dr.Read())
                //    {
                //        if (dr.GetString(0) == txtTaiKhoan.Text)
                //        {
                //            dr.Close();
                //            dr.Dispose();
                //            throw new Exception();
                //        }
                //    }
                //}
                //dr.Close();
                //dr.Dispose();

                string insert = "INSERT INTO NguoiDung VALUES(N'" + txtTaiKhoan.Text.Trim() + "',N'" + txtMatKhau.Text.Trim() + "')";
                //  DataConn.ThucHienCmd(insert);
                Response.Redirect("./login.aspx");
                lbThongBao.Text = "Đã thêm " + txtTaiKhoan.Text + " vào danh sách người dùng!";
                // this.Close();
            }
            catch (Exception)
            {
                lbThongBao.Text = "Đã có tài khoản đăng nhập với tên này!";
            }



        }

    }
}