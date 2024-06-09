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
        public partial class View_Charge : System.Web.UI.Page
        {
            protected void Page_Load(object sender, EventArgs e)
            {
          
            }
            protected void view_click(object sender, EventArgs e)
            {
                if (!string.IsNullOrEmpty(txtDeviceID.Text))
                {
                    int deviceId;
                    if (int.TryParse(txtDeviceID.Text, out deviceId))
                    {
                        ViewMyDeviceCharge(deviceId);
                    }
                    else
                    {
                        lblDeviceCharge.Text = "Invalid Device ID";
                        lblDeviceLocation.Text = "";
                    }
                }
                else
                {
                    lblDeviceCharge.Text = "Please enter a Device ID";
                    lblDeviceLocation.Text = "";
                }
            }

            protected void ViewMyDeviceCharge(int device_id)
            {
                string connstr = WebConfigurationManager.ConnectionStrings["HOMESYNC_DB"].ToString();

                using (SqlConnection conn = new SqlConnection(connstr))
                {
                    SqlCommand cmd = new SqlCommand("ViewMyDeviceCharge", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@device_id", device_id));

                    SqlParameter charge = new SqlParameter("@charge", SqlDbType.Int);
                    SqlParameter location = new SqlParameter("@location", SqlDbType.Int);
                    charge.Direction = ParameterDirection.Output;
                    location.Direction = ParameterDirection.Output;

                    cmd.Parameters.Add(charge);
                    cmd.Parameters.Add(location);

                    conn.Open();
                    cmd.ExecuteNonQuery();


                    if (charge.Value != DBNull.Value)
                    {
                        lblDeviceCharge.Text = "Charge Value: " + charge.Value.ToString();
                    }
                    else
                    {
                        lblDeviceCharge.Text = "No Charge Value Retrieved.";
                    }

                    if (location.Value != DBNull.Value)
                    {
                        lblDeviceLocation.Text = "Location Value: " + location.Value.ToString();
                    }
                    else
                    {
                        lblDeviceLocation.Text = "No Location Value Retrieved.";
                    }
                }
            }

        }
    }