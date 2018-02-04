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

namespace Customer
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        MySqlConnection con;
        MySqlConnection con1;
        MySqlDataReader reader;
        string userid;
        int id;
        string pass, newpass;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["userid"] != null)
            {
                string abc = Request.QueryString["userid"];
                byte[] dec = System.Convert.FromBase64String(abc);
                userid = System.Text.ASCIIEncoding.ASCII.GetString(dec);
                //Session["homeuserid"] = userid;
                //Response.Write("Welcome " + userid);
                id = Convert.ToInt32(userid);
                try
                {
                    con = new MySqlConnection();
                    con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
                    con.Open();
                    string sql = "select Customer_password from customer where Customer_id=@id";
                    MySqlCommand cmd = new MySqlCommand(sql, con);
                    cmd.Parameters.AddWithValue("@id", id);
                    reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        pass = reader["Customer_password"].ToString();
                    }

                    reader.Close();
                    con.Close();
                }
                catch (Exception ea)
                {
                    Response.Write(ea.Message);

                }
            }
        }

        protected void ChangePassword__Click(object sender, EventArgs e)
        {
            con1 = new MySqlConnection();
            con1.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
            if (pass== OldPassword.Text)
            {
                if ((NewPassword.Text == ConfirmNewPassword.Text))
                {
                    newpass = Request.Form["NewPassword"];
                    try
                    {
                        con1.Open();
                        string sql = "Update customer set Customer_password=@pass where Customer_id=@val11";
                        MySqlCommand cmd = new MySqlCommand(sql, con1);
                        cmd.Parameters.AddWithValue("@pass", newpass);
                        cmd.Parameters.AddWithValue("@val11", userid);
                        int i = cmd.ExecuteNonQuery();
                        if (i > 0)
                        {
                            //Response.Write("success");
                            //Response.Redirect("Homepage.aspx",false);
                            //  ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "bootbox.alert('Hello world!')", true);
                            //bootbox.alert("Hello world!");
                            ClientScript.RegisterStartupScript(this.GetType(), "Javascript", "alert('Updated Successfully'); ", true);
                            con1.Close();
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "Javascript", "alert('Updated Failed'); ", true);
                            Response.Write("error");
                        }
                        con1.Close();
                        if (string.IsNullOrEmpty(userid))
                        {
                            Response.Write("userid empty");
                        }
                        else
                        {
                            var abc = userid;
                            byte[] var = System.Text.ASCIIEncoding.ASCII.GetBytes(abc);
                            Response.Redirect("Homepage.aspx?userid=" + System.Convert.ToBase64String(var) + "", false);
                        }

                    }
                    catch (Exception ae)
                    {
                        Response.Write(ae);
                    }

                    con1.Close();
                }
                else
                {
                    //put an alert box saying that password is wrong
                   // string display = "Old Password Not Correct";
                   // ClientScript.RegisterStartupScript(this.GetType(), "Unsuccessful", "alert('" + display + "');", true);
                }
            }
            else
            {
                string display = "Old Password Not Correct";
                ClientScript.RegisterStartupScript(this.GetType(), "Unsuccessful", "alert('" + display + "');", true);
            }
        }
       
        
    }
}