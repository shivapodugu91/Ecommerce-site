using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
//using MySql.Data;

namespace ecomNew
{
    public partial class Login : System.Web.UI.Page
    {
        MySqlConnection con;
        MySqlDataReader reader;
        string userid;
        protected void Page_Load(object sender, EventArgs e)
        {
            hl1.Visible = false;
        }
        protected void signin2btn_Click(object sender, EventArgs e)
        {
            if (validate(inputEmail1.Text, inputPassword1.Text))
            {

                var abc = Session["userid"].ToString();
                byte[] var = System.Text.ASCIIEncoding.ASCII.GetBytes(abc);
                Response.Redirect("index.aspx?userid=" + System.Convert.ToBase64String(var) + "", false);
                Response.Write(Session["userid"]);
            }
            else
            {
                //  Response.Write("error in logon");
                string display = "Emailid and Password incorrect";
                ClientScript.RegisterStartupScript(this.GetType(), "Unsuccessful", "alert('" + display + "');", true);
            }

        }

        //validating customer
        public bool validate(string emailid, string password)
        {
            bool boolreturnvalue = false;
            try
            {
                con = new MySqlConnection();
                con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString; ;
                con.Open();
                string sql = "select Customer_id,Customer_emailid,Customer_password from customer where Customer_emailid=@email and Customer_password=@pass";
                MySqlCommand cmd = new MySqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@email", inputEmail1.Text);
                cmd.Parameters.AddWithValue("@pass", inputPassword1.Text);
                reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    if (reader.Read())
                    {
                        Session.Add("userid", reader["Customer_id"]);
                    }

                    boolreturnvalue = true;
                    return boolreturnvalue;
                }
                else
                {
                    return boolreturnvalue;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                Console.ReadKey();
                return false;
            }

        }




        protected void inputEmail1_TextChanged(object sender, EventArgs e)
        {

        }
        // protected void createaccbtn_Click(object sender, EventArgs e)
        // {

        //{
        // Response.Redirect("Registration.aspx");
        //}

        // }

        protected void signupbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }
    }
}
