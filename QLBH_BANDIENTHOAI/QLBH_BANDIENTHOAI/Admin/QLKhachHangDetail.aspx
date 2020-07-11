<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="QLKhachHangDetail.aspx.cs" Inherits="QLBH_BANDIENTHOAI.Admin.QLKhachHangDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid  dashboard-content">
    <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="page-header">
                            <h2 class="pageheader-title">QUẢN LÝ THÔNG TIN KHÁCH HÀNG</h2>
                            
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Quản Lý Khách hàng</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Quản Lý Thông Tin Khách Hàng</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
   <div class="row">
                        <!-- ============================================================== -->
                        <!-- valifation types -->
                        <!-- ============================================================== -->
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="card">
                                <h5 class="card-header">Thêm Nhân Viên</h5>
                                <div class="card-body">
                                    <div id="validationform" data-parsley-validate="" novalidate="">
                                        <asp:Panel runat="server" ID="pnError" Visible="false" class="alert alert-danger" >
								            Lỗi nhập liệu, vui lòng kiểm tra lại dữ lệu!
							            </asp:Panel>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Mã Khách Hàng</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                                <asp:TextBox runat="server" ID="txtmaKhachHang" CssClass="form-control"></asp:TextBox>
									            <span class="help-block">Vd: KH1</span>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Tên Khách Hàng</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                              	<asp:TextBox runat="server" ID="txtTenKhachHang" CssClass="form-control"></asp:TextBox>
									<span class="help-block">Vd: Đinh Thị B</span>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Số Điện Thoại</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                                <asp:TextBox runat="server" ID="txtSoDienThoai" CssClass="form-control"></asp:TextBox>
									<span class="help-block">Vd: Admin</span>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Giới Tính</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                                <asp:TextBox runat="server" ID="txtGioiTinh" CssClass="form-control"></asp:TextBox>
									<span class="help-block">Vd:Nam</span>
                                            </div>
                                        </div>
                                       <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Loại Khách Hàng</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                                <asp:TextBox runat="server" ID="txtLoaiKH" CssClass="form-control"></asp:TextBox>
									<span class="help-block">Vd:1</span>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group row text-right">
                                            <div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
                                               <asp:Button  runat="server" ID="btnHuy" Text="Hủy" class="btn btn-space btn-secondary"/>
									<asp:Button runat="server" ID="btnThemMoi" Onclick="btnThemMoi_Click" Text="Thêm Mới" class="btn btn-space btn-primary"  />
									<asp:Button CssClass="btn btn-primary" runat="server" ID="btnLuu" Text="Lưu lại"
										OnClientClick="return CheckLuu()"
										Onclick="btnLuu_Click"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ============================================================== -->
                        <!-- end valifation types -->
                        <!-- ============================================================== -->
                    </div>
          </div>
</asp:Content>
