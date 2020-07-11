using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBH_BANDIENTHOAI.Admin
{
    public partial class QLHangHoaDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getLoaiHangHoa();
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
                    txtMaHangHoa.Enabled = false;
                    //Đổ dữ liệu lên form
                    string MaHangHoa = Request.QueryString["Ma"].ToString();
                    QLBHEntities db = new QLBHEntities();
                    HangHoa obj = db.HangHoa.FirstOrDefault(x => x.MaHangHoa == MaHangHoa);
                    if (obj != null)
                    {
                        txtMaHangHoa.Text = obj.MaHangHoa;
                        txtTenHangHoa.Text = obj.TenHangHoa;
                        txtSoLuongTon.Text = obj.SoLuongTon.ToString();
                        txtDonGia.Text = obj.DonGia.ToString();
                        txtDonViTinh.Text = obj.DonViTinh;
                        cmbMaLoai.SelectedValue = obj.MaLoai.ToString();
                        txtMoTa.Text = obj.MoTa;
                    }
                }
            }
        }
        public void getLoaiHangHoa()
        {
           QLBHEntities db = new QLBHEntities();
            List<LoaiHangHoa> data = db.LoaiHangHoa.ToList<LoaiHangHoa>();
            //Hien thi len combobox
            cmbMaLoai.DataSource = data;
            cmbMaLoai.DataTextField = "TenLoai";
            cmbMaLoai.DataValueField = "MaLoai";
            //Render ma html
            cmbMaLoai.DataBind();
        }

        protected void btnThemMoi_Click(object sender, EventArgs e)
        {
            try
            {
                //Trường hợp thêm mới
                HangHoa obj = new HangHoa();
                obj.MaHangHoa = txtMaHangHoa.Text;
                obj.TenHangHoa = txtTenHangHoa.Text;
                obj.SoLuongTon = Convert.ToInt32(txtSoLuongTon.Text);
                obj.DonGia = Convert.ToInt32(txtDonGia.Text);
                obj.DonViTinh = txtDonViTinh.Text;
                obj.MaLoai = (cmbMaLoai.SelectedValue);
                obj.MoTa = txtMoTa.Text;
                //lưu dữ liệu vào db
                QLBHEntities db = new QLBHEntities();
                db.HangHoa.Add(obj);
                db.SaveChanges();
                //Upload file về sever
                string filename = "";
                if (fuAnhHH.HasFile)
                {
                    string ext = Path.GetFileName(fuAnhHH.FileName);
                    ext = ext.Split('.')[ext.Split('.').Length - 1];
                    // Tự sinh tên file đảm bảo tính duy nhất => Dùng thời gian upload file để sinh tên file
                    filename = DateTime.Now.ToString("yyyyMMddhhmmssffff") + "." + ext;
                    fuAnhHH.SaveAs(Server.MapPath("~/UpLoads/") + filename);
                    Multimedia newobj = new Multimedia();
                    newobj.MaHangHoa = obj.MaHangHoa;
                    newobj.Alt = obj.TenHangHoa;
                    newobj.Url = filename;
                    db.Multimedia.Add(newobj);
                    db.SaveChanges();
                }

                Response.Redirect("QLHangHoa.aspx");
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
                string MaHangHoa = txtMaHangHoa.Text;
                HangHoa obj = db.HangHoa.FirstOrDefault(x => x.MaHangHoa == MaHangHoa);
                obj.MaHangHoa = txtMaHangHoa.Text;
                obj.TenHangHoa = txtTenHangHoa.Text;
                obj.SoLuongTon = Convert.ToInt32(txtSoLuongTon.Text);
                obj.DonGia = Convert.ToInt32(txtDonGia.Text);
                obj.DonViTinh = txtDonViTinh.Text;
                obj.MaLoai = (cmbMaLoai.SelectedValue);
                obj.MoTa = txtMoTa.Text;
                //lưu dữ liệu vào db

                db.SaveChanges();

                //Upload file về sever

                if (fuAnhHH.HasFile)
                {
                    string ext = Path.GetFileName(fuAnhHH.FileName);
                    ext = ext.Split('.')[ext.Split('.').Length - 1];
                    //Tự sinh tên file đảm bảo là duy nhất
                    string filename = DateTime.Now.ToString("yyyyMMddhhmmssffff") + "." + ext;
                    fuAnhHH.SaveAs(Server.MapPath("~/UpLoads/") + filename);
                    Multimedia newobj = new Multimedia();
                    newobj.MaHangHoa = obj.MaHangHoa;
                    newobj.Alt = obj.TenHangHoa;
                    newobj.Url = filename;
                    db.Multimedia.Add(newobj);
                    db.SaveChanges();

                }
                Response.Redirect("QLHangHoa.aspx");

            }
            catch
            {
                pnError.Visible = true;
            }
        }
    }
}