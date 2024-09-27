<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucProductListByCategory.ascx.cs" Inherits="de1.UserControl.ucProductListByCategory" %>
<asp:ListView ID="ListView1" runat="server" DataKeyNames="id" DataSourceID="ProductListByCategoryEntityDataSource">
    
   
    <ItemTemplate>
     <div class="product_box">
         <asp:Label ID="Label1" runat="server" Text='<%# Eval("CatName") %>'  CssClass="product_name"></asp:Label><br />
         <asp:Image ID="Image1" runat="server" Width ="100px" Height="100px" ImageUrl='<%# "~/images/products/" + Eval("FilePath")%>' /><br />
         <asp:Label ID="Label2" runat="server" Text='<%# Eval("Price") %>' CssClass="product_price"></asp:Label><br />
         <asp:HyperLink ID="HyperLink1" NavigateUrl='<%#"~/Details.aspx?id="+Eval("CatId") %>' runat="server" CssClass="product_view">View Details</asp:HyperLink>
     </div>
    </ItemTemplate>
    <LayoutTemplate>
        <div style="" id="itemPlaceholderContainer" runat="server">
            <span runat="server" id="itemPlaceholder" />
        </div>
        <div class="pager">
            <asp:DataPager ID="DataPager1" runat="server">
                <Fields>
                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    <asp:NumericPagerField />
                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>
        </div>
    </LayoutTemplate>
    
 
    
</asp:ListView>
<asp:EntityDataSource ID="ProductListByCategoryEntityDataSource" runat="server" ConnectionString="name=QLDoUongEntities4" DefaultContainerName="QLDoUongEntities4" EnableFlattening="False" EntitySetName="Products" EntityTypeFilter="Product" Include="Category" Where="it.Category.id = @Category_Id">
    <WhereParameters>
        <asp:QueryStringParameter Name="Category_Id" QueryStringField="CatId" Type="Int32" />
    </WhereParameters>
</asp:EntityDataSource>