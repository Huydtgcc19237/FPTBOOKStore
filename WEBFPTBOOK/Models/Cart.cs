using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBFPTBOOK.Models
{
    public class Cart
    {
        DatabaseFPTBookDataContext data = new DatabaseFPTBookDataContext();
        public int BookID { get; set; }
        public string BookName { get; set; }
        public string BookPic { get; set; }
        public Double Price { get; set; }
        public int Quatity { get; set; }
        public Double Total {
            get { return Quatity * Price; }       
        }
        public Cart(int MaSach)
        {
            BookID = MaSach;
            Sach sach = data.Saches.Single(n => n.MaSach == BookID);
            BookName = sach.TenSach;
            BookPic = sach.AnhBia;
            Price = double.Parse(sach.GiaBan.ToString());
            Quatity = 1;
        }

    }
}