using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using MySql.Data.Types;
using System.Web.Configuration;
using System.Data;
using System.Web.Services;

namespace Customer
{
    public partial class ordersummary : System.Web.UI.Page
    {
        float total;
        int sum;
        string zipcode;
        MySqlConnection con;
        MySqlDataReader reader;
        MySqlDataAdapter adapter;
        string productid,filename,quantity,productprice,productdesc,filepath;
        string userid,shipid,cartid;
        int j;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Request.QueryString["Shiptoaddress_id"] != null)
                {
                    string abc = Request.QueryString["Shiptoaddress_id"];
                    byte[] dec = System.Convert.FromBase64String(abc);
                    shipid = System.Text.ASCIIEncoding.ASCII.GetString(dec);
                  //  sum=(Int32)Session["sum"];
                    sum = Convert.ToInt32(Session["sum"]);
                }
                userid = fetch(shipid);
            
            }
            getcartid();
            bindgrid();

            display();
        }

        private void getcartid()
        {
            con = new MySqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString; ;
            try
            {
                con.Open();
                string sql = "select * from cart where Customer_id=@id";
                MySqlCommand cmd = new MySqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@id", userid);
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    cartid = reader["Cart_id"].ToString();
                    //date = reader["Created_date"].ToString();
                }
                reader.Close();
                con.Close();
            }
            catch(Exception err)
            {
                Response.Write(err);
            }
            //throw new NotImplementedException();
        }

        private void bindgrid()
        {
            MySqlDataReader reader12=null;
            DataSet ds = new DataSet();
            con = new MySqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
            try
            {
                con.Open();
                /*string sql = "select * from cartitems where Cart_id=@id";
                MySqlCommand cmd = new MySqlCommand(sql,con);
                cmd.Parameters.AddWithValue("@id",cartid);
                reader = cmd.ExecuteReader();
                if(reader.Read())
                {
                    productid = reader["Product_id"].ToString();
                    getother();

                }*/
                //MySqlDataAdapter oda = new MySqlDataAdapter(select ci.Product_id,p.Product_desc,p.Product_price,p.filepath,ci.Quantity from mydb.cartitems ci,mydb.product p where ci.Product_id=p.Product_id and ci.Cart_id=@id",con);

                string sql = "select ci.Product_id,p.Product_desc,p.Product_price,p.filepath,ci.Quantity from mydb.cartitems ci,mydb.product p where ci.Product_id=p.Product_id and ci.Cart_id=@id";
                MySqlCommand cmd = new MySqlCommand(sql,con);
                cmd.Parameters.AddWithValue("@id",cartid);
                reader12 = cmd.ExecuteReader();
                reader12.Close();
                adapter = new MySqlDataAdapter(cmd);
                adapter.Fill(ds);
                GridView1.DataSource=ds;
                GridView1.DataBind();
            }
            catch(Exception err)
            {
                Response.Write(err);
            }
          //  Dataset ds = new Dataset();
            //throw new NotImplementedException();
        }

        private void getother()
        {
            con = new MySqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
            try
            {
                con.Open();
                string sql = "select * from product where Product_id=@id";
                MySqlCommand cmd = new MySqlCommand(sql,con);
                cmd.Parameters.AddWithValue("@id",productid);
                reader = cmd.ExecuteReader();
                if(reader.Read())
                {
                    filepath = reader["filepath"].ToString();
                    //filename = reader["filename"].ToString();
                    productprice = reader["Product_price"].ToString();
                    productdesc = reader["Product_desc"].ToString();
                    quantity = reader["Product_quantity"].ToString();
                }
            }
            catch(Exception err)
            {
                Response.Write(err);
            }
            
            //throw new NotImplementedException();
        }

        private string fetch(string shipid)
        {
            string id = null;
            con = new MySqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
            try
            {
                con.Open();
                string sql = "select Customer_id,Zipcode from shiptoaddress where Shiptoaddress_id=@id";
                MySqlCommand cmd = new MySqlCommand(sql,con);
                cmd.Parameters.AddWithValue("@id",shipid);
                reader = cmd.ExecuteReader();
                if(reader.Read())
                {
                    id = reader["Customer_id"].ToString();
                    zipcode = reader["Zipcode"].ToString();
                }
            }
            catch(Exception err)
            {
                   
                Response.Write(err);
            }
            con.Close();
            return id;
        }

        private void display()
        {
            con = new MySqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString; ;
            try
            {
                con.Open();
                string sql = "select * from product";
                MySqlCommand cmd = new MySqlCommand(sql,con);





                float salestax = getsalestax();
                float temp = (salestax * sum) / 100;
                total = temp + sum;
                total123.Text = total.ToString();
            }
            catch (Exception err)
            {
                Response.Write(err);
            }
            //throw new NotImplementedException();
        }

        protected void proceed_Click(object sender, EventArgs e)
        {
            Response.Redirect("payment.aspx");
        }

        private float getsalestax()
        {
            float salestax=0;
            //throw new NotImplementedException();
            con = new MySqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString; ;
            try
            {
                con.Open();
                string sql = "select SalesTax_percentage from salestax where SalesTax_zipcode=@val";
                MySqlCommand cmd = new MySqlCommand(sql,con);
                cmd.Parameters.AddWithValue("@val",zipcode);
                reader = cmd.ExecuteReader();
                if(reader.Read())
                {
                    salestax = (float)reader["SalesTax_percentage"];
                }
            }
            catch(Exception err)
            {
                Response.Write(err);
            }
            return salestax;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void sub_Click(object sender, EventArgs e)
        {
            Response.Redirect("Subscription.aspx");
        }
    }
}