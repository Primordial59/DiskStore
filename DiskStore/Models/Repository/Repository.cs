using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace DiskStore.Models.Repository
{
    public class Repository
    {

        private EFDbContext context = new EFDbContext();
        public IEnumerable<Disk> Disks
        {
            get { return context.Disks; }
        }

        // Чтение данных из таблицы Orders
        public IEnumerable<Order> Orders
        {
            get
            {
                return context.Orders
                    .Include(o => o.OrderLines.Select(ol => ol.Disk));
            }
        }


        public void SaveDisk(Disk disk)
        {
            if (disk.Id == 0)
            {
                disk = context.Disks.Add(disk);
            }
            else
            {
                Disk dbDisk = context.Disks.Find(disk.Id);
                if (dbDisk != null)
                {
                    dbDisk.Id = disk.Id;
                    dbDisk.Artist = disk.Artist;
                    dbDisk.Year = disk.Year;
                    dbDisk.Price = disk.Price;
                    dbDisk.Quantity = disk.Quantity;
                }
            }
            context.SaveChanges();
        }

        public void DeleteDisk(Disk disk)
        {
            IEnumerable<Order> orders = context.Orders
                .Include(o => o.OrderLines.Select(ol => ol.Disk))
                .Where(o => o.OrderLines
                    .Count(ol => ol.Disk.Id == disk.Id) > 0)
                .ToArray();

            foreach (Order order in orders)
            {
                context.Orders.Remove(order);
            }
            context.Disks.Remove(disk);
            context.SaveChanges();
        }

        // Сохранить данные заказа в базе данных
        public void SaveOrder(Order order)
        {
            if (order.OrderId == 0)
            {
                order = context.Orders.Add(order);

                foreach (OrderLine line in order.OrderLines)
                {
                    context.Entry(line.Disk).State
                        = EntityState.Modified;
                }

            }
            else
            {
                Order dbOrder = context.Orders.Find(order.OrderId);
                if (dbOrder != null)
                {
                    dbOrder.Family = order.Family;
                    dbOrder.Name = order.Name;
                    dbOrder.SecondName = order.SecondName;
                    dbOrder.Index = order.Index;
                    dbOrder.City = order.City;
                    dbOrder.Address = order.Address;
                    dbOrder.GiftWrap = order.GiftWrap;
                    dbOrder.Dispatched = order.Dispatched;
                    dbOrder.EMail = order.EMail;

                }
            }
            context.SaveChanges();
        }



    }
}