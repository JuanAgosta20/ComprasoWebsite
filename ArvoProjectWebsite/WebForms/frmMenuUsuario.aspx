﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmMenuUsuario.aspx.cs" Inherits="ArvoProjectWebsite.WebForms.frmMenuUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MENÚ USUARIO</p>
        <p>
            <asp:Label ID="lblNombreMenuUsuario" runat="server"></asp:Label>
        </p>
        <p>
            &nbsp;DNI:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblDniMenuUsuario" runat="server"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;
            <asp:LinkButton  ID="lbtnModificarDniMenuUsuario" runat="server" >Modificar</asp:LinkButton>
        </p>
        <p>
            MAIL:&nbsp;&nbsp;&nbsp; <asp:Label ID="lblMailMenuUsuario" runat="server"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="lbtnModificarMailMenuUsuario" runat="server">Modificar</asp:LinkButton>
        </p>
        <p>
            Direcciones</p>
        <p>
            <asp:ListBox ID="lstDireccionesMenuUsuarios" runat="server"></asp:ListBox>
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnEditarMenuUsuarios" runat="server" Text="Editar" />
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnEliminarMenuUsuarios" runat="server" Text="Eliminar" />
        </p>
        <p>
            Metodos de Pago</p>
        <p>
            <asp:ListBox ID="lstMdePagoMenuUsuarios" runat="server"></asp:ListBox>
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnEditarMdPagoMenuUsuarios" runat="server" Text="Editar" />
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnEliminarMdePagoMenuUsuarios" runat="server" Text="Eliminar" />
        </p>
        <p>
            <asp:LinkButton ID="lbtnComprasMenuUsuarios" runat="server">Compras</asp:LinkButton>
        </p>
    </form>
</body>
</html>
