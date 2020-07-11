using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBH_BANDIENTHOAI.Admin
{
    public partial class QLAnhHHDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getTenHangHoa();
                //Kiem tra xem la trường hợp sửa hay là thêm mới
                if (Request.QueryString["Ma"] == null || Request.QueryString["Ma"].ToString() == "")
                {
                    //Đây là trường hợp thêm mới
                    btnLuu.Visible = false;
                    btnThemMoi.Visible = true;
                }
                else
                {
                    //đây là trường hợp sửa
                    btnLuu.Visible = true;
                    btnThemMoi.Visible = false;
                    txtMaAnh.Enabled = false;
                    //Đổ dữ liệu lên form
                    int ID = int.Parse(Request.QueryString["Ma"].ToString().Trim());
                    QLBHEntities db = new QLBHEntities();
                    Multimedia obj = db.Multimedia.FirstOrDefault(x => x.ID == ID);
                    if (obj != null)
                    {

                        txtMaAnh.Text = obj.ID.ToString();
                        txtTenAnh.Text = obj.Alt;
                        cmbMaHangHoa.Text = obj.MaHangHoa;
                    }
                }

            }
        }
        public void getTenHangHoa()
        {
            QLBHEntities db = new QLBHEntities();
            List<HangHoa> data = db.HangHoa.ToList<HangHoa>();
            //Hien thi len combobox
            cmbMaHangHoa.DataSource = data;
            cmbMaHangHoa.DataTextField = "TenHangHoa";
            cmbMaHangHoa.DataValueField = "MaHangHoa";
            //Render ma html
            cmbMaHangHoa.DataBind();
        }

        protected void btnThemMoi_Click(object sender, EventArgs e)
        {
            try
            {
                //Trường hợp thêm mới
                Multimedia obj = new Multimedia();
                obj.ID = Convert.ToInt32(txtMaAnh.Text);
                obj.Alt = txtTenAnh.Text;
                obj.MaHangHoa = cmbMaHangHoa.SelectedValue;
                //lưu dữ liệu vào db
                QLBHEntities db = new QLBHEntities();
                db.Multimedia.Add(obj);
                db.SaveChanges();
                string filename = "";
                if (imgSP.HasFile)
                {
                    string ext = Path.GetFileName(imgSP.FileName);
                    ext = ext.Split('.')[ext.Split('.').Length - 1];
                    // Tự sinh tên file đảm bảo tính duy nhất => Dùng thời gian upload file để sinh tên file
                    filename = DateTime.Now.ToString("yyyyMMddhhmmssffff") + "." + ext;
                    imgSP.SaveAs(Server.MapPath("~/UpLoads/") + filename);


                    obj.Url = filename;
                    db.Multimedia.Add(obj);
                    db.SaveChanges();
                }

                Response.Redirect("QLAnhSP.aspx");
            }
            catch
            {
                pnError.Visible = true;
            }
        }

        protected void btnLuu_Click(object sender, EventArgs e)
        {
            try
            {
                QLBHEntities db = new QLBHEntities();
                int ID = int.Parse(txtMaAnh.Text);
                Multimedia obj = db.Multimedia.FirstOrDefault(x => x.ID == ID);
                obj.ID = Convert.ToInt32(txtMaAnh.Text);
                obj.Alt = txtTenAnh.Text;
                obj.MaHangHoa = cmbMaHangHoa.SelectedValue;
                if (imgSP.HasFile)
                {
                    string ext = Path.GetFileName(imgSP.FileName);
                    ext = ext.Split('.')[ext.Split('.').Length - 1];
                    //Tự sinh tên file đảm bảo là duy nhất
                    string filename = DateTime.Now.ToString("yyyyMMddhhmmssffff") + "." + ext;
                    imgSP.SaveAs(Server.MapPath("~/UpLoads/") + filename);


                    obj.Url = filename;
                    db.Multimedia.Add(obj);
                    db.SaveChanges();

                }
                db.SaveChanges();

                Response.Redirect("QLAnhSP.aspx");
            }
            catch
            {
                pnError.Visible = true;
            }
        }
    }
}