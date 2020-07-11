using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBH_BANDIENTHOAI.Client
{
    public partial class TrangChu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                getData();
            }
        }
        void getData()
        {
            QLBHEntities db = new QLBHEntities();
            List<HangHoa> data = db.HangHoa.OrderByDescending(x => x.SoLuongTon).Take(4).ToList<HangHoa>();
            rpwomen.DataSource = data;
            rpwomen.DataBind();

            List<HangHoa> data_1 = db.HangHoa.OrderByDescending(x => x.SoLuongTon).Skip(4).Take(4).ToList<HangHoa>();
            rpmen.DataSource = data_1;
            rpmen.DataBind();
        }
        public string getAnhwomen(string MaHangHoa)
        {
            QLBHEntities db = new QLBHEntities();
            Multimedia obj = db.Multimedia.FirstOrDefault(x => x.MaHangHoa == MaHangHoa);
            if (obj == null)
            {
                return "";
            }
            else
            {
                return obj.Url;
            }
        }
       
    }
}