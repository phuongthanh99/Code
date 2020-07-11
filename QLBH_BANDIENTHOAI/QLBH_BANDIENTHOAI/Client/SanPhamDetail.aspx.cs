using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBH_BANDIENTHOAI.Client
{
    public partial class SanPhamDetail : System.Web.UI.Page
    {
        public List<CartItem> MyShoppingCart
        {
            get
            {
                return Session["shoppingcart"] as List<CartItem>;
            }
            set
            {
                Session["shoppingcart"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    getDataAnh();
                    string MaHangHoa = Request.QueryString["Ma"].ToString();
                    getData(MaHangHoa);
                }
                catch
                {
                   Response.Redirect("./Shop.aspx");
                }
            }

        }
        void getData(string MaHangHoa)
        {
            QLBHEntities db = new QLBHEntities();
            HangHoa obj = db.HangHoa.FirstOrDefault(x => x.MaHangHoa == MaHangHoa);
            lbTenHangHoa.Text = obj.TenHangHoa;
            lbDonGia.Text = string.Format("{0:#,0}", obj.DonGia);
            lbMoTa.Text = obj.MoTa;

            List<Multimedia> data = db.Multimedia.Where(x => x.MaHangHoa == MaHangHoa).ToList<Multimedia>();
            //List<Multimedia> data = db.Multimedia.ToList<Multimedia>();
            //zoom_03.ImageUrl = data[0].Url;
            rpMultimedia.DataSource = data;
            rpMultimedia.DataBind();
        }
        void getDataAnh()
        {
            QLBHEntities db = new QLBHEntities();
            List<HangHoa> data = db.HangHoa.OrderByDescending(x => x.SoLuongTon).Take(4).ToList<HangHoa>();
            rpAnhLH.DataSource = data;
            rpAnhLH.DataBind();
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
        public string getAnhLienHe(string MaHangHoa)
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