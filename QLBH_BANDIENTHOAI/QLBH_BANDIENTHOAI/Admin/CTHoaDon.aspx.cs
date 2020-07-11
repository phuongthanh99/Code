using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBH_BANDIENTHOAI.Admin
{
    public partial class CTHoaDon : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string MaHoaDonBan = Request.QueryString["Ma"].ToString();
            //QLBHEntities db = new QLBHEntities();

            //CTHoaDonBan obj = db.CTHoaDonBan.FirstOrDefault(x => x.MaHoaDonBan == MaHoaDonBan);
            //if (obj != null)
            //{
            //    getData(MaHoaDonBan);

            //}
            if(!IsPostBack) { }
            string MaHoaDonBan = Request.QueryString.Get("Ma");
            QLBHEntities db = new QLBHEntities();
            CTHoaDonBan obj = db.CTHoaDonBan.FirstOrDefault(x => x.MaHoaDonBan == MaHoaDonBan);
            
        }

        //private void getData(string MaHoaDonBan)
        //{
        //    QLBHEntities db = new QLBHEntities();
        //    //CTHoaDonBan obj = db.CTHoaDonBan.FirstOrDefault(x => x.MaHoaDonBan == MaHoaDonBan);
        //    List<CTHoaDonBan> data = db.CTHoaDonBan.OrderByDescending(x => x.MaHoaDonBan).Skip(5).Take(1).ToList<CTHoaDonBan>();
        //    dgvCTHDBH.DataSource = data;
        //    dgvCTHDBH.DataBind();
        //    List<HangHoa> data_2 = db.HangHoa.OrderByDescending(x => x.SoLuongTon).Skip(4).Take(4).ToList<HangHoa>();





        //}
        public string getTenHangHoa(object MaHangHoa)
        {
            try
            {
                QLBHEntities db = new QLBHEntities();
                HangHoa obj = db.HangHoa.FirstOrDefault(x => x.MaHangHoa == MaHangHoa.ToString());
                return obj.TenHangHoa;
            }
            catch
            {
                return "";
            }
        }
    }
}