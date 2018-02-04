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

namespace ecomNew
{
    public partial class Registration : System.Web.UI.Page
    {
        MySqlConnection con;
        MySqlDataReader reader;
        string userid;
        int j;
     

        protected void Page_Load(object sender, EventArgs e)
        {

          


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

                    Label1.Text = "Email id already exists";

                }
                else
                {
                    Label1.Text = "";
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                Console.ReadKey();
            }


        }

       


        protected void registerbtn_Click1(object sender, EventArgs e)
        {


            insert();



        }

        public void insert()
        {
            con = new MySqlConnection();

            con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
            try
            {
                con.Open();
                string sql = "insert into customer ( `Customer_password`,`Customer_emailid`, `Customer_firstname`, `Customer_lastname`,`Customer_mobilenumber`) values(@val2,@val3,@val4,@val5,@val6)";
                string sql1 = "insert into billtoaddress ( `FirstName`,`LastName`,`Customer_emailid`, `Address1`, `Address2`,`City`,`State`,`Country`,`Mobilenumber`,`Zipcode`)  values(@val2,@val3,@val4,@val5,@val6,@val7,@val8,@val9,@val10,@val11)";
                MySqlCommand cmd = new MySqlCommand(sql, con);
                MySqlCommand cmd1 = new MySqlCommand(sql1, con);
           

                cmd.Parameters.AddWithValue("@val2", inputPassword1.Text);
                cmd.Parameters.AddWithValue("@val3", input_email.Text);
                cmd.Parameters.AddWithValue("@val4", inputFname1.Text);
                cmd.Parameters.AddWithValue("@val5", inputLnam.Text);
                cmd.Parameters.AddWithValue("@val6", mobile.Text);

                cmd1.Parameters.AddWithValue("@val2", inputFname1.Text);
                cmd1.Parameters.AddWithValue("@val3", inputLnam.Text);
                cmd1.Parameters.AddWithValue("@val4", input_email.Text);
                cmd1.Parameters.AddWithValue("@val5", address.Text);
                cmd1.Parameters.AddWithValue("@val6", address2.Text);
                cmd1.Parameters.AddWithValue("@val7", DropDownListcity.SelectedValue);
                cmd1.Parameters.AddWithValue("@val8", DropDownListstate.SelectedValue);
                cmd1.Parameters.AddWithValue("@val9", DropDownListcountry.SelectedValue);
                cmd1.Parameters.AddWithValue("@val10", mobile.Text);
                cmd1.Parameters.AddWithValue("@val11", postcode.Text);
              
            
                int i = cmd.ExecuteNonQuery();
                if (i> 0)
                {
                    j = cmd1.ExecuteNonQuery();
                    string sql5 = "select Customer_id from customer where Customer_emailid=@emailid";
                    MySqlCommand cmd5 = new MySqlCommand(sql5, con);
                    cmd5.Parameters.AddWithValue("@emailid", input_email.Text);
                    reader = cmd5.ExecuteReader();
                    if (reader.Read())
                    {
                        userid = reader["Customer_id"].ToString();
                        Session["userid"] = userid;
                    }
                    reader.Close();
                    string sql3 = "Update billtoaddress set Customer_id=@id where Customer_emailid=@val11";
                    string sql4 = "Update shiptoaddress set Customer_id=@id ";
                    MySqlCommand cmd3 = new MySqlCommand(sql3, con);
                    MySqlCommand cmd4 = new MySqlCommand(sql4, con);

                    cmd3.Parameters.AddWithValue("@val11", input_email.Text);
                    cmd3.Parameters.AddWithValue("@id", userid);
                    cmd3.ExecuteNonQuery();
                }
                


              

                con.Close();
                if (i > 0 && j > 0)
                {

                    fetch();
                    con = new MySqlConnection();
                    con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
                    con.Open();
                    string sqlsec = "insert into securityquestions (`Customer_id`, `Question_1`,`Answer_1`,`Question_2`,`Answer_2`) values(@val9,@val3,@val4,@val5,@val6)";
                    
                    MySqlCommand cmdsec = new MySqlCommand(sqlsec, con);
                 
                    cmdsec.Parameters.AddWithValue("@val9", userid);
                    cmdsec.Parameters.AddWithValue("@val3", DropDownList1.SelectedValue);
                    cmdsec.Parameters.AddWithValue("@val4", answer1.Text);
                    cmdsec.Parameters.AddWithValue("@val5", DropDownList2.Text);
                    cmdsec.Parameters.AddWithValue("@val6", answer2.Text);
                    
                    cmdsec.ExecuteNonQuery();
                   
                    if(RadioButton1.Checked)
                    {
                        string sql4 = "insert into shiptoaddress ( `Customer_id`,`FirstName`,`LastName`, `Address1`, `Address2`,`City`,`State`,`Country`,`Mobilenumber`,`Zipcode`)  values(@val2,@val3,@val4,@val5,@val6,@val7,@val8,@val9,@val10,@val11)";
                        MySqlCommand cmd4 = new MySqlCommand(sql4, con);
                        cmd4.Parameters.AddWithValue("@val2", Session["userid"]);
                        cmd4.Parameters.AddWithValue("@val3", inputFname1.Text);
                        cmd4.Parameters.AddWithValue("@val4", inputLnam.Text);

                        cmd4.Parameters.AddWithValue("@val5", saddress.Text);
                        cmd4.Parameters.AddWithValue("@val6", saddress2.Text);
                        cmd4.Parameters.AddWithValue("@val7", scity.SelectedValue);
                        cmd4.Parameters.AddWithValue("@val8", sstate.SelectedValue);
                        cmd4.Parameters.AddWithValue("@val9", scountry.SelectedValue);
                        cmd4.Parameters.AddWithValue("@val10", mobile.Text);
                        cmd4.Parameters.AddWithValue("@val11", spostcode.Text);
                        j = cmd4.ExecuteNonQuery();
                        if(j>0)
                        {
                            Response.Write("success");
                        }
                        else
                        {
                            Response.Write("error");
                        }

                    }

                    if (r1.Checked)
                    {

                        var abc = userid;
                        byte[] var = System.Text.ASCIIEncoding.ASCII.GetBytes(abc);

                        Response.Redirect("Carddetails.aspx?userid=" + System.Convert.ToBase64String(var) + "", false);
                       
                    }
                    else
                    {
                        Response.Redirect("Login.aspx");
                    }

                    Response.Write("success");
                

                }
                else
                {
                    Response.Write("error");
                }
                con.Close();
                con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
                con.Open();
               
             
                con.Close();
                if (string.IsNullOrEmpty(userid))
                {
                    Response.Write("userid empty");
                }
                else
                {
               
                }
            }
            catch (Exception e)
            {
                Response.Write(e);
            }
          
            con.Close();
        }

        private void fetch()
        {
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

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            if(RadioButton1.Checked)
            {
                lblsaddress1.Visible = true;
                saddress.Visible = true;
                lblsaddress2.Visible = true;
                saddress2.Visible = true;
                scity.Visible = true;
                scountry.Visible = true;
                lblscity.Visible = true;
                lblscountry.Visible = true;
                lblspostcode.Visible = true;
                lblsstate.Visible = true;
                sstate.Visible = true;
                RequiredFieldValidatoraddress.Enabled = true;
                regexprsaddress.Enabled = true;
                RequiredFieldValidatorsaddress2.Enabled = true;
                RegularExpressionValidatorsaddress2.Enabled = true;
                RequiredFieldValidatorscity.Enabled = true;
                RequiredFieldValidatorstate.Enabled = true;
                RequiredFieldValidatorcountry.Enabled = true;
                RequiredFieldValidatorspost.Enabled = true;
                Regexppost.Enabled = true;


                spostcode.Visible = true;
                RadioButton1.Visible = false;
                RadioButton2.Visible = false;
                yestxt.Visible = false;
                notxt.Visible = false;
            }
            else
            {
                lblsaddress1.Visible = false;
                saddress.Visible = false;
                lblsaddress2.Visible = false;
                saddress2.Visible = false;
                scity.Visible = false;
                scountry.Visible = false;
                lblscity.Visible = false;
                lblscountry.Visible = false;
                lblspostcode.Visible = false;

                spostcode.Visible = false;
                RadioButton1.Visible = false;
                RadioButton2.Visible = false;
                yestxt.Visible = false;
                notxt.Visible = false;
                shiplabel.Visible = false;
            }
            
       

           
        }

        protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
        {
            
        }

       
       








       

    }
}