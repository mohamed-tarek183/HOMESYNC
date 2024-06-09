using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HOMESYNC_1
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Devices_b(object sender, EventArgs e)
        {

            String userType = (String)Session["user_type"];
            if (userType.Equals("Admin"))
                Response.Redirect("Devices.aspx");
            else
                Response.Redirect("DevicesGuest.aspx");
        }

        protected void Tasks_b(object sender, EventArgs e)
        {

            String userType = (String)Session["user_type"];
            Response.Redirect("Tasks.aspx");
        }
    }
}