using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace de1.UserControls
{
    public partial class ucSearchProduct : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Debugging information
            string name = txtName.Text;
            decimal lowerPrice = string.IsNullOrEmpty(txtLowerPrice.Text) ? 0 : Convert.ToDecimal(txtLowerPrice.Text);
            decimal upperPrice = string.IsNullOrEmpty(txtUpperPrice.Text) ? decimal.MaxValue : Convert.ToDecimal(txtUpperPrice.Text);

            // Check if values are being set correctly
            System.Diagnostics.Debug.WriteLine($"Name: {name}, Lower Price: {lowerPrice}, Upper Price: {upperPrice}");

            ListView1.DataBind(); // Rebind the data to reflect the new search criteria
        }
        protected void ListView1_DataBound(object sender, EventArgs e)
        {
            if (ListView1.Items.Count == 0)
            {
                // Display a message when no results are found
                Literal noResults = new Literal();
                noResults.Text = "<p>No beverages founded.</p>";
                ListView1.Controls.Add(noResults);
            }
        }
    }
}