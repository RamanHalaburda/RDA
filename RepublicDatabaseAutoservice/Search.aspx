<%@ Page Title="Поиск" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="RepublicDatabaseAutoservice.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div style="margin-top:5px">
    <div class="smallfont" style="margin-bottom:2px">
        <input type="button" value="Показать" style="width:45px;font-size:10px;margin:0px;padding:0px;" onClick="if (this.parentNode.parentNode.getElementsByTagName('div')[1].getElementsByTagName('div')[0].style.display != '') { this.parentNode.parentNode.getElementsByTagName('div')[1].getElementsByTagName('div')[0].style.display = ''; this.innerText = ''; this.value = 'Скрыть'; } else { this.parentNode.parentNode.getElementsByTagName('div')[1].getElementsByTagName('div')[0].style.display = 'none'; this.innerText = ''; this.value = 'Показать'; }"> 
        <b> По области</b>
    </div>
    <div class="alt2" style="margin: 0px; padding: 6px; border: 1px inset;">
        <div style="display: none;">
            <asp:Label ID="Label1" runat="server" Text="По области"></asp:Label>
            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl2_SelectedIndexChanged"></asp:DropDownList>
            <br>
            <asp:Button ID="Button1" runat="server" Text="Найти" />
        </div>
    </div>
</div>

<div style="margin-top:5px">
    <div class="smallfont" style="margin-bottom:2px">
        <input type="button" value="Показать" style="width:45px;font-size:10px;margin:0px;padding:0px;" onClick="if (this.parentNode.parentNode.getElementsByTagName('div')[1].getElementsByTagName('div')[0].style.display != '') { this.parentNode.parentNode.getElementsByTagName('div')[1].getElementsByTagName('div')[0].style.display = ''; this.innerText = ''; this.value = 'Скрыть'; } else { this.parentNode.parentNode.getElementsByTagName('div')[1].getElementsByTagName('div')[0].style.display = 'none'; this.innerText = ''; this.value = 'Показать'; }"> 
        <b> По району</b>
    </div>
    <div class="alt2" style="margin: 0px; padding: 6px; border: 1px inset;">
        <div style="display: none;">
            <asp:Label ID="Label2" runat="server" Text="По району "></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br>
            <asp:Button ID="Button2" runat="server" Text="Найти" OnClick="Button2_Click" />
        </div>
    </div>
</div>

<div style="margin-top:5px">
    <div class="smallfont" style="margin-bottom:2px">
        <input type="button" value="Показать" style="width:45px;font-size:10px;margin:0px;padding:0px;" onClick="if (this.parentNode.parentNode.getElementsByTagName('div')[1].getElementsByTagName('div')[0].style.display != '') { this.parentNode.parentNode.getElementsByTagName('div')[1].getElementsByTagName('div')[0].style.display = ''; this.innerText = ''; this.value = 'Скрыть'; } else { this.parentNode.parentNode.getElementsByTagName('div')[1].getElementsByTagName('div')[0].style.display = 'none'; this.innerText = ''; this.value = 'Показать'; }"> 
        <b> По городу</b>
    </div>
    <div class="alt2" style="margin: 0px; padding: 6px; border: 1px inset;">
        <div style="display: none;">
            <asp:Label ID="Label3" runat="server" Text="По городу "></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br>
            <asp:Button ID="Button3" runat="server" Text="Найти" OnClick="Button3_Click" />
        </div>
    </div>
</div>

<div style="margin-top:5px">
    <div class="smallfont" style="margin-bottom:2px">
        <input type="button" value="Показать" style="width:45px;font-size:10px;margin:0px;padding:0px;" onClick="if (this.parentNode.parentNode.getElementsByTagName('div')[1].getElementsByTagName('div')[0].style.display != '') { this.parentNode.parentNode.getElementsByTagName('div')[1].getElementsByTagName('div')[0].style.display = ''; this.innerText = ''; this.value = 'Скрыть'; } else { this.parentNode.parentNode.getElementsByTagName('div')[1].getElementsByTagName('div')[0].style.display = 'none'; this.innerText = ''; this.value = 'Показать'; }"> 
        <b> По категории</b>
    </div>
    <div class="alt2" style="margin: 0px; padding: 6px; border: 1px inset;">
        <div style="display: none;">
            <asp:Label ID="Label4" runat="server" Text="По категории "></asp:Label>
            <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl3_SelectedIndexChanged"></asp:DropDownList>
            <br>
            <asp:Button ID="Button4" runat="server" Text="Найти" OnClick="Button4_Click" />
        </div>
    </div>
</div>

<div style="margin-top:5px">
    <div class="smallfont" style="margin-bottom:2px">
        <input type="button" value="Показать" style="width:45px;font-size:10px;margin:0px;padding:0px;" onClick="if (this.parentNode.parentNode.getElementsByTagName('div')[1].getElementsByTagName('div')[0].style.display != '') { this.parentNode.parentNode.getElementsByTagName('div')[1].getElementsByTagName('div')[0].style.display = ''; this.innerText = ''; this.value = 'Скрыть'; } else { this.parentNode.parentNode.getElementsByTagName('div')[1].getElementsByTagName('div')[0].style.display = 'none'; this.innerText = ''; this.value = 'Показать'; }"> 
        <b> По марке и модели</b>
    </div>
    <div class="alt2" style="margin: 0px; padding: 6px; border: 1px inset;">
        <div style="display: none;">
            <asp:Label ID="Label5" runat="server" Text="Бренд: "></asp:Label>
            <asp:DropDownList ID="DropDownList4" runat="server"></asp:DropDownList>
            <br>
            <asp:Label ID="Label6" runat="server" Text="Модель:"></asp:Label>
            <asp:DropDownList ID="DropDownList5" runat="server"></asp:DropDownList>
            <br>
            <asp:Button ID="Button5" runat="server" Text="Найти" OnClick="Button5_Click" />
        </div>
    </div>
</div>

<div style="margin-top:5px">
    <div class="smallfont" style="margin-bottom:2px">
        <input type="button" value="Показать" style="width:45px;font-size:10px;margin:0px;padding:0px;" onClick="if (this.parentNode.parentNode.getElementsByTagName('div')[1].getElementsByTagName('div')[0].style.display != '') { this.parentNode.parentNode.getElementsByTagName('div')[1].getElementsByTagName('div')[0].style.display = ''; this.innerText = ''; this.value = 'Скрыть'; } else { this.parentNode.parentNode.getElementsByTagName('div')[1].getElementsByTagName('div')[0].style.display = 'none'; this.innerText = ''; this.value = 'Показать'; }"> 
        <b> По марке</b>
    </div>
    <div class="alt2" style="margin: 0px; padding: 6px; border: 1px inset;">
        <div style="display: none;">
            <asp:Label ID="Label7" runat="server" Text="Марка: "></asp:Label>

            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true"
                OnSelectedIndexChanged="ddl1_SelectedIndexChanged">
            </asp:DropDownList>
            
            <br>
            <asp:Button ID="Button6" runat="server" Text="Найти" OnClick="Button6_Click" />
        </div>
    </div>
</div>

<div style="margin-top:5px">
    <div class="smallfont" style="margin-bottom:2px">
        <input type="button" value="Показать" style="width:45px;font-size:10px;margin:0px;padding:0px;" onClick="if (this.parentNode.parentNode.getElementsByTagName('div')[1].getElementsByTagName('div')[0].style.display != '') { this.parentNode.parentNode.getElementsByTagName('div')[1].getElementsByTagName('div')[0].style.display = ''; this.innerText = ''; this.value = 'Скрыть'; } else { this.parentNode.parentNode.getElementsByTagName('div')[1].getElementsByTagName('div')[0].style.display = 'none'; this.innerText = ''; this.value = 'Показать'; }"> 
        <b> По возрасту авто</b>
    </div>
    <div class="alt2" style="margin: 0px; padding: 6px; border: 1px inset;">
        <div style="display: none;">
            <asp:Label ID="Label8" runat="server" Text="Возраст: "></asp:Label>
            <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
            <br>
            <asp:Button ID="Button7" runat="server" Text="Найти" OnClick="Button7_Click" />            
        </div>
    </div>
</div>

<div style="margin-top:5px">
    <div class="smallfont" style="margin-bottom:2px">
        <input type="button" value="Показать" style="width:45px;font-size:10px;margin:0px;padding:0px;" onClick="if (this.parentNode.parentNode.getElementsByTagName('div')[1].getElementsByTagName('div')[0].style.display != '') { this.parentNode.parentNode.getElementsByTagName('div')[1].getElementsByTagName('div')[0].style.display = ''; this.innerText = ''; this.value = 'Скрыть'; } else { this.parentNode.parentNode.getElementsByTagName('div')[1].getElementsByTagName('div')[0].style.display = 'none'; this.innerText = ''; this.value = 'Показать'; }"> 
        <b> По возрасту автомобиля и стране</b>
    </div>
    <div class="alt2" style="margin: 0px; padding: 6px; border: 1px inset;">
        <div style="display: none;">
            <asp:Label ID="Label9" runat="server" Text="Возраст: "></asp:Label>
            <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
            <br>
            <asp:Label ID="Label10" runat="server" Text="Страна-производитель: "></asp:Label>
            <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
            <br>
            <asp:Button ID="Button8" runat="server" Text="Найти" OnClick="Button8_Click" />
        </div>
    </div>
</div>

<p>
    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
</p>
</asp:Content>