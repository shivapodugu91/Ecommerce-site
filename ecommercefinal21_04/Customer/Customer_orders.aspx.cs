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
    public partial class Customer_orders1 : System.Web.UI.Page
    {
        MySqlConnection connection, ocon;
        MySqlCommand SqlCommand, SqlCommand1;
        string userid;
        protected void Page_Load(object sender, EventArgs e)
        {
            userid =Session["userid"].ToString();
            if (!IsPostBack)
            {

                BindGrid();
            }
        }

        protected void BindGrid()
        {
            Initialize1();
            System.Data.DataTable dt = new System.Data.DataTable();
            try
            {
                connection.Open();
                //Response.Write("hi 333333");
                MySqlDataAdapter oda = new MySqlDataAdapter("select Order_id,TotalPrice from mydb.order where Customer_id='"+userid+"'", connection);

                //SqlCommandBuilder builder = new SqlCommandBuilder(oda);
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
                }
                connection.Close();
            }
            catch (SqlException e1)
            {
                Response.Write(e1);
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
        public void gv1_RowCommand(object sender, GridViewCommandEventArgs e)
        {//subscriptionOrders
            if (e.CommandName == "Orders")
            {
                //int index=gv1.SelectedIndex;
                //int a=gv1.CurrentCell.RowIndex;

                //int rowIndex = gv1.(System.Windows.Forms.CurrentCell).RowIndex;
                //Response.Write(index);


                GridViewRow gvr = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                int rowIndex = gvr.RowIndex;
                int Order_id = int.Parse(gv1.DataKeys[rowIndex]["Order_id"].ToString());
                //Response.Write(Order_id);
                Response.Redirect("LineItemsDisplay.aspx?Order_id=" + Order_id);
                //string LineItems_id = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "LineItems_id"));
                //long LineItems_id=Int64.Parse((gv1.DataKeys[index]["LineItems_id"]).ToString());
                //Response.Write(LineItems_id);      

            }
            /*  if (e.CommandName == "subscriptionOrders")
              {

                  Response.Redirect("subscription_items_display.aspx" );


              }*/

        }
        public void subscriptionOrders(object sender, EventArgs e)
        {
            Response.Redirect("subscription_items_display.aspx");
        }
    }
}