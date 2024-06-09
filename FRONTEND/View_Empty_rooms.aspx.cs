using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HOMESYNC_1
{
    public partial class View_Empty_rooms : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            string connstr = WebConfigurationManager.ConnectionStrings
                ["HOMESYNC_DB"].ToString();
            SqlConnection conn = new SqlConnection(connstr);
            SqlCommand ViewEmptyRooms = new SqlCommand("ViewRoom", conn);
            ViewEmptyRooms.CommandType = CommandType.StoredProcedure;
            using (conn)
            {
                SqlDataAdapter sda = new SqlDataAdapter(ViewEmptyRooms);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                DataGrid1.DataSource = ds;
                DataGrid1.DataBind();
            }
        }
    }
}