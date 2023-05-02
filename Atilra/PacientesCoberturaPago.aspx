<%@ Page Title="Pacientes con cobertura que pagaron estudios" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="PacientesCoberturaPago.aspx.cs" Inherits="Atilra.PacientesCoberturaPago" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Pacientes con cobertura que pagaron estudios</h2>
    <div class="row">
        <div class="col-sm-6">
            <asp:GridView ID="GridViewPacientesCoberturaPago" runat="server" CssClass="table table-striped table-hover" AutoGenerateColumns="true">

            </asp:GridView>
        </div>
    </div>
</asp:Content>
