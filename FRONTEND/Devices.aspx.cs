using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HOMESYNC_1
{
    public partial class Devices : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
    protected void Button1_Click(object sender, EventArgs e)
        {
          
            Response.Redirect("View Charge.aspx");
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
         
            Response.Redirect("Add Device.aspx");
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("Location.aspx");
        }
        protected void Charging()
        {
            string connstr = WebConfigurationManager.ConnectionStrings["HOMESYNC_DB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connstr))
            {
                using (SqlCommand cmd = new SqlCommand("Charging", conn))
                {

                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                 
                    conn.Open();
                    int rows=cmd.ExecuteNonQuery();

                    if (rows > 0)
                    {
                        Response.Write("<script>alert('Charging')</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Not Charging')</script>");
                    }
                    conn.Close();
                }
            }

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Charging();
        }
        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("Location of 2 or more.aspx");
        }

    }
}