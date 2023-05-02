<%@ Page Title="" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="IngresarActualizarPrecios.aspx.cs" Inherits="Atilra.IngresarActualizarPrecios" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <h1 class="mb-4">Ingresar o actualizar precios de estudios</h1>
            <p>Por favor ingrese la información del estudio y el precio:</p>
            <div>
                <div class="form-group mb-3">
                    <label for="TextBoxNombreEstudio">Nombre del estudio:</label>
                    <asp:TextBox ID="TextBoxNombreEstudio" runat="server" CssClass="form-control" />
                </div>
                <div class="form-group mb-3">
                    <label for="TextBoxNombreInstituto">Nombre del instituto:</label>
                    <asp:TextBox ID="TextBoxNombreInstituto" runat="server" CssClass="form-control" />
                </div>
                <div class="form-group mb-3">
                    <label for="TextBoxPrecio">Precio:</label>
                    <asp:TextBox ID="TextBoxPrecio" runat="server" CssClass="form-control" />
                </div>
                <asp:Button ID="ButtonIngresarActualizar" runat="server" Text="Ingresar o actualizar" CssClass="btn btn-primary mt-4" OnClick="ButtonIngresarActualizar_Click" CausesValidation="false"/>
            </div>
            <br />
            <asp:Label ID="LabelResult" runat="server" ForeColor="Green" CssClass="mt-3 d-block" />
        </div>

    </div>


</asp:Content>
