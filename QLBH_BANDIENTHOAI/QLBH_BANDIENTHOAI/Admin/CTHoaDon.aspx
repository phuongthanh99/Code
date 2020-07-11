<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="CTHoaDon.aspx.cs" Inherits="QLBH_BANDIENTHOAI.Admin.CTHoaDon" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="container-fluid  dashboard-content">
                <!-- ============================================================== -->
                <!-- pageheader -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="page-header">
                            <h2 class="pageheader-title">QUẢN LÝ CHI TIẾT HÓA ĐƠN BÁN</h2>
                            
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
            <asp:GridView AutoGenerateColumns="false" runat="server" CssClass="table table-bordered" ID="dgvCTHDBH">
                <Columns>
                    <asp:BoundField HeaderText="Mã CT hóa đơn bán" DataField="MaCTHDBan" />
                </Columns>
                <Columns>
                    <asp:BoundField HeaderText="Mã hàng hóa" DataField="MaHangHoa" />
                </Columns>
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label runat="server" >Tên hàng hóa</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# getTenHangHoa(Eval("MaHangHoa")) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <Columns>
                    <asp:BoundField  HeaderText="Số lượng" DataField="SoLuong"/>
                </Columns>
                <Columns>
                    <asp:BoundField  HeaderText="Đơn giá" DataField="DonGia"/>
                </Columns>
                <Columns>
                    <asp:BoundField  HeaderText="Thành tiền" DataField="ThanhTien"/>
                </Columns>
                <Columns>
                    <asp:BoundField  HeaderText="Mã CT khuyến mại" DataField="MaCTKM"/>
                </Columns>
                <Columns>
                    <asp:BoundField  HeaderText="Mã hóa đơn bán" DataField="MaHoaDonBan"/>
                </Columns>
            </asp:GridView>
        </div>
    </div>
       </div>
</asp:Content>
