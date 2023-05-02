<%@ Page Title="Ingresar Estudios Programados" EnableEventValidation="false" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="IngresarEstudiosProgramados.aspx.cs" Inherits="Atilra.IngresarEstudiosProgramados" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-8 ">
                <h1 class="mb-4">Ingresar Estudios Programadoso</h1>
                <p>Por favor ingrese la información del estudio programado:</p>
                <form>
                    <div class="form-group">
                        <label for="txtNombreEstudio">Nombre del estudio:</label>
                        <asp:TextBox ID="txtNombreEstudio" runat="server" class="form-control" ViewStateMode="Disabled"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtDni">DNI del paciente:</label>
                        <asp:TextBox ID="txtDni" runat="server" class="form-control" ViewStateMode="Disabled"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtMatricula">Matrícula del médico:</label>
                        <asp:TextBox ID="txtMatricula" runat="server" class="form-control" ViewStateMode="Disabled"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtNombreInstituto">Nombre del instituto:</label>
                        <asp:TextBox ID="txtNombreInstituto" runat="server" class="form-control" ViewStateMode="Disabled"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtSigla">Sigla de la obra social:</label>
                        <asp:TextBox ID="txtSigla" runat="server" class="form-control" ViewStateMode="Disabled"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtCantidad">Cantidad de estudios:</label>
                        <asp:TextBox ID="txtCantidad" runat="server" class="form-control" ViewStateMode="Disabled"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtLapso">Lapso de días:</label>
                        <asp:TextBox ID="txtLapso" runat="server" class="form-control" ViewStateMode="Disabled"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" OnClick="ButtonIngresar_Click" class="btn btn-primary mt-4" />
                    <br />
                    <br />
                    <asp:Label ID="lblResult" runat="server" class="form-text text-muted"></asp:Label>
                </form>
                <br />
                <asp:Label ID="LabelResult" runat="server" ForeColor="Green" />
            </div>
        </div>
    </div>

</asp:Content>
