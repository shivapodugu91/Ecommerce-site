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
    public partial class Addresses : System.Web.UI.Page
    {
        MySqlConnection con;
        MySqlConnection con1;
        MySqlDataReader reader, reader1;
        string userid;
        int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["userid"] != null)
            {
                string abc = Request.QueryString["userid"];
                byte[] dec = System.Convert.FromBase64String(abc);
                ViewState["userid"] = System.Text.ASCIIEncoding.ASCII.GetString(dec);
            }
           
                userid = Session["userid"].ToString();
          
            if (!IsPostBack)
            {

                {

                    
                    try
                    {
                        con = new MySqlConnection();
                        con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
                        con.Open();
                        string sql = "select  `Address1`, `Address2`, `City`,`State`,`Country`,`Zipcode` from billtoaddress where `Customer_id`=@id";
                       // string sql1 = "select  `Address1`, `Address2`, `City`,`State`,`Country`,`Zipcode` from billtoaddress where `Customer_id`=@id";
                        MySqlCommand cmd = new MySqlCommand(sql, con);
                       // MySqlCommand cmd1= new MySqlCommand(sql1, con);
                        cmd.Parameters.AddWithValue("@id", userid);
                       // cmd1.Parameters.AddWithValue("@id", userid);
                        reader = cmd.ExecuteReader();

                        if (reader.Read())
                        {
                            baddress.Text = reader["Address1"].ToString();
                            baddress2.Text = reader["Address2"].ToString();
                            bcity.Text = reader["City"].ToString();
                            bstate.Text = reader["State"].ToString();
                            bcountry.Text = reader["Country"].ToString();
                            bpostcode.Text = reader["Zipcode"].ToString();
                        }
                        else
                        {
                            // Customer_firstname.Text = reader["Customer_firstname"].ToString();
                        }
                        reader.Close();
                        con.Close();

                        con.Open();
                        string sql1 = "select  `Address1`, `Address2`, `City`,`State`,`Country`,`Zipcode` from shiptoaddress where `Customer_id`=@id";
                        MySqlCommand cmd1 = new MySqlCommand(sql1, con);
                        cmd1.Parameters.AddWithValue("@id", id);
                        reader1 = cmd1.ExecuteReader();
                        if (reader1.Read())
                        {
                            address.Text = reader1["Address1"].ToString();
                            address2.Text = reader1["Address2"].ToString();
                            city.Text = reader1["City"].ToString();
                            state.Text = reader1["State"].ToString();
                            country.Text = reader1["Country"].ToString();
                            postcode.Text = reader1["Zipcode"].ToString();

                        }
                        else
                        {
                            //Response.Write(ea.Message);
                        }

                        reader1.Close();

                        con.Close();
                    }
                    catch (Exception ea)
                    {
                        Response.Write(ea.Message);

                    }
                }
            }

        }

        protected void registerbtn_Click(object sender, EventArgs e)
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

                string sql2 = "Update shiptoaddress set Address1=@val6,Address2=@val7,City=@val8,State=@val9,Country=@val10,Zipcode=@val11 where Customer_id=@val12";
                string sql1 = "Update billtoaddress set Address1=@val6,Address2=@val7,City=@val8,State=@val9,Country=@val10,Zipcode=@val11 where Customer_id=@val12";

                MySqlCommand cmd1 = new MySqlCommand(sql1, con1);
                 MySqlCommand cmd2 = new MySqlCommand(sql2, con1);


                //cmd.Parameters.AddWithValue("@val2", Request.Form["input_email"]);
                //cmd.Parameters.AddWithValue("@val3", Request.Form["inputFname1"]);
                //cmd.Parameters.AddWithValue("@val4", Request.Form["inputLnam"]);
                //cmd.Parameters.AddWithValue("@val5", Request.Form["mobile"]);
                cmd1.Parameters.AddWithValue("@val6", Request.Form["baddress"]);
                cmd1.Parameters.AddWithValue("@val7", Request.Form["baddress2"]);
                cmd1.Parameters.AddWithValue("@val8", Request.Form["bcity"]);
                cmd1.Parameters.AddWithValue("@val9", Request.Form["bstate"]);
                cmd1.Parameters.AddWithValue("@val10", Request.Form["bcountry"]);
                cmd1.Parameters.AddWithValue("@val11", Convert.ToInt32(Request.Form["bpostcode"]));

                cmd1.Parameters.AddWithValue("@val12", userid);
                //cmd1.Parameters.AddWithValue("@val12", Session["userid"]);
                cmd2.Parameters.AddWithValue("@val6", Request.Form["address"]);
                cmd2.Parameters.AddWithValue("@val7", Request.Form["address2"]);
                cmd2.Parameters.AddWithValue("@val8", Request.Form["city"]);
                cmd2.Parameters.AddWithValue("@val9", Request.Form["state"]);
                cmd2.Parameters.AddWithValue("@val10", Request.Form["country"]);
                cmd2.Parameters.AddWithValue("@val11", Convert.ToInt32(Request.Form["postcode"]));

                cmd2.Parameters.AddWithValue("@val12", userid);


                int i = cmd1.ExecuteNonQuery();
                int j = cmd2.ExecuteNonQuery();
                if (i > 0 && j>0)
                {

                    con1.Close();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Updated Successfully !'); ", true);

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