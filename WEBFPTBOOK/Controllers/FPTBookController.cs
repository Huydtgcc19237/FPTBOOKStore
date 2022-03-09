using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WEBFPTBOOK.Models;
using PagedList;
using PagedList.Mvc;

namespace WEBFPTBOOK.Controllers
{
    public class FPTBookController : Controller
    {
        // Create a manage
        DatabaseFPTBookContextDataContext data = new DatabaseFPTBookContextDataContext();
        private List<Book> GetBookNew(int count)
        {
            //sap xep
            return data.Books.OrderByDescending(a => a.DayUpdate).Take(count).ToList();
        }
        // GET: FPTBook
        public ActionResult Index()
        {
            var booknew = GetBookNew(5);
            return View(booknew);
        }
        public ActionResult Topic()
        {
            var topic = from tp in data.Topics select tp;
            return PartialView(topic);
        }
        public ActionResult Publisher()
        {
            var publisher = from pl in data.Publishers select pl;
            return PartialView(publisher);
        }
        public ActionResult ProByThem(int id)  /// Product by theme
        {
            var book = from b in data.Books where b.TopicID == id select b;
            return View(book);
        }
        public ActionResult ProByPublisher(int id)  /// Products by publisher
        {
            var book = from b in data.Books where b.PubID == id select b;
            return View(book);
        }
        public ActionResult Details(int id)  /// Products by publisher
        {
            var book = from b in data.Books where b.BookID == id select b;
            return View(book.Single());
        }
        /*[HttpGet]
        public ActionResult SearchResult(int? page, string key)
        {
            ViewBag.Key = key;

            //phân trang
            int pageNumber = (page ?? 1);
            int pageSize = 6;

            var result = new HomeProcess().Search(key).ToPagedList(pageNumber, pageSize);

            if (result.Count == 0 || key == null || key == "")
            {
                ViewBag.ThongBao = "Không tìm thấy sản phẩm nào";
                return View(result);
            }
            ViewBag.ThongBao = "Hiện có " + result.Count + " kết quả ở trang này";

            return View(result);
        }*/
    }
}