using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBH_BANDIENTHOAI
{
    public partial class index : System.Web.UI.Page
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
            rpHotProducts.DataSource = data;
            rpHotProducts.DataBind();

            // List<HangHoa> data_2 = db.HangHoa.OrderByDescending(x => x.SoLuongTon).Skip(4).Take(4).ToList<HangHoa>();
            // rpHotProducts_2.DataSource = data_2;
            //rpHotProducts_2.DataBind();
        }
        public string getAnhDaiDien(string MaHangHoa)
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