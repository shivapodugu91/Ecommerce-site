using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Customer
{
    public partial class admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("addCategory.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("addSubCategory.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("addProduct.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewProduct.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("editProduct.aspx");
        }

        protected void Signoff_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }
    }
}