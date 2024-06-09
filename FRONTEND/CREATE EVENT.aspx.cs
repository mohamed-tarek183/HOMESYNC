using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace HOMESYNC_1
{
    public partial class CREATE_EVENT : System.Web.UI.Page
    {
        private int eventId;
        private int userId;
        private string name;
        private string description;
        private string location;
        private DateTime reminderDate;
        private int otherUserId;

        protected void Page_Load(object sender, EventArgs e)
        {
            eventId = 0;
            userId = 0;
            name = "";
            description = "";
            location = "";
            reminderDate = DateTime.Now;
            otherUserId = 0;
        }

        protected void createEventButton_Click(object sender, EventArgs e)
        {
            // Retrieve values from the TextBox controls
            name = eventNameTextBox.Text;
            description = eventDescriptionTextBox.Text;
            location = eventLocationTextBox.Text;

            if (DateTime.TryParse(reminderDateTextBox.Text, out DateTime parsedDate))
            {
                reminderDate = parsedDate;
            }

            if (int.TryParse(otherUserIdTextBox.Text, out int parsedOtherUserId))
            {
                otherUserId = parsedOtherUserId;
            }

            // Your database logic to create the event
            CreateEventInDatabase();

            // Fetch and display events after creating the new event
            FetchAndDisplayEvents();
        }

        private void CreateEventInDatabase()
        {
            string connstr = WebConfigurationManager.ConnectionStrings["HOMESYNC_DB"].ToString();

            using (SqlConnection conn = new SqlConnection(connstr))
            {
                try
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("CreateEvent", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@event_id", eventId);
                        cmd.Parameters.AddWithValue("@user_id", userId);
                        cmd.Parameters.AddWithValue("@name", name);
                        cmd.Parameters.AddWithValue("@description", description);
                        cmd.Parameters.AddWithValue("@location", location);
                        cmd.Parameters.AddWithValue("@reminder_date", reminderDate);

                        if (otherUserId != 0)
                        {
                            cmd.Parameters.AddWithValue("@other_user_id", otherUserId);
                        }

                        cmd.ExecuteNonQuery();

                        Response.Write("Event created successfully!");
                    }
                }
                catch (SqlException ex)
                {
                    Response.Write("Error creating event: " + ex.Message);
                }
                catch (Exception ex)
                {
                    Response.Write("Error creating event: " + ex.Message);
                }
            }
        }

        private static List<Event> GetEventsFromDatabase()
        {
            List<Event> events = new List<Event>
            {
                new Event { Name = "Event 1", Description = "Description 1" },
                new Event { Name = "Event 2", Description = "Description 2" }
            };

            return events;
        }

        public class Event
        {
            public string Name { get; set; }
            public string Description { get; set; }
        }

        private void FetchAndDisplayEvents()
        {
            string updatedEvents = get_events();
            // Implement your logic to display events
        }

        private string get_events()
        {
            // Implement your logic to retrieve events from the database
            throw new NotImplementedException();
        }
    }
}
