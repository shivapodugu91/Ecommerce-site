
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
    public partial class Subscription : System.Web.UI.Page
    {
         MySqlConnection connection,ocon;
         MySqlCommand SqlCommand, SqlCommand1, SqlCommand2;
         static double subscription_price1,Order_price;
         static Label lbl, lbl1 ;
         string userid;


   
        public void Page_Load(object sender, EventArgs e)
        {
            userid = Session["userid"].ToString();
           // Response.Write("hi 1");
            if (!IsPostBack)
            {
               // Response.Write("hi 2");
                BindGrid();
                
            }

        }
        public void BindGrid()
        {
           // Response.Write("hi 3");
            Initialize1();
            System.Data.DataTable dt = new System.Data.DataTable();
            Button btn = (Button)this.FindControl("btnGetSelected");
            try
            {
                connection.Open();
                //Response.Write("hi 333333");
                MySqlDataAdapter oda = new MySqlDataAdapter("select ci.Product_id,p.filepath,p.Product_desc,ci.Quantity,p.Product_price from mydb.product p,mydb.cartitems ci,mydb.cart c where c.Cart_id=ci.Cart_id and ci.Product_id=p.Product_id and Customer_id='"+userid+"';", connection);
                
              
                DataSet ds = new DataSet();
                oda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    gv1.DataSource = dt;
                    gv1.DataBind();
                }
                else
                {
                    DataTable dt1= new System.Data.DataTable();
                    gv1.DataSource = dt;
                    gv1.DataBind();
                    btn.Enabled = false;
                }
                connection.Close();
            }
            catch(SqlException e)
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
        protected void OnCheckedChanged(object sender, EventArgs e)
        {
            CheckBox chkTest = (CheckBox)sender;
            GridViewRow grdRow = (GridViewRow)chkTest.NamingContainer;
            Label lbl = (Label)grdRow.FindControl("Quantity");
            TextBox txtname = (TextBox)grdRow.FindControl("Quantity_tb");
            DropDownList dropdown = (DropDownList)grdRow.FindControl("Frequency");
            DropDownList dropdown1 = (DropDownList)grdRow.FindControl("TimeSpan");
            //int price = int.Parse(((Label)grdRow.FindControl("Product_price")).Text);
            if (chkTest.Checked)
            {
               
                dropdown.Enabled = true;
                dropdown1.Enabled = true;
                txtname.Visible = true;
                lbl.Visible = false;
                //subscription_price();
                
            }

            

        }
      
        
      
        

       
       
        protected void GetSelectedRecords(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();

            
           
            dt.Columns.AddRange(new DataColumn[3] { new DataColumn("filepath"), new DataColumn("Product_desc"), new DataColumn("Quantity") });
            foreach (GridViewRow row in gv1.Rows)
            {
                
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chkRow") as CheckBox);
                    if (chkRow.Checked)
                    {
                        String freq = (row.Cells[5].FindControl("Frequency") as DropDownList).Text;
                        
                        int Product_id = int.Parse((row.Cells[1].FindControl("Product_id") as Label).Text);
                        int frequency= int.Parse(freq.Substring(0,1));
                        int Quantity = int.Parse((row.Cells[4].FindControl("Quantity_tb") as TextBox).Text);
                        int Product_price = int.Parse((row.Cells[5].FindControl("Product_price") as Label).Text);
                       
                        
                        Initialize1();
                        connection.Open();
                      //  DateTime Order_CreationDate = DateTime.Now;
                        String nextMonth = DateTime.Now.AddDays(1).AddMonths(frequency).AddDays(-1).ToString("MM/dd/yyyy");

                       
                       String timefreq = (row.Cells[6].FindControl("TimeSpan") as DropDownList).Text;
                       int Timespan = int.Parse(timefreq.Substring(0, 1));

                       SqlCommand = new MySqlCommand("insert into subscription(Customer_id,Timespan,Expected_Deliverydate,Frequency,Product_id,Quantity,Order_CreationDate) values('"+userid+"'," + frequency + ",DATE_ADD(NOW(), INTERVAL " + frequency + " month)," + Timespan + "," + Product_id + "," + Quantity + ",Now())", connection);
                       int i = SqlCommand.ExecuteNonQuery();
                       // SqlCommand2 = new MySqlCommand("select CartItems_id from mydb.cartitems ci,mydb.cart c where ci.Cart_id=c.Cart_id and Product_id=" + Product_id + " and c. Customer_id=123", connection);

                        //SqlCommand1 = new MySqlCommand("select CartItems_id from mydb.cartitems ci,mydb.cart c where ci.Cart_id=c.Cart_id and Product_id=" + Product_id + " and c. Customer_id=123", connection);
                        //int CartItems_id = Convert.ToInt32(SqlCommand2.ExecuteScalar().ToString());
                        

                        //SqlCommand1 = new MySqlCommand("Delete from mydb.cartitems where CartItems_id=" + CartItems_id + "", connection);
                        
                      //  SqlCommand1.ExecuteNonQuery();
                        if (i != 0)
                        {
                            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Thank you for subscription!!!!!!!')", true);
                           
                           
                        }
                        else
                        {
                            Response.Write("Not Updated");
                        }
                        
                        BindGrid();
                        connection.Close();
                    }
                }
            }

            Response.Redirect("Subscription_modified.aspx");
        }
       
       

       

        

    }
}