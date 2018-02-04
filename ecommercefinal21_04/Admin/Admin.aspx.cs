using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin
{
    public partial class Admin : System.Web.UI.Page
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
        protected void Button7_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminReturn_Initiate.aspx");
        }
        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_cancel.aspx");
        }
       
        protected void Button9_Click(object sender, EventArgs e)
        {
            Response.Redirect("Pick_status.aspx");
        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            Response.Redirect("admin_retrieve_order.aspx");
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            Response.Redirect("Status.aspx");
        }
    }

}
