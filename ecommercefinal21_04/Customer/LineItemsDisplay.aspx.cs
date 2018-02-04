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
using System.Web.Configuration;
using System.IO;

namespace Customer
{
    public partial class LineItemsDisplay1 : System.Web.UI.Page
    {
        // int index = 0;

        MySqlConnection connection, ocon;
        MySqlCommand SqlCommand;
        public int Product_id;
        public static string category_name;
        //string sqlconn = System.Configuration.ConfigurationManager.ConnectionStrings["Project"].ConnectionString;
        public void Page_Load(object sender, EventArgs e)
        {
            //Orders();
            if (!IsPostBack)
            {

                BindGrid();
            }

        }


        public void BindGrid()
        {
            //Response.Write("Your Orderlines in Order");
            Initialize1();
            System.Data.DataTable dt = new System.Data.DataTable();
            int Order_id = int.Parse(Request.QueryString["Order_id"]);
            //Response.Write(Order_id);
            //System.Data.DataTable dt1 = new System.Data.DataTable();
            try
            {
                connection.Open();
                //Response.Write("hi 333333");
                MySqlDataAdapter oda = new MySqlDataAdapter("select l.LineItems_id,p.Product_name,p.Product_desc,l.Product_price,l.Shipment_status from mydb.order_lineitems l,mydb.product p where l.Product_id=p.Product_id and l.Order_id=" + Order_id + ";", connection);
                // MySqlDataAdapter oda1 = new MySqlDataAdapter("select Order_id,TotalPrice from mydb.order where Order_id=(select Order_id from mydb.order where Customer_id=345);", connection);
                //SqlCommandBuilder builder = new SqlCommandBuilder(oda);
                DataSet ds = new DataSet();
                oda.Fill(dt);
                // oda1.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    gv1.DataSource = dt;
                    gv1.DataBind();
                }
                connection.Close();
            }
            catch (SqlException e)
            {
                Response.Write(e);
            }

        }
        public void gv1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ReturnInitiate")
            {


                try
                {
                    GridViewRow gvr = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                    int rowIndex = gvr.RowIndex;
                    int LineItems_id = int.Parse(gv1.DataKeys[rowIndex]["LineItems_id"].ToString());


                    Initialize1();
                    connection.Open();

                    SqlCommand = new MySqlCommand("update order_lineitems set Shipment_status='RETURN INITIATED' where LineItems_id=" + LineItems_id + ";", connection);


                    int j = SqlCommand.ExecuteNonQuery();

                    if (j > 0)
                    {
                        this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Return Initiated')", true);
                        // System.Windows.Forms.DialogResult dialogResult = System.Windows.Forms.MessageBox.Show("Succesfully Updated", "Update Products", System.Windows.Forms.MessageBoxButtons.OK);
                    }
                    BindGrid();
                }

                catch (Exception e1)
                {
                    Response.Write(e1);
                }
            }


            if (e.CommandName == "CancelInitiate")
            {


                try
                {
                    GridViewRow gvr = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                    int rowIndex = gvr.RowIndex;
                    int LineItems_id = int.Parse(gv1.DataKeys[rowIndex]["LineItems_id"].ToString());


                    Initialize1();
                    connection.Open();

                    SqlCommand = new MySqlCommand("update order_lineitems set Shipment_status='CANCEL INITIATED' where LineItems_id=" + LineItems_id + ";", connection);


                    int j = SqlCommand.ExecuteNonQuery();

                    if (j > 0)
                    {
                        this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Cancel Initiated')", true);
                        // System.Windows.Forms.DialogResult dialogResult = System.Windows.Forms.MessageBox.Show("Succesfully Updated", "Update Products", System.Windows.Forms.MessageBoxButtons.OK);
                    }
                    BindGrid();
                }

                catch (Exception e1)
                {
                    Response.Write(e1);
                }
            }

        }
        protected void gv1_RowDataBound(object sender, GridViewRowEventArgs e)
        {


            string headerText = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "Shipment_status"));

            Button btn = (Button)e.Row.FindControl("Button1");


            if (headerText == "PICK" || headerText == "PACK" || headerText == "SHIP" || headerText == "INVOICED" || headerText == "RETURN INITIATED" || headerText == "RETURN RECEIVED" || headerText == "CANCEL INITIATED" || headerText == "CANCEL RECEIVED")
            {

                btn.Enabled = false;
            }

            Button btn2 = (Button)e.Row.FindControl("Button2");
            if (headerText == "RETURN INITIATED" || headerText == "RETURN RECEIVED" || headerText == "SHIP" || headerText == "CANCEL INITIATED" || headerText == "CANCEL RECEIVED" || headerText == "INVOICED" || headerText == "DELIVERED")
            {

                btn2.Enabled = false;
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
    }
}