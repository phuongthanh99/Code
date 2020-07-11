<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="QLHoaDonBan.aspx.cs" Inherits="QLBH_BANDIENTHOAI.Admin.QLHoaDonBan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .lb-warning{
            color:red;
        }
        #btnSua{
            color:blue;
        }
    </style>
    <script>
        function checkDelete() {
            if (confirm('Bạn chắc chắn muốn xóa?') == true) {
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
                            <h2 class="pageheader-title">QUẢN LÝ HÓA ĐƠN BÁN</h2>
                            
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                       
                                        
                                        
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <div class="card">
        <asp:GridView AutoGenerateColumns="false" runat="server" CssClass="table table-bordered" ID="dgvHoaDonBan">
            <Columns>
                <asp:BoundField HeaderText="Mã hóa đơn bán " DataField="MaHoaDonBan"/>
            </Columns>
            <Columns>
                <asp:BoundField HeaderText="Mã nhân viên" DataField="MaNhanVien" />
            </Columns>
            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:Label runat="server" >Tên nhân viên</asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# getTenNhanVien(Eval("MaNhanVien")) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <Columns>
                <asp:BoundField  HeaderText="Mã khách hàng" DataField="MaKhachHang"/>
            </Columns>
            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:Label runat="server">Tên khách hàng</asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# getTenKhachHang(Eval("MaKhachHang")) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <Columns>
                <asp:BoundField  HeaderText="Ngày bán"  DataField="NgayBan"/>
            </Columns>
            <Columns>
                <asp:BoundField HeaderText="Mã CT khuyến mại"  DataField="MaCTKM"/>
            </Columns>
            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:Label runat="server">Tên CT khuyến mại</asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# getTenCTKM(Eval("MaCTKM")) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <Columns>
                <asp:BoundField HeaderText="Tổng tiền " DataField="TongTien"/>
            </Columns>
            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:Label runat="server">Chức năng</asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        
                        <a id="btnSua" href='<%#" QLHDBDetail.aspx?Ma="+Eval("MaHoaDonBan").ToString() %>'>Sửa</a>
                        <asp:LinkButton runat="server" ID="btnXoa" Text="Xóa" CssClass="lb-warning"
                           CommandArgument='<%# Eval("MaHoaDonBan").ToString() %>'
                           OnClientClick="return checkDelete();"
                            OnCommand="btnXoa_Command"></asp:LinkButton>
                        <a id="btnHienthi" href='<%# "CTHoaDon.aspx?Ma=" + Eval("MaHoaDonBan").ToString() %>'>Show</a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        </div>
         <a href="QLHDBDetail.aspx" class="btn btn-primary">Thêm mới</a>
    </div>
         </div>
</asp:Content>
