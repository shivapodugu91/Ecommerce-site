using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Web.Configuration;
using System.Collections;
namespace Customer
{
    
    public partial class entershipaddress : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection();
       // MySqlCommand cmd;
        String userid,shipaddress1,shipaddress2,shipcity,shipstate;
        int shipaddressid;
        MySqlDataReader reader;
        ArrayList shipdetails = new ArrayList();
        string selectedValue;
        protected void Page_Load(object sender, EventArgs e)
        {
            
                userid=Session["userid"].ToString();
                con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
                try
                {
                    con.Open();

                    string sql1 = "SELECT `Shiptoaddress_id`,`Address1`, `Address2`,`City`,`State` FROM shiptoaddress where Customer_id=@id ";

                    MySqlCommand cmd1 = new MySqlCommand(sql1, con);
                    cmd1.Parameters.AddWithValue("@id", userid);


                    reader = cmd1.ExecuteReader();
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {

                            shipaddressid =(int) reader["Shiptoaddress_id"];
                           shipaddress1 = reader["Address1"].ToString();
                           shipaddress2 = reader["Address2"].ToString();
                           shipcity = reader["City"].ToString();
                            shipstate = reader["State"].ToString();


                            

                            shippingdetails shippingadd = new shippingdetails(shipaddressid,shipaddress1, shipaddress2, shipcity, shipstate);

                            shipdetails.Add(shippingadd);



                        }
                    }

                    reader.Close();



                    con.Close();
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                    con.Close();
                }
                GridView1.DataSource = shipdetails;
                GridView1.DataBind();



               

            
        }
         protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {
             if(RadioButton1.Checked)
             {
                 lblsaddress1.Visible = true;
                 saddress.Visible = true;
                 lblsaddress2.Visible = true;
                 saddress2.Visible = true;
                 lblscity.Visible = true;
                 scity.Visible = true;
                 lblscountry.Visible = true;
                 scountry.Visible = true;
                 lblsstate.Visible = true;
                 sstate.Visible = true;
                 lblmobile.Visible = true;
                 mobile.Visible = true;
                 lblspostcode.Visible = true;
                 spostcode.Visible = true;
                 lblfname.Visible = true;
                 fname.Visible = true;
                 lbllname.Visible = true;
                 lname.Visible = true;
                
                 RequiredFieldValidator1.Enabled = true;
                 regexpfname.Enabled = true;
                 RequiredFieldValidator2.Enabled = true;
                 regexplname.Enabled = true;
                 RequiredFieldValidatoraddress.Enabled = true;
                 regexprsaddress.Enabled = true;
                 RequiredFieldValidatorsaddress2.Enabled = true;
                 RegularExpressionValidatorsaddress2.Enabled = true;
                 RequiredFieldValidatorscity.Enabled = true;
                 RequiredFieldValidatorstate.Enabled = true;
                 RequiredFieldValidatorcountry.Enabled = true;
                 RequiredFieldValidatorspost.Enabled = true;
                 Regexppost.Enabled = true;
                 RequiredFieldValidator9.Enabled = true;

                 RadioButton1.Visible = false;
                 RadioButton2.Visible = false;
                 yestxt.Visible = false;
                 notxt.Visible = false;
                 GridView1.Visible = false;

             }
             else
             {
                 lblsaddress1.Visible = false;
                 saddress.Visible = false;
                 lblsaddress2.Visible = false;
                 saddress2.Visible = false;
                 lblscity.Visible = false;
                 scity.Visible = false;
                 lblscountry.Visible = false;
                 scountry.Visible = false;
                 lblsstate.Visible = false;
                 sstate.Visible = false;
                 lblmobile.Visible = false;
                 mobile.Visible = false;
                 lblspostcode.Visible = false;
                 spostcode.Visible = false;
                 lblfname.Visible = false;
                 fname.Visible = false;
                 lbllname.Visible = false;
                 lname.Visible = false;
                
                 shiplabel.Visible = false;
                 shipheading.Visible = false;
                 RadioButton1.Visible = false;
                 RadioButton2.Visible = false;
                 yestxt.Visible = false;
                 notxt.Visible = false;
             }
           
        }
         protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
         {
            
         }

        protected void Proceed_Click(object sender, EventArgs e)
        {
             
           if(RadioButton1.Checked)
           {
               con = new MySqlConnection();
               con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
               try
               {
                   con.Open();
                   //String sql = "select * from billtoaddress where Customer_id=@id";
                   String sql = "insert into shiptoaddress ( `Customer_id`,`FirstName`,`LastName`, `Address1`, `Address2`,`City`,`State`,`Country`,`Mobilenumber`,`Zipcode`)  values(@val0,@val1,@val2,@val3,@val4,@val5,@val6,@val7,@val8,@val9)";
                   MySqlCommand cmd = new MySqlCommand(sql, con);
                   cmd.Parameters.AddWithValue("@val0", userid);
                   cmd.Parameters.AddWithValue("@val1", fname.Text);
                   cmd.Parameters.AddWithValue("@val2", lname.Text);
                   cmd.Parameters.AddWithValue("@val3", saddress.Text);
                   cmd.Parameters.AddWithValue("@val4", saddress2.Text);
                   cmd.Parameters.AddWithValue("@val5", scity.SelectedValue);
                   cmd.Parameters.AddWithValue("@val6", sstate.SelectedValue);
                   cmd.Parameters.AddWithValue("@val7", scountry.SelectedValue);
                   cmd.Parameters.AddWithValue("@val8", mobile.Text);
                   cmd.Parameters.AddWithValue("@val9", spostcode.Text);
                   int i = cmd.ExecuteNonQuery();
                   if (i > 0)
                   {
                       string sql1 = "select  Shiptoaddress_id from shiptoaddress where Customer_id=@id order by Shiptoaddress_id desc LIMIT 1 ;";
                       MySqlCommand cmd1 = new MySqlCommand(sql1, con);
                       cmd1.Parameters.AddWithValue("@id", userid);
                       reader = cmd1.ExecuteReader();
                       if (reader.Read())
                       {
                           selectedValue = reader["Shiptoaddress_id"].ToString();
                           Session["shipaddressid"] = selectedValue;
                       }
                       reader.Close();
                       var abc = Session["shipaddressid"].ToString(); ;
                       byte[] var = System.Text.ASCIIEncoding.ASCII.GetBytes(abc);
                       Response.Redirect("ordersummary.aspx?Shiptoaddress_id=" + System.Convert.ToBase64String(var) + "", false);
                   }
               }
               finally
               {

               }
           
           }
           else {
               selectedValue = Request.Form["MyRadioButton"];
               Session["shipaddressid"] = selectedValue;
               var abc = Session["shipaddressid"].ToString(); ;
               byte[] var = System.Text.ASCIIEncoding.ASCII.GetBytes(abc);
               Response.Redirect("ordersummary.aspx?Shiptoaddress_id=" + System.Convert.ToBase64String(var) + "", false);
           }
           
               
        }

        protected void GridView1_SelectedIndexChanging(object sender, EventArgs e)
        {
           
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName=="select")
            {
                shiplabel.Visible = false;
                shipheading.Visible = false;
                RadioButton1.Visible = false;
                RadioButton2.Visible = false;

            }
        }
    }
}