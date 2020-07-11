<%@ Page Title="" Language="C#" MasterPageFile="~/Client/Main.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="QLBH_BANDIENTHOAI.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function valid() {
            var username = document.getElementById("txtTaiKhoan").value;
            var password = document.getElementById("txtMatKhau").value;
            if (username.length == 0 || password.length == 0) {
                return false;
                alert('dang nhap that bai')
            }
            return true;
            alert('Dang nhap thanh cong')
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <a href="#"><i class="fa fa-home"></i>Home</a>
                        <span>Login</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Form Section Begin -->

    <!-- Register Section Begin -->
    <div class="register-login-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="login-form">
                        <h2>Login</h2>

                        <div>
                            <div class="group-input">
                                <asp:Label runat="server">Username or email address *: </asp:Label><br />
                                <asp:TextBox runat="server" ID="txtTaiKhoan" Font-Size="50px" Height="50px"></asp:TextBox>

                            </div>
                            <div class="group-input">
                                <asp:Label runat="server">Password*: </asp:Label><br />
                                <%--<input type="password" ID="txtMatKhau" Font-Size="50px" Height="50px" />--%>
                                <asp:TextBox type="password" runat="server" ID="txtMatKhau" Font-Size="50px" Height="50px"></asp:TextBox>

                            </div>
                            <div>
                                <asp:Label runat="server" ID="lbThongBao" CssClass="error"></asp:Label>
                            </div>
                            <div class="group-input gi-check">
                                <div class="gi-more">
                                    <label for="save-pass">
                                        Save Password
                                        <input type="checkbox" id="save-pass">
                                        <span class="checkmark"></span>
                                    </label>
                                    <a href="#" class="forget-pass">Forget your Password</a>
                                </div>
                            </div>
                            <div>
                                <asp:Button runat="server" CssClass="site-btn login-btn" Text="Sign In " Height="48px" OnClientClick="return valid();" OnClick="btnDangNhap_Click" Width="249px" />
                            </div>
                            <%-- <button type="submit" Cssclass="site-btn login-btn">Sign In</button>--%>
                        </div>
                        <div class="switch-login">
                            <a href="./register.html" class="or-login">Or Create An Account</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Register Form Section End -->

    <!-- Partner Logo Section Begin -->
    <div class="partner-logo">
        <div class="container">
            <div class="logo-carousel owl-carousel">
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="img/logo-carousel/logo-1.png" alt="">
                    </div>
                </div>
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="img/logo-carousel/logo-2.png" alt="">
                    </div>
                </div>
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="img/logo-carousel/logo-3.png" alt="">
                    </div>
                </div>
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="img/logo-carousel/logo-4.png" alt="">
                    </div>
                </div>
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="img/logo-carousel/logo-5.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Partner Logo Section End -->
</asp:Content>
