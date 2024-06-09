using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.Services;

namespace HOMESYNC_1
{
    public partial class Uninvite : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        [WebMethod]
        public static string UninvitedUser(int eventId, int userId)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HOMESYNC_1"].ToString();

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                try
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("Uninvited", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@event_id", eventId);
                        cmd.Parameters.AddWithValue("@user_id", userId);

                        cmd.ExecuteNonQuery();

                        return "User uninvited from event successfully!";
                    }
                }
                catch (SqlException ex)
                {
                    // Handle SQL exceptions
                    return "Error uninviting user from event: " + ex.Message;
                }
                catch (Exception ex)
                {
                    // Handle other exceptions
                    return "Error uninviting user from event: " + ex.Message;
                }
            }
        }
    }
}
