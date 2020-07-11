<%@ Page Title="" Language="C#" MasterPageFile="~/Client/Main.Master" AutoEventWireup="true" CodeBehind="shopping-cart.aspx.cs" Inherits="QLBH_BANDIENTHOAI.Client.shopping_cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <% if (Session["shoppingcart"] == null || ((List<QLBH_BANDIENTHOAI.CartItem>)Session["shoppingcart"]).Count == 0)
        { %>
    <p>
        Giỏ hàng rỗng
    </p>
    <% } %>
    <% else { %>
    <table style="width:100%;border:1px solid #808080";>
        <thead>
            <tr style="border:1px solid #808080";>
                <th>Hình</th>
                <th>Tên sản phẩm</th>
                <th>Đơn giá</th>
                <th>Số lượng</th>
                <th>Thành tiền</th>
            </tr>
           
        </thead>
       <% foreach (var cardItem in Session["shoppingcart"] as List<QLBH_BANDIENTHOAI.CartItem>) { %>
        <tr style="border:1px solid #808080";>
            <td><img src="/UpLoads/<%= cardItem.Hinh %>" width="70" height="70" /></td>
            <td> <%= cardItem.TenHangHoa %></td>
            <td> <%= cardItem.DonGia %> đ</td>
            <td> <%= cardItem.SoLuongTon %></td>
            <td> <%= cardItem.ThanhTien.ToString("#,##0") %> đ</td>

            <td> <a title="Tăng số lượng" href="/EditCartItem.aspx?id=<%= cardItem.MaHangHoa %>&change=plus" style="text-decoration:none" class="btn btn-default" ><span class="fa fa-plus"></span></a></td>
            <td> <a title="Giảm số lượng" href="/EditCartItem.aspx?id=<%= cardItem.MaHangHoa %>&change=minus" style="text-decoration:none" class="btn btn-default" ><span class="fa fa-minus"></span></a></td>
            <td> 
                <a onclick="return confirm('Bạn có chắc muốn bỏ sản phẩm này khỏi giỏ hàng?');" href="DeleteCartItem?id=<%= cardItem.MaHangHoa %>" style="text-decoration:none" class="btn btn-default" ><span class="fa fa-trash-o"></span> Xóa</a>
               
            </td>
     
        </tr>
        <% } %>
        <tr style="border:1px solid #808080"; >
            <td></td>
            <td></td>
            <td> Tổng số lượng: </td>
            <td> <%= ((List<QLBH_BANDIENTHOAI.CartItem>)Session["shoppingcart"]).Sum(m => m.SoLuongTon) %> sản phẩm</td>
            <td> Tổng thành tiền: </td>
            <td> <%= ((List<QLBH_BANDIENTHOAI.CartItem>)Session["shoppingcart"]).Sum(m => m.ThanhTien) %> đồng</td>
            <td></td>
            <td></td>
        </tr>
    </table>
    <% } %> 
</asp:Content>
