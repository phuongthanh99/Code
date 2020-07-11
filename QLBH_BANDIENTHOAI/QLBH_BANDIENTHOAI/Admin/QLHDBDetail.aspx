<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="QLHDBDetail.aspx.cs" Inherits="QLBH_BANDIENTHOAI.Admin.QLHDBDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function checkLuu() {
            if (confirm('Bạn chắc chắn muốn lưu k?') == true) {
                return true;
            }
            else {
                return false;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid  dashboard-content">
    <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="page-header">
                            <h2 class="pageheader-title">QUẢN LÝ THÔNG TIN HÓA ĐƠN BÁN</h2>
                            
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Quản Lý Hóa Đơn Bán</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Quản Lý Thông Tin Hóa Đơn Ba</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
         </div>
    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <div class="card">
            
              <div class="login-panel panel panel-default">
                <div class="panel-body">
                    <div role="form">
                        <asp:Panel runat="server" ID="pnError" Visible="false" class="alert alert-danger">
                            Lỗi nhập liệu, vui lòng kiểm tra lại dữ liệu!
                        </asp:Panel>
                        <div class="form-group row">
                             <label class="col-12 col-sm-3 col-form-label text-sm-right"> Mã Hóa Đơn</label>
                              <div class="col-12 col-sm-8 col-lg-6">
                                <asp:TextBox runat="server" ID="txtMaHoaDonBan" CssClass="form-control"></asp:TextBox>
                                <span class="help-block">VD:1</span>
                            </div>
                        </div>
                        <div class="form-group row">
                             <label class="col-12 col-sm-3 col-form-label text-sm-right"> Mã Nhân Viên</label>
                              <div class="col-12 col-sm-8 col-lg-6">
                                <asp:DropDownList runat="server" ID="cmbMaNhanVien" CssClass="form-control"></asp:DropDownList>
                                <span class="help-block">VD:NV001</span>
                            </div>
                        </div>
                                                                
                         <div class="form-group row">
                             <label class="col-12 col-sm-3 col-form-label text-sm-right"> Mã Khách Hàng</label>
                              <div class="col-12 col-sm-8 col-lg-6">
                                <asp:DropDownList runat="server" ID="cmbMaKhachHang" CssClass="form-control"></asp:DropDownList>
                                <span class="help-block">VD:KH2</span>
           
                            </div>
                        </div>
                        <div class="form-group row">
                             <label class="col-12 col-sm-3 col-form-label text-sm-right">Ngày Bán</label>
                              <div class="col-12 col-sm-8 col-lg-6">
                                <asp:TextBox runat="server" ID="txtNgayBan" CssClass="form-control"></asp:TextBox>
                                <span class="help-block">VD:20-03-2020</span>
                            </div>
                        </div>
                        <div class="form-group row">
                             <label class="col-12 col-sm-3 col-form-label text-sm-right">Mã CTKM</label>
                              <div class="col-12 col-sm-8 col-lg-6">
                                <asp:DropDownList runat="server" ID="cmbMaCTKM" CssClass="form-control"></asp:DropDownList>
                               <span class="help-block">VD:Sale cuối tuần</span>
                            </div>
                        </div>
                        
                             <div class="form-group row">
                             <label class="col-12 col-sm-3 col-form-label text-sm-right">Tổng Tiền</label>
                              <div class="col-12 col-sm-8 col-lg-6">
                                <asp:TextBox runat="server" ID="txtTongTien" CssClass="form-control"></asp:TextBox>
                                <span class="help-block">VD:100000</span>
                            </div>
                        </div>
                       <div class="form-group row text-right">
                                            <div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
                                <asp:Button runat="server" CssClass="btn btn-white" ID="btnHuy" Text="Hủy" />
                                <asp:Button CssClass="btn btn-primary" runat="server" ID="btnThemMoi" Text="Thêm mới"
                                   OnClientClick="return CheckLuu()"
                                   OnClick="btnThemMoi_Click"/>
                                <asp:Button CssClass="btn btn-primary" runat="server" ID="btnLuu" Text="Lưu lại"
                                   OnClientClick="return CheckLuu()"
                                   OnClick="btnLuu_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
      </div>
         
    </div>
</asp:Content>
