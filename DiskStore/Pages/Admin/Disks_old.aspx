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
                        <th>Артист</th>
                        <th>Страна</th>
                        <th>Стиль</th>
                        <th>Альбом</th>
                        <th>Год</th>
                        <th>Лейбл</th>
                        <th>Номер</th>
                        <th>Лицензия</th>
                        <th>Цена</th>
                        <th>Конверт</th>
                        <th>Буклет</th>
                        <th>Картинка</th>
                        <th>Треки</th>
                        <th>Категория</th>
                        <th>Количество</th>
                    </tr>
                    <tr runat="server" id="itemPlaceholder"></tr>
                </table>
            </div>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Item.Artist %></td>
                <td><%# Item.Country %></td>
                <td><%# Item.Style %></td>
                <td><%# Item.Album %></td>
                <td><%# Item.Year %></td>
                <td><%# Item.Label %></td>
                <td><%# Item.Number %></td>
                <td><%# Item.Licensing %></td>
                <td><%# Item.Price.ToString("c") %></td>
                <td><%# Item.Cover %></td>
                <td><%# Item.Booklet %></td>
                <td><%# Item.Picture %></td>
                <td class="description"><span><%# Item.Tracks %></span></td>
                <td><%# Item.Category %></td>
                <td><%# Item.Quantity.ToString() %></td>
                <td>
                    <asp:Button ID="Button1" CommandName="Edit" Text="Изменить" runat="server" />
                    <asp:Button ID="Button2" CommandName="Delete" Text="Удалить" runat="server" />
                </td>
            </tr>
        </ItemTemplate>
        <EditItemTemplate>
            <tr>
                <td><input name="ProductID" value="<%# Item.Id %>" />
                <input name="name" value="<%# Item.Artist %>" /></td>
                <td><input name="country" value="<%# Item.Country %>" /></td>
                <td><input name="style" value="<%# Item.Style %>" /></td>
                <td><input name="album" value="<%# Item.Album %>" /></td>
                <td><input name="year" value="<%# Item.Year %>" /></td>
                <td><input name="label" value="<%# Item.Label %>" /></td>
                <td><input name="number" value="<%# Item.Number %>" /></td>
                <td><input name="licensing" value="<%# Item.Licensing %>" /></td>
                <td><input name="price" value="<%# Item.Price %>" /></td>
                <td><input name="cover" value="<%# Item.Cover %>" /></td>
                <td><input name="booklet" value="<%# Item.Booklet %>" /></td>
                <td><input name="picture" value="<%# Item.Picture %>" /></td>
                <td><input name="description" value="<%# Item.Tracks %>" /></td>
                <td><input name="category" value="<%# Item.Category %>" /></td>
                <td><input name="quantity" value="<%# Item.Quantity %>" /></td>
                    <asp:Button ID="Button3" CommandName="Update" Text="Обновить" runat="server" />
                    <asp:Button ID="Button4" CommandName="Cancel" Text="Отмена" runat="server" />
                </td>
            </tr>
        </EditItemTemplate>
        <InsertItemTemplate>
            <tr>
                
                <td><input name="ProductID" value="0" />                      
                    <input name="name" /> </td>
                <td>
                    <input name="country" /></td>
                <td>
                    <input name="style" /></td>
                <td>
                    <input name="album" /></td>
                <td>
                    <input name="year" /></td>
                <td>
                    <input name="label" /></td>
                <td>
                    <input name="number" /></td>
                <td>
                    <input name="licensing" /></td>
                <td>
                    <input name="price" /></td>
                <td>
                    <input name="cover" /></td>
                <td>
                    <input name="booklet" /></td>
                <td>
                    <input name="picture" /></td>
                <td>
                    <input name="tracks" /></td>
                <td>
                    <input name="category" /></td>
                <td>
                    <input name="quantity" /></td>
                <td>
                    <asp:Button ID="Button5" CommandName="Insert" Text="Вставить" runat="server" />
                </td>
            </tr>
        </InsertItemTemplate>
    </asp:ListView>
</asp:Content>

 

