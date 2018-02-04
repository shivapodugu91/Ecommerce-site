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
                ViewState["userid"] = System.Text.ASCIIEncoding.ASCII.GetString(dec);
            }

            userid = Session["userid"].ToString();
            if (!IsPostBack)
            {
                if (Session["userid"] != null)
                {
                    userid = Session["userid"].ToString();
                   
                    id = Convert.ToInt32(userid);
                    try
                    {
                        con = new MySqlConnection();
                        con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
                        con.Open();
                        string sql = "select Customer_password from customer where Customer_id=@id";
                        MySqlCommand cmd = new MySqlCommand(sql, con);
                        cmd.Parameters.AddWithValue("@id", userid);
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
        }



        protected void subclick_Click(object sender, EventArgs e)
        {
            con1 = new MySqlConnection();
            con1.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
            if (pass == Request.Form["OldPassword"])
            {
                if ((Request.Form["NewPassword"] == Request.Form["ConfirmNewPassword"]))
                {

                    try
                    {
                        con1.Open();
                        string sql = "Update customer set Customer_password=@pass where Customer_id=@val11";
                        MySqlCommand cmd = new MySqlCommand(sql, con1);
                        cmd.Parameters.AddWithValue("@pass", NewPassword.Text);
                        cmd.Parameters.AddWithValue("@val11", userid);
                        int i = cmd.ExecuteNonQuery();
                        if (Session["userid"] == null)
                        {
                            Response.Write("userid empty");
                        }
                        if (i > 0)
                        {
                            //Response.Write("success");
                            //Response.Redirect("Homepage.aspx",false);
                            //  ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "bootbox.alert('Hello world!')", true);
                            //bootbox.alert("Hello world!");
                            con1.Close();
                            ClientScript.RegisterStartupScript(this.GetType(), "Javascript", "alert('Updated Successfully'); window.location='Login.aspx'", true);

                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "Javascript", "alert('Updated Failed'); ", true);
                            Response.Write("error");
                        }
                        con1.Close();



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