using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WEBFPTBOOK.Models;

namespace WEBFPTBOOK.Controllers
{
    public class UserController : Controller
    {
        // create object manage data
        DatabaseFPTBookContextDataContext data = new DatabaseFPTBookContextDataContext();
        // GET: User
        public ActionResult Index()
        {
            return View();
        }
        // GET : USER
        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Register(FormCollection collection, Customer cus)
        {
            // add value to form
            var fullname = collection["FullName"];
            var username = collection["UserName"];
            var password = collection["Password"];
            var password2  = collection["Re-Password"];
            var email = collection["Email"];
            var phone = collection["Phone"];
            var adress = collection["Adress"];
            var birthday = string.Format("{0:MM/dd/yyyy}", collection["Birthday"]);
            if (string.IsNullOrEmpty(fullname))
            {
                ViewData["Error1"] = "Name cannot be blank!!!";
            }
            if (string.IsNullOrEmpty(username))
            {
                ViewData["Error2"] = "Please enter username!!!";
            }
            if (string.IsNullOrEmpty(password))
            {
                ViewData["Error3"] = "Please enter password!!!";
            }
            if (string.IsNullOrEmpty(password2))
            {
                ViewData["Error4"] = "Please enter re-password!!!";
            }
            if (string.IsNullOrEmpty(email))
            {
                ViewData["Error5"] = "Please enter email!!!";
            }
            if (string.IsNullOrEmpty(phone))
            {
                ViewData["Error6"] = "Please enter phone!!!";
            }
            if (string.IsNullOrEmpty(adress))
            {
                ViewData["Error7"] = "Please enter address!!!";
            }
            if (string.IsNullOrEmpty(birthday))
            {
                ViewData["Error8"] = "Please enter your date of birth!!!";
            }
            else
            {
                // add value to data
                cus.FullName = fullname;
                cus.UserName = username;
                cus.Password = password;
                cus.Email = email;
                cus.Address = adress;
                cus.Phone = phone;
                cus.Birthday = DateTime.Parse(birthday);
                data.Customers.InsertOnSubmit(cus);
                data.SubmitChanges();
                return RedirectToAction("Index");

            }
            return this.Index();
        }
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(FormCollection collection)
        {
            var username = collection["UserName"];
            var password = collection["Password"];
            if (string.IsNullOrEmpty(username))
            {
                ViewData["Error1"] = "Please ente username!!!";
            }
            if (string.IsNullOrEmpty(password))
            {
                ViewData["Error2"] = "Please enter password!!!";
            }
            else
            {
                Customer cus = data.Customers.SingleOrDefault(n => n.UserName == username && n.Password == password);
                if (cus!=null)
                {
                    ViewBag.Notify = "Login successfully";
                    Session["Username"] = cus;
                    return RedirectToAction("Index", "FPTBook");
                }
                else
                {
                    ViewBag.Notify = "Username and Password is incorrect";
                }
            }
            return View();
        }

        //GET : /User/EditUser
    }
}