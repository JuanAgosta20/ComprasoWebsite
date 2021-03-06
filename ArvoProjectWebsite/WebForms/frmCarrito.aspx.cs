﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Entidad;
using CapaLogicadeNegocio;
using System.Globalization;

namespace ArvoProjectWebsite
{
    public partial class frmCarrito : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                actualizarCarrito();
                cargarEnvios();
            }
        }

        protected void lnkSeguircom_Click(object sender, EventArgs e)
        {
            Response.Redirect("/default.aspx");
        }

        protected void lnkComprar_Click(object sender, EventArgs e)
        {
            int pos = actualizarCantidades();
            switch (pos)
            {
                case -1:
                    Response.Write("<script language=javascript>alert('Stock insuficiente');</script>");

                    break;
                case 0:
                    this.Session["Compras"] = null;
                    this.Session["Compras"] = LogicaCompra.crearCompra();
                    LogicaCompra.cargarCompras((DataTable)this.Session["Compras"]
                            , (DataTable)this.Session["Carrito"]);
                    Response.Redirect("frmCompra.aspx");
                    break;
                default:
                        Response.Write("<script language=javascript>alert('Valor incorrecto en campo cantidad');</script>");
                    break;
            }
        }

        protected void grdCarrito_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void grdCarrito_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int pos = e.RowIndex;
            eliminarprodCarrito((DataTable)this.Session["Carrito"], pos);
            actualizarCarrito();
        }

        public void eliminarprodCarrito(DataTable tbl, int pos)
        {
            DataTable tblcompras = new DataTable();
            tblcompras = (DataTable)this.Session["Compras"];
            if (pos < tbl.Rows.Count && pos >= 0)
            {
                tbl.Rows.RemoveAt(pos);
                if (this.Session["Compras"] != null)
                    tblcompras.Rows.RemoveAt(pos);
            }
            if (tbl.Rows.Count == 0)
            {
                tbl = null;
                this.Session["Compras"] = null;
            }

        }

        public void actualizarCarrito()
        {
            if (this.Session["Carrito"] == null || ((DataTable)this.Session["Carrito"]).Rows.Count == 0)
            {
                lnkComprar.Visible = false;
                lblNocarrito.Visible = true;
            }
            else
            {
                lnkComprar.Visible = true;
                lblNocarrito.Visible = false;

            }
            cargarCarrito();
            grdCarrito.DataBind();
        }

        public void cargarCarrito()
        {
            grdCarrito.DataSource = (DataTable)this.Session["Carrito"];
        }

        protected void grdCarrito_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[6].Visible = false;
            e.Row.Cells[7].Visible = false;
            e.Row.Cells[8].Visible = false;
            string prueba = e.Row.Cells[7].Text;
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (prueba != null && prueba != "&nbsp")
                {
                    ((TextBox)e.Row.FindControl("txtCantidad")).Text =
                        e.Row.Cells[7].Text;
                }
            }
        }

        protected void grdCarrito_Sorting(object sender, GridViewSortEventArgs e)
        {

        }

        protected void grdCarrito_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void grdCarrito_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void grdCarrito_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

        }

        protected int actualizarCantidades()
        {
            int pos = 0;
            for (int i = 0; i < grdCarrito.Rows.Count; i++)
            {
                if (((TextBox)grdCarrito.Rows[i].FindControl("txtCantidad")).Text != string.Empty)
                {
                    int valor = int.Parse(((TextBox)grdCarrito.Rows[i].FindControl("txtCantidad")).Text);
                    if (valor < 0)
                    {
                        pos++;
                    }
                    else if (valor > int.Parse(grdCarrito.Rows[i].Cells[9].Text))
                    {
                        pos=-1;
                    }
                    else
                    {
                        ((DataTable)this.Session["Carrito"]).Rows[i][4] = valor;
                    }
                }
                else pos++;
            }
            return pos;
        }

        protected void grdCarrito_RowCreated(object sender, GridViewRowEventArgs e)
        {

        }

        protected void lnkSeguircom_PreRender(object sender, EventArgs e)
        {
            
        }

        protected void cargarEnvios()
        {
            ddlprecioEnvio.DataSource = LogicaCarrito.getEnvios();
            ddlprecioEnvio.DataTextField = "Provincia_ENVIO";
            ddlprecioEnvio.DataValueField = "IDEnvio";
            ddlprecioEnvio.Items.Insert(0, "<Seleccione Provincia>");
            ddlprecioEnvio.AppendDataBoundItems = true;
            ddlprecioEnvio.DataBind();
        }

        protected void ddlprecioEnvio_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(ddlprecioEnvio.SelectedIndex !=0)
                lblPrecio.Text = "$" + LogicaCarrito.getPrecioenvio(ddlprecioEnvio.SelectedValue);
        }
    }
}
