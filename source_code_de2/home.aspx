<%@ Page Title="" Language="C#" MasterPageFile="~/DefaultPageMaster.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="de1.home" %>

<%@ Register Src="~/UserControls/ucSearchProduct.ascx" TagPrefix="uc1" TagName="ucSearchProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ucSearchProduct runat="server" id="ucSearchProduct" />
</asp:Content>
