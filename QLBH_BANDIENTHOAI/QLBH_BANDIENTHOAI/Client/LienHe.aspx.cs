using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

namespace QLBH_BANDIENTHOAI.Client
{
    public partial class LienHe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void send_Click(object sender, EventArgs e)
        {
            try
            {
                SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                client.EnableSsl = true;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                client.Credentials = new NetworkCredential("@gmail.com", "password");
                MailMessage msgobj = new MailMessage();
                msgobj.To.Add(txtEmail.Text);
                msgobj.From = new MailAddress("@gmail.com");
                msgobj.Subject = txtName.Text;
                msgobj.Body = txtMeg.Text;
                client.Send(msgobj);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('message send successfull');", true);
            }
            catch (Exception ex)
            {
                Response.Write("Couldnot send email" + ex.Message);
            }
        }
    }
}