<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="QLAnhSP.aspx.cs" Inherits="QLBH_BANDIENTHOAI.Admin.QLAnhSP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .row{
            width:1300px;
        }
        .lb-warning{
            color:red;
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
                            <h2 class="pageheader-title">QUẢN LÝ MULTIMEDIA</h2>
                            
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                       
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Quản Lý Multimedia</a></li>
                                        
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
                                            <h4 class="mb-0">QUẢN LÝ ẢNH SẢN PHẨM</h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="needs-validation" novalidate="">
                                                
                                               
                             <asp:GridView  AutoGenerateColumns="false" runat="server" CssClass="table " ID="dgvAnh">
                    
                     <Columns>
                        <asp:BoundField HeaderText="ID Ảnh" DataField="ID" />
                    </Columns>
                    <Columns>
                       <asp:BoundField HeaderText="Tên Sản Phẩm" DataField="Alt"  />
                    

                    </Columns>
                    <Columns>
                        
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:Label runat="server">Ảnh Sản Phẩm</asp:Label>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Image ID="anh" runat="server" ImageUrl='<%# "~/UpLoads/"+Eval("Url") %>' width="160" Height="180"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <Columns>
                        <asp:BoundField  HeaderText="Mã Hàng Hóa" DataField="MaHangHoa"/>
                    </Columns>

                    
                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:Label runat="server">Chức năng</asp:Label>

                            </HeaderTemplate>
                            <ItemTemplate>
                                <a ID="btnSua" class="sua" href='<%# "QLAnhHHDetail.aspx?Ma=" + Eval("ID").ToString() %>'>Sửa</a>
                                <asp:LinkButton runat="server" ID="btnXoa" Text="Xóa" CssClass="lb-warning" CommandArgument='<%# Eval("ID").ToString() %>'
                                    OnClientClick="return checkDelete();" Oncommand="btnXoa_Command">

                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                            
				</asp:GridView>                 
                            <div><a href="QLAnhHHDetail.aspx" class="btn btn-primary" >Thêm mới</a></div>                    
                                            </div>
                                        </div>
                                            
                                    </div>
                                </div>
                               
                            </div>
                        </div>
                    </div>
                </div>

</asp:Content>
