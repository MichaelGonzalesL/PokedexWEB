using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace pokedex
{
    public partial class FormularioPokemon : System.Web.UI.Page
    {
        public bool confirmarEliminacion { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            confirmarEliminacion = false;
            txtId.Enabled = false;
            if (!IsPostBack)
            {
                ElementoNegocio elemento = new ElementoNegocio();
                List<Elemento> lista = elemento.listar();

                ddlTipo.DataSource = lista;
                ddlTipo.DataValueField = "Id";
                ddlTipo.DataTextField = "Descripcion";
                ddlTipo.DataBind();

                ddlDebilidad.DataSource = lista;
                ddlDebilidad.DataValueField = "Id";
                ddlDebilidad.DataTextField = "Descripcion";
                ddlDebilidad.DataBind();

                string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
                if (id != "")
                {
                    PokemonNegocio negocio = new PokemonNegocio();
                    Pokemon seleccionado = (negocio.listar(id))[0];

                    Session.Add("pokeSeleccionado", seleccionado);

                    txtId.Text = id;
                    txtNombre.Text = seleccionado.Nombre;
                    txtNumero.Text = seleccionado.Numero.ToString();
                    txtDescripcion.Text = seleccionado.Descripcion;
                    txtImagenUrl.Text = seleccionado.UrlImagen;


                    ddlTipo.SelectedValue = seleccionado.Tipo.Id.ToString();
                    ddlDebilidad.SelectedValue = seleccionado.Debilidad.Id.ToString();
                    txtImagenUrl_TextChanged(sender, e);

                    //configurar acciones
                    if (!seleccionado.Activo)
                    {
                        btnInactivar.Text = "Reactivar";
                    }

                }

            }
        }

        protected void txtImagenUrl_TextChanged(object sender, EventArgs e)
        {
            imgPokemon.ImageUrl = txtImagenUrl.Text;
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Pokemon poke = new Pokemon();
                PokemonNegocio negocio = new PokemonNegocio();
                poke.Numero = int.Parse(txtNumero.Text);
                poke.Nombre = txtNombre.Text;
                poke.Descripcion = txtDescripcion.Text;
                poke.UrlImagen = txtImagenUrl.Text;

                poke.Tipo = new Elemento();
                poke.Tipo.Id = int.Parse(ddlTipo.SelectedValue);
                poke.Debilidad = new Elemento();
                poke.Debilidad.Id = int.Parse(ddlDebilidad.SelectedValue);
                if (Request.QueryString["id"] != null)
                {
                    poke.Id = int.Parse(txtId.Text);
                    negocio.modificarConSP(poke);
                }
                else
                {
                    negocio.agregarConSP(poke);
                }
                Response.Redirect("PokemonLista.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                // throw;
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            confirmarEliminacion = true;
        }

        protected void btnEliminarConfirmacion_Click(object sender, EventArgs e)
        {
            try
            {

                if (chkConfirmarEliminacion.Checked)
                {
                    PokemonNegocio negocio = new PokemonNegocio();
                    negocio.eliminar(int.Parse(txtId.Text));
                    Response.Redirect("PokemonLista.aspx");
                }
            }
            catch (Exception ex)
            {
                Session.Add("error",ex);
            }
        }

        protected void btnInactivar_Click(object sender, EventArgs e)
        {
            try
            {
                PokemonNegocio negocio =new PokemonNegocio();
                Pokemon seleccionado = (Pokemon)Session["pokeSeleccionado"];

                negocio.eliminarLogico(seleccionado.Id, !seleccionado.Activo);
                Response.Redirect("PokemonLista.aspx");
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
            }
        }
    }
}