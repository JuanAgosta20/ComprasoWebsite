﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaLogicadeNegocio;
using Entidad;

namespace ArvoProjectWebsite
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void InicSec_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmLogin.aspx");
        }

       

        protected void Carrito_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmCarrito.aspx");
        }

        protected void imgProducto_Command(object sender, CommandEventArgs e)
        {
            Response.Redirect("WebForms/frmProducto.aspx?IDProd=" + e.CommandArgument);
        }

        protected void item_Command(object sender, CommandEventArgs e)
        {
            Session["filtroCategoria"] = e.CommandArgument;
            Response.Redirect("/WebForms/frmListaProductos.aspx");
        }

    }
}