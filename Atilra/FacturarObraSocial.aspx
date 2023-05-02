<%@ Page Title="" Language="C#" EnableEventValidation="false" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="FacturarObraSocial.aspx.cs" Inherits="Atilra.FacturarObraSocial" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h1 class="mb-4">Facturar a obra social</h1>
        <form>
            <div class="form-group">
                <label for="TextBoxObraSocialSigla">Obra social (sigla):</label>
                <asp:TextBox ID="TextBoxObraSocialSigla" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label for="TextBoxPeriodoInicio">Período de inicio:</label>
                <asp:TextBox ID="TextBoxPeriodoInicio" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label for="TextBoxPeriodoFin">Período de fin:</label>
                <asp:TextBox ID="TextBoxPeriodoFin" runat="server" CssClass="form-control" />
            </div>
            <asp:Button ID="ButtonFacturar" runat="server" Text="Facturar" CssClass="btn btn-primary mt-4" OnClick="ButtonFacturar_Click" />
        </form>
        <br />
        <asp:Label ID="LabelResult" runat="server" ForeColor="Green" />
    </div>
</asp:Content>