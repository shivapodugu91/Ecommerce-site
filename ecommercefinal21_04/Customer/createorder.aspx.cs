using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Web.Configuration;
namespace Customer
{
    public partial class createorder : System.Web.UI.Page
    {
        MySqlConnection con;
        String userid,paymentid,orderid;
        MySqlDataReader reader;
        String cartid = null, date = null;
        protected void Page_Load(object sender, EventArgs e)
        {
           ///Response.Write(Session["sum"].ToString());
           //s userid = Session["userid"].ToString();
            if(!IsPostBack)
            {
                if (Request.QueryString["payment_id"] != null)
                {
                    string abc = Request.QueryString["payment_id"];
                    byte[] dec = System.Convert.FromBase64String(abc);
                    paymentid = System.Text.ASCIIEncoding.ASCII.GetString(dec);
                }
                userid=fetch(paymentid);
                //Response.Write(userid);
                placeorder();
                createlineitems();
                updateproductqty();
                deletecartitems();
            }
        }

        private void updateproductqty()
        {
            con = new MySqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
            MySqlDataReader reader=null;
            try
            {
                con.Open();
                string sql = "select Quantity,Product_id from cartitems where Cart_id=@id";
                MySqlCommand cmd = new MySqlCommand(sql,con);
                cmd.Parameters.AddWithValue("@id",cartid);
                reader = cmd.ExecuteReader();
                while(reader.Read())
                {
                    int qty = Convert.ToInt32(reader["Quantity"]);
                    string pid = reader["Product_id"].ToString();
                    int pqty=getproductqty(pid);
                    int final = pqty - qty;
                    if(final>0)
                    {
                        updateproduct(final,pid);
                    }
                    //
                }
            }
            catch(Exception err)
            {
                Response.Write(err);
            }

        }

        private int getproductqty(string pid)
        {
            int pqty = 0;
            MySqlConnection con = null;
            con = new MySqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
            MySqlDataReader reader12=null;
            try
            {
                con.Open();
                string sql = "select Product_quantity from product where Product_id=@id";
                MySqlCommand cmd= new MySqlCommand(sql,con);
                cmd.Parameters.AddWithValue("@id",pid);
                reader12 = cmd.ExecuteReader();
                if(reader12.Read())
                {
                    pqty = Convert.ToInt32(reader12["Product_quantity"]);
                }
            }
            catch(Exception err)
            {
                Response.Write(err);
            }
            return pqty;
        }

        private void updateproduct(int p,string pid)
        {

            MySqlConnection con = null;
            con = new MySqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
            MySqlDataReader reader=null;
            try
            {
                con.Open();
                string sql = "Update product set Product_quantity=@qty where Product_id=@id";
                MySqlCommand cmd = new MySqlCommand(sql,con);
                cmd.Parameters.AddWithValue("@qty",p.ToString());
                cmd.Parameters.AddWithValue("@id", pid);
                int i = cmd.ExecuteNonQuery();
                if(i>0)
                {
                    //Response.Write("Success in updating");
                }
            }
            catch(Exception err)
            {
                Response.Write(err);
            }
        }

        private void updateproduct()
        {
            throw new NotImplementedException();
        }

        private string fetch(string paymentid)
        {
            string userid = null; ;
           // throw new NotImplementedException();
            con = new MySqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
            try
            {
                con.Open();
                string sql = "select Customer_id from payment where payment_id=@val";
                MySqlCommand cmd = new MySqlCommand(sql,con);
                cmd.Parameters.AddWithValue("@val",paymentid);
                reader = cmd.ExecuteReader();
                if(reader.Read())
                {
                    userid=reader["Customer_id"].ToString();
                }
            }
            catch(Exception err)
            {
                Response.Write(err);
            }
            return userid;
        }

        private void deletecartitems()
        {
           // con = new MySqlConnection();
            /*con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
            try
            {
                con.Open();
                string sql = "select mydb.`order`.Cart_id from mydb.`order` where mydb.`order`.Customer_id=@id";
                MySqlCommand cmd = new MySqlCommand(sql,con);
                cmd.Parameters.AddWithValue("@id",userid);
                reader = cmd.ExecuteReader();
                while(reader.Read())
                {
                    string cartid = reader["Cart_id"].ToString();
               
                }
                con.Close();
            }
            catch(Exception e)
            {
                Response.Write(e);
            }*/
            delete(cartid);
        }

        private void delete(string cartid)
        {
            con = new MySqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
            try
            {

                con.Open();
                string sql = "SET SQL_SAFE_UPDATES=0 ; delete from mydb.cartitems where Cart_id=@id";
                MySqlCommand cmd = new MySqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@id", cartid);
                int i = cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    //Response.Write("success in deleting the items");
                }
            }
            catch(Exception e)
            {
                Response.Write(e);
            }
        }

        private void createlineitems()
        {
            
            con = new MySqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
            try
            {
                con.Open();
                //string sql = "select mydb.`order`.Order_id,mydb.cartitems.Cart_id, mydb.cartitems.Product_id from mydb.cartitems join mydb.`order` as `order` on mydb.`order`.Cart_id=mydb.cartitems.Cart_id where mydb.`order`.Customer_id=@id";
                string sql = "select Product_id,Quantity from cartitems where Cart_id=@val";
                //string sql1 = "select Product_price from product where Product_id=@id";
                MySqlCommand cmd = new MySqlCommand(sql,con);
                cmd.Parameters.AddWithValue("@val",cartid);
                //cmd.Parameters.AddWithValue("@id", cartid);
                reader = cmd.ExecuteReader();
                while(reader.Read())
                {
                    
                    string productprice = getprice(reader["Product_id"].ToString());
                    string productid = reader["Product_id"].ToString();
                    string quantity = reader["Quantity"].ToString();
                  //  string orderid = getorder(reader["Order_id"].ToString());
                    //string orderid = reader["Order_id"].ToString();
                    //string cartid = reader["Cart_id"].ToString();
                    //string productid = reader["Product_sku"].ToString();
                    //getproduct price

                    insert(orderid,productid,productprice,quantity);
                }
                con.Close();
            }
            catch(Exception e)
            {
                Response.Write(e);
            }
        }

        

        private string getprice(string p)
        {
            MySqlConnection con1=null;
            MySqlDataReader reader1=null;
            string price=null;
            con1 = new MySqlConnection();
            con1.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
            try
            {
                con1.Open();
                string sql = "select Product_price from product where Product_id=@id";
                MySqlCommand cmd = new MySqlCommand(sql,con1);
                cmd.Parameters.AddWithValue("@id",p);
                reader1 = cmd.ExecuteReader();
                if(reader1.Read())
                {
                    price = reader1["Product_price"].ToString();
                }
            }
            catch(Exception err)
            {
                Response.Write(err);
            }
            con1.Close();
            reader1.Close();
            return price;
        }

        private void insert(string orderid,string productid,string productprice,string quantity)
        {
            con = new MySqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
            try
            {
                con.Open();
                string sql = "insert into order_lineitems (`Product_id`, `Product_price`, `Shipment_status`, `Order_id`,`Product_quantity` ) values(@val1,@val2,@val3,@val4,@val5)";
                MySqlCommand cmd = new MySqlCommand(sql,con);
                cmd.Parameters.AddWithValue("@val1",productid);
                cmd.Parameters.AddWithValue("@val2",productprice);
                cmd.Parameters.AddWithValue("@val3","PICK");
                cmd.Parameters.AddWithValue("@val4",orderid);
                cmd.Parameters.AddWithValue("@val5",quantity);
                int i = cmd.ExecuteNonQuery();
                if(i>0)
                {
                    //Response.Write("Success in adding in lineitems");
                }
                con.Close();
            }
            catch(Exception e)
            {
                Response.Write(e);
            }
        }

        private void placeorder()
        {
            con = new MySqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString; ;            
            try
            {
                con.Open();
                string sql = "select * from cart where Customer_id=@id";
                MySqlCommand cmd = new MySqlCommand(sql,con);
                cmd.Parameters.AddWithValue("@id",userid);
                reader = cmd.ExecuteReader();
                if(reader.Read())
                {
                    cartid = reader["Cart_id"].ToString();
                    //date = reader["Created_date"].ToString();
                }
                reader.Close();
                con.Close();
                //string rand=generaterandom();
                insertorder();
            }
            catch(Exception e)
            {
                //con.Close();
                Response.Write(e);
            }
        }

        private void insertorder()
        {
            DateTime dt= DateTime.Today;
            String date=dt.ToString("d");
            con = new MySqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString; ;            
            try
            {
                con.Open();
                string sql = "insert into `order` ( `Customer_id`,`Order_date`, `Ship_date`, `TotalPrice`)  values(@val1,@val3,@val4,@val5)";
                MySqlCommand cmd = new MySqlCommand(sql,con);
                cmd.Parameters.AddWithValue("@val1",userid);
                //cmd.Parameters.AddWithValue("@val2",rand);
                cmd.Parameters.AddWithValue("@val3",Convert.ToDateTime(date));
                cmd.Parameters.AddWithValue("@val4", DateTime.Now.AddDays(10).ToString("yyyy-MM-dd"));
                cmd.Parameters.AddWithValue("@val5",Session["sum"].ToString());
                
                //cmd.Parameters.AddWithValue("@val6",cartid);
                int i = cmd.ExecuteNonQuery();
                orderid = cmd.LastInsertedId.ToString();
                //reader = cmd.ExecuteReader();
                //con.Close();
                //con.Open();
                /*string sql1 = "select Order_id from order where Customer_id=@id";
                MySqlCommand cmd1 = new MySqlCommand(sql1,con);
                cmd1.Parameters.AddWithValue("@id",userid);
                MySqlDataReader reader3=null;
                reader3 = cmd1.ExecuteReader();
                if(i>0)
                {
                  if(reader3.Read())
                  {
                      orderid = reader3["Order_id"].ToString();
                  }
                    //Response.Write("Success");
                    
                }
                //
                */
                con.Close();
                //orderid = fetchorderid();
            }
            catch(Exception e)
            {
                Response.Write(e);
            }
            
        }

        private string fetchorderid()
        {
            string orderid = null;
            MySqlConnection con1 = null;
            MySqlDataReader reader3 = null;
            con1 = new MySqlConnection();
            con1.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString; ;
            try
            {
                con1.Open();
                string sql4 = "select mydb.`order`.Order_id from mydb.`order` where Customer_id=@val";
                MySqlCommand cmd4 = new MySqlCommand(sql4,con1);
                cmd4.Parameters.AddWithValue("@val",userid);
                reader3 = cmd4.ExecuteReader();
                if(reader3.Read())
                {
                    orderid = reader3["Order_id"].ToString();
                    //orderid = cmd4.LastInsertedId.ToString();
                }
            }
            catch(Exception err)
            {
                Response.Write(err);
            }
            con1.Close();
            return orderid;
        }

        private string generaterandom()
        {
            Random gene = new Random();
            String rand = gene.Next(0,1000000).ToString("D6");
            return rand;
        }

        protected void Proceed_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }
    }
}