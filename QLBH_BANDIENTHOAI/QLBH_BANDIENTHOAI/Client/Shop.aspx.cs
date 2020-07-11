using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBH_BANDIENTHOAI.Client
{
    public partial class Shop : System.Web.UI.Page
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
            List<HangHoa> data = db.HangHoa.OrderByDescending(x => x.SoLuongTon).Take(3).ToList<HangHoa>();
            rpSale.DataSource = data;
            rpSale.DataBind();

            List<HangHoa> data_1 = db.HangHoa.OrderByDescending(x => x.SoLuongTon).Skip(3).Take(3).ToList<HangHoa>();
            rpSale1.DataSource = data_1;
            rpSale1.DataBind();

            List<HangHoa> data_2 = db.HangHoa.OrderByDescending(x => x.SoLuongTon).Skip(6).Take(3).ToList<HangHoa>();
            rpSale2.DataSource = data_2;
            rpSale2.DataBind();
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