using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Customer
{
    public partial class CustomerAddress : System.Web.UI.Page
    {
        MySqlConnection con;
        MySqlDataReader reader;
        string userid;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            
                userid = Session["userid"].ToString();
               // Response.Write(userid);
                fetch();
//                check();
            
        }

        private void check()
        {
            
        }

        private void fetch()
        {
            con = new MySqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString; ;
            try
            {
                con.Open();
                String sql = "select * from billtoaddress where Customer_id=@id";
                MySqlCommand cmd = new MySqlCommand(sql,con);
                cmd.Parameters.AddWithValue("@id",userid);
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    address.Text=reader["Address1"].ToString();
                    address2.Text = reader["Address2"].ToString();
                    city.Text=reader["City"].ToString();
                    state.Text = reader["State"].ToString();
                    country.Text = reader["Country"].ToString();
                    mobile.Text = reader["Mobilenumber"].ToString();
                    postcode.Text=reader["Zipcode"].ToString();
                }
            }
            finally
            {
                con.Close();
            }
        }

        protected void Proceed_Click(object sender, EventArgs e)
        {
            string selectedValue=null;
             con = new MySqlConnection();
               con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
               try
               {
                   con.Open();
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
            catch(Exception err)
              {
                  Response.Write(err);
            }
            //Response.Redirect("payment.aspx");
            //String user=null, fname=null, lname=null, add1=null, add2=null, city=null, state=null, mno=null, country=null, zip=null;
            //con = new MySqlConnection();
            //con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
            //try
            //{
            //    con.Open();
            //    String sql = "select * from billtoaddress where Customer_id=@id";
            //    String sql1 = "insert into shiptoaddress ( `Customer_id`,`FirstName`,`LastName`, `Address1`, `Address2`,`City`,`State`,`Country`,`Mobilenumber`,`Zipcode`)  values(@val0,@val1,@val2,@val3,@val4,@val5,@val6,@val7,@val8,@val9)";
            //    MySqlCommand cmd = new MySqlCommand(sql, con);
            //    MySqlCommand cmd1 = new MySqlCommand(sql1, con);
            //    cmd.Parameters.AddWithValue("@id", userid);
            //    cmd1.Parameters.AddWithValue("@id", userid);
            //    reader = cmd.ExecuteReader();
            //    if (reader.Read())
            //    {
            //        user = reader["Customer_id"].ToString();
            //        fname = reader["FirstName"].ToString();
            //        lname = reader["LastName"].ToString();
            //        add1 = reader["Address1"].ToString();
            //        add2 = reader["Address2"].ToString();
            //        city = reader["City"].ToString();
            //        state = reader["State"].ToString();
            //        country = reader["Country"].ToString();
            //        mno = reader["Mobilenumber"].ToString();
            //        zip = reader["Zipcode"].ToString();
            //    }
            //    reader.Close();
            //    cmd1.Parameters.AddWithValue("@val0", user);
            //    cmd1.Parameters.AddWithValue("@val1", fname);
            //    cmd1.Parameters.AddWithValue("@val2", lname);
            //    cmd1.Parameters.AddWithValue("@val3", add1);
            //    cmd1.Parameters.AddWithValue("@val4", add2);
            //    cmd1.Parameters.AddWithValue("@val5", city);
            //    cmd1.Parameters.AddWithValue("@val6", state);
            //    cmd1.Parameters.AddWithValue("@val7", country);
            //    cmd1.Parameters.AddWithValue("@val8", mno);
            //    cmd1.Parameters.AddWithValue("@val9", zip);
            //    try
            //    {
            //        int i = cmd1.ExecuteNonQuery();
            //        if (i > 0)
            //        {
            //            // Response.Write("Success");
            //        }
            //    }
            //    catch (Exception rror)
            //    {
            //        Response.Write(rror);
            //    }

            //}
            //catch(Exception err)
            //{
            //    Response.Write(err);
            //}
        }
        
    
        

        protected void yes_CheckedChanged(object sender, EventArgs e)
        {
            Proceed.Enabled = true;
            //Response.Redirect("index.aspx");
            String user=null, fname=null, lname=null, add1=null, add2=null, city=null, state=null, mno=null, country=null, zip=null;
            if(yes.Checked)
            {
                //Console.WriteLine("yes");
                con = new MySqlConnection();
                con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
                try
                {
                    con.Open();
                    String sql = "select * from billtoaddress where Customer_id=@id";
                    String sql1 = "insert into shiptoaddress ( `Customer_id`,`FirstName`,`LastName`, `Address1`, `Address2`,`City`,`State`,`Country`,`Mobilenumber`,`Zipcode`)  values(@val0,@val1,@val2,@val3,@val4,@val5,@val6,@val7,@val8,@val9)";
                    MySqlCommand cmd = new MySqlCommand(sql,con);
                    MySqlCommand cmd1 = new MySqlCommand(sql1, con);
                    cmd.Parameters.AddWithValue("@id",userid);
                    cmd1.Parameters.AddWithValue("@id",userid);
                    reader = cmd.ExecuteReader();
                    if(reader.Read())
                    {
                        user = reader["Customer_id"].ToString();
                        fname = reader["FirstName"].ToString();
                        lname=reader["LastName"].ToString();
                        add1 = reader["Address1"].ToString();
                        add2 = reader["Address2"].ToString();
                        city = reader["City"].ToString();
                        state = reader["State"].ToString();
                        country = reader["Country"].ToString();
                        mno = reader["Mobilenumber"].ToString();
                        zip = reader["Zipcode"].ToString();
                    }
                    reader.Close();
                        cmd1.Parameters.AddWithValue("@val0",user);
                        cmd1.Parameters.AddWithValue("@val1", fname);
                        cmd1.Parameters.AddWithValue("@val2", lname);
                        cmd1.Parameters.AddWithValue("@val3", add1);
                        cmd1.Parameters.AddWithValue("@val4", add2);
                        cmd1.Parameters.AddWithValue("@val5", city);
                        cmd1.Parameters.AddWithValue("@val6", state);
                        cmd1.Parameters.AddWithValue("@val7", country);
                        cmd1.Parameters.AddWithValue("@val8", mno);
                        cmd1.Parameters.AddWithValue("@val9", zip);
                        try
                        {
                            int i = cmd1.ExecuteNonQuery();
                            if (i > 0)
                            {
                               // Response.Write("Success");
                            }
                        }
                        catch(Exception rror)
                        {
                            Response.Write(rror);
                        }
                    
                    
                }
                finally
                {
                    con.Close();
                }

            }
            else
            {
                //Console.WriteLine("No is checked");
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "key", "window.open('entershipaddress.aspx,'','width=700,height=500')", true);
                Proceed.Enabled = false;
                //string url = "entershipaddress.aspx?userid=" + System.Convert.ToBase64String(var);
                
                string url = "entershipaddress.aspx";
                string s = "window.open('" + url + "', 'popup_window', 'width=700,height=500,left=100,top=100,resizable=yes');";
                ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);
                //Response.Redirect("index.aspx");
            }
            
        }

        
    }
}