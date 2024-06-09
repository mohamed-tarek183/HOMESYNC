using System;
using System.Data.SqlClient;

namespace HOMESYNC_1
{
    public partial class view_event : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ViewEvent(object sender, EventArgs e)
        {
            if (int.TryParse(userIdTextBox.Text, out int userId) && int.TryParse(eventIdTextBox.Text, out int eventId))
            {
                DisplayResults(CallViewEventProcedure(userId, eventId));
            }
            else
            {
                resultContainer.InnerHtml = "Invalid user ID or event ID.";
            }
        }

        protected void RemoveEvent(object sender, EventArgs e)
        {
            if (int.TryParse(eventIdTextBox.Text, out int eventId))
            {
                if (CallRemoveEventProcedure(eventId))
                {
                    resultContainer.InnerHtml = "Event removed successfully.";
                }
                else
                {
                    resultContainer.InnerHtml = "Failed to remove the event.";
                }
            }
            else
            {
                resultContainer.InnerHtml = "Invalid event ID.";
            }
        }

        protected void ViewUserId(object sender, EventArgs e)
        {
            // Retrieve and display the User ID
            int userId = int.Parse(userIdTextBox.Text);
            resultContainer.InnerHtml = $"User ID: {userId}";
        }

        protected void ViewEventId(object sender, EventArgs e)
        {
            // Retrieve and display the Event ID
            int eventId = int.Parse(eventIdTextBox.Text);
            resultContainer.InnerHtml = $"Event ID: {eventId}";
        }

        private string CallViewEventProcedure(int userId, int eventId)
        {
            string connectionString = "YourConnectionString";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand("ViewEvent", connection))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("@User_id", userId);
                    command.Parameters.AddWithValue("@Event_id", eventId);

                    SqlDataReader reader = command.ExecuteReader();

                    string result = "";
                    while (reader.Read())
                    {
                        result += $"Event ID: {reader["event_id"]}, Event Name: {reader["event_name"]}, ...\n";
                    }

                    return result;
                }
            }
        }

        private bool CallRemoveEventProcedure(int eventId)
        {
            string connectionString = "YourConnectionString";

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    using (SqlCommand command = new SqlCommand("RemoveEvent", connection))
                    {
                        command.CommandType = System.Data.CommandType.StoredProcedure;

                        command.Parameters.AddWithValue("@event_id", eventId);
                        command.Parameters.AddWithValue("@user_id", int.Parse(userIdTextBox.Text));

                        int rowsAffected = command.ExecuteNonQuery();

                        return rowsAffected > 0;
                    }
                }
            }
            catch (Exception)
            {
                return false;
            }
        }

        private void DisplayResults(string result)
        {
            resultContainer.InnerHtml = result;
        }
    }
}
