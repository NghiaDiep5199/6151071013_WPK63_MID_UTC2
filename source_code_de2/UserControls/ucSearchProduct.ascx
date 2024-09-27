<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucSearchProduct.ascx.cs" Inherits="de1.UserControls.ucSearchProduct" %>
Name: <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
<p>
    &nbsp;</p>
Price:<asp:TextBox ID="txtLowerPrice" runat="server"></asp:TextBox> - <asp:TextBox ID="txtUpperPrice" runat="server"></asp:TextBox>
<asp:Button ID="Button1" runat="server" Text="Search"  />

<p>
    &nbsp;</p>
<p>
    Search Result:</p>

<asp:ListView ID="ListView1" runat="server" DataKeyNames="id" DataSourceID="SearchEntityDataSource" OnDataBound="ListView1_DataBound">
    <ItemTemplate>
        <asp:Label ID="Label1" runat="server" Text='<%# Eval("CatName") %>' CssClass="product_name"></asp:Label><br />
        <asp:Image ID="Image1" runat="server" Width="100px" Height="100px" ImageUrl='<%# "~/images/products/" + Eval("FilePath") %>' /><br />
        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Price") %>' CssClass="product_price"></asp:Label><br />
        <asp:HyperLink ID="HyperLink1" NavigateUrl='<%#"~/Details.aspx?id=" + Eval("CatId") %>' runat="server" CssClass="product_view">View Details</asp:HyperLink>
    </ItemTemplate>
    <LayoutTemplate>
        <div id="itemPlaceholderContainer" runat="server" style="">
            <span runat="server" id="itemPlaceholder" />
        </div>
        <div style="">
            <asp:DataPager ID="DataPager1" runat="server" PageSize="4">
                <Fields>
                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                </Fields>
            </asp:DataPager>
        </div>
    </LayoutTemplate>
</asp:ListView>
<asp:EntityDataSource ID="SearchEntityDataSource" runat="server" ConnectionString="name=QLDoUongEntities4" DefaultContainerName="QLDoUongEntities4" EnableFlattening="False" EntitySetName="Products" EntityTypeFilter="Product" Where="it.Name like '%'+@Name+'%' and it.Price >= @LowerPrice and it.Price <= @UpperPrice">
    <WhereParameters>
        <asp:ControlParameter ControlID="txtName" PropertyName="Text" Name="Name" Type="String" />
        <asp:ControlParameter ControlID="txtLowerPrice" Name="LowerPrice" PropertyName="Text" Type="Decimal" />
        <asp:ControlParameter ControlID="txtUpperPrice" Name="UpperPrice" PropertyName="Text" Type="Decimal" />
    </WhereParameters>
</asp:EntityDataSource>