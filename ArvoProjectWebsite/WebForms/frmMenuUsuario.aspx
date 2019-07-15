﻿<%@ Page Title="" Language="C#" MasterPageFile="~/WebForms/MasterPage.Master" AutoEventWireup="true" CodeBehind="frmMenuUsuario.aspx.cs" Inherits="ArvoProjectWebsite.WebForms.frmMenuUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Assets/Styles/usuario.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <h4 class="text-light text-center bg-secondary"> MENÚ USUARIO</h4>
       
    <p>
        <asp:Label ID="lblNombreMenuUsuario" runat="server"></asp:Label>
    </p>
    <p>
        DNI:&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblDniMenuUsuario" runat="server"></asp:Label>
    </p>
    <p>
        EMAIL:&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblMailMenuUsuario" runat="server"></asp:Label>
    </p>
    <p>
        <asp:LinkButton ID="lbtnDireccionesMenuUsuario" runat="server" OnClick="lbtnDireccionesMenuUsuario_Click"><i class="fas fa-map-marker-alt"></i>&nbsp Direcciones</asp:LinkButton>
&nbsp;&nbsp;&nbsp;
        <asp:LinkButton ID="lbtnMdPMenuUsuario" runat="server" OnClick="lbtnMdPMenuUsuario_Click"><i class="far fa-credit-card"></i>&nbsp Medios de Pago</asp:LinkButton>
&nbsp;&nbsp;&nbsp;
        <asp:LinkButton ID="lbtnComprasMenuUsuario" runat="server" OnClick="lbtnComprasMenuUsuario_Click"><i class="fas fa-shopping-basket"></i>&nbsp Compras</asp:LinkButton>
    </p>
    

        <div class="tituloUsuario mb-2 bg-danger"> <asp:Label ID="lblMenuUsuario" runat="server" CssClass="text-light bold"></asp:Label></div>
       

    
    <div class="mt-1 mb-3 text-center">

        <asp:GridView ID="grdMenuUsuario" horizontalalign="Center" runat="server" AutoGenerateDeleteButton="True" CellPadding="15"  OnRowDeleting="grdMenuUsuario_RowDeleting"  OnSelectedIndexChanging="grdMenuUsuario_SelectedIndexChanging" OnRowDataBound="grdMenuUsuario_RowDataBound">
            <EditRowStyle BackColor="#3366FF" />
        </asp:GridView>
        <br />
        <asp:LinkButton CssClass="btn btn-primary" ID="lbtnAgregarMenuUsuario" runat="server" OnClick="lbtnAgregarMenuUsuario_Click" ToolTip="Agregar nuevo item." Visible="False">Agregar</asp:LinkButton>
        <br />
        <br />
        <asp:Label ID="lblCampo1" runat="server"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtCampo1" runat="server" Visible="False"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblValidarTarjeta" runat="server" style="font-size: small; color: #CC0000" Visible="False"></asp:Label>
        <br />
        <br />
        <asp:Label ID="lblCampo2" runat="server"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddlCampo2" runat="server" Visible="False">
        </asp:DropDownList>
        <br />
        <br />
        &nbsp;<asp:Label ID="lblCampo3" runat="server"></asp:Label>
&nbsp;&nbsp;&nbsp;
&nbsp;
        <asp:TextBox ID="txtCampo3" runat="server" Visible="False" MaxLength="30"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblValidarUsuario" runat="server" style="font-size: small; color: #CC0000"></asp:Label>
        <br />
        <br />
        &nbsp;<asp:Label ID="lblCampo4" runat="server" Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtCampo4" runat="server" Visible="False" Width="25px" MaxLength="2"></asp:TextBox>
        <asp:Label ID="lblSeparadorVenc" runat="server" Text="/" Visible="False"></asp:Label>
        <asp:TextBox ID="txtCampo4b" runat="server" Visible="False" Width="43px" MaxLength="4"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblValidarVencimiento" runat="server" style="font-size: small; color: #CC0000"></asp:Label>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:LinkButton CssClass="btn btn-primary" ID="lbtnAceptar" runat="server" OnClick="lbtnAceptar_Click" Visible="False">Aceptar</asp:LinkButton>
        <br />
        <br />
    </div>
</asp:Content>
