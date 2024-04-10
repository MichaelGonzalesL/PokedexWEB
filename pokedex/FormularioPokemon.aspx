<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="FormularioPokemon.aspx.cs" Inherits="pokedex.FormularioPokemon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager runat="server" ID="ScriptManager1"></asp:ScriptManager>
    <div class="row">
        <div class="col-6">

            <div class="mb-3">
                <label for="txtId" class="form-label">Id</label>
                <asp:TextBox runat="server" ID="txtId" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtNombre" class="form-label">Nombre</label>
                <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtNumero" class="form-label">Numero</label>
                <asp:TextBox runat="server" ID="txtNumero" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="ddlTipo" class="form-label">Tipo</label>
                <asp:DropDownList runat="server" ID="ddlTipo" CssClass="form-select"></asp:DropDownList>
            </div>
            <div class="mb-3">
                <label for="ddlDebilidad" class="form-label">Debilidad</label>
                <asp:DropDownList runat="server" ID="ddlDebilidad" CssClass="form-select"></asp:DropDownList>
            </div>

            <div class="mb-3">
                <asp:Button Text="Aceptar" ID="btnAceptar" runat="server" CssClass="btn btn-primary" OnClick="btnAceptar_Click" />
                <a href="PokemonLista.aspx">Cancelar</a>
                <asp:Button Text="Inactivar" ID="btnInactivar" runat="server" CssClass="btn btn-warning" OnClick="btnInactivar_Click" />
            </div>
        </div>

        <div class="col-6">
            <div class="mb-3">
                <label for="txtDescripcion" class="form-label">Descripcion</label>
                <asp:TextBox runat="server" ID="txtDescripcion" TextMode="MultiLine" CssClass="form-control" />
            </div>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="mb-3">
                        <label for="txtImagenUrl" class="form-label">UrlImagen</label>
                        <asp:TextBox runat="server" ID="txtImagenUrl" CssClass="form-control" OnTextChanged="txtImagenUrl_TextChanged" AutoPostBack="true" />
                    </div>
                    <asp:Image ImageUrl="https://editorial.unc.edu.ar/wp-content/uploads/sites/33/2022/09/placeholder.png"
                        ID="imgPokemon" Width="60%" runat="server" />
                </ContentTemplate>
            </asp:UpdatePanel>

        </div>
    </div>
    <div class="row">
        <div class="col-6">
            <asp:UpdatePanel ID="UpdatePnael2" runat="server">
                <ContentTemplate>
                    <div class="mb-3">
                        <asp:Button Text="Eliminar" ID="btnEliminar" runat="server" CssClass="btn btn-danger" OnClick="btnEliminar_Click" />
                    </div>

                    <%if (confirmarEliminacion){%>
                        <div class="mb-3">
                            <asp:CheckBox Text="Confirmar elimnacion" ID="chkConfirmarEliminacion" runat="server" CssClass="btn btn-primary" />
                            <asp:Button Text="Eliminar" ID="btnEliminarConfirmacion" runat="server" CssClass="btn btn-outline-danger" OnClick="btnEliminarConfirmacion_Click" />
                        </div>
                    <% } %>
                </ContentTemplate>
            </asp:UpdatePanel>

        </div>

    </div>
</asp:Content>
