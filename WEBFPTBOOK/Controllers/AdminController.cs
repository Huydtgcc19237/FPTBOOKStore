using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WEBFPTBOOK.Models;
using System.IO;
namespace WEBFPTBOOK.Controllers
{
    public class AdminController : Controller
    {
        // create object manage data
        DatabaseFPTBookContextDataContext data = new DatabaseFPTBookContextDataContext();
        // GET: Admin
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult BookManage()
        {
            return View(data.Books.ToList());
        }
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
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
                Admin admin = data.Admins.SingleOrDefault(n => n.UserAdmin == username && n.PassAdmin == password);
                if (admin != null)
                {
                    ViewBag.Notify = "Login successfully";
                    Session["Username"] = admin;
                    return RedirectToAction("Index", "Admin");
                }
                else
                {
                    ViewBag.Notify = "Username and Password is incorrect";
                }
            }
            return View();
        }
        [HttpGet]
        public ActionResult AddBook()
        {
            ViewBag.TopicID = new SelectList(data.Topics.ToList().OrderBy(n => n.TopicName), "TopicID", "TopicName");
            ViewBag.PubID = new SelectList(data.Publishers.ToList().OrderBy(n => n.PubName), "PubID", "PubID");
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult AddBook(Book book, HttpPostedFileBase fileupload)
        {
            ViewBag.TopicID = new SelectList(data.Topics.ToList().OrderBy(n => n.TopicName), "TopicID", "TopicName");
            ViewBag.PubID = new SelectList(data.Publishers.ToList().OrderBy(n => n.PubName), "PubID", "PubName");
            
            if (fileupload == null)
            {
                ViewBag.Notify = "Select Image input";
                return View();
            }
            // add to database
            else
            {
                if (ModelState.IsValid)
                {
                    //save file image
                    var fileName = Path.GetFileName(fileupload.FileName);
                    // save link file
                    var path = Path.Combine(Server.MapPath("~/product_imgs"), fileName);
                    if (System.IO.File.Exists(path))
                        ViewBag.Notify = "image already exists";
                    else
                    {
                        fileupload.SaveAs(path);
                    }
                    book.BookPic = fileName;
                    // Save File
                    data.Books.InsertOnSubmit(book);
                    data.SubmitChanges();
                }
                return RedirectToAction("BookManages");
            }

        }
        // Create delete all
        [HttpGet]
        public ActionResult DeleteAll(int id )
        {
            // Get object to delete
            Book book = data.Books.SingleOrDefault(n => n.BookID == id);
            ViewBag.BookID = book.BookID;
            if (book == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(book);
        }
        [HttpPost, ActionName("DeleteAll")]
        public ActionResult AgreeDelete(int id)
        {
            // Get object to delete
            Book book = data.Books.SingleOrDefault(n => n.BookID == id);
            ViewBag.BookID = book.BookID;
            if (book == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            data.Books.DeleteOnSubmit(book);
            data.SubmitChanges();
            return RedirectToAction("BookManage");
        }
        //Create Publisher manage
        [HttpGet]
        public ActionResult Publisher()
        {
            ViewBag.PubID = new SelectList(data.Topics.ToList().OrderBy(n => n.TopicName), "TopicID", "TopicName");
            ViewBag.PubID = new SelectList(data.Publishers.ToList().OrderBy(n => n.PubName), "PubID", "PubID");
            return View();
        }
    }
}