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
using System.Data.SqlClient;
using System.Collections;

namespace ecomNew
{
    public partial class product_summary : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection();
        MySqlDataReader reader;
        string userid, username, productsku, productdesc, filepath;
        int cartidexists, j, quantity, i, itemid, productid,cartid,productquantity;
            float productprice;
            float sum;
        ArrayList cartitems = new ArrayList();
   
        protected void Page_Load(object sender, EventArgs e)
        {
            string abc = Session["userid"].ToString();
            userid = abc;
            if (!IsPostBack)
            {
                if (Session["userid"] != null )
                {
                  
                    userid = abc;
                  
                    log.Visible = false;
                    logout.Visible = true;
                    fetch();
                    userfname.Text =  username;
                    con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
                    try
                    {
                        cartid = cartidinfo();
                        con.Open();

                        string sql1 = "select CartItems_id,c2.Product_id,Product_sku,Product_desc,p.Product_quantity,Quantity,Product_price,filepath from cart c1 inner join cartitems c2 on c1.Cart_id=c2.Cart_id inner join product p on c2.Product_id=p.Product_id where c2.Cart_id=@id ";

                        MySqlCommand cmd1 = new MySqlCommand(sql1, con);

                        cmd1.Parameters.AddWithValue("@id", cartid);

                        reader = cmd1.ExecuteReader();
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {

                                itemid = (int)reader["Cartitems_id"];
                                ViewState["itemid"] = itemid;
                                productquantity = (int)reader["Product_quantity"];
                                
                                productid = (int)reader["Product_id"];
                                productsku = reader["Product_sku"].ToString();
                                productdesc = reader["Product_desc"].ToString();
                                productprice = (float)reader["Product_price"];
                                quantity = (int)reader["Quantity"];
                                sum += productprice * quantity;
                                Session["sum"] = sum;
                                filepath = reader["filepath"].ToString();

                                product productadd = new product(itemid, productsku, productdesc, productprice, quantity,productquantity, filepath);

                                cartitems.Add(productadd);





                            }
                        }
                        else
                        {
                            log.Visible = true;
                            logout.Visible = false;
                            chngpwd.Visible = false;
                            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('There are no items in your cart!');", true);
                        }
                        reader.Close();



                        con.Close();
                    }
                    catch (Exception ex)
                    {
                        Response.Write(ex.Message);
                        con.Close();
                    }
                    GridView1.DataSource = cartitems;
                    GridView1.DataBind();
                    Labelprice.Text = "$"+sum.ToString();


                }
                else
                {
                    log.Visible = true;
                    logout.Visible = false;
                    chngpwd.Visible = false;
                    
                }



            }
        }
        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
             
            e.Row.Cells[1].Visible = false;
          
        
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

      

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            showdetails();

                
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow gvr = GridView1.Rows[e.RowIndex];
            ViewState["itemid"] = int.Parse(((Label)gvr.FindControl("Label7")).Text);
          

            con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
            try
            {
                con.Open();
                string sql = "Update cartitems set Quantity=@quan where Cartitems_id=@id";
                MySqlCommand cmd = new MySqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@quan", int.Parse(((TextBox)gvr.FindControl("TextBox4")).Text));
                cmd.Parameters.AddWithValue("@id", ViewState["itemid"]);
                i = cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
                con.Close();
            }



           


            GridView1.EditIndex = -1;
            showdetails();

        }

        protected void GridView1_RowDataBound1(object sender, GridViewRowEventArgs e)
        {
           // e.Row.Cells[5].Text += "$";
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow gvr = GridView1.Rows[e.RowIndex];
          
            ViewState["itemid"] = int.Parse(((Label)gvr.FindControl("Label6")).Text);
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
            cartidexists = deletefromcart();
            cartid = cartidinfo();
            try
            {
                con.Open();
                string sql = "delete from cartitems where CartItems_id=@id";
                MySqlCommand cmd = new MySqlCommand(sql, con);

                cmd.Parameters.AddWithValue("@id", ViewState["itemid"]);

                i = cmd.ExecuteNonQuery();
               
               
                if(i>0)
                {
                    string sql1 = "select Cart_id from cartitems where  Cart_id=@id";

                    MySqlCommand cmd1 = new MySqlCommand(sql1, con);

                    cmd1.Parameters.AddWithValue("@id", cartid);


                    reader = cmd1.ExecuteReader();
                    if (reader.Read())
                    {
                        cartidexists = 1;

                    }
                    else
                    {
                        cartidexists = 0;
                    }
                    reader.Close();

                    if (cartidexists == 0)
                    {
                        string sql2 = "delete from cart where Cart_id=@cartid";
                        MySqlCommand cmd2 = new MySqlCommand(sql2, con);
                        cmd2.Parameters.AddWithValue("@cartid", cartid);
                        j = cmd2.ExecuteNonQuery();
                        if (j > 0)
                        {
                           // Response.Write("success");
                        }
                        else
                        {
                            Response.Write("fail");
                        }

                    }
                
                }
               
               
               
             
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
                con.Close();
            }






            GridView1.EditIndex = -1;
            showdetails();
           
        }

        private int deletefromcart()
        {
            cartid = cartidinfo();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
            try
            {
                con.Open();
                string sql = "select Cart_id from cartitems where  Cart_id=@id";

                MySqlCommand cmd = new MySqlCommand(sql, con);

                cmd.Parameters.AddWithValue("@id", cartid);


                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    cartidexists = 1;
                    
                }
                else
                {
                    cartidexists = 0;
                }
                reader.Close();



                con.Close();
            }
            catch (Exception e)
            {
                Response.Write(e.Message);
                con.Close();
            }

            return cartidexists;
        }

       private void showdetails()
        {
            cartid = cartidinfo();
          
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
            try
            {
                con.Open();

                string sql1 = "select CartItems_id,c2.Product_id,Product_sku,p.Product_quantity,Product_desc,Quantity,Product_price,filepath from cart c1 inner join cartitems c2 on c1.Cart_id=c2.Cart_id inner join product p on c2.Product_id=p.Product_id where c2.Cart_id=@id ";
            
                MySqlCommand cmd1 = new MySqlCommand(sql1, con);
           
                cmd1.Parameters.AddWithValue("@id", cartid);

                reader = cmd1.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        itemid = (int)reader["CartItems_id"];
                        productid = (int)reader["Product_id"];
                        productquantity = (int)reader["Product_quantity"];
                        productsku = reader["Product_sku"].ToString();
                        productdesc = reader["Product_desc"].ToString();
                        productprice = (float)reader["Product_price"];
                        quantity = (int)reader["Quantity"];
                        sum += productprice * quantity;
                        Session["sum"] = sum;
                    
                        filepath = reader["filepath"].ToString();

                        product productadd = new product(itemid, productsku, productdesc, productprice, quantity,productquantity, filepath);

                        cartitems.Add(productadd);



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
            GridView1.DataSource = cartitems;
            GridView1.DataBind();

            Labelprice.Text = "$" + sum.ToString();
       
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

      


    }
}