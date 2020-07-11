<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="QLBH_BANDIENTHOAI.Admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="TemplateAdmin/assets/vendor/bootstrap/css/bootstrap.min.css"/>
    <link href="TemplateAdmin/assets/vendor/fonts/circular-std/style.css" rel="stylesheet"/>
    <link rel="stylesheet" href="TemplateAdmin/assets/libs/css/style.css"/>
    <link rel="stylesheet" href="TemplateAdmin/assets/vendor/fonts/fontawesome/css/fontawesome-all.css"/>
    <style>
    html,
    body {
        height: 100%;
    }

    body {
        display: -ms-flexbox;
        display: flex;
        -ms-flex-align: center;
        align-items: center;
        padding-top: 40px;
        padding-bottom: 40px;
        margin-left:550px;
    }
     .error{
            color: red;
            font-style: italic;
        }
        .dangnhap{
            width:150px;
            height:40px;
            margin-left:100px;
        }
    </style>
   <script>
        function valid() {
            var username = document.getElementById("txtTaiKhoan").value;
            var password = document.getElementById("txtMatKhau").value;
            if (username.length == 0 || password.length == 0) {
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
       <div class="splash-container">
        <div class="card ">
            <div class="card-header text-center"><a href="../index.html"><img class="logo-img" src="TemplateAdmin/assets/images/logo.png" alt="logo"/></a><span class="splash-description">Please enter your user information.</span></div>
            <div class="card-body">
                <div>
                    <div class="form-group">
                        <label for="emailaddress">Tài Khoản :</label>
                         <asp:TextBox runat="server" ID="txtTaiKhoan" Width="263px"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="emailaddress">Mật Khẩu :</label>
                      <asp:TextBox runat="server" ID="txtMatKhau" Width="263px"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        
                    <div>
                  <asp:Label runat="server" ID="lbThongBao" CssClass="error"></asp:Label>
                    </div>
                <div class="form-group row text-center mt-4 mb-4">
                <div class="col-12">

                   </div>
                    <asp:Button runat="server" ID="btnDangNhap" Text="Đăng nhập" OnClientClick="return valid();" Onclick="btnDangNhap_Click" CssClass="dangnhap" />

                   </div>
            </div>
            <div class="card-footer bg-white p-0  ">
                </div>
                    </div>
            </div>
        </div>
    </div>
  
    <!-- ============================================================== -->
    <!-- end login page  -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <script src="TemplateAdmin/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="TemplateAdmin/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    </form>
</body>
</html>
