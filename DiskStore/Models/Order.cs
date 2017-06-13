using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;


namespace DiskStore.Models
{
    public class Order
    {
        public int OrderId { get; set; }

       [Required(ErrorMessage = "Пожалуйста введите свою Фамилию")]
        public string Family { get; set; }

        [Required(ErrorMessage = "Пожалуйста введите свое имя")]
        public string Name { get; set; }

        [Required(ErrorMessage = "Пожалуйста введите свое отчество")]
        public string SecondName { get; set; }

        [Required(ErrorMessage = "Пожалуйста укажите индекс, куда нужно доставить заказ")]
        public string Index { get; set; }

        [Required(ErrorMessage = "Пожалуйста укажите город, куда нужно доставить заказ")]
        public string City { get; set; }
        [Required(ErrorMessage = "Пожалуйста укажите почтовый адрес, куда нужно доставить заказ")]
        public string Address { get; set; }
        public bool GiftWrap { get; set; }
        public bool Dispatched { get; set; }

        [Required(ErrorMessage = "Пожалуйста введите адрес E-Mail")]
        public string EMail { get; set; }
        public virtual List<OrderLine> OrderLines { get; set; }
     

    }
    public class OrderLine
    {
        public int OrderLineId { get; set; }
        public Order Order { get; set; }
        public Disk Disk { get; set; }
        public int Quantity { get; set; }
    }



}