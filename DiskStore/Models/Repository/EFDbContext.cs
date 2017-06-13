using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace DiskStore.Models.Repository
{
    public class EFDbContext : DbContext
    {
        public DbSet<Disk> Disks { get; set; }
        public DbSet<Order> Orders { get; set; }
    }
}