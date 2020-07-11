<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="QLAnhSPDetail.aspx.cs" Inherits="QLBH_BANDIENTHOAI.Admin.QLAnhSPDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid  dashboard-content">
    <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="page-header">
                            <h2 class="pageheader-title">Quản Lý Chi Tiết Ảnh Sản Phẩm</h2>
                            
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Quản Lý Ảnh Sản Phẩm</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Quản Lý Chi Tiết Ảnh Sản Phẩm</li>
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
                                <h5 class="card-header">Quản Lý Chi Tiết Ảnh Sản Phẩm</h5>
                                <div class="card-body">
                                    <div id="validationform" data-parsley-validate="" novalidate="">
                                        <asp:Panel runat="server" ID="pnError" Visible="false" class="alert alert-danger" >
								            Lỗi nhập liệu, vui lòng kiểm tra lại dữ lệu!
							            </asp:Panel>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Mã ảnh</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                                <asp:TextBox runat="server" ID="txtMaAnh" CssClass="form-control"></asp:TextBox>
									            <span class="help-block">Vd:1</span>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Tên ảnh</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                              	<asp:TextBox runat="server" ID="txtTenAnh" CssClass="form-control"></asp:TextBox>
									<span class="help-block">Vd:Áo len lửng</span>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Url</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                                <asp:FileUpload runat="server" CssClas="form-control" ID="imgSP"/>
								
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Mã hàng hóa</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                                <asp:DropDownList runat="server" ID="cmbMaHangHoa" CssClass="form-control"></asp:DropDownList>
									            <span class="help-block">Vd:HH01</span>
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
