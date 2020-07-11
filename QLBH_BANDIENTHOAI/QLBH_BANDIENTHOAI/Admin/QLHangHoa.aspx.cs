using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBH_BANDIENTHOAI.Admin
{
    public partial class QLHangHoa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            getData();
        }
        void getData()
        {
            
           QLBHEntities db = new QLBHEntities();
            List<HangHoa> data = db.HangHoa.ToList<HangHoa>();
            //hiển thị lên DataGridview
            dgvHangHoa.DataSource = data;
            //render về mã HTML
            dgvHangHoa.DataBind();
        }
        public string getTenLoai(object MaLoai)
        {
            try
            {
                QLBHEntities db = new QLBHEntities();
               
                LoaiHangHoa data = db.LoaiHangHoa.FirstOrDefault(x => x.MaLoai == MaLoai);
                return data.TenLoai;
            }
            catch
            {
                return "";
            }
            
        }

        protected void btnXoa_Command(object sender, CommandEventArgs e)
        {
            //code để xóa dữ liệu với mã hàng hóa lưu trong CommanArgument
            string MaHangHoa = e.CommandArgument.ToString();
            //xóa dữ liệu trong database
            //tạo đối tượng truy vấn
           QLBHEntities db = new QLBHEntities();
            HangHoa data = db.HangHoa.FirstOrDefault(x => x.MaHangHoa == MaHangHoa);
            if (data != null)
            {
                db.HangHoa.Remove(data);
                db.SaveChanges();
                getData();
            }
        }
    }
}