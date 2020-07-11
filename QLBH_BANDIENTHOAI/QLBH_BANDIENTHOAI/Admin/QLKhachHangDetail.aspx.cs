using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBH_BANDIENTHOAI.Admin
{
    public partial class QLKhachHangDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
             
                //Kiem tra xem la trường hợp sửa hay là thêm mới
                if (Request.QueryString["Ma"] == null || Request.QueryString["Ma"].ToString() == "")
                {
                    //Đây là trường hợp thêm mới
                    btnLuu.Visible = false;
                    btnThemMoi.Visible = true;
                }
                else
                {
                    //đây là trường hợp sửa
                    btnLuu.Visible = true;
                    btnThemMoi.Visible = false;
                   txtmaKhachHang.Enabled = false;
                    //Đổ dữ liệu lên form
                    string MaKhachHang = Request.QueryString["Ma"].ToString();
                    QLBHEntities db = new QLBHEntities();
                   KhachHang obj = db.KhachHang.FirstOrDefault(x => x.MaKhachHang == MaKhachHang);
                    if (obj != null)
                    {
                        txtmaKhachHang.Text = obj.MaKhachHang;
                       txtTenKhachHang.Text = obj.TenKhachHang;
                       txtLoaiKH.Text = obj.LoaiKH.ToString();
                        txtSoDienThoai.Text = obj.SoDienThoai.ToString();
                        txtGioiTinh.Text = obj.GioiTinh;
                        
                       

                    }
                }
            }
        }
       
        protected void btnThemMoi_Click(object sender, EventArgs e)
        {
            try
            {
                //Trường hợp thêm mới
                KhachHang obj = new KhachHang();
                obj.MaKhachHang = txtmaKhachHang.Text;
                obj.TenKhachHang = txtTenKhachHang.Text;
                obj.GioiTinh = txtGioiTinh.Text;
                obj.SoDienThoai = txtSoDienThoai.Text;
                obj.LoaiKH = txtLoaiKH.Text;


                //lưu dữ liệu vào db
                QLBHEntities db = new QLBHEntities();
                db.KhachHang.Add(obj);
                db.SaveChanges();


                Response.Redirect("QLKhachHang.aspx");
            }
            catch
            {
                pnError.Visible = true;
            }
        }

        protected void btnLuu_Click(object sender, EventArgs e)
        {
            try
            {
                QLBHEntities db = new QLBHEntities();
                string MaKhachHang = txtmaKhachHang.Text;
               KhachHang obj = db.KhachHang.FirstOrDefault(x => x.MaKhachHang == MaKhachHang);
                obj.MaKhachHang = txtmaKhachHang.Text;
                obj.TenKhachHang = txtTenKhachHang.Text;
                obj.GioiTinh = txtGioiTinh.Text;
                obj.SoDienThoai = txtSoDienThoai.Text;
                obj.LoaiKH = txtLoaiKH.Text;

                //lưu dữ liệu vào db

                db.SaveChanges();

                Response.Redirect("QLKhachHang.aspx");

            }
            catch
            {
                pnError.Visible = true;
            }
        }
    }
}