<%@ Page Title="Pacientes más viejos con patrón de apellido" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="PacientesViejosApellido.aspx.cs" Inherits="Atilra.PacientesViejosApellido" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Pacientes más viejos con patrón de apellido</h2>
    <asp:TextBox ID="TextBoxPatronApellido" runat="server" CssClass="form-control" placeholder="Ingrese el patrón del apellido"></asp:TextBox>
    <asp:Button ID="ButtonBuscar" runat="server" CssClass="btn btn-primary mt-2" Text="Buscar" OnClick="ButtonBuscar_Click" />
    <div class="row">
        <div class="col-sm-6">
             <asp:GridView ID="GridViewPacientesViejosApellido" runat="server" CssClass="table table-striped table-hover" AutoGenerateColumns="true"></asp:GridView>
        </div>
    </div>
</asp:Content>
