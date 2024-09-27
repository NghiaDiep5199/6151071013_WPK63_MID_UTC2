<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucManageProduct.ascx.cs" Inherits="de1.UserControl.ucManageProduct" %>
<table style="width:100%;">
    <tr>
        <td>Beverage name:</td>
        <td><asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox></td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>Beverage price</td>
        <td>
            <asp:TextBox ID="TextBoxPrice" runat="server"></asp:TextBox></td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>Category</td>
        <td><asp:DropDownList ID="DropDownListCategory" runat="server"></asp:DropDownList></td>
        <td>&nbsp;</td>
    </tr>
    <tr>
    <td>Beverage Description</td>
    <td>
        <asp:TextBox ID="TextBoxDescription" TextMode="MultiLine" runat="server"></asp:TextBox></td>
       
    <td>&nbsp;</td>
</tr>
    <tr>
     <td>Beverage Picture</td>
     <td>
         <asp:FileUpload ID="FileUploadPicture" runat="server" /></td>
     <td>&nbsp;</td>
 </tr>

    <tr>
        <td>&nbsp;</td>
        <td>
            <asp:Button ID="ButtonAddNew" runat="server" Text="Add new" OnClick="ButtonAddNew_Click" /></td>
    </tr>
</table>

<hr />
<asp:GridView ID="GridViewProducts" AllowPaging="true" PageSize="5"  AutoGenerateColumns="false" runat="server" OnRowCommand="GridViewProducts_RowCommand" OnPageIndexChanging="GridViewProducts_PageIndexChanging" DataKeyNames="id">
<Columns>
    <asp:TemplateField HeaderText="No.">
        <ItemTemplate>
            <%# Container.DataItemIndex+1 %>
        </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Picture">
        <ItemTemplate>
            <asp:Image runat="server" ID="imageProduct" ImageUrl='<%# "~/images/Products/" + Eval("FilePath") %>' Width="100px" Height="100px" />
        </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Name">
        <ItemTemplate>
            <asp:HyperLink ID="HyperLink1" Text='<%# Eval("Name")%>' Target="_blank" runat="server" NavigateUrl='<%# "~/Details.aspx?id="+Eval("id") %>'></asp:HyperLink>
        </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField>
        <ItemTemplate>
            <asp:Button runat="server" OnClientClick="return confirm('Do you really want to delete this product?');" ID="DeleteButton" Text="Delete" CommandName="DeleteProduct" CommandArgument='<%# Eval("id") %>'/>
        </ItemTemplate>
    </asp:TemplateField>


        <asp:TemplateField>
    <ItemTemplate>
        <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandName="EditProduct" CommandArgument='<%# Eval("id") %>' />
    </ItemTemplate>
</asp:TemplateField>
</Columns>
</asp:GridView>
<hr />
<asp:Panel ID="pnlEditProduct" runat="server" Visible="false">
    <asp:Label ID="lblProductId" runat="server" Text="" Visible="false"></asp:Label>
    <asp:TextBox ID="txtEditProductName" runat="server" placeholder="Product Name"></asp:TextBox>
    <asp:TextBox ID="txtEditProductPrice" runat="server" placeholder="Product Price"></asp:TextBox>
    <asp:TextBox ID="txtEditProductDescription" runat="server" placeholder="Product Description"></asp:TextBox>
    <asp:DropDownList ID="dpEditProductCategory" runat="server"></asp:DropDownList>
    <asp:FileUpload ID="fulEditImageProduct" runat="server" />
    <asp:Button ID="btnUpdateProduct" runat="server" Text="Update" OnClick="btnUpdateProduct_Click" />
    <asp:Button ID="btnCancelUpdate" runat="server" Text="Cancel" OnClick="btnCancelUpdate_Click" />
</asp:Panel>