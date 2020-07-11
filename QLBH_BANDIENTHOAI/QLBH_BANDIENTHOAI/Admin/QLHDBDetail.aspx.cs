using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBH_BANDIENTHOAI.Admin
{
    public partial class QLHDBDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getNhanVien();
                getKhachHang();
                getCTKM();
                // kiểm tra xem là trường hợp sửa hay là thêm mới
                if (Request.QueryString["Ma"] == null || Request.QueryString["Ma"].ToString() == "")
                {
                    // Đây là trường hợp thêm mới
                    btnLuu.Visible = false;
                    btnThemMoi.Visible = true;
                }
                else
                {
                    btnLuu.Visible = true;
                    btnThemMoi.Visible = false;
                    txtMaHoaDonBan.Enabled = false;
                    string MaHoaDonBan = Request.QueryString["Ma"].ToString();
                    QLBHEntities db = new QLBHEntities();
                    HoaDonBan obj = db.HoaDonBan.FirstOrDefault(x => x.MaHoaDonBan == MaHoaDonBan);
                    if (obj != null)
                    {
                        txtMaHoaDonBan.Text = obj.MaHoaDonBan;
                        cmbMaNhanVien.SelectedValue = obj.MaNhanVien.ToString();
                        cmbMaKhachHang.SelectedValue = obj.MaKhachHang.ToString();
                        txtNgayBan.Text = obj.NgayBan.ToString();
                        cmbMaCTKM.SelectedValue = obj.MaCTKM.ToString();
                        txtTongTien.Text = obj.TongTien.ToString();
                    }
                }
            }
        }
        public void getNhanVien()
        {
            QLBHEntities db = new QLBHEntities();
            List<NhanVien> data = db.NhanVien.ToList<NhanVien>();
            cmbMaNhanVien.DataSource = data;
            cmbMaNhanVien.DataTextField = "TenNhanVien";
            cmbMaNhanVien.DataValueField = "MaNhanVien";
            cmbMaNhanVien.DataBind();
        }
        public void getKhachHang()
        {
            QLBHEntities db = new QLBHEntities();
            List<KhachHang> data = db.KhachHang.ToList<KhachHang>();
            cmbMaKhachHang.DataSource = data;
            cmbMaKhachHang.DataTextField = "TenKhachHang";
            cmbMaKhachHang.DataValueField = "MaKhachHang";
            cmbMaKhachHang.DataBind();
        }
        public void getCTKM()
        {
            QLBHEntities db = new QLBHEntities();
            List<CTKM> data = db.CTKM.ToList<CTKM>();
            cmbMaCTKM.DataSource = data;
            cmbMaCTKM.DataTextField = "TenCTKM";
            cmbMaCTKM.DataValueField = "MaCTKM";
            cmbMaCTKM.DataBind();
        }

        protected void btnThemMoi_Click(object sender, EventArgs e)
        {
            try
            {
                //Trường hợp thêm mới
                HoaDonBan obj = new HoaDonBan();
                obj.MaHoaDonBan = txtMaHoaDonBan.Text;
                obj.MaNhanVien = cmbMaNhanVien.SelectedValue;
                obj.MaKhachHang = cmbMaKhachHang.SelectedValue;
                obj.NgayBan = Convert.ToDateTime(txtNgayBan.Text);
                obj.MaCTKM = cmbMaCTKM.SelectedValue;
                obj.TongTien = Convert.ToInt32(txtTongTien.Text);
                //lưu dữ liệu vào db
                QLBHEntities db = new QLBHEntities();
                db.HoaDonBan.Add(obj);
                db.SaveChanges();
                Response.Redirect("QLHoaDonBan.aspx");
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
                string MaHoaDonBan = txtMaHoaDonBan.Text;
                HoaDonBan obj = db.HoaDonBan.FirstOrDefault(x => x.MaHoaDonBan == MaHoaDonBan);
                obj.MaHoaDonBan = txtMaHoaDonBan.Text;
                obj.MaNhanVien = cmbMaNhanVien.SelectedValue;
                obj.MaKhachHang = cmbMaKhachHang.SelectedValue;
                obj.NgayBan = Convert.ToDateTime(txtNgayBan.Text);
                obj.MaCTKM = cmbMaCTKM.SelectedValue;
                obj.TongTien = Convert.ToInt32(txtTongTien.Text);
                db.SaveChanges();
                Response.Redirect("QLHoaDonBan.aspx");
            }
            catch
            {
                pnError.Visible = true;
            }
        }
    }
}