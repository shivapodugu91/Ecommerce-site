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
    public partial class RegPay : System.Web.UI.Page
    {

         MySqlConnection con;
         MySqlDataReader reader;
        String userid,paymentcardnumber;
        ArrayList paymentdetails = new ArrayList();
        protected void Page_Load(object sender, EventArgs e)
        {
            userid = Session["userid"].ToString();
            
               

            
        }

        private void insert()
        {
            con = new MySqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
            try
            {
                con.Open();
                string sql = "insert into payment (`Customer_id`,`Card_number`,`Card_cvv`,`Card_expiry_month`,`Card_expiry_year`) values(@val1,@val2,@val3,@val4,@val5)";
                MySqlCommand cmd = new MySqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@val1",userid);
                cmd.Parameters.AddWithValue("@val2",cardnumber.Text);
                cmd.Parameters.AddWithValue("@val3",cvv.Text);
                cmd.Parameters.AddWithValue("@val4",monthdrop.SelectedValue);
                cmd.Parameters.AddWithValue("@val5",year.SelectedValue);
                int i = cmd.ExecuteNonQuery();
                if(i>0)
                {
                    string url = "RegPay.aspx";
                    //Response.Redirect("createorder.aspx");
                    string s = "window.close('" + url + "', 'popup_window', 'width=700,height=500,left=100,top=100,resizable=yes');";
                    ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);
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

        protected void registerbtn_Click(object sender, EventArgs e)
        {
            insert();
        }
    }

    }
