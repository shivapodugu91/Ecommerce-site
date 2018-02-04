using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Web.Configuration;
using System.Configuration;
using System.Data;
using System.Text;
using System.Collections;

namespace ecomNew
{
    public partial class index : System.Web.UI.Page
    {


        bool _isConfirmNeeded = true;
        string _confirmMessage = string.Empty;
        public bool IsConfirmNeeded
        {
            get { return _isConfirmNeeded; }
            set { _isConfirmNeeded = value; }
        }
        public string ConfirmMessage
        {
            get { return _confirmMessage; }
            set { _confirmMessage = value; }
        }





        string userid, username, productsku, productdesc, filepath,sku;

        ArrayList cartitemslist = new ArrayList();
        MySqlConnection con = new MySqlConnection();
        MySqlDataReader reader;
        int i, j, cartid, productquantity, productid,quantity;
        float productprice;
        protected void Page_Load(object sender, EventArgs e)
        {

            IsConfirmNeeded = true;
            ConfirmMessage = "You already have this item in your cart ! \\nDo you want to increase its quantity?";

            // Insure that the __doPostBack() JavaScript is added to the page...
            ClientScript.GetPostBackEventReference(this, string.Empty);


            string eventTarget = Request["__EVENTTARGET"] ?? string.Empty;
            string eventArgument = Request["__EVENTARGUMENT"] ?? string.Empty;

            switch (eventTarget)
            {
                case "UserConfirmationPostBack":
                    if (Convert.ToBoolean(eventArgument))
                    {
                        // User said to go ahead and do it...
                        Response.Redirect("product_summary.aspx");
                    }
                    else
                    {

                        // User said NOT to do it...
                        Response.Redirect("index.aspx");



                    }
                    break;
            }



           

            if (!IsPostBack)
            {
               
                if (Session["userid"] != null)
                {

                    if (Request.QueryString["userid"] != null)
                    {
                        string abc = Request.QueryString["userid"];
                        byte[] dec = System.Convert.FromBase64String(abc);
                        userid = System.Text.ASCIIEncoding.ASCII.GetString(dec);
                    }
                    log.Visible = false;
                    logout.Visible = true;
                    cartitems.Visible = true;
                    fetch();
                    userfname.Text = "Welcome! " + username;
                }
                else
                {
                    log.Visible = true;
                    logout.Visible = false;
                    chngpwd.Visible = false;
                    cartitems.Visible = false;
                }

                con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
                try
                {
                    con.Open();

                    string sql1 = "SELECT Product_sku,Product_desc,Product_price,Product_quantity,filepath FROM product ";

                    MySqlCommand cmd1 = new MySqlCommand(sql1, con);

                 

                    reader = cmd1.ExecuteReader();
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                           
                           
                            productsku = reader["Product_sku"].ToString();
                            productdesc = reader["Product_desc"].ToString();
                            productprice = (float)reader["Product_price"];
                            quantity = (int)reader["Product_quantity"];
                           

                            filepath = reader["filepath"].ToString();

                            product productadd = new product( productsku, productdesc, productprice, quantity, filepath);

                            cartitemslist.Add(productadd);



                        }
                    }

                    reader.Close();



                    con.Close();
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                    con.Close();
                }
                GridView1.DataSource = cartitemslist;
                GridView1.DataBind();



               




            }
        }
        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[2].Visible = false; 
        }

        private void fetch()
        {
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
            try
            {
                con.Open();
                string sql = "select Customer_firstname from customer where Customer_id=@id";
                MySqlCommand cmd = new MySqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@id", userid);
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    username = reader["Customer_firstname"].ToString();
                }
                reader.Close();
                con.Close();
            }
            catch (Exception e)
            {
                Response.Write(e.Message);
                con.Close();
            }

        }

       
       

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (Session["userid"] == null)
            {
                this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please login before adding items to cart!'); window.location='Login.aspx'", true);
            }
            else
            {
                int index = Convert.ToInt32(e.CommandArgument);

                // Retrieve the row that contains the button clicked 
                // by the user from the Rows collection.
                GridViewRow row = GridView1.Rows[index];
                //Response.Write(row.Cells[2].Text);

                ViewState["sku"] = row.Cells[2].Text;
                sku = ViewState["sku"].ToString();
                check();



                
            }

        }

       

       


        private void productinfo()
        {

            con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
            try
            {
                con.Open();
                string sql = "select Product_id,Product_sku,Product_desc,Product_price,filepath,`Product_quantity` from product where Product_sku=@sku";

                MySqlCommand cmd = new MySqlCommand(sql, con);

                cmd.Parameters.AddWithValue("@sku", ViewState["sku"]);


                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    productsku = reader["Product_sku"].ToString();
                    productid =(int) reader["Product_id"];
                    productdesc = reader["Product_desc"].ToString();
                    productprice = (float)reader["Product_price"];
                    filepath = reader["filepath"].ToString();
                    productquantity = (int)reader["Product_quantity"];
                }
                reader.Close();



                con.Close();
            }
            catch (Exception e)
            {
                Response.Write(e.Message);
                con.Close();
            }

        }


        private int cartidinfo()
        {

            con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
            try
            {
                con.Open();
                string sql = "select Cart_id from cart where Customer_id=@id";

                MySqlCommand cmd = new MySqlCommand(sql, con);

                cmd.Parameters.AddWithValue("@id", Session["userid"]);


                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    cartid = (int)reader["Cart_id"];
                    
                }
                else
                {
                    cartid = 0;
                }
                reader.Close();



                con.Close();
            }
            catch (Exception e)
            {
                Response.Write(e.Message);
                con.Close();
            }
            return cartid;

        }

        private void check()
        {
            productinfo();
            cartid = cartidinfo();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
            try
            {
                con.Open();
                string sql = "select Product_id from cartitems ci inner join cart c where Product_id=@pid and Customer_id=@id";

                MySqlCommand cmd = new MySqlCommand(sql, con);

                cmd.Parameters.AddWithValue("@id", Session["userid"]);
                cmd.Parameters.AddWithValue("@pid", productid);

                reader = cmd.ExecuteReader();
                if (reader.Read())
                {

                    Session.Add("cartid", Session["userid"]);
                    if (IsConfirmNeeded)
                    {
                        StringBuilder javaScript = new StringBuilder();

                        string scriptKey = "ConfirmationScript";

                        javaScript.AppendFormat("var userConfirmation = window.confirm('{0}');\n", ConfirmMessage);


                        javaScript.Append("__doPostBack('UserConfirmationPostBack', userConfirmation);\n");

                        ClientScript.RegisterStartupScript(GetType(), scriptKey, javaScript.ToString(), true);
                        reader.Close();
                    }
                }
                else
                {
                    reader.Close();
                    if (cartid == 0)
                    {
                        string sqlcart = "insert into cart (`Customer_id`) value (@val2)";


                        MySqlCommand cmdc = new MySqlCommand(sqlcart, con);

                        cmdc.Parameters.AddWithValue("@val2", Session["userid"]);

                        i = cmdc.ExecuteNonQuery();
                        if(i==0)
                        {
                            Response.Redirect("Login.aspx"); 
                        }
                        if (i > 0)
                        {
                            string sql1 = "select Cart_id from cart where Customer_id=@id";

                            MySqlCommand cmd2 = new MySqlCommand(sql1, con);

                            cmd2.Parameters.AddWithValue("@id", Session["userid"]);


                            reader = cmd2.ExecuteReader();
                            if (reader.Read())
                            {
                                cartid = (int)reader["Cart_id"];

                            }
                            reader.Close();
                            con.Close();
                            con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
                            con.Open();
                            string sql3 = "insert into cartitems (`Cart_id`, Quantity,Product_id) values(@val6,@val7,@val8)";
                            MySqlCommand cmd3 = new MySqlCommand(sql3, con);
                            cmd3.Parameters.AddWithValue("@val6", cartid);
                            cmd3.Parameters.AddWithValue("@val7", 1);
                            cmd3.Parameters.AddWithValue("@val8", productid);

                            j = cmd3.ExecuteNonQuery();
                            if (j > 0)
                            {
                                this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Product added to your cart!'); ", true);
                            }
                            else
                            {
                                Response.Write("error");
                            }
                            con.Close();

                        }
                        else
                        {
                            Response.Write("error");
                        }


                    }

                    else
                    {
                        con.Close();
                        con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
                        con.Open();
                        string sql4 = "insert into cartitems (`Cart_id`, Quantity,Product_id) values(@val6,@val7,@val8)";
                        MySqlCommand cmd3 = new MySqlCommand(sql4, con);
                        cmd3.Parameters.AddWithValue("@val6", cartid);
                        cmd3.Parameters.AddWithValue("@val7", 1);
                        cmd3.Parameters.AddWithValue("@val8", productid);

                        j = cmd3.ExecuteNonQuery();
                        if (j > 0)
                        {
                            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Product added to your cart!'); ", true);
                        }
                        else
                        {
                            Response.Write("error");
                        }
                        con.Close();

                    }

                    con.Close(); 

                    reader.Close();
                    con.Close();








                }
                reader.Close();



                con.Close();
            }
            catch (Exception e)
            {
                Response.Write(e.Message);
                con.Close();
            }

        }




    }
}