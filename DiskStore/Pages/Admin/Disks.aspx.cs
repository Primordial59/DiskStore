using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DiskStore.Models;
using DiskStore.Models.Repository;
using System.Web.ModelBinding;



namespace DiskStore.Pages.Admin
{
    public partial class Disks : System.Web.UI.Page
    {
        private Repository repository = new Repository();

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public IEnumerable<Disk> GetDisks()
        {
            return repository.Disks;
        }

        public void UpdateDisk(int Id)
        {
            Disk myDisk = repository.Disks
                .Where(p => p.Id == Id).FirstOrDefault();
            if (myDisk != null && TryUpdateModel(myDisk,
                new FormValueProvider(ModelBindingExecutionContext)))
            {
                repository.SaveDisk(myDisk);
            }
        }

        public void DeleteDisk(int Id)
        {
            Disk myDisk = repository.Disks
                .Where(p => p.Id == Id).FirstOrDefault();
            if (myDisk != null)
            {
                repository.DeleteDisk(myDisk);
            }
        }

        public void InsertDisk()
        {
            Disk myDisk = new Disk();
            if (TryUpdateModel(myDisk,
                new FormValueProvider(ModelBindingExecutionContext)))
            {
                repository.SaveDisk(myDisk);
            }
        }




    }
}