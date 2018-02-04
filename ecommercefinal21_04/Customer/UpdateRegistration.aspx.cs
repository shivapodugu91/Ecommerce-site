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
    public partial class UpdateRegistration : System.Web.UI.Page
    {
        //MySql.Data.MySqlClient.MySqlConnection msqlConnection = null;
        // string connectionstring = "server=localhost;user id=root;Password=root;persistsecurityinfo=True;database=mydb";
        // string connectionstring = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
        //SqlDataAdapter adapter = new SqlDataAdapter();
        MySqlConnection con;
        MySqlConnection con1;
        MySqlDataReader reader, reader1;
        string userid;
        int id,i,j;
        //SqlDataReader reader;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["userid"] != null)
            {
                string abc = Request.QueryString["userid"];
                byte[] dec = System.Convert.FromBase64String(abc);
                userid = System.Text.ASCIIEncoding.ASCII.GetString(dec);
                id = Convert.ToInt32(userid);
            }


            userid = Session["userid"].ToString();
               id = Convert.ToInt32(userid);
            if (!IsPostBack)
            {

                {

                    userid = Session["userid"].ToString();
                    id = Convert.ToInt32(userid);
                  
                    try
                    {
                        con = new MySqlConnection();
                        con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
                        con.Open();
                        string sql = "select `Customer_emailid`,`Customer_firstname`,`Customer_lastname`,`Customer_mobilenumber` from customer where `Customer_id`=@id";

                        MySqlCommand cmd = new MySqlCommand(sql, con);

                        cmd.Parameters.AddWithValue("@id", id);

                        reader = cmd.ExecuteReader();

                        if (reader.Read())
                        {
                            // userid = reader["Customer_username"].ToString();
                            inputFname1.Text = reader["Customer_firstname"].ToString();
                            inputLnam.Text = reader["Customer_lastname"].ToString();
                            input_email.Text = reader["Customer_emailid"].ToString();
                            //Customer_username.Text = reader["Customer_username"].ToString();

                            mobile.Text = reader["Customer_mobilenumber"].ToString();
                        }
                        else
                        {
                            // Customer_firstname.Text = reader["Customer_firstname"].ToString();
                        }
                        reader.Close();


                        con.Close();
                        //labelusername.Text ="Welcome! "+ inputFname1.Text;
                        //con.Open();
                        //string sql1 = "select  `Address1`, `Address2`, `City`,`State`,`Country`,`Zipcode` from billtoaddress where `Customer_id`=@id";
                        //MySqlCommand cmd1 = new MySqlCommand(sql1, con);
                        //cmd1.Parameters.AddWithValue("@id", id);
                        //reader1 = cmd1.ExecuteReader();
                        //if(reader1.Read())
                        //{
                        //    address.Text = reader1["Address1"].ToString();
                        //    address2.Text = reader1["Address2"].ToString();
                        //    city.Text = reader1["City"].ToString();
                        //    state.Text = reader1["State"].ToString();
                        //    country.Text = reader1["Country"].ToString();
                        //    postcode.Text = reader1["Zipcode"].ToString();

                        //}
                        //else
                        //{
                        //    //Response.Write(ea.Message);
                        //}

                        //reader1.Close();

                        // con.Close();
                    }
                    catch (Exception ea)
                    {
                        Response.Write(ea.Message);

                    }
                }
            }

        }


        protected void update_Click(object sender, EventArgs e)
        {

            Update();
        }

        public void Update()
        {
            con1 = new MySqlConnection();
            con1.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
            try
            {
                con1.Open();

                string sql = "Update customer set Customer_emailid=@val2,Customer_firstname=@val3,Customer_lastname=@val4,Customer_mobilenumber=@val5 where Customer_id=@val12";
                string sql1 = "Update billtoaddress set Customer_emailid=@val2,FirstName=@val3,LastName=@val4,Mobilenumber=@val5 where Customer_id=@val12";

                MySqlCommand cmd = new MySqlCommand(sql, con1);
                MySqlCommand cmd1 = new MySqlCommand(sql1, con1);


                cmd.Parameters.AddWithValue("@val2", Request.Form["input_email"]);
                cmd.Parameters.AddWithValue("@val3", Request.Form["inputFname1"]);
                cmd.Parameters.AddWithValue("@val4", Request.Form["inputLnam"]);
                cmd.Parameters.AddWithValue("@val5", Request.Form["mobile"]);
                cmd1.Parameters.AddWithValue("@val2", Request.Form["input_email"]);
                cmd1.Parameters.AddWithValue("@val3", Request.Form["inputFname1"]);
                cmd1.Parameters.AddWithValue("@val4", Request.Form["inputLnam"]);
                cmd1.Parameters.AddWithValue("@val5", Request.Form["mobile"]);

                //cmd1.Parameters.AddWithValue("@val7", Request.Form["address2"]);
                //cmd1.Parameters.AddWithValue("@val8", Request.Form["city"]);
                //cmd1.Parameters.AddWithValue("@val9", Request.Form["state"]);
                //cmd1.Parameters.AddWithValue("@val10", Request.Form["country"]);
                //cmd1.Parameters.AddWithValue("@val11", Convert.ToInt32(Request.Form["postcode"]));

                cmd.Parameters.AddWithValue("@val12", id);
                cmd1.Parameters.AddWithValue("@val12", id);


               i = cmd.ExecuteNonQuery();
                if(i>0)
                { 
                   j = cmd1.ExecuteNonQuery(); 
                }
              
                if (i > 0 && j > 0)
                {

                    con1.Close();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Updated Successfully !'); window.location='index.aspx'", true);

                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Javascript", "alert('Update Failed'); ", true);
                    Response.Write("error");
                    con1.Close();
                }


            }
            catch (Exception e)
            {
                Response.Write(e);
                con1.Close();
            }


        }



    }
}