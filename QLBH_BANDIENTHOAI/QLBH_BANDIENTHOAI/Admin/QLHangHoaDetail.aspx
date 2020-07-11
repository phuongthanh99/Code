<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="QLHangHoaDetail.aspx.cs" Inherits="QLBH_BANDIENTHOAI.Admin.QLHangHoaDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="container-fluid  dashboard-content">
    <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="page-header">
                            <h2 class="pageheader-title">Quản lý chi tiết hàng hóa</h2>
                            
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Quản Lý Hàng Hóa</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Quản Lý Chi Tiết Hàng Hóa</li>
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
                                <h5 class="card-header">Thêm Hàng Hóa</h5>
                                <div class="card-body">
                                    <div id="validationform" data-parsley-validate="" novalidate="">
                                        <asp:Panel runat="server" ID="pnError" Visible="false" class="alert alert-danger" >
								            Lỗi nhập liệu, vui lòng kiểm tra lại dữ lệu!
							            </asp:Panel>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Mã Hàng Hóa</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                                <asp:TextBox runat="server" ID="txtMaHangHoa" CssClass="form-control"></asp:TextBox>
									            <span class="help-block">Vd: DD0001</span>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Tên Hàng Hóa</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                              	<asp:TextBox runat="server" ID="txtTenHangHoa" CssClass="form-control"></asp:TextBox>
									<span class="help-block">Vd: Bộ Ngủ Dành Cho Nữ</span>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Số Lượng Tồn</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                                <asp:TextBox runat="server" ID="txtSoLuongTon" CssClass="form-control"></asp:TextBox>
									<span class="help-block">Vd: 35</span>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Đơn Giá</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                                <asp:TextBox runat="server" ID="txtDonGia" CssClass="form-control"></asp:TextBox>
									<span class="help-block">Vd:450000</span>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Đơn Vị Tính</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                                <asp:TextBox runat="server" ID="txtDonViTinh" CssClass="form-control"></asp:TextBox>
									<span class="help-block">Vd: Chiếc</span>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Mã Loại</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                         <asp:DropDownList runat="server" ID="cmbMaLoai" CssClass="form-control"></asp:DropDownList>
									<span class="help-block">Vd:Men</span>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Mô Tả</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                               <asp:TextBox runat="server" ID="txtMoTa" CssClass="form-control"></asp:TextBox>
									<span class="help-block">Vd:Sơ Mi Nữ Dài Tay</span>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Ảnh Sản Phẩm</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                               <asp:FileUpload runat="server" CssClass="form-control" ID="fuAnhHH"/>
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
