using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HOMESYNC_1
{
    public partial class AssignUserToEvent : System.Web.UI.Page
    {
        private int userId;
        private int eventId;

        protected void Page_Load(object sender, EventArgs e)
        {
            userId = 0;
            eventId = 0;
        }

        protected void AssignUserToEvent_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HOMESYNC_1"].ToString();

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                try
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("AssignUser", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Assuming userIdTextBox and eventIdTextBox are HtmlInputText controls in your ASP.NET page
                        userId = int.Parse(userIdTextBox.Value);
                        eventId = int.Parse(eventIdTextBox.Value);

                        cmd.Parameters.AddWithValue("@user_id", userId);
                        cmd.Parameters.AddWithValue("@event_id", eventId);

                        cmd.ExecuteNonQuery();

                        // Optionally, you can display a success message or redirect to another page
                        Response.Write("User assigned to event successfully!");
                    }
                }
                catch (SqlException ex)
                {
                    // Handle SQL exceptions
                    Response.Write("Error assigning user to event: " + ex.Message);
                }
                catch (Exception ex)
                {
                    // Handle other exceptions
                    Response.Write("Error assigning user to event: " + ex.Message);
                }
            }
        }
    }
}
