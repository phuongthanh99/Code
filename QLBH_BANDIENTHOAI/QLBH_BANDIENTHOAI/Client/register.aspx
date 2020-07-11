<%@ Page Title="" Language="C#" MasterPageFile="~/Client/Main.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="QLBH_BANDIENTHOAI.Client.register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <a href="#"><i class="fa fa-home"></i>Home</a>
                        <span>Register</span>
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
                    <div class="register-form">
                        <h2>Register</h2>
                        <div>

                            <div class="group-input">
                                <%-- <asp:Label runat="server">Username or email address *: </asp:Label><br />
                                <asp:TextBox runat="server" ID="txtTaiKhoan" Font-Size="50px" Height="50px"></asp:TextBox>--%>
                                <asp:Label runat="server">Username or email address *: </asp:Label><br />
                                <asp:TextBox runat="server" ID="txtTaiKhoan" Font-Size="50px" Height="50px"></asp:TextBox>
                            </div>
                            <div class="group-input">
                                <asp:Label runat="server">Password*: </asp:Label><br />
                                
                                <asp:TextBox runat="server"  type="password" ID="txtMatKhau" Font-Size="50px" Height="50px"></asp:TextBox>
                            </div>
                            <div class="group-input">
                                <asp:Label runat="server">Pass Confim *: </asp:Label><br />
                                <asp:TextBox runat="server"  type="password" ID="txtConPass" Font-Size="50px" Height="50px"></asp:TextBox>
                            </div>
                            <div>
                                <asp:Label runat="server" ID="lbThongBao" CssClass="error"></asp:Label>
                            </div>
                            <asp:Button runat="server" CssClass="site-btn register-btn" Text="REGISTER" Height="48px" OnClientClick="return register();" OnClick="btnDangKy_Click" Width="249px" />
                            <%--<button type="submit" class="site-btn register-btn">REGISTER</button>--%>
                        </div>
                        <div class="switch-login">
                            <a href="./login.html" class="or-login">Or Login</a>
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
