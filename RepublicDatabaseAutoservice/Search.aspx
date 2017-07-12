<%@ Page Title="Поиск" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="RepublicDatabaseAutoservice.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<link href="Content/FilterStyle.css" rel="stylesheet" type="text/css" />

    <br>

    <div ID="filters">
        <div class="fblocks">
            <asp:Label  ID="Label1" runat="server" Text="Область" CssClass="flabel"></asp:Label>
            <asp:DropDownList ID="ddlRegion" runat="server" CssClass="fields" OnSelectedIndexChanged="ddlRegion_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
        
            <br>

            <asp:Label  ID="Label2" runat="server" Text="Район" CssClass="flabel"></asp:Label>
            <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="fields" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>

            <br>

            <asp:Label  ID="Label3" runat="server" Text="Город" CssClass="flabel"></asp:Label>
            <asp:DropDownList ID="ddlCity" runat="server" CssClass="fields"></asp:DropDownList>
        </div>

        <div class="fblocks">
            <asp:Label  ID="Label4" runat="server" Text="Марка" CssClass="flabel"></asp:Label>
            <asp:DropDownList ID="ddlBrand" runat="server" CssClass="fields" OnSelectedIndexChanged="ddlBrand_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
        
            <br>

            <asp:Label  ID="Label5" runat="server" Text="Модель" CssClass="flabel"></asp:Label>
            <asp:DropDownList ID="ddlModel" runat="server" CssClass="fields"></asp:DropDownList>
        </div>

        <div class="fblocks">
            <asp:Label  ID="Label6" runat="server" Text="Категория работ" CssClass="flabel"></asp:Label>
            <asp:DropDownList ID="ddlCategory" runat="server" CssClass="fields"></asp:DropDownList>
        </div>

        <div class="fblocks">
            <asp:Label  ID="Label7" runat="server" Text="Возраст авто" CssClass="flabel"></asp:Label>
            <asp:TextBox ID="tbAge" runat="server" CssClass="fields"></asp:TextBox>

            <br>

            <asp:Label  ID="Label8" runat="server" Text="Страна" CssClass="flabel"></asp:Label>
            <asp:DropDownList ID="ddlCountry" runat="server" CssClass="fields"></asp:DropDownList>
        </div>

        <br>
        <asp:Button ID="btnSearch" runat="server" Text="Поиск" CssClass="btnsearch" />
    </div>

    <p>
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
    </p>

    

    
</asp:Content>