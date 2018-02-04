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

namespace Admin
{
    public partial class Admin_cancel : System.Web.UI.Page
    {
        MySqlConnection connection, ocon;
        MySqlCommand SqlCommand, SqlCommand1, SqlCommand2;
        public int Product_id;
        public static string category_name;
        //string sqlconn = System.Configuration.ConfigurationManager.ConnectionStrings["Project"].ConnectionString;
        public void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Response.Write("hi 2");
                BindGrid();
            }


        }
        public void cancel(object sender, EventArgs e)
        {
            BindGrid();


        }




        public void BindGrid()
        {
            // Response.Write("hi 3");
            Initialize1();
            System.Data.DataTable dt = new System.Data.DataTable();
            try
            {
                connection.Open();
                //Response.Write("hi 333333");
                MySqlDataAdapter oda = new MySqlDataAdapter("select l.Order_id,l.LineItems_id,l.Shipment_status,p.Product_name,p.Product_desc,l.Product_price from mydb.order_lineitems l,mydb.product p where p.Product_id=l.Product_id and Shipment_status='CANCEL INITIATED' ;", connection);

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

        public void gv1_RowEditing(object sender, GridViewEditEventArgs e)
        {

            gv1.EditIndex = e.NewEditIndex;
            BindGrid();




        }



        public void gv1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            if (this.IsPostBack)
            {
                int LineItems_id = int.Parse(((Label)(gv1.Rows[e.RowIndex].Cells[1].FindControl("LineItems_id"))).Text);
                int Order_id = int.Parse(((Label)(gv1.Rows[e.RowIndex].Cells[1].FindControl("Order_id"))).Text);
                string Shipment_status = ((DropDownList)(gv1.Rows[e.RowIndex].Cells[1].FindControl("Shipment_status"))).Text;
                int Product_price = int.Parse(((Label)(gv1.Rows[e.RowIndex].Cells[1].FindControl("Product_price"))).Text);


                try
                {
                    Initialize1();
                    connection.Open();

                    if (Shipment_status == "CANCEL RECEIVED")
                    {
                        SqlCommand = new MySqlCommand("Update order_lineitems set Shipment_status='" + Shipment_status + "' where LineItems_id=" + LineItems_id, connection);
                        //SqlCommand1 = new MySqlCommand("Update mydb.order set TotalPrice=TotalPrice-(select Product_price from mydb.lineitems where LineItems_id=" + LineItems_id + " and Order_id=" + Order_id + ") where Order_id=" + Order_id + ";", connection);
                        SqlCommand1 = new MySqlCommand("Update mydb.order set TotalPrice=TotalPrice-(select Product_price from mydb.order_lineitems where  LineItems_id=" + LineItems_id + " and Order_id=" + Order_id + ") where Order_id=" + Order_id + ";", connection);
                        SqlCommand2 = new MySqlCommand("Update mydb.product set Product_quantity=Product_quantity+(select Product_quantity from mydb.order_lineitems where  LineItems_id=" + LineItems_id + ") where Product_id=(select Product_id from mydb.order_lineitems where LineItems_id=" + LineItems_id + " );", connection);
                        int i = SqlCommand.ExecuteNonQuery();
                        int j = SqlCommand1.ExecuteNonQuery();
                        SqlCommand2.ExecuteNonQuery();
                        if (i != 0)
                        {

                            //SqlCommand1 = new MySqlCommand("Update order set TotalPrice=TotalPrice-(select Product_price from lineitems where LineItems_id=" + LineItems_id + " and Order_id=" + Order_id + ") where Order_id=" + Order_id + ";", connection);

                            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Updated Succesfully')", true);
                            // System.Windows.Forms.DialogResult dialogResult = System.Windows.Forms.MessageBox.Show("Succesfully Updated", "Update Products", System.Windows.Forms.MessageBoxButtons.OK);
                        }
                    }
                    else
                    {
                        this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Change Status to RETURN RECEIVED')", true);
                    }
                    connection.Close();

                    gv1.EditIndex = -1;



                    BindGrid();
                }
                catch (SqlException e3)
                {
                    Response.Write(e3);
                }

            }
        }

        public void gv1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gv1.EditIndex = -1;
            BindGrid();
        }

        protected void adminhome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Status.aspx");
        }








    }

}




