<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="QLHangHoa.aspx.cs" Inherits="QLBH_BANDIENTHOAI.Admin.QLHangHoa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .row{
            width:1100px;
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
                            <h2 class="pageheader-title">QUẢN LÝ HÀNG HÓA</h2>
                            
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                       
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Quản Lý Hàng Hóa</a></li>
                                        
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
                        <!-- ============================================================== -->
                        <!-- validation form -->
                        <!-- ============================================================== -->
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="card">
                                <h5 class="card-header">Quản Lý Hàng Hóa</h5>
                                <div class="card-body">
                                    <div class="needs-validation" novalidate>
                                        <div class="row">
                                            
                        <asp:GridView  AutoGenerateColumns="false" runat="server" CssClass="table " ID="dgvHangHoa">
                    <Columns>
                        <asp:BoundField HeaderText="Mã hàng hóa" DataField="MaHangHoa" />
                    </Columns>
                    <Columns>
                       <asp:BoundField HeaderText="Tên hàng hóa" DataField="TenHangHoa" />
                    </Columns>
                          
                    <Columns>
                        <asp:BoundField  HeaderText="Số Lượng Tồn" DataField="SoLuongTon"/>
                    </Columns>
                    <Columns>
                        <asp:BoundField  HeaderText="Đơn Giá" DataField="DonGia"/>
                    </Columns>

                    <Columns>
                        <asp:BoundField  HeaderText="Đơn Vị Tính" DataField="DonViTinh"/>
                    </Columns>
                    
                     <Columns>
                        <asp:BoundField  HeaderText="Mã Loại" DataField="MaLoai"/>
                    </Columns>
                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:Label runat="server">Tên  Loại</asp:Label>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# getTenLoai(Eval("MaLoai")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <Columns>
                        <asp:BoundField  HeaderText="Mô Tả" DataField="MoTa"/>
                    </Columns>
                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:Label runat="server">Chức năng</asp:Label>

                            </HeaderTemplate>
                            <ItemTemplate>
                                <a ID="btnSua" class="sua" href='<%# "QLHangHoaDetail.aspx?Ma=" + Eval("MaHangHoa").ToString() %>'>Sửa</a>
                                <asp:LinkButton runat="server" ID="btnXoa" Text="Xóa" CssClass="lb-warning" CommandArgument='<%# Eval("MaHangHoa").ToString() %>'
                                    OnClientClick="return checkDelete();" Oncommand="btnXoa_Command">

                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
				</asp:GridView>
                                             
                         <div>
                              <a href="QLHangHoaDetail.aspx" class="btn btn-primary" >Thêm mới</a>
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
</asp:Content>
