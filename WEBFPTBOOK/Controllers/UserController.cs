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
        DatabaseFPTBookDataContext db = new DatabaseFPTBookDataContext();
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
        public ActionResult Register(FormCollection collection, KhachHang cus)
        {
            // gan gia tri vao form
            var fullname = collection["Fullname"];
            var username = collection["Username"];
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
                cus.HoTen = fullname;
                cus.TaiKhoan = username;
                cus.MatKhau = password;
                cus.Email = email;
                cus.DiachiKH = adress;
                cus.DienThoaiKH = phone;
                cus.NgaySinh = DateTime.Parse(birthday);
                db.KhachHangs.InsertOnSubmit(cus);
                db.SubmitChanges();
                return RedirectToAction("Login");

            }
            return this.Register();
        }
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        public ActionResult Login(FormCollection collection)
        {
            var username = collection["Username"];
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
                KhachHang cus = db.KhachHangs.SingleOrDefault(n => n.TaiKhoan == username && n.MatKhau == password);
                if (cus!=null)
                {
                    ViewBag.Notify = "Login successfully";
                    Session["Username"] = cus;
                }
                else
                {
                    ViewBag.Notify = "Username and Password is incorrect";
                }
            }
            return View();
        }
    }
}