using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DiskStore.Models
{
    public class Cart
    {

        private List<CartLine> lineCollection = new List<CartLine>();

        public void AddItem(Disk disk, int quantity)
        {
            CartLine line = lineCollection
                .Where(p => p.Disk.Id == disk.Id)
                .FirstOrDefault();

            if (line == null)
            {
                lineCollection.Add(new CartLine
                {
                    Disk = disk,
                    Quantity = quantity
                });
            }
            else
            {
                line.Quantity += quantity;
            }
        }

        public void RemoveLine(Disk disk)
        {
            lineCollection.RemoveAll(l => l.Disk.Id == disk.Id);
        }

        public decimal ComputeTotalValue()
        {
            return lineCollection.Sum(e => e.Disk.Price * e.Quantity);

        }
        public void Clear()
        {
            lineCollection.Clear();
        }

        public IEnumerable<CartLine> Lines
        {
            get { return lineCollection; }
        }
    }

    public class CartLine
    {
        public Disk Disk { get; set; }
        public int Quantity { get; set; }
    }

}