﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using CapaLogicadeNegocio;
using Entidad;
using System.Globalization;

namespace ArvoProjectWebsite.WebForms
{
    public partial class frmCompra : System.Web.UI.Page
    {
        float suma = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            suma = 0;
            multi.ActiveViewIndex = 0;
            grdCompra.DataSource = (DataTable)this.Session["Compras"];
            grdCompra.DataBind();
            if (this.Application["Usuario"] == null)
            {
                Response.Redirect("frmLogin.aspx");
            }

            if (!IsPostBack)
            {
                iniciarMensajeserror();
                rellenarTarxusu();
                llenarTarjetas();
                llenarCuotas();
                llenarDirecciones();
                txtVencimiento.Visible = false;
                lblVto.Visible = false;
                chbGuardartarj.Visible = false;
            }
            if (IsPostBack)
            {
                habilitarTxttarjeta();
                quitaErrores();
                if (chbGuardartarj.Checked == true)
                {
                    txtVencimiento.Visible = true;
                    lblVto.Visible = true;
                }
            }
            mostrarPrecioenvio();
            mostrarCostototal();
        }

        protected void ddlMetodopago_SelectedIndexChanged(object sender, EventArgs e)
        {
            llenarCuotas();
        }

        public void llenarTarjetas()
        {
            ddlMetodopago.DataSource = LogicaCompra.rellenarMetodos();
            ddlMetodopago.Items.Insert(0, "<Seleccione tarjeta>");
            ddlMetodopago.AppendDataBoundItems = true;
            ddlMetodopago.DataTextField = "Nombre_TARJ";
            ddlMetodopago.DataValueField = "IDTarjeta_TARJ";
            ddlMetodopago.DataBind();
            ddlMetodopago.SelectedIndex = 0;
        }

        public void llenarCuotas()
        {
            if (ddlIndexmetodos())
            {
                string index = ddlMetodopago.SelectedValue.ToString();
                ddlCuotas.Items.Clear();
                ddlCuotas.DataSource = LogicaCompra.rellenarCuotas(index);
                ddlCuotas.Items.Insert(0, "<Seleccione cuotas>");
                ddlCuotas.AppendDataBoundItems = true;
                ddlCuotas.DataTextField = "Metodo";
                ddlCuotas.DataValueField = "IDCuota_CUO";
                ddlCuotas.DataBind();
            }
            else
            {
                if(ddlCuotas.Items.Count == 0)
                    ddlCuotas.Items.Insert(0, "<Seleccione cuotas>");
            }
        }
        protected void llenarDirecciones()
        {
            if (this.Application["Usuario"] != null)
            {
                string id = ((Usuario)this.Application["Usuario"]).IDUsuario;
                ddlDireccion.DataSource = LogicaCompra.rellenarDirecciones(id);
                ddlDireccion.DataValueField = "CodDirreccion";
                ddlDireccion.DataTextField = "Direccion_DIR";
                ddlDireccion.Items.Insert(0, "<Seleccione Direccion>");
                ddlDireccion.AppendDataBoundItems = true;
                ddlDireccion.DataBind();
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[5].Visible = false;
            e.Row.Cells[6].Visible = false;
            e.Row.Cells[7].Visible = false;
            if (e.Row.Cells[1].Text != null && e.Row.Cells[1].Text != "Total: $" + suma.ToString() &&
                e.Row.Cells[1].Text != "Total:" && e.Row.Cells[1].Text != "Subtotal")
            {
                string prueba = e.Row.Cells[1].Text;
                suma += float.Parse(e.Row.Cells[1].Text);
            }

            grdCompra.Columns[1].FooterText = "Total: $" + suma.ToString();
        }

        protected void txtNrotarjeta_TextChanged(object sender, EventArgs e)
        {
            tarjetaIngresada();
            if (txtNrotarjeta.Text == string.Empty)
            {
                ddlTarxu.Enabled = true;
            }
            else
            {
                ddlTarxu.Enabled = false;
            }
            if (!(LogicaCompra.verificarTarjeta(txtNrotarjeta.Text) && (!ddlIndextarxus()|| ddlTarxu.SelectedIndex == -1)))
            {
                chbGuardartarj.Visible = false;
                chbGuardartarj.Checked = false;
                lblErrorntar.Visible = true;
                lblVto.Visible = false;
                txtVencimiento.Visible = false;
            }
            if(ddlIndextarxus())
            {
                lblErrorntar.Visible = false;
            }
        }

        protected float sumaTotal()
        {
            float suma = 0;
            foreach (GridViewRow item in grdCompra.Rows)
            {
                string prueba = item.Cells[1].Text;
                suma += float.Parse(prueba);
            }
            return suma;
        }

        protected void lbtnComprar_Click(object sender, EventArgs e)
        {
            Usuario us = (Usuario)this.Application["Usuario"];
            if (chbGuardartarj.Checked && LogicaCompra.verificarTarjeta(txtNrotarjeta.Text))
            {
                LogicaCompra.agregarMetodopago(us.IDUsuario, txtNrotarjeta.Text
                    , ddlMetodopago.SelectedValue, us.Nombre + us.Apellido, txtVencimiento.Text);
            }
            if (validacionesBtnCompras())
            {
                registroVenta();
                detalleVenta();
                this.Session["Carrito"] = null;
                multi.ActiveViewIndex = 1;
            }
        }

        protected void detalleVenta()
        {
            foreach (DataRow item in ((DataTable)this.Session["Compras"]).Rows)
            {
                LogicaCompra.insertarDetVenta(item);
            }
        }

        protected void registroVenta()
        {
            if (ddlIndexdireccion() && ddlIndexcuotas())
            {
                Ventas venta = new Ventas();
                venta.IDUsuario1 = ((Usuario)this.Application["Usuario"]).IDUsuario;
                venta.CodDireccion = int.Parse(ddlDireccion.SelectedValue.ToString());
                venta.Total = LogicaCompra.costoTotal(suma, LogicaCompra.getInteres(ddlCuotas.SelectedValue),
                    float.Parse(LogicaCompra.recuperarEnvio(ddlDireccion.SelectedValue)[1].ToString()));
                venta.IdEnvio = LogicaCompra.recuperarEnvio(ddlDireccion.SelectedValue)[0].ToString();
                venta.EstadoEnvio = 0;
                venta.Descuento = 0;
                if (ddlIndextarxus() && ddlTarxu.SelectedIndex != -1)
                    venta.NroTarjeta = ddlTarxu.SelectedItem.Text;
                else if (txtNrotarjeta.Enabled ==true)
                    venta.NroTarjeta = txtNrotarjeta.Text;

                LogicaCompra.insertarVenta(venta);
            }
        }

        protected void ddlDireccion_SelectedIndexChanged(object sender, EventArgs e)
        {
            mostrarPrecioenvio();
        }

        protected void lbtnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("/default.aspx");
        }

        protected void grdCompra_RowCreated(object sender, GridViewRowEventArgs e)
        {

        }

        protected bool rellenarTarxusu()
        {
            DataTable tbl = new DataTable();
            tbl = LogicaCompra.tarjxUsu((Usuario)this.Application["Usuario"]);
            if (tbl.Rows.Count > 0)
            {
                ddlTarxu.Items.Insert(0, "<Seleccione tarjeta>");
                ddlTarxu.AppendDataBoundItems = true;
                ddlTarxu.DataSource = tbl;
                ddlTarxu.DataTextField = "Nro Tarjeta";
                ddlTarxu.SelectedIndex = 0;
                ddlTarxu.DataBind();
                return true;
            }
            else
            {
                ddlTarxu.Visible = false;
                return false;
            }
        }

        protected void habilitarTxttarjeta()
        {
            if (ddlTarxu.SelectedIndex <= 0 )
            {
                txtNrotarjeta.Enabled = true;
            }
            else
            {
                txtNrotarjeta.Enabled = false;
            }
        }

        protected void txtNrotarjeta_Load(object sender, EventArgs e)
        {

        }

        protected void quitaErrores()
        {
            if (ddlIndexmetodos())
            {
                lblErrormetodo.Visible = false;
            }
            if (ddlIndexcuotas())
            {
                lblErrorncuota.Visible = false;
            }
            if (ddlIndexdireccion())
            {
                lblErrorDire.Visible = false;
            }
            if (LogicaCompra.verificarTarjeta(txtNrotarjeta.Text) && !ddlIndextarxus())
            {
                lblErrorntar.Visible = false;
            }
            if (ddlIndextarxus())
            {
                lblErrorntar.Visible = false;
            }
            if (LogicaCompra.verificarTarjeta(txtNrotarjeta.Text) && (!ddlIndextarxus() || ddlTarxu.SelectedIndex ==-1))
            {
                chbGuardartarj.Visible = true;
                if (chbGuardartarj.Checked)
                {
                    txtVencimiento.Visible = true;
                    lblVto.Visible = true;
                }
            }
            if (txtVencimiento.Visible)
            {
                if (LogicaCompra.verificarstringFecha(txtVencimiento.Text))
                {
                    lblErrorfecha.Visible = false;
                }
            }

        }

        protected bool validacionesBtnCompras()
        {
            bool a= true;
            bool b = true;
            bool c = true;
            bool d= true;
            bool e = true;
            bool f = true;//banderas
            if (!ddlIndexmetodos())
            {
                a = false;
                lblErrormetodo.Visible = true;
            }
            if (!ddlIndexcuotas())
            {
                b = false;
                lblErrorncuota.Visible = true;
            }
            if (!ddlIndextarxus() && txtNrotarjeta.Text == string.Empty)
            {
               c = false;
                lblErrorntartarus.Visible = true;
                lblErrorntar.Visible = true;
            }
            if (!ddlIndexdireccion())
            {
                d = false;
                lblErrorDire.Visible = true;
                if(ddlDireccion.Items.Count == 1)
                {
                    lblErrorDire.Text = "Cargue una dirección en el menu";
                    lbtnCargardir.Visible = true;
                }
                
            }
            if (!(LogicaCompra.verificarTarjeta(txtNrotarjeta.Text) && (!ddlIndextarxus()|| ddlTarxu.SelectedIndex ==-1)))
            {
                e = false;
                lblErrorntar.Visible = true;
                lblErrorntartarus.Visible = false;
            }
            if (ddlIndextarxus() && ddlTarxu.SelectedIndex != -1)
            {
                e = true;
                lblErrorntar.Visible = false;
            }
            if (txtVencimiento.Visible)
            {
                if (!(LogicaCompra.verificarstringFecha(txtVencimiento.Text)))
                {
                    f = false;
                    lblErrorfecha.Visible = true;
                }
            }
            if (a && b && c && d && e && f)
                return true;
            else return false;
        }

        protected void iniciarMensajeserror()
        {
            lblErrorntartarus.Visible = false;
            lblErrorncuota.Visible = false;
            lblErrorntar.Visible = false;
            lblErrorDire.Visible = false;
            lblErrormetodo.Visible = false;
            lblErrorfecha.Visible = false;
            lbtnCargardir.Visible = false;
        }

        protected void ddlTarxu_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlIndextarxus())
            {
                ddlMetodopago.SelectedValue = LogicaCompra.tipoTarjeta(ddlTarxu.SelectedItem.Text);
                lblErrormetodo.Visible = false;
                chbGuardartarj.Visible = false;
                chbGuardartarj.Checked = false;
                ddlMetodopago.Enabled = false;
                lblErrorntartarus.Visible = false;
            }
            else
            {
                ddlMetodopago.Enabled = true;
            }
            llenarCuotas();
            ddlMetodopago.DataBind();
        }

        protected bool ddlIndexcuotas()
        {
            if (ddlCuotas.SelectedIndex != 0)
                return true;
            else return false;
        }

        protected bool ddlIndexmetodos()
        {
            if (ddlMetodopago.SelectedIndex != 0)
                return true;
            else return false;
        }

        protected bool ddlIndextarxus()
        {
            if (ddlTarxu.SelectedIndex != 0)
                return true;
            else return false;
        }

        protected bool ddlIndexdireccion()
        {
            if (ddlDireccion.SelectedIndex != 0)
                return true;
            else return false;
        }

        protected void mostrarCostototal()
        {
            if (ddlIndexcuotas() && ddlIndexdireccion() && ddlCuotas.Text != string.Empty)
            {
                lblCostoTotal.Text = "$ " + LogicaCompra.costoTotal(suma, LogicaCompra.getInteres(ddlCuotas.SelectedValue)
                    , float.Parse(LogicaCompra.recuperarEnvio(ddlDireccion.SelectedValue)[1].ToString())).ToString();
            }
        }

        protected void mostrarPrecioenvio()
        {
            if (ddlIndexcuotas() && ddlIndexdireccion() && ddlCuotas.Text != string.Empty)
            {
                lblPrecioEnvio.Text = "$ " + LogicaCompra.recuperarEnvio(ddlDireccion.SelectedValue)[1].ToString();
                lblPrecioEnvio.DataBind();
            }
        }

        protected void lbtnComprar_PreRender(object sender, EventArgs e)
        {

        }

        public bool verificarstringFecha(string txt)
        {
            DateTime dt;
            if (DateTime.TryParseExact(txt, "d/M/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out dt))
            {
                if (dt > DateTime.Today)
                    return true;
            }
            return false;
        }

        protected void ddlTarxu_Load(object sender, EventArgs e)
        {

        }

        protected void ddlTarxu_PreRender(object sender, EventArgs e)
        {

        }

        protected void tarjetaIngresada()
        {
            foreach (ListItem item in ddlTarxu.Items)
            {
                if(txtNrotarjeta.Text == item.Text)
                {
                    ddlTarxu.SelectedValue = item.Value;
                    ddlMetodopago.SelectedValue = LogicaCompra.tipoTarjeta(ddlTarxu.SelectedItem.Text);
                    txtNrotarjeta.Text = string.Empty;
                    chbGuardartarj.Visible = false;
                    chbGuardartarj.Checked = false;
                    ddlMetodopago.Enabled = false;
                    txtNrotarjeta.Enabled = false;
                    llenarCuotas();
                }
                else
                {
                    txtNrotarjeta.Enabled = true;
                }
            }
        }

        protected void chbGuardartarj_CheckedChanged(object sender, EventArgs e)
        {
            if(chbGuardartarj.Checked == false)
            {
                lblVto.Visible = false;
                txtVencimiento.Visible = false;
            }
        }

        protected void lnbtnHastapronto_Click(object sender, EventArgs e)
        {
            Response.Redirect("/default.aspx");
        }

        protected void lbtnCargardir_Click(object sender, EventArgs e)
        {
            this.Session["redir"] = "Direccion";
            Response.Redirect("~/WebForms/frmMenuUsuario.aspx");
        }
    }
}