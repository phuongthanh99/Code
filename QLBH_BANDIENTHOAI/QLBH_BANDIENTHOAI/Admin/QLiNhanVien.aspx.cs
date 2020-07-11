using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBH_BANDIENTHOAI.Admin
{
    public partial class QLiNhanVien : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
                getData();
                
        }
        void getData()
        {
            //lấy dữ liệu lên DataGridView
            //ạo đối tượng query lên database qua Entity Framework
            QLBHEntities db = new QLBHEntities();
            List<NhanVien> data = db.NhanVien.ToList<NhanVien>();
           
            //hiển thị lên DataGridview
            dgvNhanVien.DataSource = data;
            //render về mã HTML
            dgvNhanVien.DataBind();
        }
        protected void btnXoa_Command(object sender, CommandEventArgs e)
        {
            //code để xóa dữ liệu với mã hàng hóa lưu trong CommanArgument
            string MaNhanVien = e.CommandArgument.ToString();
            //xóa dữ liệu trong database
            //tạo đối tượng truy vấn
            QLBHEntities db = new QLBHEntities();
            NhanVien data = db.NhanVien.FirstOrDefault(x => x.MaNhanVien == MaNhanVien);
        
            if (data != null)
            {
                db.NhanVien.Remove(data);
                db.SaveChanges();
                getData();
            }
        }
    }
}