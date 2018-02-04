using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Customer
{
    public class paymentdetails
    {
       private string card_number;
       private int Payment_id;
        public string Card_number
       {
           get { return card_number; }
           set { this.card_number = value; }
       }
        public int payment_id
        {
            get { return Payment_id; }
            set { this.Payment_id = value; }
        }

        public paymentdetails(int Payment_id,string card_number)
         {
             payment_id = Payment_id;
             Card_number = card_number;
         }
    }
}