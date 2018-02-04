using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ecomNew
{
    public partial class forgotPassword1 : System.Web.UI.Page
    {
        string userid;
        MySqlConnection con;
        MySqlDataReader reader;
        int id;
        string answer1, answer2;
        protected void Page_Load(object sender, EventArgs e)
        {
            // if (!IsPostBack)
            {

                if (Request.QueryString["userid"] != null)
                {
                    string abc = Request.QueryString["userid"];
                    byte[] dec = System.Convert.FromBase64String(abc);
                    userid = System.Text.ASCIIEncoding.ASCII.GetString(dec);
                    id = Convert.ToInt32(Session["userid"].ToString());
                }

                try
                {
                    con = new MySqlConnection();
                    con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
                    con.Open();
                    string sql = "select `Question_1`,`Question_2` from securityquestions where `Customer_id`=@id";

                    MySqlCommand cmd = new MySqlCommand(sql, con);

                    cmd.Parameters.AddWithValue("@id", id);

                    reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        // userid = reader["Customer_username"].ToString();
                        ques1.Text = reader["Question_1"].ToString();
                        //answer1= reader["Answer_1"].ToString();
                        ques2.Text = reader["Question_2"].ToString();
                        //answer2 = reader["Answer_2"].ToString();

                        //Customer_username.Text = reader["Customer_username"].ToString();

                        // mobile.Text = reader["Customer_mobilenumber"].ToString();
                    }
                    else
                    {
                        // Customer_firstname.Text = reader["Customer_firstname"].ToString();
                    }

                    reader.Close();
                    con.Close();
                    //ans1.Text = " ";
                    //ans2.Text = " ";

                }
                catch (Exception ea)
                {
                    Response.Write(ea.Message);

                }

            }





        }

        protected void sub_Click(object sender, EventArgs e)
        {
            //Response.Write(answer1 + answer2);

            bool a = answercheck();

            if (a == true)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('You can reset your password !'); window.location='ChangePassword1.aspx'", true);
                // Response.Redirect("ChangePassword.aspx");
            }
            else
            {

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Both theanswers must be correct !');", true);
            }

        }

        protected bool answercheck()
        {
            id = Convert.ToInt32(Session["userid"].ToString());

            try
            {
                con = new MySqlConnection();
                con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
                con.Open();
                string sql = "select `Answer_1`,`Answer_2` from securityquestions where `Customer_id`=@id";

                MySqlCommand cmd = new MySqlCommand(sql, con);

                cmd.Parameters.AddWithValue("@id", id);

                reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    // userid = reader["Customer_username"].ToString();
                    //ques1.Text = reader["Question_1"].ToString();
                    answer1 = reader["Answer_1"].ToString();
                    // ques2.Text = reader["Question_2"].ToString();
                    answer2 = reader["Answer_2"].ToString();

                    //Customer_username.Text = reader["Customer_username"].ToString();

                    // mobile.Text = reader["Customer_mobilenumber"].ToString();
                }
                else
                {
                    // Customer_firstname.Text = reader["Customer_firstname"].ToString();
                }


                reader.Close();
                con.Close();

            }
            catch (Exception ea)
            {
                Response.Write(ea.Message);

            }
            //Response.Write("welcome" + answer1);

            if (answer1.Equals(ans1.Text) && answer2.Equals(ans2.Text))

                return true;

            else
                return false;

        }



    }
}