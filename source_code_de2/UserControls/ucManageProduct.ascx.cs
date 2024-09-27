using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace de1.UserControl
{
    public partial class ucManageProduct : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
                BindDropDownList();
            }
        }

        protected void ButtonAddNew_Click(object sender, EventArgs e)
        {
            string filename = "";
            if (FileUploadPicture.HasFile)
            {
                filename = FileUploadPicture.FileName;
                FileUploadPicture.SaveAs(Server.MapPath("~/images/Products/" + filename));
            }

            QLDoUongEntities4 context = new QLDoUongEntities4();
            Product p = new Product();
           
            p.Name = TextBoxName.Text;
            p.Price = decimal.Parse(TextBoxPrice.Text);
            p.Description = TextBoxDescription.Text;
            p.Category_id = int.Parse(DropDownListCategory.SelectedValue);
            p.FilePath = filename;

            context.Products.Add(p);
            context.SaveChanges();

            BindGridView(); 
            Page.Master.DataBind();
        }
    }

    protected void BindGridView()
    {
        QLDoUongEntities4 context = new QLDoUongEntities4();
        var query = (from p in context.Products select p).ToList<Product>();
        GridViewProducts.DataSource = query;
        GridViewProducts.DataBind();
    }
    protected void BindDropDownList()
    {
        QLDoUongEntities4 context = new QLDoUongEntities4();
        DropDownListCategory.DataSource = (from c in context.Categories select c).ToList<Category>();
        DropDownListCategory.DataTextField = "Name";
        DropDownListCategory.DataValueField = "id";
        DropDownListCategory.DataBind();

        dpEditProductCategory.DataSource = (from c in context.Categories select c).ToList<Category>();
        dpEditProductCategory.DataTextField = "Name";
        dpEditProductCategory.DataValueField = "id";
        dpEditProductCategory.DataBind();
    }

    protected void GridViewProducts_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridViewProducts.PageIndex = e.NewPageIndex;

        BindGridView();
    }

    protected void GridViewProducts_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int id = int.Parse(e.CommandArgument.ToString());
        QLDoUongEntities4 context = new QLDoUongEntities4();

        if (e.CommandName == "EditProduct")
        {
            var product = (from p in context.Products
                           where p.id == id
                           select p).SingleOrDefault();

            if (product != null)
            {
                lblProductId.Text = product.id.ToString(); 
                txtEditProductName.Text = product.Name;
                txtEditProductPrice.Text = product.Price.ToString();
                txtEditProductDescription.Text = product.Description;
                dpEditProductCategory.SelectedValue = product.Category_id.ToString();
                pnlEditProduct.Visible = true; 
            }
        }
        else if (e.CommandName == "DeleteProduct")
        {
            var product = (from p in context.Products
                           where p.id == id
                           select p).SingleOrDefault();
            if (product != null)
            {
                context.Products.Remove(product);
                context.SaveChanges();
                BindGridView();
            }
        }
    }

    protected void btnUpdateProduct_Click(object sender, EventArgs e)
    {
        QLDoUongEntities4 context = new QLDoUongEntities4();
        int productId = int.Parse(lblProductId.Text);
        var product = (from p in context.Products
                       where p.id == productId
                       select p).SingleOrDefault();

        if (product != null)
        {
            product.Name = txtEditProductName.Text;
            product.Price = decimal.Parse(txtEditProductPrice.Text);
            product.Description = txtEditProductDescription.Text;
            product.Category_id = int.Parse(dpEditProductCategory.SelectedValue);

           
            if (fulEditImageProduct.HasFile)
            {
                string filename = fulEditImageProduct.FileName;
                fulEditImageProduct.SaveAs(Server.MapPath("~/images/Products/" + filename));
                product.FilePath = filename; 

            context.SaveChanges(); 
            BindGridView(); 
            pnlEditProduct.Visible = false;
            Page.Master.DataBind();
        }
    }
    protected void btnCancelUpdate_Click(object sender, EventArgs e)
    {
        pnlEditProduct.Visible = false; 
    }
}