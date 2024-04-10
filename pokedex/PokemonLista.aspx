﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="PokemonLista.aspx.cs" Inherits="pokedex.PokemonLista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptManager1"></asp:ScriptManager>
    <h1>Lista de Pokemons</h1>

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col-6">

                    <div class="mb-3">
                        <asp:Label Text="Filtrar" class="form-label" runat="server" />
                        <asp:TextBox runat="server" ID="txtfiltro" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtfiltro_TextChanged" />
                    </div>
                </div>
                <div class="col-6" style="display: flex; flex-direction: column; justify-content: flex-end">
                    <div class="mb-3">
                        <asp:CheckBox Text="Filtro Avanzado" runat="server" CssClass="" ID="chkAvanzado"
                            AutoPostBack="true" OnCheckedChanged="chkAvanzado_CheckedChanged" />
                    </div>
                </div>
            </div>

            <%if (chkAvanzado.Checked)
                {%>
            <div class="row">
                <div class="col-3">
                    <div class="mb-3">
                        <asp:Label Text="Campo" ID="lblCampo" runat="server" />
                        <asp:DropDownList runat="server" ID="ddlCampo" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged">
                            <asp:ListItem Text="Nombre" />
                            <asp:ListItem Text="Tipo" />
                            <asp:ListItem Text="Número" />
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-3">
                    <div class="mb-3">
                        <asp:Label Text="Criterio" runat="server" />
                        <asp:DropDownList runat="server" ID="ddlCriterio" CssClass="form-control"></asp:DropDownList>
                    </div>
                </div>
                <div class="col-3">
                    <div class="mb-3">
                        <asp:Label Text="Filtro" runat="server" />
                        <asp:TextBox runat="server" ID="txtFiltroAvanzado" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="col-3">
                    <div class="mb-3">
                        <asp:Label Text="Estado" runat="server" />
                        <asp:DropDownList runat="server" ID="ddlEstado" CssClass="form-control">
                            <asp:ListItem Text="Todos" />
                            <asp:ListItem Text="Activo" />
                            <asp:ListItem Text="Inactivo" />
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-3">
                    <div class="mb-3">
                        <asp:Button Text="Buscar" runat="server" CssClass="btn btn-primary" ID="btnBuscar" OnClick="btnBuscar_Click"/>
                    </div>
                </div>
            </div>
            <%} %>
            <asp:GridView ID="dgvPokemons" runat="server" CssClass="table" AutoGenerateColumns="false"
                DataKeyNames="Id"
                OnSelectedIndexChanged="dgvPokemons_SelectedIndexChanged" OnPageIndexChanging="dgvPokemons_PageIndexChanging"
                AllowPaging="true" PageSize="5">


                <Columns>

                    <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                    <asp:BoundField HeaderText="Numero" DataField="Numero" />
                    <asp:BoundField HeaderText="Tipo" DataField="Tipo.Descripcion" />
                    <asp:CheckBoxField HeaderText="Activo" DataField="Activo" />
                    <asp:CommandField HeaderText="Accion" ShowSelectButton="true" SelectText="♣" />
                </Columns>
            </asp:GridView>
            <a href="FormularioPokemon.aspx" class="btn btn-primary">Agregar</a>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
