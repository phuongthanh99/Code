<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="QLKhachHang.aspx.cs" Inherits="QLBH_BANDIENTHOAI.Admin.QLKhachHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .row{
            width:1150px;
        }
        .lb-warning{
            color:red;
        }
        .sua{
            color:blue;
        }
    </style>
     <script>
        function checkDelete() {
            if (confirm("Bạn có muốn xóa không?") == true){
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
                <!-- ============================================================== -->
                <!-- pageheader -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="page-header">
                            <h2 class="pageheader-title">QUẢN LÝ THÔNG TIN KHÁCH HÀNG</h2>
                            
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                       
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Quản Lý Tài Khoản</a></li>
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Quản Lý Tài Khoản Khách Hàng</a></li>
                                        
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- end pageheader -->
                <!-- ============================================================== -->
             
                     <div class="row">
                        <div class="offset-xl-2 col-xl-8 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4 class="mb-0">Quản Lý Tài Khoản Khách Hàng</h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="needs-validation" novalidate="">
                        <asp:GridView  AutoGenerateColumns="false" runat="server" CssClass="table " ID="dgvKhachHang">
                    <Columns>
                        <asp:BoundField HeaderText="Mã Khách Hàng" DataField="MaKhachHang" />
                    </Columns>
                            <Columns>

                       <asp:BoundField HeaderText="Tên Khách Hàng" DataField="TenKhachHang" />
                    </Columns>
                    <Columns>

                       <asp:BoundField HeaderText="Số Điện Thoại" DataField="SoDienThoai" />
                    </Columns>
                    <Columns>
                        <asp:BoundField  HeaderText="Giới Tính" DataField="GioiTinh"/>
                    </Columns>
                    <Columns>
                        <asp:BoundField  HeaderText="Loại Khách Hàng" DataField="LoaiKH"/>
                    </Columns>

                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:Label runat="server">Chức năng</asp:Label>

                            </HeaderTemplate>
                            <ItemTemplate>
                                <a ID="btnSua"  class="sua" href='<%# "QLKhachHangDetail.aspx?Ma=" + Eval("MaKhachHang").ToString() %>'>Sửa</a>
                                <asp:LinkButton runat="server" ID="btnXoa" Text="Xóa" CssClass="lb-warning" CommandArgument='<%# Eval("MaKhachHang").ToString() %>'
                                    OnClientClick="return checkDelete();" Oncommand="btnXoa_Command">

                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
				</asp:GridView>
                                             
                             <div>
                                 <a href="QLKhachHangDetail.aspx" class="btn btn-primary" >Thêm mới</a>
                             </div>         
                        
                                                </div>
                                           
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ============================================================== -->
                        <!-- end validation form -->
                        <!-- ============================================================== -->
                    </div>
                </div>
         </div>
</asp:Content>
