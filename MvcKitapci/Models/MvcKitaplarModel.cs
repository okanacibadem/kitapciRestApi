using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcKitapci.Models
{
    public class MvcKitaplarModel
    {

        public int kitapid { get; set; }
        public Nullable<int> barkod { get; set; }
        public string kitapadi { get; set; }
        public string yazar { get; set; }
        public string yayinevi { get; set; }
        public string turu { get; set; }
        public Nullable<System.DateTime> basimtarihi { get; set; }
        public string konum { get; set; }
        public string konumsira { get; set; }
        public string aciklama { get; set; }
        public string durum { get; set; }
        public string okunma { get; set; }
    }
}