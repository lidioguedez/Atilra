<%--<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="_Default.aspx.cs" Inherits="Atilra._Default" %>--%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>    
         <div class="container mt-5">
            <h1 class="text-center mb-4">Consulta de Pacientes con Cobertura</h1>
            <div class="d-flex justify-content-center">
                <asp:Button ID="btnConsultar" runat="server" Text="Consultar" OnClick="btnConsultar_Click" CssClass="btn btn-primary" />
            </div>
            <asp:GridView ID="gvResultados" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-hover mt-4">
                <HeaderStyle CssClass="thead-dark" />
                <Columns>
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="Apellido" HeaderText="Apellido" />
                    <asp:BoundField DataField="ObraSocial" HeaderText="Obra Social" />
                    <asp:BoundField DataField="PlanID" HeaderText="Plan" />
                    <asp:BoundField DataField="ImporteAbonado" HeaderText="Importe Abonado" />
                </Columns>
            </asp:GridView>
        </div>
    </main>

</asp:Content>
