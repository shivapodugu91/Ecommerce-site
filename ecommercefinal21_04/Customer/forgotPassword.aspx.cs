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
    public partial class forgotPassword : System.Web.UI.Page
    {
        MySqlConnection con;
        MySqlDataReader reader;
        string userid;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected int dataindb()
        {

            con = new MySqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString; ;
            //try
            {
                con.Open();
                string sql = "select Customer_emailid from customer where Customer_emailid=@name";
                MySqlCommand cmd = new MySqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@name", input_email.Text);
                reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    return 1;

                    //Label1.Text = "";
                    //fetch();
                    //var abc = userid;
                    //byte[] var = System.Text.ASCIIEncoding.ASCII.GetBytes(abc);
                    //Response.Redirect("forgotpassword1.aspx?userid=" + System.Convert.ToBase64String(var) + "", false);

                }
                else
                {
                    return 0;
                    //Label1.Text = "Email id does not exist";
                }
                con.Close();
            }
            //catch (Exception ex)
            {
                //Console.WriteLine(ex.Message);
                //Console.ReadKey();
            }



        }


        protected void input_email_TextChanged(object sender, EventArgs e)
        {
            con = new MySqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString; ;
            try
            {
                con.Open();
                string sql = "select Customer_emailid from customer where Customer_emailid=@name";
                MySqlCommand cmd = new MySqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@name", input_email.Text);
                reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {

                    Label1.Text = "";
                    fetch();
                    //var abc = userid;
                    //byte[] var = System.Text.ASCIIEncoding.ASCII.GetBytes(abc);
                    //Response.Redirect("forgotpassword1.aspx?userid=" + System.Convert.ToBase64String(var) + "", false);

                }
                else
                {
                    Label1.Text = "Email id does not exist";
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                Console.ReadKey();
            }


        }


        private void fetch()
        {
            con = new MySqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
            try
            {
                con.Open();
                string sql = "select Customer_id from customer where Customer_emailid=@emailid";
                MySqlCommand cmd = new MySqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@emailid", input_email.Text);
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    userid = reader["Customer_id"].ToString();
                    Session["userid"] = userid;
                }
                reader.Close();
                con.Close();
            }
            catch (Exception e)
            {
                Response.Write(e.Message);
                con.Close();
            }


        }

        protected void sub1_Click(object sender, EventArgs e)
        {
            fetch();

            int a = dataindb();
            if (a == 1)
            {

                var abc = Session["userid"].ToString(); ;
                byte[] var = System.Text.ASCIIEncoding.ASCII.GetBytes(abc);
                Response.Redirect("forgotpassword1.aspx?userid=" + System.Convert.ToBase64String(var) + "", false);
                // Response.Write("Hello "+Session["userid"]);
            }
            //Response.Write(Session["userid"]);
        }



    }
}