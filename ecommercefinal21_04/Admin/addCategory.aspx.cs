using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Customer
{
    public partial class tempaddproduct : System.Web.UI.Page
    {
        MySqlConnection con1;
        MySqlConnection con;
        MySqlDataReader reader;
        protected void Page_Load(object sender, EventArgs e)
        {
            populate_dropdown();
        }

        public void populate_dropdown()
        {
            Label3.Visible = false;
            if (!this.IsPostBack)
            {
                string constr = System.Configuration.ConfigurationManager.ConnectionStrings["Project"].ConnectionString;
                using (MySqlConnection con = new MySqlConnection(constr))
                {
                    using (MySqlCommand cmd = new MySqlCommand("SELECT category_name FROM category"))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        DropDownList1.DataSource = cmd.ExecuteReader();
                        DropDownList1.DataTextField = "category_name";
                        DropDownList1.DataValueField = "category_name";
                        DropDownList1.DataBind();
                        con.Close();
                    }
                    con.Close();
                }
                DropDownList1.Items.Insert(0, new ListItem("View Category list", "0"));
            }
        }


        protected void UserName_TextChanged(object sender, EventArgs e)
        {
            con = new MySqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString; 
            try
            {
                con.Open();
                string sql = "select Category_name from category where Category_name=@name";
                MySqlCommand cmd = new MySqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@name", newCategory.Text);
                reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    Label3.Visible = true;
                  // addcategory.Enabled = false;
                }
                else
                {
                    Label3.Visible = false;
                    //addcategory.Enabled = true;
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                Console.ReadKey();
            }
        }

        protected void insert(object sender, EventArgs e)
        {
            con1 = new MySqlConnection();
            con1.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
            con = new MySqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
            try
            {
                con.Open();
                string sql = "select Category_name from category where Category_name=@name";
                MySqlCommand cmd = new MySqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@name", newCategory.Text);
                reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    con.Close();
                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Not inserted as  category is already present in system')", true);
                    newCategory.Text = "";
                }
                else
                {
                    con.Close();
                    con1.Open();
                    string sql1 = "insert into category (`Category_name`) values(@val1)";
                    MySqlCommand cmd1 = new MySqlCommand(sql1, con1);
                    cmd1.Parameters.AddWithValue("@val1", newCategory.Text);
                    int i = cmd1.ExecuteNonQuery();
                    if (i > 0)
                    {
                        con1.Close();
                        this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('inserted new category in to system')", true);
                        newCategory.Text ="";
                        populate_dropdown();
                    }
                }
                con1.Close();
            }
            catch (Exception ae)
            {
                Response.Write(ae);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("admin.aspx");
        }
    }
}