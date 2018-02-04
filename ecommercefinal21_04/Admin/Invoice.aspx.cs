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
    public partial class Invoice : System.Web.UI.Page
    {
        MySqlConnection connection, ocon;
        MySqlCommand SqlCommand, SqlCommand1;
        protected void Page_Load(object sender, EventArgs e)
        {
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
            try
            {
                connection.Open();
                //Response.Write("hi 333333");
                MySqlDataAdapter oda = new MySqlDataAdapter("select Order_id,LineItems_id,Shipment_status from mydb.order_lineitems where Shipment_status in('INVOICED') ;", connection);

                //SqlCommandBuilder builder = new SqlCommandBuilder(oda);
                DataSet ds = new DataSet();
                Button btn = (Button)this.FindControl("btnGetSelected");
                oda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    gv1.DataSource = dt;
                    gv1.DataBind();
                }
                else
                {
                    DataTable dt1 = new System.Data.DataTable();
                    btn.Visible = false;
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
        protected void GetSelectedRecords(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();



            dt.Columns.AddRange(new DataColumn[3] { new DataColumn("Order_id"), new DataColumn("LineItems_id"), new DataColumn("Shipment_status") });
            foreach (GridViewRow row in gv1.Rows)
            {

                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chkRow") as CheckBox);
                    if (chkRow.Checked)
                    {
                        int LineItems_id = int.Parse((row.Cells[2].FindControl("LineItems_id") as Label).Text);

                        //Response.Write(LineItems_id);


                        Initialize1();
                        connection.Open();


                        SqlCommand = new MySqlCommand("update mydb.order_lineitems set Shipment_status='SHIP' where LineItems_id=" + LineItems_id, connection);

                        int i = SqlCommand.ExecuteNonQuery();
                        if (i != 0)
                        {
                            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Updated Succesfully')", true);
                            // System.Windows.Forms.DialogResult dialogResult = System.Windows.Forms.MessageBox.Show("Succesfully Updated", "Update Products", System.Windows.Forms.MessageBoxButtons.OK);
                        }
                        else
                        {
                            Response.Write("Not Updated");
                        }
                        connection.Close();

                        BindGrid();
                    }
                }
            }

        }

        protected void adminhome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Status.aspx");
        }
    }
}