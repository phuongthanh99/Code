using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBH_BANDIENTHOAI.Admin
{
    public partial class QLHoaDonBan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            getData();
        }
        void getData()
        {

            QLBHEntities db = new QLBHEntities();
            List<HoaDonBan> data = db.HoaDonBan.ToList<HoaDonBan>();
            dgvHoaDonBan.DataSource = data;
            dgvHoaDonBan.DataBind();
        }
        public string getTenNhanVien(object MaNhanVien)
        {
            try
            {
                QLBHEntities db = new QLBHEntities();
                NhanVien obj = db.NhanVien.FirstOrDefault(x => x.MaNhanVien == MaNhanVien.ToString());
                return obj.TenNhanVien;
            }
            catch
            {
                return "";
            }
        }
        public string getTenKhachHang(object MaKhachHang)
        {
            try
            {
                QLBHEntities db = new QLBHEntities();
                KhachHang obj = db.KhachHang.FirstOrDefault(x => x.MaKhachHang == MaKhachHang.ToString());
                return obj.TenKhachHang;
            }
            catch
            {
                return "";
            }
        }
        public string getTenCTKM(object MaCTKM)
        {
            try
            {
                QLBHEntities db = new QLBHEntities();
                CTKM obj = db.CTKM.FirstOrDefault(x => x.MaCTKM == MaCTKM.ToString());
                return obj.TenCTKM;
            }
            catch
            {
                return "";
            }
        }
        protected void btnXoa_Command(object sender, CommandEventArgs e)
        {
            string MaHoaDonBan = e.CommandArgument.ToString();
            QLBHEntities db = new QLBHEntities();
            HoaDonBan data = db.HoaDonBan.FirstOrDefault(x => x.MaHoaDonBan == MaHoaDonBan);
            if (data != null)
            {
                db.HoaDonBan.Remove(data);
                db.SaveChanges();
                getData();
            }
        }
    }
}