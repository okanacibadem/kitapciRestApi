using MvcKitapci.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;

namespace MvcKitapci.Controllers
{
    public class KitaplarController : Controller
    {
        // GET: Kitaplar
        public ActionResult Index()
        {
            IEnumerable<MvcKitaplarModel> calList;
            HttpResponseMessage response = GlobalVariables.WebApiClient.GetAsync("Kitaplar").Result;

            calList = response.Content.ReadAsAsync<IEnumerable<MvcKitaplarModel>>().Result;

            return View(calList);
        }

        public ActionResult Ekle(int id = 0)
        {
            if (id == 0)
            {
                return View(new MvcKitaplarModel());
            }
            else
            {
                HttpResponseMessage response =
                    GlobalVariables.WebApiClient.GetAsync("Kitaplar/" + id.ToString()).Result;
                return View(response.Content.ReadAsAsync<MvcKitaplarModel>().Result);
            }
        }
        [HttpPost]
        public ActionResult Ekle(MvcKitaplarModel calisan)
        {
            if (calisan.kitapid == 0)
            {
                HttpResponseMessage response =
                    GlobalVariables.WebApiClient.PostAsJsonAsync("Kitaplar", calisan
                    ).Result;
                TempData["SuccessMessage"] = "başarılı şekilde kaydedildi";
            }
            else
            {
                HttpResponseMessage response =
                    GlobalVariables.WebApiClient.PutAsJsonAsync("Kitaplar/" + calisan.kitapid, calisan).Result;
                TempData["SuccessMessage"] = "update başarılı";
            }
            return RedirectToAction("Index");
        }
    }
}