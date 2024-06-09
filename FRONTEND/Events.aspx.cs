using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HOMESYNC
{
    public partial class Events : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void RedirectToAssignUser(object sender, EventArgs e)
        {
            Response.Redirect("AssignUser.aspx");
        }

        protected void RedirectToCreateEvent(object sender, EventArgs e)
        {
            Response.Redirect("CREATE EVENT.aspx");
        }

        protected void RedirectToUninvite(object sender, EventArgs e)
        {
            Response.Redirect("Uninvite.aspx");
        }

        protected void RedirectToViewEvent(object sender, EventArgs e)
        {
            Response.Redirect("view event.aspx");
        }
    }
}