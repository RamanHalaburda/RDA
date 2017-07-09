<%@ Page Title="Главная" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RepublicDatabaseAutoservice._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Республиканский реестр автосервисов</h1>
        <p class="lead">Вы открыли веб-сервис "Республиканский реестр автосервисов", разрабтанный компанией Byte-Protect</p>
        <p><a href="http://www.byte-protect.com/" class="btn btn-primary btn-lg">Узнать больше о компании &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Управяй своим автосервисом</h2>
            <p>
                Вы можете создать аккаунт владельца, добавить автосервис в реестр, добалвять и изменять информацию о нём.
            </p>
            <p>
                <a class="btn btn-default" href="~/Register">Перейти &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Ищи интересующие автосервисы</h2>
            <p>
                Веб-сервис предоставляет много фильтров для поиска интересующего автосервиса.
            </p>
            <p>
                <a class="btn btn-default" href="~/Search">Перейти &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Оставляй пожелания и отзывы</h2>
            <p>
                Вы можете написать отзыв об автосервисе, в который вы обратились за услугами. Также можно добавить пожелания по усовершенствованию.
            </p>
            <p>
                <!--<a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>-->
            </p>
        </div>
    </div>

</asp:Content>
