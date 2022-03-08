using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WEBFPTBOOK.Models;

namespace WEBFPTBOOK.Controllers
{
    public class FPTBookController : Controller
    {
        // Create a manage
        DatabaseFPTBookDataContext data = new DatabaseFPTBookDataContext();
        private List<Sach> Laysachmoi(int count)
        {
            //sap xep
            return data.Saches.OrderByDescending(a => a.NgayCapNhat).Take(count).ToList();
        }
        // GET: FPTBook
        public ActionResult Index()
        {
            var sachmoi = Laysachmoi(5);
            return View(sachmoi);
        }
        public ActionResult Topic()
        {
            var topic = from cd in data.ChuDes select cd;
            return PartialView(topic);
        }
        public ActionResult Publisher()
        {
            var publisher = from cd in data.NhaXuatBans select cd;
            return PartialView(publisher);
        }
        public ActionResult ProByThem(int id)  /// Product by theme
        {
            var book = from s in data.Saches where s.MaCD == id select s;
            return View(book);
        }
        public ActionResult ProByPublisher(int id)  /// Products by publisher
        {
            var book = from s in data.Saches where s.MaNXB == id select s;
            return View(book);
        }
        public ActionResult Details(int id)  /// Products by publisher
        {
            var book = from s in data.Saches where s.MaSach == id select s;
            return View(book.Single());
        }
    }
}