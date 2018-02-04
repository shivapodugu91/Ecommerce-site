using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using MySql.Data.Types;
using System.Collections;

namespace ecomNew
{
    public partial class Carddetails : System.Web.UI.Page
    {
        MySqlConnection con;
        String userid;
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["userid"] != null)
                {
                    string abc = Request.QueryString["userid"];
                    byte[] dec = System.Convert.FromBase64String(abc);
                    userid = System.Text.ASCIIEncoding.ASCII.GetString(dec);
                    //Session["homeuserid"] = userid;
                    //Response.Write("Welcome " + userid);
                    ViewState["id"] = Convert.ToInt32(userid);
                }
            }
        }

        private void insert()
        {
            con = new MySqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
            try
            {
                con.Open();
                string sql = "insert into payment (`Customer_id`,`Card_number`,`Card_cvv`,`Card_expiry_month`,`Card_expiry_year`,`Zipcode`) values(@val1,@val2,@val3,@val4,@val5,@val6)";
                MySqlCommand cmd = new MySqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@val1", ViewState["id"]);
                cmd.Parameters.AddWithValue("@val2", cardnumber.Text);
                cmd.Parameters.AddWithValue("@val3", cvv.Text);
                cmd.Parameters.AddWithValue("@val4", monthdrop.SelectedValue);
                cmd.Parameters.AddWithValue("@val5", year.SelectedValue);
                cmd.Parameters.AddWithValue("@val6", postcode.Text);
                int i = cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    
                    Response.Redirect("Login.aspx");
                   
                }
                else
                {
                    Response.Write("error");
                }
                con.Close();
            }

            finally
            {
                con.Close();
            }
        }

        protected void registerbtn_Click(object sender, EventArgs e)
        {
            insert();
        }
    }

}
