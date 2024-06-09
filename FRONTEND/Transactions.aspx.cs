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
    public partial class Transactions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connstr = WebConfigurationManager.ConnectionStrings
                 ["HOMESYNC_DB"].ToString();
            SqlConnection conn = new SqlConnection(connstr);
            SqlCommand recieveproc = new SqlCommand("ReceiveMoney", conn);
            recieveproc.CommandType = CommandType.StoredProcedure;

        }

        protected void recievetransaction(object sender, EventArgs e)
        {
            string connstr = WebConfigurationManager.ConnectionStrings
                ["HOMESYNC_DB"].ToString();
            SqlConnection conn = new SqlConnection(connstr);

            SqlCommand recieveproc = new SqlCommand("ReceiveMoney", conn);
            recieveproc.Parameters.Add(new SqlParameter("@reciever_id", receiverId));
            recieveproc.Parameters.Add(new SqlParameter("@type", type));
            recieveproc.Parameters.Add(new SqlParameter("@amount", amount));
            recieveproc.Parameters.Add(new SqlParameter("@status ", status));
            recieveproc.Parameters.Add(new SqlParameter("@date ", date));

                conn.Open();
                recieveproc.ExecuteNonQuery();
                                conn.Close();
            
        }
    }
}