using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBH_BANDIENTHOAI.Admin
{
    public partial class QLAnhSP : System.Web.UI.Page
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
            List<Multimedia> data = db.Multimedia.ToList<Multimedia>();
            //hiển thị lên DataGridview
            dgvAnh.DataSource = data;
            //render về mã HTML
            dgvAnh.DataBind();
        }


        protected void btnXoa_Command(object sender, CommandEventArgs e)
        {
           

            int ID = Convert.ToInt32(e.CommandArgument.ToString());
            //xoa du lieu trong database
            //tao doi tuong truy van
            QLBHEntities db = new QLBHEntities();
            Multimedia data = db.Multimedia.FirstOrDefault(x => x.ID == ID);
            if (data != null)
            {
                db.Multimedia.Remove(data);
                db.SaveChanges();
                getData();
            }

        }
    }
}