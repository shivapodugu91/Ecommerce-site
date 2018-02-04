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
    public partial class subscription_items_display : System.Web.UI.Page
    {
        MySqlConnection connection, ocon;
        MySqlCommand SqlCommand;
        public int Product_id;
        public static string category_name;
        string userid;
        //string sqlconn = System.Configuration.ConfigurationManager.ConnectionStrings["Project"].ConnectionString;
        public void Page_Load(object sender, EventArgs e)
        {
            //Orders();
            userid = Session["userid"].ToString();
            if (!IsPostBack)
            {

                BindGrid();
            }

        }


        public void gv1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Cancel_Initiate")
            {


                try
                {
                    GridViewRow gvr = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                    int rowIndex = gvr.RowIndex;
                    int LineItems_id = int.Parse(gv1.DataKeys[rowIndex]["Subscription_id"].ToString());


                    Initialize1();
                    connection.Open();

                    SqlCommand = new MySqlCommand("update mydb.subscription set Frequency=0 where Subscription_id=" + LineItems_id + ";", connection);


                    int j = SqlCommand.ExecuteNonQuery();

                    if (j > 0)
                    {
                        this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Subscription Cancelled')", true);
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


            String headerText = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "Frequency"));
            // int headerText1 = int.Parse(headerText);

            Button btn = (Button)e.Row.FindControl("Button1");


            if (headerText == "0")
            {
                btn.Enabled = false;
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

        public void BindGrid()
        {

            Initialize1();
            System.Data.DataTable dt = new System.Data.DataTable();
            // int Order_id = int.Parse(Request.QueryString["Order_id"]);
            //Response.Write(Order_id);
            //System.Data.DataTable dt1 = new System.Data.DataTable();
            try
            {
                connection.Open();
                //Response.Write("hi 333333");
                MySqlDataAdapter oda = new MySqlDataAdapter("select s.Subscription_id,s.Product_id,p.Product_name,p.Product_desc,s.Quantity,s.Frequency,s.Expected_Deliverydate from mydb.subscription s,mydb.product p where s.Product_id=p.Product_id and s.Customer_id='" + userid + "';", connection);
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
    }
}