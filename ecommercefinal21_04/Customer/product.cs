using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ecomNew
{
    public class product
    {
        private string  product_sku,
       product_desc
            , Filepath;
        private int quantity, cartItems_id,product_id,product_quantity;
        private float product_price;
        public int CartItems_id
        {
            get { return cartItems_id; }
            set { this.cartItems_id = value; }

        }
        public int Product_id
        {
            get { return product_id; }
            set { this.product_id = value; }

        }
        public string Product_sku
        {
            get { return product_sku; }
            set { this.product_sku = value; }
        }
        public string Product_desc
        {

            get { return product_desc; }
            set { this.product_desc = value; }
        }
        public float Product_price
        {
            get { return product_price; }
            set { this.product_price = value; }
        }
        public string filepath
        {
            get { return Filepath; }
            set { this.Filepath = value; }
        }
        public int Quantity
        {
            get { return quantity; }
            set { this.quantity = value; }
        }
        public int Product_quantity
        {
            get { return product_quantity; }
            set { this.product_quantity = value; }
        }
        public product(int cartitems_id,string productsku, string productdesc, float productprice, int quantity,int product_quantity, string filepath)
        {
            CartItems_id = cartitems_id;
            Product_sku = productsku;
            Product_desc = productdesc;
            Product_price = productprice;
            this.filepath = filepath;
            Quantity = quantity;
            Product_quantity = product_quantity;

        }

        public product(string productsku,string productdesc,float productprice,int product_quantity,string filepath)
        {
            Product_sku = productsku;
            Product_desc = productdesc;
            Product_price = productprice;
            this.filepath = filepath;
            Product_quantity = product_quantity;

        }
    }
}