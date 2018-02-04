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
    public partial class payment : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection();
        String userid, paymentcardnumber;
        int paymentid;
        string selectedValue;
        MySqlDataReader reader;
        ArrayList paymentdetails = new ArrayList();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            
                userid=Session["userid"].ToString();
                //insert();
                con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
                try
                {
                    con.Open();

                    string sql1 = "SELECT `payment_id`,`Card_number` FROM payment where Customer_id=@id ";

                    MySqlCommand cmd1 = new MySqlCommand(sql1, con);
                    cmd1.Parameters.AddWithValue("@id", userid);


                    reader = cmd1.ExecuteReader();
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {

                            paymentid =(int) reader["payment_id"];
                            paymentcardnumber = reader["Card_number"].ToString();





                            paymentdetails paymentadd = new paymentdetails(paymentid,paymentcardnumber);

                            paymentdetails.Add(paymentadd);



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
                GridView1.DataSource = paymentdetails;
                GridView1.DataBind();


            
        }

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {

            if(RadioButton1.Checked)
            {
                paymentlabel.Visible = false;
                RadioButton1.Visible = false;
                RadioButton2.Visible = false;
                //yestxt.Visible = false;
                //notxt.Visible = false;
                GridView1.Visible = false;
                payheading.Visible = false;
                lblcardholdername.Visible = true;
                holdername.Visible = true;
                lblcardnumber.Visible = true;
                cardnumber.Visible = true;
                lblcardexpiry.Visible = true;
                monthdrop.Visible = true;
                year.Visible = true;
                lblcvv.Visible = true;
                cvv.Visible = true;
                lblpostcode.Visible = true;
                postcode.Visible = true;
                RequiredFieldValidator1.Enabled = true;
                RequiredFieldValidator2.Enabled = true;
                RequiredFieldValidator11.Enabled = true;
                regexppost.Enabled = true;
            }
            else
            {
                paymentlabel.Visible = false;
                RadioButton1.Visible = false;
                RadioButton2.Visible = false;
                lblcardholdername.Visible = false;
                holdername.Visible = false;
                lblcardnumber.Visible = false;
                cardnumber.Visible = false;
                lblcardexpiry.Visible = false;
                monthdrop.Visible = false;
                year.Visible = false;
                lblcvv.Visible = false;
                cvv.Visible = false;
            }
        }

        //private void insert()
        //{
        //    con = new MySqlConnection();
        //    con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
        //    try
        //    {
        //        con.Open();
        //        string sql = "insert into payment (`Customer_id`,`Card_number`,`Card_cvv`,`Card_expiry_month`,`Card_expiry_year`,`Zipcode`) values(@val1,@val2,@val3,@val4,@val5,@val6)";
        //        MySqlCommand cmd = new MySqlCommand(sql, con);
        //        cmd.Parameters.AddWithValue("@val1",userid);
        //        cmd.Parameters.AddWithValue("@val2",cardnumber.Text);
        //        cmd.Parameters.AddWithValue("@val3",cvv.Text);
        //        cmd.Parameters.AddWithValue("@val4",monthdrop.SelectedValue);
        //        cmd.Parameters.AddWithValue("@val5",year.SelectedValue);
        //        cmd.Parameters.AddWithValue("@val6", postcode.Text);
        //        int i = cmd.ExecuteNonQuery();
        //        if(i>0)
        //        {
        //            Response.Redirect("createorder.aspx");
        //        }
        //        else
        //        {
        //            Response.Write("error");
        //        }
        //        con.Close();
        //    }

        //    finally
        //    {
        //        con.Close();
        //    }
        //}

        protected void registerbtn_Click(object sender, EventArgs e)
        {
           
            if (RadioButton1.Checked)
            {
                con = new MySqlConnection();
                con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
                try
                {
                    con.Open();
                    string sql = "insert into payment (`Customer_id`,`Card_number`,`Card_cvv`,`Card_expiry_month`,`Card_expiry_year`,`Zipcode`) values(@val1,@val2,@val3,@val4,@val5,@val6)";
                    MySqlCommand cmd = new MySqlCommand(sql, con);
                    cmd.Parameters.AddWithValue("@val1", userid);
                    cmd.Parameters.AddWithValue("@val2", cardnumber.Text);
                    cmd.Parameters.AddWithValue("@val3", cvv.Text);
                    cmd.Parameters.AddWithValue("@val4", monthdrop.SelectedValue);
                    cmd.Parameters.AddWithValue("@val5", year.SelectedValue);
                    cmd.Parameters.AddWithValue("@val6", postcode.Text);
                    int i = cmd.ExecuteNonQuery();
                    if (i > 0)
                    {
                        string sql1 = "select  payment_id from payment where Customer_id=@id order by payment_id desc LIMIT 1 ;";
                        MySqlCommand cmd1 = new MySqlCommand(sql1, con);
                        cmd1.Parameters.AddWithValue("@id", userid);
                        reader = cmd1.ExecuteReader();
                        if (reader.Read())
                        {
                            selectedValue = reader["payment_id"].ToString();
                            Session["payment_id"] = selectedValue;
                        }
                        reader.Close();
                
                        var abc = Session["payment_id"].ToString(); ;
                        byte[] var = System.Text.ASCIIEncoding.ASCII.GetBytes(abc);
                        Response.Redirect("createorder.aspx?payment_id=" + System.Convert.ToBase64String(var) + "", false);
                     
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
            else {
                selectedValue = Request.Form["MyRadioButton"];
                Session["payment_id"] = selectedValue;
                var abc = Session["payment_id"].ToString(); ;
                byte[] var = System.Text.ASCIIEncoding.ASCII.GetBytes(abc);
                Response.Redirect("createorder.aspx?payment_id=" + System.Convert.ToBase64String(var) + "", false);
              
            }
          
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            paymentlabel.Visible = false;
            RadioButton1.Visible = false;
            RadioButton2.Visible = false;
        }
    }
}