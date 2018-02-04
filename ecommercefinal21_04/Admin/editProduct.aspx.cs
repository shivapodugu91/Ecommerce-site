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
    public partial class editProduct : System.Web.UI.Page
    {
        MySqlConnection connection, ocon;
        MySqlCommand SqlCommand;
        public int Product_id;
        public static string category_name;
        //string sqlconn = System.Configuration.ConfigurationManager.ConnectionStrings["Project"].ConnectionString;
        public void Page_Load(object sender, EventArgs e)
        {
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
            try
            {
                connection.Open();
                //Response.Write("hi 333333");
                MySqlDataAdapter oda = new MySqlDataAdapter("SELECT p.Product_id,p.Product_sku,p.Product_name,p.Product_desc,p.Product_price,p.Product_quantity,p.category_name,p.subCategory_name,p.filename from product p", connection);

                //SqlCommandBuilder builder = new SqlCommandBuilder(oda);
                DataSet ds = new DataSet();
                oda.Fill(dt);
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

        public void gv1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    DataRowView drv = e.Row.DataItem as DataRowView;

                    DropDownList ddlCategories = (DropDownList)e.Row.FindControl("ddlCategories");
                    //Bind categories data to dropdownlist
                    ddlCategories.DataTextField = "category_name";
                    ddlCategories.DataValueField = "category_name";
                    ddlCategories.DataSource = RetrieveCategories();
                    ddlCategories.DataBind();
                    //set the selected value of the dropdown to selected product's category
                    ddlCategories.SelectedValue = drv["category_name"].ToString();
                    DropDownList ddlSubCategories = (DropDownList)e.Row.FindControl("ddlSubCategories");
                    //Get Subcategories list based on selected product's category and bind it to
                    //subcategory dropdown
                    ddlSubCategories.DataTextField = "subCategory_name";
                    ddlSubCategories.DataValueField = "subCategory_name";
                    ddlSubCategories.DataSource = RetrieveSubCategories(drv["category_name"].ToString());
                    ddlSubCategories.DataBind();
                    ddlSubCategories.SelectedValue = drv["subCategory_name"].ToString();



                }
            }


        }

        private DataTable RetrieveSubCategories(string categoryID)
        {
            try
            {
                Initialize1();
                connection.Open();

                DataTable dtSubCategories = new DataTable();

                using (SqlCommand = new MySqlCommand("Select subCategory_name  from subcategory where Category_name='" + categoryID + "'", connection))
                {
                    MySqlDataAdapter oda = new MySqlDataAdapter(SqlCommand);

                    oda.Fill(dtSubCategories);
                }
                return dtSubCategories;
            }



            catch (SqlException e)
            {
                DataTable dtSubCategories = new DataTable();
                Response.Write(e);
                return dtSubCategories;
            }

        }

        private DataTable RetrieveCategories()
        {
            try
            {

                DataTable dtCategories = new DataTable();


                Initialize1();
                connection.Open();


                using (SqlCommand = new MySqlCommand("Select Category_name  from category ", connection))
                {
                    MySqlDataAdapter oda = new MySqlDataAdapter(SqlCommand);

                    oda.Fill(dtCategories);
                }

                return dtCategories;
            }
            catch (SqlException e)
            {
                DataTable dtCategories = new DataTable();
                Response.Write(e);
                return dtCategories;
            }
        }
        protected void ddlCategories_SelectedIndexChanged(object sender, EventArgs e)
        {
            //since this event is raised by the control in the gridview row
            //we could do some reverse engineerign to get reference to the gridview row
            GridViewRow gvrow = (GridViewRow)((DropDownList)sender).NamingContainer;

            //get reference to the categories & subcategories dropdownlist
            DropDownList ddlCategories = (DropDownList)gvrow.FindControl("ddlCategories");
            DropDownList ddlSubCategories = (DropDownList)gvrow.FindControl("ddlSubCategories");

            //Get subcategories based on category selected and bind the list to subcategories dropdownlist
            ddlSubCategories.DataTextField = "subCategory_name";
            ddlSubCategories.DataValueField = "subCategory_name";
            ddlSubCategories.DataSource = RetrieveSubCategories(ddlCategories.SelectedValue);
            ddlSubCategories.DataBind();
        }

        public void gv1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //Response.Write("hi 5");
            int Product_id = Convert.ToInt32(gv1.DataKeys[e.RowIndex].Value);

            try
            {
                Initialize1();
                connection.Open();
                SqlCommand = new MySqlCommand("Delete from product where Product_id=" + Product_id + "", connection);
                //ocmd.CommandText = "DELETE FROM product WHERE Product_id=@Product_id";
                //ocmd.Parameters.AddWithValue("@Product_id", Product_id);

                SqlCommand.ExecuteNonQuery();
                connection.Close();
                BindGrid();
            }
            catch (SqlException e1)
            {
                Response.Write(e1);
            }
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
                Product_id = int.Parse(((Label)(gv1.Rows[e.RowIndex].Cells[1].FindControl("lbleid"))).Text);
                string Product_sku = ((Label)(gv1.Rows[e.RowIndex].Cells[1].FindControl("Product_sku"))).Text;
                string Product_name = ((TextBox)(gv1.Rows[e.RowIndex].Cells[1].FindControl("Product_name"))).Text;
                string Product_desc = ((TextBox)(gv1.Rows[e.RowIndex].Cells[1].FindControl("Product_desc"))).Text;
                int Product_price = int.Parse(((TextBox)(gv1.Rows[e.RowIndex].Cells[1].FindControl("Product_price"))).Text);
                int Product_quantity = int.Parse(((TextBox)(gv1.Rows[e.RowIndex].Cells[1].FindControl("Product_quantity"))).Text);
                DropDownList ddlSubCategories = (DropDownList)(gv1.Rows[e.RowIndex].Cells[1].FindControl("ddlSubCategories"));
                string subCategory_name = ddlSubCategories.SelectedValue;
                // string category_name = ((DropDownList)(gv1.Rows[e.RowIndex].Cells[1].FindControl("category_name"))).Text;
                DropDownList ddlCategories = (DropDownList)(gv1.Rows[e.RowIndex].Cells[1].FindControl("ddlCategories"));
                string Category_name = ddlCategories.SelectedValue;
                //gv1.Rows[e.RowIndex].FindControl("FileUpload1") as FileUpload.Enabled = true;
                //string subCategory_name = ((DropDownList)(gv1.Rows[e.RowIndex].Cells[1].FindControl("subCategory_name")).Text;
                FileUpload fileUpload = gv1.Rows[e.RowIndex].FindControl("FileUpload1") as FileUpload;

                if (fileUpload != null && fileUpload.HasFile)
                {

                    string filename = Path.GetFileName(fileUpload.PostedFile.FileName);

                    fileUpload.SaveAs(Server.MapPath("/DbImages/" + filename));
                    try
                    {
                        Initialize1();
                        connection.Open();

                        // Response.Write("not null");
                        SqlCommand = new MySqlCommand("Update product set Product_name='" + Product_name + "',Product_desc='" + Product_desc + "',Product_price=" + Product_price + ",Product_quantity=" + Product_quantity + ",category_name=@var1,subCategory_name=@var2,filename='" + filename + "',filepath='../DbImages/" + filename + "' where Product_sku='" + Product_sku + "'", connection);
                        SqlCommand.Parameters.AddWithValue("@var1", ddlCategories.SelectedValue);
                        SqlCommand.Parameters.AddWithValue("@var2", ddlSubCategories.SelectedValue);
                        int i = SqlCommand.ExecuteNonQuery();
                        if (i > 0)
                        {
                            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Updated Succesfully')", true);
                            // System.Windows.Forms.DialogResult dialogResult = System.Windows.Forms.MessageBox.Show("Succesfully Updated", "Update Products", System.Windows.Forms.MessageBoxButtons.OK);
                        }
                        else
                        {
                            Response.Write("Not Updated");
                        }
                        connection.Close();
                        //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
                        gv1.EditIndex = -1;
                        //Call ShowData method for displaying updated data  


                        BindGrid();
                    }
                    catch (SqlException e3)
                    {
                        Response.Write(e3);
                    }
                }
                else
                {

                    try
                    {
                        Initialize1();
                        connection.Open();


                        SqlCommand = new MySqlCommand("Update product set Product_name='" + Product_name + "',Product_desc='" + Product_desc + "',Product_price=" + Product_price + ",Product_quantity=" + Product_quantity + ",category_name=@var1,subCategory_name=@var2 where Product_sku='" + Product_sku + "'", connection);
                        SqlCommand.Parameters.AddWithValue("@var1", ddlCategories.SelectedValue);
                        SqlCommand.Parameters.AddWithValue("@var2", ddlSubCategories.SelectedValue);
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

                        gv1.EditIndex = -1;



                        BindGrid();
                    }
                    catch (SqlException e3)
                    {
                        Response.Write(e3);
                    }
                }
            }
        }

        public void gv1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gv1.EditIndex = -1;
            BindGrid();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("admin.aspx");
        }

        protected void gv1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}