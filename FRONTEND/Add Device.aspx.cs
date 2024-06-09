using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;

namespace HOMESYNC_1
{
    public partial class Add_Device : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void AddDevice_Click(object sender, EventArgs e)
        {
            string connstr = WebConfigurationManager.ConnectionStrings["HOMESYNC_DB"].ToString();
            int deviceId = Convert.ToInt32(txtDeviceID.Text);
            string status = txtStatus.Text;
            int battery;
            int.TryParse(txtBattery.Text, out battery);

            string location = txtLocation.Text;
            string type = txtType.Text;


            if (battery < 0 || battery > 100)
            {
                ErrorMessage.Text = "Battery value must be between 0 and 100.";
                ShowErrorPanel();
                return;
            }

            if (string.IsNullOrEmpty(status))
            {
                ErrorMessage.Text = "Status cannot be empty.";
                ShowErrorPanel();
                return;
            }
            else if (status.Length > 20)
            {
                ErrorMessage.Text = "Status must be maximum 20 characters.";
                ShowErrorPanel();
                return;
            }

            int locationValue;
            bool isLocationValid = int.TryParse(location, out locationValue);

            if (!isLocationValid)
            {
                ErrorMessage.Text = "Location must be an integer.";
                ShowErrorPanel();
                return;
            }

            if (string.IsNullOrEmpty(type))
            {
                ErrorMessage.Text = "Type cannot be empty.";
                ShowErrorPanel();
                return;
            }
            else if (type.Length > 20)
            {
                ErrorMessage.Text = "Type must be maximum 20 characters.";
                ShowErrorPanel();
                return;
            }

            using (SqlConnection conn = new SqlConnection(connstr))
            {
                conn.Open();


                using (SqlCommand checkCmd = new SqlCommand("SELECT COUNT(*) FROM Device WHERE device_id = @device_id", conn))
                {
                    checkCmd.Parameters.AddWithValue("@device_id", deviceId);
                    int existingDeviceCount = (int)checkCmd.ExecuteScalar();


                    using (SqlCommand check = new SqlCommand("SELECT COUNT(*) FROM Room WHERE room_id = @location", conn))
                    {
                        check.Parameters.AddWithValue("@location", locationValue);
                        int rooms = (int)check.ExecuteScalar();

                        if (rooms <= 0)
                        {
                            ErrorMessage.Text = "Room does not exist in the database. Please add the room first.";
                            ShowErrorPanel();
                        }
                        else if (existingDeviceCount > 0)
                        {
                            ErrorMessage.Text = "Device ID already exists in the database. Please use a different ID.";
                            ShowErrorPanel();
                        }
                        else
                        {

                            using (SqlCommand cmd = new SqlCommand("AddDevice", conn))
                            {
                                cmd.CommandType = CommandType.StoredProcedure;
                                cmd.Parameters.AddWithValue("@device_id", deviceId);
                                cmd.Parameters.AddWithValue("@status", status);
                                cmd.Parameters.AddWithValue("@battery", battery);
                                cmd.Parameters.AddWithValue("@location", locationValue);
                                cmd.Parameters.AddWithValue("@type", type);

                                int rowsAffected = cmd.ExecuteNonQuery();

                                if (rowsAffected > 0)
                                {
                                    Response.Redirect("Devices.aspx");
                                }
                                else
                                {
                                    ErrorMessage.Text = "Failed to add the device. Please try again.";
                                    ShowErrorPanel();
                                }
                            }
                        }
                    }
                }
            }
        }

        protected void Retry_Click(object sender, EventArgs e)
        {
            HideErrorPanel();
        }

        private void ShowErrorPanel()
        {
            ErrorMessage.Visible = true;
            RetryButton.Visible = true;
            Add.Visible = false;
        }

        private void HideErrorPanel()
        {
            ErrorMessage.Visible = false;
            RetryButton.Visible = false;
            Add.Visible = true;
        }
    }
}
