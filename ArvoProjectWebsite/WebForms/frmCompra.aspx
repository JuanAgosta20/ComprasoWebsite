﻿<%@ Page Title="Continuar Compra" Language="C#" MasterPageFile="~/WebForms/MasterPage.Master" AutoEventWireup="true" CodeBehind="frmCompra.aspx.cs" Inherits="ArvoProjectWebsite.WebForms.frmCompra" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="/Assets/Styles/Compras.css" rel="stylesheet" />
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  
    <asp:MultiView ID="multi" runat="server">
<asp:View ID="vista1" runat="server">
    <div class="general">
     <div style="margin-left: 40px">
     <asp:Label ID="lblMetodo" runat="server" Text="Seleccione tipo de tarjeta" EnableTheming="True" CssClass="label1"></asp:Label>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <asp:DropDownList ID="ddlMetodopago" runat="server" DataTextField="Nombre_TARJ" DataValueField="IDTarjeta_TARJ" OnSelectedIndexChanged="ddlMetodopago_SelectedIndexChanged" AutoPostBack="True" class="">
    </asp:DropDownList>

<asp:Label ID="lblErrormetodo" runat="server" Font-Names="Britannic Bold" Font-Size="Medium" Font-Strikeout="False" ForeColor="Red" Text="*Elija una opción"></asp:Label>
         <br />
         <br />
         <asp:Label ID="llblCuotas" runat="server" Text="Cantidad de cuotas"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    <asp:DropDownList ID="ddlCuotas" runat="server" AutoPostBack="True">
    </asp:DropDownList>
<asp:Label ID="lblErrorncuota" runat="server" Font-Names="Britannic Bold" Font-Size="Medium" Font-Strikeout="False" ForeColor="Red" Text="*Elija una opción" ></asp:Label>
         <br />
    <asp:GridView ID="grdCompra" runat="server" HorizontalAlign="Right" OnRowDataBound="GridView1_RowDataBound" ShowFooter="True" CssClass="text-center" OnRowCreated="grdCompra_RowCreated">
        <Columns>
            <asp:ImageField DataImageUrlField="RutaImagen">
                <ControlStyle  CssClass="miniatura" />
            </asp:ImageField>
            <asp:BoundField DataField="Subtotal" HeaderText="Subtotal" FooterText="Total:" />
        </Columns>
    </asp:GridView>

     </div>
     <br />

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<asp:Label ID="lblNrotarjeta" runat="server" Text="Nro Tarjeta"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="txtNrotarjeta" runat="server" OnTextChanged="txtNrotarjeta_TextChanged" ToolTip="Solo números, no puede quedar vacío" AutoPostBack="True" Width="148px" OnLoad="txtNrotarjeta_Load"></asp:TextBox>
<asp:Label ID="lblErrorntar" runat="server" Font-Names="Britannic Bold" Font-Size="Medium" Font-Strikeout="False" ForeColor="Red" Text="*Valor erróneo."></asp:Label>


     <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


<asp:CheckBox ID="chbGuardartarj" runat="server" Text="Guardar tarjeta" AutoPostBack="True" style="top: 134px; left: 112px" OnCheckedChanged="chbGuardartarj_CheckedChanged" />
     <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
<asp:Label ID="lblVto" runat="server" Text="Ingrese vencimiento" ></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtVencimiento" runat="server" Width="105px" AutoPostBack="True" TextMode="DateTime" ToolTip="Fecha de vencimiento">dd/mm/aaaa</asp:TextBox>
 <asp:Label ID="lblErrorfecha" runat="server" Font-Names="Britannic Bold" Font-Size="Medium" Font-Strikeout="False" ForeColor="Red" Text="*Valor erróneo."></asp:Label>
     <br />
     <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Label ID="lblTarjGuardadas" runat="server" Text="Tarjetas guardadas"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:DropDownList ID="ddlTarxu" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlTarxu_SelectedIndexChanged" OnLoad="ddlTarxu_Load" OnPreRender="ddlTarxu_PreRender">
    </asp:DropDownList>
<asp:Label ID="lblErrorntartarus" runat="server" Font-Names="Britannic Bold" Font-Size="Medium" Font-Strikeout="False" ForeColor="Red" Text="*Elija una opción"></asp:Label>

     <br />

     <br />

 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

 <asp:Label ID="lblDireccion" runat="server" Text="Direccion de envío"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="ddlDireccion" runat="server" OnSelectedIndexChanged="ddlDireccion_SelectedIndexChanged" AutoPostBack="True">
    </asp:DropDownList>
    <asp:Label ID="lblErrorDire" runat="server" Font-Names="Britannic Bold" Font-Size="Medium" Font-Strikeout="False" ForeColor="Red" Text="*Elija una opción"></asp:Label>

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:LinkButton ID="lbtnCargardir" runat="server" OnClick="lbtnCargardir_Click">Cargar dirección.</asp:LinkButton>

     <br />

     <br />

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<asp:Label ID="lblEnvio" runat="server" Text="Costo de envío"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <asp:Label ID="lblPrecioEnvio" runat="server"></asp:Label>
     <br />
     <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Costo total&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Label ID="lblCostoTotal" runat="server"></asp:Label>

     <br />

     <br />

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<asp:LinkButton CssClass="btn btn-danger" ID="lbtnCancelar" runat="server" OnClick="lbtnCancelar_Click">Cancelar compra</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:LinkButton CssClass="btn btn-success" ID="lbtnComprar" runat="server" OnClick="lbtnComprar_Click" OnClientClick="" OnPreRender="lbtnComprar_PreRender">Confirmar compra</asp:LinkButton>
        <br />
        <br />
</div>
</asp:View>
    <asp:View ID ="Vista2" runat="server">
        <div class="text-center">
            <br />
            <br />
            <br />
            <br />
            <asp:Label ID="lblCompraExitosa" runat="server" Text="La compra ha sido exitosa !! Lo/a esperamos de vuelta!! :D" Font-Bold="True" Font-Names="Comic Sans MS" Font-Size="X-Large" ForeColor="#336600"></asp:Label>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:LinkButton ID="lnbtnHastapronto" runat="server" CssClass="btn btn-success" OnClick="lnbtnHastapronto_Click">Hasta pronto!</asp:LinkButton>
            <br />
            <br />
        </div>
    </asp:View>
</asp:MultiView>
</asp:Content>
