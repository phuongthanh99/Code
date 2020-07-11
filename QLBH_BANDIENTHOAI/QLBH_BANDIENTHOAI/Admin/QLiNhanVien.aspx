<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="QLiNhanVien.aspx.cs" Inherits="QLBH_BANDIENTHOAI.Admin.QLiNhanVien" %>
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
                            <h2 class="pageheader-title">QUẢN LÝ TÀI KHOẢN</h2>
                            
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                       
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Quản Lý Tài Khoản</a></li>
                                        
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
                                            <h4 class="mb-0">Quản Lý Tài Khoản Nhân Viên</h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="needs-validation" novalidate="">
                        <asp:GridView  AutoGenerateColumns="false" runat="server" CssClass="table " ID="dgvNhanVien">
                    <Columns>
                        <asp:BoundField HeaderText="Mã Nhân Viên" DataField="MaNhanVien" />
                    </Columns>
                            <Columns>

                       <asp:BoundField HeaderText="Tên Nhân viên" DataField="TenNhanVien" />
                    </Columns>
                    <Columns>

                       <asp:BoundField HeaderText="Mật Khẩu" DataField="MatKhau" />
                    </Columns>
                    <Columns>
                        <asp:BoundField  HeaderText="Số Điện Thoại" DataField="SoDienThoai"/>
                    </Columns>
                    

                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:Label runat="server">Chức năng</asp:Label>

                            </HeaderTemplate>
                            <ItemTemplate>
                                <a ID="btnSua"  class="sua" href='<%# "QLiNhanVienDetail.aspx?Ma=" + Eval("MaNhanVien").ToString() %>'>Sửa</a>
                                <asp:LinkButton runat="server" ID="btnXoa" Text="Xóa" CssClass="lb-warning" CommandArgument='<%# Eval("MaNhanVien").ToString() %>'
                                    OnClientClick="return checkDelete();" Oncommand="btnXoa_Command">

                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
				</asp:GridView>
                                             
                             <div>
                                 <a href="QLiNhanVienDetail.aspx" class="btn btn-primary" >Thêm mới</a>
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
