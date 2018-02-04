using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Customer
{
    public class shippingdetails
    {
        private string address1,
      address2
           , city,state;
        private int shiptoaddress_id;

        public int Shiptoaddress_id
        {
            get { return shiptoaddress_id; }
            set { this.shiptoaddress_id = value; }
        }

        public string Address1
        {
            get { return address1; }
            set { this.address1 = value; }
        }
        public string Address2
        {

            get { return address2; }
            set { this.address2 = value; }
        }
        public string City
        {
            get { return city; }
            set { this.city = value; }
        }
        public string State
        {

            get { return state; }
            set { this.state = value; }
        }


        public shippingdetails(int shiptoaddress_id, string address1, string address2, string city, string state)
        {
            Shiptoaddress_id = shiptoaddress_id;
            Address1 = address1;
            Address2 = address2;
            City = city;
            State = state;
       

        }
    }
}