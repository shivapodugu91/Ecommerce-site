using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin
{
    public partial class Status : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Pick_status.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Pack_status.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Invoice.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("Ship_status.aspx");
        }
        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_cancel.aspx");
        }
        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminReturn_Initiate.aspx");
        }

        protected void adminhome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin.aspx");
        }
    }
}