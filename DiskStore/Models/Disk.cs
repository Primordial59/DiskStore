using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DiskStore.Models
{
    public class Disk
    {
        public int Id { get; set; }
        public string Artist { get; set; }
        public string Country { get; set; }
        public string Style { get; set; }
        public string Album { get; set; }
        public decimal Year { get; set; }
        public string Label { get; set; }
        public string Number { get; set; }
        public string Licensing { get; set; }
        public decimal Price { get; set; }
        public string Cover { get; set; }
        public string Booklet { get; set; }
        public  string Picture { get; set; }
        public string Tracks { get; set; }
        public string Category { get; set; }
        public int Quantity { get; set; }

    }
}


