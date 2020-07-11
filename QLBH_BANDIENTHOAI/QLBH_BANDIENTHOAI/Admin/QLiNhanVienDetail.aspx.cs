using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBH_BANDIENTHOAI.Admin
{
    public partial class QLiNhanVienDetail : System.Web.UI.Page
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
                    txtMaNhanVien.Enabled = false;
                    //Đổ dữ liệu lên form
                    string MaNhanVien = Request.QueryString["Ma"].ToString();
                    QLBHEntities db = new QLBHEntities();
                    NhanVien obj = db.NhanVien.FirstOrDefault(x => x.MaNhanVien == MaNhanVien);
                    if (obj != null)
                    {
                        txtMaNhanVien.Text = obj.MaNhanVien;
                        txtTenNhanVien.Text = obj.TenNhanVien;
                        txtMatKhau.Text = obj.MatKhau.ToString();
                        txtSoDienThoai.Text = obj.SoDienThoai.ToString();

                    }
                }
            }
        }
    
    

    protected void btnThemMoi_Click(object sender, EventArgs e)
        {
            try
            {
                //Trường hợp thêm mới
                NhanVien obj = new NhanVien();
                obj.MaNhanVien = txtMaNhanVien.Text;
                obj.TenNhanVien = txtTenNhanVien.Text;
                obj.MatKhau = txtMatKhau.Text;
                obj.SoDienThoai = txtSoDienThoai.Text;
               
                //lưu dữ liệu vào db
                QLBHEntities db = new QLBHEntities();
                db.NhanVien.Add(obj);
                db.SaveChanges();
                

                Response.Redirect("QLiNhanVien.aspx");
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
                string MaNhanVien = txtMaNhanVien.Text;
             NhanVien  obj = db.NhanVien.FirstOrDefault(x => x.MaNhanVien == MaNhanVien);
                obj.MaNhanVien =txtMaNhanVien.Text;
                obj.TenNhanVien = txtTenNhanVien.Text;
                obj.MatKhau = txtMatKhau.Text;
               
                //lưu dữ liệu vào db

                db.SaveChanges();

                Response.Redirect("QLiNhanVien.aspx");

            }
            catch
            {
                pnError.Visible = true;
            }
        }
    }
}