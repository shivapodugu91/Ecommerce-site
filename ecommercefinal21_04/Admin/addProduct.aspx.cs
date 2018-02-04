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
using System.IO;

namespace Customer
{
    public partial class addProduct : System.Web.UI.Page

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
            DropDownList1.Items.Insert(0, new ListItem("Select Category list", "0"));
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
            DropDownList2.Items.Insert(0, new ListItem("Select Sub Category list", "0"));
        }
        catch (Exception ae)

        {
            Response.Write(ae);
        }//}
    }

     /*   public void populate_dropdown3()
        {

            //  if (!this.IsPostBack)
            //  {
            Label6.Text = DropDownList1.SelectedValue;
            string constr = System.Configuration.ConfigurationManager.ConnectionStrings["Project"].ConnectionString;
            try
            {
                using (MySqlConnection con = new MySqlConnection(constr))
                {
                    //where category_name = '@name'
                    using (MySqlCommand cmd = new MySqlCommand("SELECT Product_sku FROM product where category_name=@name and subCategory_name=@name2"))
                    {
                        cmd.Parameters.AddWithValue("@name", DropDownList1.SelectedValue.ToString().Trim());
                        cmd.Parameters.AddWithValue("@name2", DropDownList2.SelectedValue.ToString().Trim());
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        DropDownList3.DataSource = cmd.ExecuteReader();
                        DropDownList3.DataTextField = "Product_sku";
                        DropDownList3.DataValueField = "Product_sku";
                        DropDownList3.DataBind();
                        con.Close();
                    }
                    con.Close();
                }
                DropDownList3.Items.Insert(0, new ListItem("View Product SKU list", "0"));
            }
            catch (Exception ae)

            {
                Response.Write(ae);
            }//}
        }
*/


        protected void Page_Load(object sender, EventArgs e)
    {
        populate_dropdown();
        DropDownList2.Enabled = false;
        //DropDownList3.Enabled = false;
            Product_name.Enabled = false;
            Product_desc.Enabled = false;
            Product_price.Enabled = false;
            Product_quantity.Enabled = false;
        }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("admin.aspx");
    }

    protected void Product_sku_TextChanged(object sender, EventArgs e)
    {
        con = new MySqlConnection();
        con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
        try
        {
            con.Open();
            string sql = "select Product_sku from product where Product_sku=@name";
            MySqlCommand cmd = new MySqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@name", Product_sku.Text);
                cmd.Parameters.AddWithValue("@cat", DropDownList1.SelectedValue.ToString().Trim());
                cmd.Parameters.AddWithValue("@subcat", DropDownList2.SelectedValue.ToString().Trim());
                reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                Label3.Visible = true;
               // Product_sku.Enabled = false;

            }
            else
            {
                Label3.Visible = false;
                    Product_sku.Enabled = true;
                    Product_name.Enabled = true;
                    Product_desc.Enabled = true;
                    Product_price.Enabled = true;
                    Product_quantity.Enabled = true;
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
        if (DropDownList1.SelectedIndex > 0 && (!String.IsNullOrEmpty(Product_sku.Text)) && (!String.IsNullOrEmpty(Product_name.Text)) && (!String.IsNullOrEmpty(Product_desc.Text)) && (!String.IsNullOrEmpty(Product_price.Text)) && (!String.IsNullOrEmpty(Product_quantity.Text)) && FileUpload1.PostedFile != null)
        {

            con1 = new MySqlConnection();
            con1.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
            con = new MySqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
            try
            {
                con.Open();
                string sql = "select Product_sku from product where Product_sku=@sku  and category_name=@cat and subCategory_name=@subcat";
                MySqlCommand cmd = new MySqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@sku", Product_sku.Text);
                cmd.Parameters.AddWithValue("@cat", DropDownList1.SelectedValue);
                    cmd.Parameters.AddWithValue("@subcat", DropDownList2.SelectedValue);
                    reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    con.Close();
                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Not inserted as product is already present in system')", true);
                }
                else
                {
                    con.Close();
                    con1.Open();
                        string FileName = Path.GetFileName(FileUpload1.PostedFile.FileName);

                        //Save files to disk
                        FileUpload1.SaveAs(Server.MapPath("~/DbImages/" + FileName));

                        string sql1 = "insert into product (`Product_sku`,`Product_name`,`Product_desc`,`Product_price`,`Product_quantity`,`filename`,`filepath`,`subCategory_name`,`Category_name`) values(@sku,@pname,@pdesc,@pprice,@pquant,@FileName,@FilePath,@subcat,@cat)";
                        
                        MySqlCommand cmd1 = new MySqlCommand(sql1, con1);
                    cmd1.Parameters.AddWithValue("@sku", Product_sku.Text);
                    cmd1.Parameters.AddWithValue("@cat", DropDownList1.SelectedValue);
                        cmd1.Parameters.AddWithValue("@subcat", DropDownList2.SelectedValue);
                        cmd1.Parameters.AddWithValue("@pname", Product_name.Text);
                        cmd1.Parameters.AddWithValue("@pdesc", Product_desc.Text);
                        cmd1.Parameters.AddWithValue("@pprice", Product_price.Text);
                        cmd1.Parameters.AddWithValue("@pquant", Product_quantity.Text);
                        cmd1.Parameters.AddWithValue("@FileName", FileName);
                        cmd1.Parameters.AddWithValue("@FilePath", "~/DbImages/" + FileName);
                        int i = cmd1.ExecuteNonQuery();
                    if (i > 0)
                    {
                        con1.Close();
                        this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('inserted new product in to system')", true);
                            Product_sku.Text = "";
                            Product_name.Text = "";
                            Product_desc.Text = "";
                            Product_price.Text = "";
                            Product_quantity.Text = "";
                       // populate_dropdown3();
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
            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please select category, sub category and enter all values')", true);

        }
    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
            if (DropDownList2.SelectedIndex > 0)
            {
                //DropDownList3.Enabled = true;
               // populate_dropdown3();
                
            }
            else
                DropDownList2.Items.Clear();
        }

     /*   protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.PostedFile != null)
            {
                string FileName = Path.GetFileName(FileUpload1.PostedFile.FileName);

                //Save files to disk
                FileUpload1.SaveAs(Server.MapPath("DbImages/" + FileName));

                //Add Entry to DataBase
                String strConnString = System.Configuration.ConfigurationManager
                    .ConnectionStrings["Project"].ConnectionString;
                SqlConnection con = new SqlConnection(strConnString);
                string strQuery = "insert into product (fileName, filePath) values(@FileName, @FilePath)";
                SqlCommand cmd = new SqlCommand(strQuery);
                cmd.Parameters.AddWithValue("@FileName", FileName);
                cmd.Parameters.AddWithValue("@FilePath", "DbImages/" + FileName);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
                finally
                {
                    con.Close();
                    con.Dispose();
                }
            }
        }
        */
        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }
    }
}