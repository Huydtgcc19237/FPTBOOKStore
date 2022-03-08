using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WEBFPTBOOK.Models;

namespace WEBFPTBOOK.Controllers
{
    public class CartController : Controller
    {
        DatabaseFPTBookDataContext data = new DatabaseFPTBookDataContext();
        // GET: Cart
        public List<Cart> getcart()
        {
            List<Cart> stCart = Session["Cart"] as List<Cart>;
            if (stCart ==null)
            {
                stCart = new List<Cart>();
                Session["Cart"] = stCart;
            }
            return stCart;
        }
        public ActionResult Cart(int BookID, string strURL)
        {
            //GET : SESSION
            List<Cart> stCart = getcart();
            // Check if the book has been added to the cart
            Cart product = stCart.Find(n => n.BookID == BookID);
            if (product == null)
            {
                product = new Cart(BookID);
                stCart.Add(product);
                return Redirect(strURL);
            }
            else
            {
                product.Quatity++;
                return Redirect(strURL);
            }
        }
        // Total quantity
        private int TotalQuantity()
        {
            int iTotalQuantity = 0;
            List<Cart> stCart = Session["Cart"] as List<Cart>;
            if (stCart!=null)
            {
                iTotalQuantity = stCart.Sum(n => n.Quatity);

            }
            return iTotalQuantity;
        }
        // Total price
        private double TotalPrice()
        {
            double iTotalPrice = 0;
            List<Cart> stCart = Session["Cart"] as List<Cart>;
            if(stCart!=null){
                iTotalPrice = stCart.Sum(n => n.Total);

            }
            return iTotalPrice;

        }
        // Create cart
        public ActionResult Cart()
        {
            List<Cart> stCart = getcart();
            if(stCart.Count==0)
            {
                return RedirectToAction("Index", "FPTBook");
            }
            ViewBag.TotalQuantity = TotalQuantity();
            ViewBag.TotalPrice = TotalPrice();
            return View(stCart);
        }
        public ActionResult CartPartial()
        {
            ViewBag.TotalQuantity = TotalQuantity();
            ViewBag.TotalPrice = TotalPrice();
            return PartialView();
        }
        // Delete cart
        public ActionResult DeleteCart(int IBookID)
        {
            List<Cart> stCart = getcart();
            // check book
            Cart product = stCart.SingleOrDefault(n => n.BookID == IBookID);
            if(stCart!==null)
            {

            }
        }

    }
}