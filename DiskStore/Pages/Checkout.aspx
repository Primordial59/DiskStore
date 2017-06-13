<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="DiskStore.Pages.Checkout" 
     MasterPageFile="~/Pages/Store.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="bodyContent" runat="server">
    <div id="content">

        <div id="checkoutForm" class="checkout" runat="server">
            <h2>Оформить заказ</h2>
            Пожалуйста, введите свои данные, и мы обработаем Ваш заказ прямо сейчас!

        <div id="errors" data-valmsg-summary="true">
            <ul>
                <li style="display:none"></li>
            </ul>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        </div>

            <h3>Заказчик</h3>
            <div>
                <label for="family">Фамилия:</label>
              <!--  <input id="family" name="family" data-val="true" data-val-required="Введите имя"/>-->
                <SX:VInput Property="Family" runat="server" /> 
            </div>
                <div>
                <label for="name">Имя:</label>
                <SX:VInput Property="Name" runat="server"/>
            </div>
           <div>
                <label for="secondName">Отчество:</label>
                <SX:VInput Property="SecondName" runat="server"/>
            </div>
            <div>
                <label for="email">Электронная почта:</label>
                <SX:VInput Property="EMail" runat="server"/>
            </div>

            <h3>Адрес доставки</h3>
            <div>
                <label for="index">Индекс:</label>
                <SX:VInput Property="Index" runat="server"/>
            </div>
            <div>
                <label for="city">Город:</label>
                <SX:VInput Property="City" runat="server"/>
            </div>
            <div>
                <label for="address">Адрес:</label>
                <SX:VInput Property="Address" runat="server"/>
            </div>
            
            <h3>Детали заказа</h3>
            <input type="checkbox" id="giftwrap" name="giftwrap" value="true" />
            Использовать подарочную упаковку?
        
        <p class="actionButtons">
            <button class="actionButtons" type="submit">Обработать заказ</button>
        </p>
        </div>
        <div id="checkoutMessage" runat="server">
            <h2>Спасибо!</h2>
            Спасибо что выбрали наш магазин! Мы постараемся максимально быстро обработать Ваш заказ   
        </div>
    </div>
</asp:Content>
