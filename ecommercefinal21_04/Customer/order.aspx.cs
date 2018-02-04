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
    public partial class order : System.Web.UI.Page
    {
        string userid, username, productsku, productdesc, filepath, sku;

        ArrayList cartitemslist = new ArrayList();
        MySqlConnection con = new MySqlConnection();
        MySqlDataReader reader;
        int i, j, cartid, productquantity, productid, quantity;
        float productprice;
        protected void Page_Load(object sender, EventArgs e)
        {
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

                        product productadd = new product(productsku, productdesc, productprice, quantity, filepath);

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


        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[2].Visible = false;
        }
    }
}