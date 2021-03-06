﻿<%@ Page Language="C#" Title="Menú Administración" MaintainScrollPositionOnPostback="true" MasterPageFile="~/WebForms/MasterPage.Master" AutoEventWireup="true" CodeBehind="frmMenuAdmin.aspx.cs" Inherits="ArvoProjectWebsite.frmMenuAdmin" %>

<script runat="server">

    protected void btnStats_Click(object sender, EventArgs e)
    {

    }
</script>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="bg-secondary">
        <h4 class="text-light text-center">MENÚ ADMINISTRADOR</h4>
    </div>
    <br />
    <p>

        <asp:Button ID="btnProductos" runat="server" Text="Productos" CssClass="btn btn-primary ml-3" OnClick="btnProductos_Click" Font-Bold="True" />
        <asp:Button ID="btnMarcas" runat="server" Text="Marcas" CssClass="btn btn-success ml-3" OnClick="btnMarcas_Click" Font-Bold="True" />
        <asp:Button ID="btnVentas" runat="server" Text="Ventas" CssClass="btn btn-danger ml-3" OnClick="btnVentas_Click" Font-Bold="True" />
        <asp:Button ID="btnEstadist" runat="server" Text="Estadísticas" CssClass="btn btn-info ml-3" OnClick="btnEstadist_Click" Font-Bold="True" />

    </p>

    <div>
        <asp:MultiView ID="MultiViewAdmin" runat="server">
            <asp:View ID="ViewProductos" runat="server">

                <p>
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"><i class="fas fa-plus-circle"></i> &nbsp Agregar producto</asp:LinkButton>
                </p>

                <div class="container-fluid mb-3">

                    <asp:Label ID="lblError" runat="server" Font-Italic="True" ForeColor="Red" Text="Label" Visible="False"></asp:Label>

                    <asp:Table ID="AgregarProducto" runat="server" Width="77%" Visible="False" CssClass="mb-3">
                        <asp:TableRow runat="server" TableSection="TableHeader" BackColor="#3366FF" Font-Bold="True" ForeColor="White" CssClass="text-center">
                            <asp:TableCell runat="server">Id Producto</asp:TableCell>
                            <asp:TableCell runat="server">Nombre</asp:TableCell>
                            <asp:TableCell runat="server">Categoria</asp:TableCell>
                            <asp:TableCell runat="server">Subcategoria</asp:TableCell>
                            <asp:TableCell runat="server">Marca</asp:TableCell>
                            <asp:TableCell runat="server">Stock</asp:TableCell>
                            <asp:TableCell runat="server">Precio</asp:TableCell>
                            <asp:TableCell runat="server">Descuento</asp:TableCell>
                            <asp:TableCell runat="server">ACTIVO</asp:TableCell>
                            <asp:TableCell runat="server">Descripción</asp:TableCell>
                            <asp:TableCell runat="server"></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow runat="server" CssClass="text-center">
                            <asp:TableCell CssClass="campo" runat="server">
                                <asp:TextBox ID="txtIdProd" runat="server"></asp:TextBox>
                            </asp:TableCell>
                            <asp:TableCell runat="server">
                                <asp:TextBox ID="txtNombreProd" runat="server"></asp:TextBox>
                            </asp:TableCell>

                            <asp:TableCell runat="server">
                                <asp:DropDownList ID="ddlCategorias" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCategorias_SelectedIndexChanged"></asp:DropDownList>
                            </asp:TableCell>
                            <asp:TableCell runat="server">
                                <asp:DropDownList ID="ddlSubcat" runat="server" AutoPostBack="true"></asp:DropDownList>
                            </asp:TableCell>
                            <asp:TableCell runat="server">
                                <asp:DropDownList ID="ddlMarcas" runat="server"></asp:DropDownList>
                            </asp:TableCell>
                            <asp:TableCell runat="server">
                                <asp:TextBox ID="txtStock" runat="server"></asp:TextBox>
                            </asp:TableCell>

                            <asp:TableCell runat="server">
                                <asp:TextBox ID="txtPrecio" runat="server"></asp:TextBox>
                            </asp:TableCell>
                            <asp:TableCell runat="server">
                                <asp:TextBox ID="txtDescuento" runat="server"></asp:TextBox>
                            </asp:TableCell>
                            <asp:TableCell runat="server">
                                <asp:CheckBox ID="chkActivo" runat="server" />
                            </asp:TableCell>
                            <asp:TableCell runat="server">
                                <asp:TextBox ID="txtDescripcion" runat="server"></asp:TextBox>


                            </asp:TableCell>
                            <asp:TableCell runat="server">
                                <asp:Button ID="btnAgregar" runat="server" Text="Agregar" OnClick="btnAgregar_Click1" />


                            </asp:TableCell>

                        </asp:TableRow>
                    </asp:Table>

                    <br />
                    <asp:Table ID="Table1" runat="server">
                        <asp:TableRow runat="server">
                            <asp:TableCell runat="server">
                                <asp:TextBox ID="txtBuscar" runat="server"></asp:TextBox>
                            </asp:TableCell>
                            <asp:TableCell runat="server">
                                <asp:DropDownList ID="ddlBuscarMarcas" runat="server"></asp:DropDownList>
                            </asp:TableCell>
                            <asp:TableCell runat="server">

                                <asp:DropDownList ID="ddlBuscarCat" AutoPostBack="true" OnSelectedIndexChanged="ddlBuscarCat_SelectedIndexChanged" runat="server"></asp:DropDownList></asp:TableCell>

                            <asp:TableCell runat="server">
                                <asp:DropDownList ID="ddlBuscarSubcat" runat="server"></asp:DropDownList>
                            </asp:TableCell>
                            <asp:TableCell runat="server">
                                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>

                    <asp:GridView ID="grdProd" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" AutoGenerateColumns="False" AutoGenerateEditButton="True" OnRowCancelingEdit="grdProd_RowCancelingEdit" OnRowEditing="grdProd_RowEditing" OnRowUpdating="grdProd_RowUpdating" OnPageIndexChanging="grdProd_PageIndexChanging" Width="100%" OnRowDataBound="grdProd_RowDataBound">
                        <Columns>
                            <asp:TemplateField HeaderText="Imagen">
                                <EditItemTemplate>
                                    <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("RutaImagen") %>' />
                                    <asp:Label ID="lblRuta2" runat="server" Text='<%# Bind("RutaImagen") %>' Visible="False"></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("RutaImagen") %>' />
                                </ItemTemplate>
                                <ControlStyle CssClass="miniatura" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ID Producto" SortExpression="IDProducto">
                                <EditItemTemplate>
                                    <asp:Label ID="lblId" runat="server" Text='<%# Bind("IDProducto") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblID" runat="server" Text='<%# Bind("IDProducto") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nombre" SortExpression="Nombre_PROD">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtNombre" runat="server" Text='<%# Bind("Nombre_PROD") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("Nombre_PROD") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Marca" SortExpression="Nombre_MARCA">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlMarcasEdit" AutoPostBack="true" runat="server">
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Nombre_MARCA") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Categoria" SortExpression="Nombre_CAT">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlCatEdit" runat="server" AutoPostBack="True">
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Nombre_CAT") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Subcategoria" SortExpression="Nombre_SUBCAT">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlSubcatEdit" runat="server">
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Nombre_SUBCAT") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Stock" SortExpression="Stock_PROD">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtStock" runat="server" Text='<%# Bind("Stock_PROD") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblStock" runat="server" Text='<%# Bind("Stock_PROD") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Precio" SortExpression="Precio_PROD">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtPrecio" runat="server" Text='<%# Bind("Precio_PROD") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblPrecio" runat="server" Text='<%# Bind("Precio_PROD", "{0:C}") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="100px" />
                                <HeaderStyle Width="90px" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Descuento" SortExpression="Descuento_PROD">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtDescuento" runat="server" Text='<%# Bind("Descuento_PROD") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblDescuento" runat="server" Text='<%# Bind("Descuento_PROD", "{0}%") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ACTIVO" SortExpression="ACTIVO">
                                <EditItemTemplate>
                                    <asp:CheckBox ID="chkActivo2" runat="server" AutoPostBack="true" Checked='<%# Bind("ACTIVO") %>' />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkActivo" runat="server" Checked='<%# Bind("ACTIVO") %>' Enabled="false" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Descripción" SortExpression="Descripcion_PROD">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtDescrip" runat="server" Text='<%# Bind("Descripcion_PROD") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblDescrip" runat="server" Text='<%# Bind("Descripcion_PROD") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle CssClass="celloverflowtext" Height="50px" />
                                <ItemStyle CssClass="celloverflowtext" />
                            </asp:TemplateField>
                        </Columns>

                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                    <br />

                </div>

            </asp:View>

            <asp:View ID="ViewMarcas" runat="server">
                <div class="container-fluid mb-4 text-center">
                    <asp:LinkButton ID="AgregarMarca" runat="server" OnClick="AgregarMarca_Click"><i class="fas fa-plus-circle"></i> &nbsp; Agregar Marca</asp:LinkButton>
                    <asp:Table ID="tblAgregarMarca" runat="server" Visible="false" HorizontalAlign="Center">

                        <asp:TableRow runat="server">
                            <asp:TableCell runat="server">
                                <asp:TextBox ID="txtIdMArca" runat="server" placeholder="Id Marca"></asp:TextBox>
                            </asp:TableCell>
                            <asp:TableCell runat="server">
                                <asp:TextBox ID="txtNombreMarca" runat="server" placeholder="Nombre Marca"></asp:TextBox>
                            </asp:TableCell>
                            <asp:TableCell runat="server">
                                <asp:Button ID="btnAgregarMarca" runat="server" Text="Agregar" OnClick="btnAgregarMarca_Click" />
                            </asp:TableCell>
                            <asp:TableCell runat="server">
                                <asp:Label ID="lblErrorMarca" runat="server" Text="" Visible="false" Font-Italic="True" ForeColor="Red"></asp:Label>
                            </asp:TableCell>

                        </asp:TableRow>



                    </asp:Table>
                    <br />
                    <asp:GridView ID="GridMarcas" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="IDMarca" DataSourceID="SqlDataSource_Marcas" ForeColor="#333333" GridLines="None" AllowPaging="True" HorizontalAlign="Center" OnSelectedIndexChanged="GridMarcas_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="IDMarca" HeaderText="IDMarca" ReadOnly="True" SortExpression="IDMarca" />
                            <asp:BoundField DataField="Nombre_MARCA" HeaderText="Nombre" SortExpression="Nombre_MARCA" />
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar"></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#E3EAEB" />
                        <FooterStyle BackColor="#009999" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#009999" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#009999" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>

                    <asp:SqlDataSource ID="SqlDataSource_Marcas" runat="server" ConnectionString="<%$ ConnectionStrings:ComprasoBDConnectionStringLocal %>" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [IDMarca], [Nombre_MARCA] FROM [MARCAS]" UpdateCommand="UPDATE MARCAS SET [Nombre_MARCA]=@Nombre_MARCA where [IDMarca]=@IDMarca">
                        <UpdateParameters>
                            <asp:Parameter Name="Nombre_MARCA" Type="String" />
                            <asp:Parameter Name="IDMarca" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>


            </asp:View>

            <asp:View ID="ViewVentas" runat="server">
                <div class="container-fluid mb-3 text-center align-items-center">
                    <br />
                    
                    <asp:Label ID="Label4" runat="server" Text="Ver Estado: "></asp:Label>
                    <asp:DropDownList ID="ddlVentas" runat="server">
                    </asp:DropDownList>
                    <asp:Button ID="btnBuscarVentas" runat="server" Text="Buscar" OnClick="btnBuscarVentas_Click" />
                    <asp:Button ID="btnQuitarFiltroVentas" runat="server" OnClick="btnQuitarFiltroVentas_Click" Text="Quitar Filtro" />
                    <br />
                    <br />

                    <asp:GridView ID="GridVentas" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="IDVenta" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" HorizontalAlign="Center" OnRowDataBound="GridVentas_RowDataBound">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="Fecha_VENTA" DataFormatString="{0:MM-dd-yyyy}" HeaderText="Fecha" SortExpression="Fecha_VENTA" />
                            <asp:BoundField DataField="IDVenta" HeaderText="IDVenta" InsertVisible="False" ReadOnly="True" SortExpression="IDVenta" />
                            <asp:BoundField DataField="NroTarjeta_VENTA" HeaderText="NroTarjeta" SortExpression="NroTarjeta_VENTA" />
                            <asp:BoundField DataField="IDUsuario_VENTA" HeaderText="IDUsuario" SortExpression="IDUsuario_VENTA" />
                            <asp:BoundField DataField="CodDirreccion_VENTA" HeaderText="CodDirreccion" SortExpression="CodDirreccion_VENTA" Visible="False" />
                            <asp:BoundField DataField="Descuento_VENTA" HeaderText="Descuento" SortExpression="Descuento_VENTA" DataFormatString="{0:p}" />
                            <asp:BoundField DataField="Total_VENTA" HeaderText="Total" SortExpression="Total_VENTA" />
                            <asp:BoundField DataField="IDEnvio_VENTA" HeaderText="IDEnvio" SortExpression="IDEnvio_VENTA" />
                            <asp:TemplateField HeaderText="Estado" SortExpression="Estado" Visible="False">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlEstado" runat="server">
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblEstado" runat="server" Text='<%# Bind("Estado") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Estado Pedido">
                                <ItemTemplate>
                                    <asp:Label ID="lblEstadoPedido" runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowEditButton="True" Visible="False" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btnConfirmar" runat="server" CommandArgument='<%# Eval("IDVenta") %>' Font-Size="Smaller" OnCommand="btnConfirmar_Command" Text="Confirmar" />
                                    <asp:Button ID="btnCancelar" runat="server" CommandArgument='<%# Eval("IDVenta") %>' Font-Size="Smaller" OnCommand="btnCancelar_Command" Text="Cancelar" />
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#ff6666" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#ff6666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                  <%--  <asp:SqlDataSource ID="SqlDataSource_Ventas" runat="server" ConnectionString="<%$ ConnectionStrings:ComprasoBDConnectionStringLocal %>" SelectCommand="SELECT * FROM [VENTAS]"></asp:SqlDataSource>--%>

                </div>
            </asp:View>

        </asp:MultiView>

    </div>


</asp:Content>
