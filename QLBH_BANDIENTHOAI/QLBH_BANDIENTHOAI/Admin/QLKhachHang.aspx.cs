using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBH_BANDIENTHOAI.Admin
{
    public partial class QLKhachHang : System.Web.UI.Page
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
           
            List<KhachHang> data = db.KhachHang.ToList<KhachHang>();
                
            //hiển thị lên DataGridview
            dgvKhachHang.DataSource = data;
            //render về mã HTML
            dgvKhachHang.DataBind();
        }
        protected void btnXoa_Command(object sender, CommandEventArgs e)
        {

            //code để xóa dữ liệu với mã hàng hóa lưu trong CommanArgument
            string MaKhachHang = e.CommandArgument.ToString();
            //xóa dữ liệu trong database
            //tạo đối tượng truy vấn
            QLBHEntities db = new QLBHEntities();
           KhachHang data = db.KhachHang.FirstOrDefault(x => x.MaKhachHang== MaKhachHang);
           
            if (data != null)
            {
                db.KhachHang.Remove(data);
                db.SaveChanges();
                getData();
            }
        }
    }
}