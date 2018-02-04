using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using MySql.Data.MySqlClient;
//using MySql.Data.MySqlClient;
using System.Web.Configuration;
using System.IO;
using System.Globalization;

namespace WebApplication1
{
    public partial class Subscription_modified : System.Web.UI.Page
    {
        MySqlConnection connection, ocon;
        MySqlCommand SqlCommand, SqlCommand1, SqlCommand2;

        static double subscription_price1, Total_OrderPrice;
        static Label lbl;
        string userid;
        protected void Page_Load(object sender, EventArgs e)
        {
            userid = Session["userid"].ToString();
            if (!IsPostBack)
            {

                BindGrid1();
                BindGrid();
               
                
                GetSelectedRecords();
            }
        }
       
        public void BindGrid()
        {
            // Response.Write("hi 3");
            Initialize1();
            System.Data.DataTable dt = new System.Data.DataTable();
           // Button btn = (Button)this.FindControl("btnGetSelected");
            try
            {
                connection.Open();
                //Response.Write("hi 333333");
               
                MySqlDataAdapter oda = new MySqlDataAdapter("select s.Product_id,p.filepath,p.Product_desc,s.Quantity,p.Product_price from mydb.product p,mydb.subscription s where p.Product_id=s.Product_id and s.Customer_id='"+userid+"' and s.Order_CreationDate between date_add(now(),interval -1 minute ) and date_add(now(), interval 1 minute)", connection);


                DataSet ds = new DataSet();
                oda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    gv1.DataSource = dt;
                    gv1.DataBind();
                }
                else
                {
                    DataTable dt1 = new System.Data.DataTable();
                    gv1.DataSource = dt;
                    gv1.DataBind();
                   // btn.Enabled = false;
                }
                connection.Close();
            }
            catch (SqlException e)
            {
                Response.Write(e);
            }

        }
        public void BindGrid1()
        {
            // Response.Write("hi 3");
            Initialize1();
            System.Data.DataTable dt = new System.Data.DataTable();
            // Button btn = (Button)this.FindControl("btnGetSelected");
            try
            {
                connection.Open();
                //Response.Write("hi 333333");

                MySqlDataAdapter oda = new MySqlDataAdapter("select ci.Product_id,p.filepath,p.Product_desc,ci.Quantity,p.Product_price from mydb.product p,mydb.cartitems ci,mydb.cart c where c.Cart_id=ci.Cart_id and ci.Product_id=p.Product_id and Customer_id='"+userid+"';", connection);


                DataSet ds = new DataSet();
                oda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
                else
                {
                    DataTable dt1 = new System.Data.DataTable();
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    // btn.Enabled = false;
                }
                connection.Close();
            }
            catch (SqlException e)
            {
                Response.Write(e);
            }

        }
        public void Initialize1()
        {
            string server = "localhost";
            string database = "mydb";
            string uid = "root";
            string password = "root";
            string connectionString;
            connectionString = "SERVER=" + server + ";" + "DATABASE=" +
            database + ";" + "UID=" + uid + ";" + "PASSWORD=" + password + ";";
            connection = new MySqlConnection(connectionString);

        }
        
        protected void GetSelectedRecords()
        {
            DataTable dt = new DataTable();

            lbl = (this.FindControl("subscription_price") as Label);
            
            dt.Columns.AddRange(new DataColumn[3] { new DataColumn("filepath"), new DataColumn("Product_desc"), new DataColumn("Quantity") });
            foreach (GridViewRow row in gv1.Rows)
            {
                
                if (row.RowType == DataControlRowType.DataRow)
                {


                    Initialize1();
                    connection.Open();
                    int Quantity = int.Parse((row.Cells[3].FindControl("Quantity") as Label).Text);
                        int Product_price = int.Parse((row.Cells[4].FindControl("Product_price") as Label).Text);
                       // SqlCommand1 = new MySqlCommand("select CartItems_id from mydb.cartitems ci,mydb.cart c where ci.Cart_id=c.Cart_id  and c. Customer_id=123", connection);
                       // int CartItems_id = Convert.ToInt32(SqlCommand2.ExecuteScalar().ToString());
                        SqlCommand2 = new MySqlCommand("select sum(p.Product_price*ci.Quantity) from mydb.cartitems ci,mydb.cart c,mydb.product p where ci.Cart_id=c.Cart_id and ci.Product_id=p.Product_id and c. Customer_id='"+userid+"'", connection);

                        subscription_price1 += (double)(Quantity * Product_price);
                        Total_OrderPrice =Convert.ToDouble(SqlCommand2.ExecuteScalar().ToString());
                        
                        BindGrid();
                        connection.Close();
                    
                }
            }
            
            lbl.Text = subscription_price1.ToString();
            Label1.Text = Total_OrderPrice.ToString();
            
        }

        protected void Proceed_Click(object sender, EventArgs e)
        {
            Response.Redirect("Payment.aspx");
        }
       
       

       

        

    
    }
}