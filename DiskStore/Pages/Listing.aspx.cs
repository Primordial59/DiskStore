using System;
using System.Collections.Generic;
using DiskStore.Models;
using DiskStore.Models.Repository;
using System.Linq;
using DiskStore.Pages.Helpers;
using System.Web.Routing;

namespace DiskStore.Pages
{
    public partial class Listing : System.Web.UI.Page
    {
        private Repository repository = new Repository();
        private int pageSize = 7;

        protected int CurrentPage
        {
            get {
                int page;
                page = GetPageFromRequest();
                return page > MaxPage ? MaxPage : page;
            }
        }

        protected int MaxPage
        {
            get {
                int prodCount = FilterDisks().Count();
                return (int)Math.Ceiling((decimal)prodCount / pageSize);
            }
        }

        private int GetPageFromRequest()
        {
            int page;
            string reqValue = (string)RouteData.Values["page"] ??
                Request.QueryString["page"];
            return reqValue != null && int.TryParse(reqValue, out page) ? page : 1;
        }

        public IEnumerable<Disk> GetDisks()
        {
            return FilterDisks()
                .OrderBy(g => g.Id)
                .Skip((CurrentPage - 1) * pageSize)
                .Take(pageSize);
        }

        public IEnumerable<Disk> FilterDisks()
        {
            IEnumerable<Disk> disks = repository.Disks.Where(g=>g.Quantity>=1);
            string currentCategory = (string)RouteData.Values["category"] ??
                Request.QueryString["category"];
            return currentCategory == null ? disks :
                disks.Where(p => p.Category == currentCategory);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
           if (IsPostBack)
            {

                int selectedDiskId;
                if (int.TryParse(Request.Form["add"], out selectedDiskId))
                {
                    Disk selectedDisk = repository.Disks
                        .Where(g => g.Id == selectedDiskId).FirstOrDefault();

                    if (selectedDisk != null)
                    {
                        SessionHelper.GetCart(Session).AddItem(selectedDisk, 1);
                        SessionHelper.Set(Session, SessionKey.RETURN_URL,
                            Request.RawUrl);

                        Response.Redirect(RouteTable.Routes
                            .GetVirtualPath(null, "cart", null).VirtualPath);
                    }
                }


            }
        }
    }
}