<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Disks.aspx.cs" Inherits="DiskStore.Pages.Admin.Disks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:ListView ID="ListView1" ItemType="DiskStore.Models.Disk" SelectMethod="GetDisks"
        DataKeyNames="Id" UpdateMethod="UpdateDisk" DeleteMethod="DeleteDisk"
        InsertMethod="InsertDisk" InsertItemPosition="LastItem" EnableViewState="false"
        runat="server">
        <LayoutTemplate>
            <div class="outerContainer">
                <table id="productsTable">
                    <tr>
                        <th>Id</th>
                        <th>Артист</th>
                        <th>Год</th>
                        <th>Цена</th>
                        <th>Количество</th>
                    </tr>
                    <tr runat="server" id="itemPlaceholder"></tr>
                </table>
            </div>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
              
                <td><%# Item.Id %></td> 
                <td><%# Item.Artist %></td>

                <td><%# Item.Year.ToString() %></td>
                <td><%# Item.Price.ToString("c") %></td>
                <td><%# Item.Quantity.ToString() %></td>
                <td>
                    <asp:Button ID="Button1" CommandName="Edit" Text="Изменить" runat="server" />
                    <asp:Button ID="Button2" CommandName="Delete" Text="Удалить" runat="server" />
                </td>
            </tr>
        </ItemTemplate>
        <EditItemTemplate>
            <tr>
                
                <td> <input name="id" value="<%# Item.Id %>" /></td>
                <td><input name="artist" value="<%# Item.Artist %>" /></td>
                <td><input name="year" value="<%# Item.Year %>" /></td>
                <td><input name="price" value="<%# Item.Price %>" /></td>
                <td><input name="quantity" value="<%# Item.Quantity %>" /></td>
                <td>
                    <asp:Button ID="Button3" CommandName="Update" Text="Обновить" runat="server" />
                    <asp:Button ID="Button4" CommandName="Cancel" Text="Отмена" runat="server" />
                </td>
            </tr>
        </EditItemTemplate>
        <InsertItemTemplate>
            <tr>
               
                <td><input name="id" value="0" /></td> 
                <td><input name="artist" /></td>
                <td><input name="year" /></td>
                <td><input name="price" /></td>
                <td><input name="quantity" /></td>
                <td>
                    <asp:Button ID="Button5" CommandName="Insert" Text="Вставить" runat="server" />
                </td>
            </tr>
        </InsertItemTemplate>
    </asp:ListView>
</asp:Content>

 

