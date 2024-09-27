<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucCategoriesList.ascx.cs" Inherits="de1.UserControl.ucCategoriesList" %>
<asp:DataList ID="DataList1" runat="server" DataSourceID="CategoryListEntityDataSource" DataKeyField="id">
    <ItemTemplate>
        <div>

            <asp:HyperLink ID="HyperLink1" runat="server"  Text='<%# Eval("CatName") + "("+ Eval("Beverage.Count")+")" %>' NavigateUrl='<%# "~/Category.aspx?CatId=" + Eval("CatId")%>' ></asp:HyperLink>
       
        </div>
       
    </ItemTemplate>
</asp:DataList>
<asp:EntityDataSource ID="CategoryListEntityDataSource" runat="server" ConnectionString="name=QLDoUongEntities4" DefaultContainerName="QLDoUongEntities4" EnableFlattening="False" EntitySetName="Categories" EntityTypeFilter="Category" Include="Beverage">
</asp:EntityDataSource>