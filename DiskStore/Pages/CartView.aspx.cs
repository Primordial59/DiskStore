using System;
using System.Collections.Generic;
using System.Linq;
using DiskStore.Models;
using DiskStore.Models.Repository;
using DiskStore.Pages.Helpers;
using System.Web.Routing;

namespace DiskStore.Pages
    {
        public partial class CartView : System.Web.UI.Page
        {
            protected void Page_Load(object sender, EventArgs e)
            {
            if (IsPostBack)
            {
                Repository repository = new Repository();
                int diskId;
                if (int.TryParse(Request.Form["remove"], out diskId))
                {
                    Disk diskToRemove = repository.Disks
                        .Where(g => g.Id == diskId).FirstOrDefault();
                    if (diskToRemove != null)
                    {
                        SessionHelper.GetCart(Session).RemoveLine(diskToRemove);
                    }
                }
            }


        }

        public IEnumerable<CartLine> GetCartLines()
            {
                return SessionHelper.GetCart(Session).Lines;
            }

            public decimal CartTotal
            {
                get
                {
                    return SessionHelper.GetCart(Session).ComputeTotalValue();
                }
            }

            public string ReturnUrl
            {
                get
                {
                    return SessionHelper.Get<string>(Session, SessionKey.RETURN_URL);
                }
            }

              public string CheckoutUrl
             {
                 get
                {
                     return RouteTable.Routes.GetVirtualPath(null, "checkout",
                          null).VirtualPath;
                  }
               }


    }
}
