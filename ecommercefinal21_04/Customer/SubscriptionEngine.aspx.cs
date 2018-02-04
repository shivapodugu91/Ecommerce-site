using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using MySql.Data.MySqlClient;
using MySql.Data.Types;
using System.Globalization;

namespace Customer
{
    public partial class SubscriptionEngine : System.Web.UI.Page
    {
         MySqlConnection con,con1,con2;
        MySqlDataReader reader, reader1;
        String Customer_id,Product_id,price,quantity;
        int order_id = 0, s_id = 0, freq = 0, ts = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {  
            subscriptionProcessor();
        }
        private void subscriptionProcessor()
        {
          
            con = new MySqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
            try
            {
                timedate2.InnerHtml+= ".........subscriptionProcessor called...........";
                con.Open();
                string CurrentDatePlusOne = DateTime.Now.AddDays(1).ToString("yyyy-MM-dd");
                string sql = "select * from subscription where Expected_Deliverydate=@deliveryDate and Frequency>0";
                MySqlCommand cmd = new MySqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@deliveryDate", CurrentDatePlusOne);
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Customer_id = reader["Customer_id"].ToString();
                    Product_id = reader["Product_id"].ToString();
                    quantity = reader["Quantity"].ToString();
                    s_id = Int32.Parse(reader["Subscription_id"].ToString());
                    freq = Int32.Parse(reader["Frequency"].ToString());
                    ts = Int32.Parse(reader["Timespan"].ToString());
                    price = findProductPrice(Product_id);
                    double totalPrice = double.Parse(price) * double.Parse(quantity);
                    ///tax to be computed
                    totalPrice = totalPrice + (totalPrice * 0.0825);
                    totalPrice = Math.Round(totalPrice,2);
                    // insert();
                    insertIntoOrder(Customer_id, totalPrice);
                    updateSubscriptionOrder(freq, s_id,ts);
                    insertIntoOrderLineitems(Product_id, totalPrice,Int32.Parse(quantity));
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

        public void updateSubscriptionOrder(int f,int sub_id,int t_s)
        {
            con2 = new MySqlConnection();
            con2.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
            try
            {
                con1.Open();
                string sql = "Update subscription set Frequency=@val1,Expected_Deliverydate=@val2 where Subscription_id=@val3";
                MySqlCommand cmd = new MySqlCommand(sql, con1);
                f = f - 1;
                //commented below for demo purpose
                // t_s = t_s + 1;
                cmd.Parameters.AddWithValue("@val1", f);
                //commented below for demo purpose
                //string s = DateTime.Today.AddDays(t_s+1).ToString("yyyy-MM-dd");
                string s = DateTime.Today.AddDays(1).ToString("yyyy-MM-dd");
                cmd.Parameters.AddWithValue("@val2", Convert.ToDateTime(s));
                cmd.Parameters.AddWithValue("@val3", sub_id);
                int i = cmd.ExecuteNonQuery();
                if (i > 0 )
                {
                    con1.Close();
                }
                else
                { 
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

        private string findProductPrice(String p_id)
        {
            timedate2.InnerHtml+= "........findProductPrice called...........";
            string p="";
            con1 = new MySqlConnection();
            con1.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
            try
            {
                con1.Open();
                string sql = "select Product_price from product where Product_id=@Product_id";
                MySqlCommand cmd1 = new MySqlCommand(sql, con1);
                cmd1.Parameters.AddWithValue("@Product_id", p_id);
                reader1 = cmd1.ExecuteReader();
                if (reader1.Read())
                {
                    p = reader1["Product_price"].ToString();
                }
                reader1.Close();
                con1.Close();
                return p;
            }
            catch (Exception e)
            {
                Response.Write(e.Message);
                con1.Close();
                return p;
            }
        }

        public void insertIntoOrder(string c_id,double tp)
        {
            timedate2.InnerHtml += "....insertIntoOrder called.......";
            con2 = new MySqlConnection();
            con2.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
            try
            {
                con2.Open();
                string sql = "insert into `order` ( `Customer_id`,`Order_date`, `Ship_date`, `TotalPrice`)  values(@val1,@val2,@val3,@val4)";
                MySqlCommand cmd2 = new MySqlCommand(sql, con2);
                cmd2.Parameters.AddWithValue("@val1", Int32.Parse(c_id));
                string s = DateTime.Today.ToString("yyyy-MM-dd");
                cmd2.Parameters.AddWithValue("@val2", Convert.ToDateTime(s)); 
                s = DateTime.Today.AddDays(1).ToString("yyyy-MM-dd");
                cmd2.Parameters.AddWithValue("@val3", Convert.ToDateTime(s));
                cmd2.Parameters.AddWithValue("@val4", (float)tp);
                int i = cmd2.ExecuteNonQuery();
                order_id =(Int32) cmd2.LastInsertedId;
                timedate2.InnerHtml += "order_id: "+order_id;
                if (i > 0)
                {
                    timedate2.InnerHtml += ".............order insertion success called...........";
                    con2.Close();
                }
                else
                {
                    //  Response.Write("error");
                    timedate2.InnerHtml += ".............order insertion failed ...........";
                }
                con2.Close();
            }
            catch (Exception e)
            {
                timedate2.InnerHtml += e;
            }
            con2.Close();
        }

        public void insertIntoOrderLineitems(string p_id, double tp,int q)
        {
            timedate2.InnerHtml += "....insertIntoOrderlineitems called.......";
            con2 = new MySqlConnection();
            con2.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
            try
            {
                con2.Open();
                string sql = "insert into `order_lineitems` ( `Product_id`,`Product_price`, `Shipment_status`, `Order_id`,`Product_quantity`)  values(@val1,@val2,@val3,@val4,@val5)";
                MySqlCommand cmd2 = new MySqlCommand(sql, con2);
                cmd2.Parameters.AddWithValue("@val1", Int32.Parse(p_id));
                //total price is inserted
                cmd2.Parameters.AddWithValue("@val2", tp);
                cmd2.Parameters.AddWithValue("@val3","pick");
                cmd2.Parameters.AddWithValue("@val4", order_id);
                cmd2.Parameters.AddWithValue("@val5", q);
                int i = cmd2.ExecuteNonQuery();
                if (i > 0)
                {
                    timedate2.InnerHtml += ".............order lineitems insertion success called...........\n\n";
                    con2.Close();
                    updateProductQuantity(Int32.Parse(p_id),q);
                }
                else
                {
                    //  Response.Write("error");
                    timedate2.InnerHtml += ".............order lineitems insertion failed ...........";
                }
                con2.Close();
            }
            catch (Exception e)
            {
                timedate2.InnerHtml += e;
            }
            con2.Close();
        }
        public void updateProductQuantity(int productId, int productQuantity)
        {
            con2 = new MySqlConnection();
            con2.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
            try
            {
                con1.Open();
                string sql = "UPDATE `mydb`.`product` SET `Product_quantity`=`Product_quantity`-@val1 WHERE `Product_id`=@val2;";
                MySqlCommand cmd = new MySqlCommand(sql, con1);
              
                cmd.Parameters.AddWithValue("@val1", productQuantity);
                cmd.Parameters.AddWithValue("@val2", productId);
                int i = cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    timedate2.InnerHtml += ".............updateProductQuantity Success ...........";
                    con1.Close();
                }
                else
                {
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
