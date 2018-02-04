using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Customer
{
    public partial class addSubCategory : System.Web.UI.Page
    {
        MySqlConnection con1;
        MySqlConnection con;
        MySqlDataReader reader;
        string cat;
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

           public void populate_dropdown2()
           {

            //  if (!this.IsPostBack)
            //  {
            //Label6.Text = DropDownList1.SelectedValue;
                   string constr = System.Configuration.ConfigurationManager.ConnectionStrings["Project"].ConnectionString;
               try
               {
                   using (MySqlConnection con = new MySqlConnection(constr))
                   {
                    //where category_name = '@name'
                       using (MySqlCommand cmd = new MySqlCommand("SELECT subCategory_name FROM subcategory where category_name = @name "))
                       {
                           cmd.Parameters.AddWithValue("@name", DropDownList1.SelectedValue.ToString().Trim());
                           cmd.CommandType = CommandType.Text;
                           cmd.Connection = con;
                           con.Open();
                           DropDownList2.DataSource = cmd.ExecuteReader();
                           DropDownList2.DataTextField = "subCategory_name";
                           DropDownList2.DataValueField = "subCategory_name";
                           DropDownList2.DataBind();
                           con.Close();
                       }
                       con.Close();
                   }
                   DropDownList2.Items.Insert(0, new ListItem("View Sub Category list", "0"));
               }
               catch (Exception ae)

               {
                   Response.Write(ae);
               }//}
           }

     

      

        protected void Page_Load(object sender, EventArgs e)
        {
            populate_dropdown();
            DropDownList2.Enabled = false;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("admin.aspx");
        }

        protected void UserName_TextChanged(object sender, EventArgs e)
        {
            con = new MySqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
            try
            {
                con.Open();
                string sql = "select subCategory_name from subcategory where subCategory_name=@name";
                MySqlCommand cmd = new MySqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@name", newSubCategory.Text);
                reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    Label3.Visible = true;
                   // addcategory.Enabled = false;
                }
                else
                {
                    Label3.Visible = false;
                   // addcategory.Enabled = true;
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                Console.ReadKey();
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            cat = DropDownList1.SelectedValue;
            if (DropDownList1.SelectedIndex > 0)
            {
                DropDownList2.Enabled = true;
                populate_dropdown2();
            }
            else
                DropDownList1.Items.Clear();
        }

        protected void insert(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedIndex > 0 && (!String.IsNullOrEmpty(newSubCategory.Text)))
            {
               
                con1 = new MySqlConnection();
                con1.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
                con = new MySqlConnection();
                con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
                try
                {
                    con.Open();
                    string sql = "select subCategory_name from subcategory where subCategory_name=@name  and category_name=@val2";
                    MySqlCommand cmd = new MySqlCommand(sql, con);
                    cmd.Parameters.AddWithValue("@name", newSubCategory.Text);
                    cmd.Parameters.AddWithValue("@val2", cat);
                    reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        con.Close();
                        this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Not inserted as sub category is already present in system')", true);
                    }
                    else
                    {
                        con.Close();
                        con1.Open();
                        string sql1 = "insert into subCategory (`subCategory_name`,`Category_name`) values(@val1,@val2)";
                        MySqlCommand cmd1 = new MySqlCommand(sql1, con1);
                        cmd1.Parameters.AddWithValue("@val1", newSubCategory.Text);
                        cmd1.Parameters.AddWithValue("@val2", DropDownList1.SelectedValue);
                        int i = cmd1.ExecuteNonQuery();
                        if (i > 0)
                        {
                            con1.Close();
                            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('inserted new sub category in to system')", true);
                            newSubCategory.Text = "";
                            populate_dropdown2();
                        }
                    }
                    con1.Close();
                }
                catch (Exception ae)
                {
                    Response.Write(ae);
                }
            }
            else
            {
                this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please select category and enter sub category')", true);

            }
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}