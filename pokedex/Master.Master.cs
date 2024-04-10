using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;
using dominio;
using System.Configuration;


namespace pokedex
{
    public partial class Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            imgAvatar.ImageUrl = "https://www.came-educativa.com.ar/upsoazej/2022/03/placeholder-1.png";

            if (!(Page is Login || Page is Default || Page is Registro || Page is error))
            {
                if (!Seguridad.sesionActiva(Session["trainee"]))
                {
                    Response.Redirect("Login.aspx", false);
                }
                else
                {
                    Trainee user = (Trainee)Session["trainee"];
                    lblUser.Text = user.Email;
                    //if(user.ImagenPerfil!=null)  //Alternativa para null
                    //    imgAvatar.ImageUrl = "~/Images/" + user.ImagenPerfil;
                    if (!string.IsNullOrEmpty(user.ImagenPerfil))
                        imgAvatar.ImageUrl = "~/Images/" + user.ImagenPerfil;

                }
            }



        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}