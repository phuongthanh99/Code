using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBH_BANDIENTHOAI.Admin
{
    public partial class QLAnhSPDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getMaHangHoa();
                //Kiem tra xem la trường hợp sửa hay là thêm mới
                if (Request.QueryString["ID"] == null || Request.QueryString["ID"].ToString() == "")
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
                   int ID= int.Parse (Request.QueryString["ID"]);
                    QLBHEntities db = new QLBHEntities();
                    Multimedia obj = db.Multimedia.FirstOrDefault(x => x.ID == ID);
                    if (obj != null)
                    {
                        cmbMaHangHoa.SelectedValue = obj.MaHangHoa.ToString();
                        txtTenAnh.Text = obj.Alt;
                        txtMaAnh.Text = obj.ID.ToString();
                      
                        
                       
                    }
                }
            }
        }
        public void getMaHangHoa()
        {
            QLBHEntities db = new QLBHEntities();
            List<HangHoa> data = db.HangHoa.ToList<HangHoa>();
            //Hien thi len combobox
           cmbMaHangHoa.DataSource = data;
            cmbMaHangHoa.DataTextField = "TenHangHoa";
           cmbMaHangHoa.DataValueField = "MaHangHoa";
           
            cmbMaHangHoa.DataBind();
        }

        protected void btnThemMoi_Click(object sender, EventArgs e)
        {
            try
            {
                //Trường hợp thêm mới
                Multimedia obj = new Multimedia();
                obj.MaHangHoa = cmbMaHangHoa.SelectedValue;
                obj.Alt = txtTenAnh.Text;
                obj.ID = Convert.ToInt32(txtMaAnh.Text);

                
                
                ////lưu dữ liệu vào db
                QLBHEntities db = new QLBHEntities();
                //db.HangHoa.Add(obj);
                //db.SaveChanges();
                ////Upload file về sever
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
                int ID = Convert.ToInt32(txtMaAnh.Text);
                Multimedia obj = db.Multimedia.FirstOrDefault(x => x.ID == ID);
                obj.Alt = txtTenAnh.Text;
                obj.MaHangHoa = cmbMaHangHoa.SelectedValue;

                //Upload file về sever

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
                Response.Redirect("QLAnhSP.aspx");

            }
            catch
            {
                pnError.Visible = true;
            }
        }
    }
}