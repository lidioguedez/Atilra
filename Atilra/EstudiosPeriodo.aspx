<%@ Page Title="" Language="C#" EnableEventValidation="false" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="EstudiosPeriodo.aspx.cs" Inherits="Atilra.EstudiosPeriodo" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <h1 class="mb-4">Estudios por período</h1>
            <p>Por favor ingrese el período (mes y año) para consultar la cantidad de pacientes y médicos que realizaron estudios:</p>
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group mb-3">
                        <label for="TextBoxMes">Mes:</label>
                        <asp:TextBox ID="TextBoxMes" runat="server" CssClass="form-control" ViewStateMode="Disabled"/>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group mb-3">
                        <label for="TextBoxAnio">Año:</label>
                        <asp:TextBox ID="TextBoxAnio" runat="server" CssClass="form-control" ViewStateMode="Disabled"/>
                    </div>
                </div>
            </div>
            <asp:Button ID="ButtonConsultar" runat="server" Text="Consultar" CssClass="btn btn-primary mx-2 mt-4 col-sm-1" OnClick="ButtonConsultar_Click" />
            <br />
            <asp:Label ID="LabelResult" runat="server" ForeColor="Green" CssClass="mt-3 d-block" />
        </div>

    </div>
</asp:Content>
