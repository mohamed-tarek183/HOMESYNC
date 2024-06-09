using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace HOMESYNC_1
{
    public partial class ShowMessages : System.Web.UI.Page
    {
        protected void btnShowMessages_Click(object sender, EventArgs e)
        {
            string connstr = WebConfigurationManager.ConnectionStrings["HOMESYNC_DB"].ToString();
            SqlConnection conn = new SqlConnection(connstr);

            SqlCommand showMessagesProc = new SqlCommand("ShowMessages", conn);
            showMessagesProc.CommandType = CommandType.StoredProcedure;

            //SqlParameter sqlParameter = showMessagesProc.Parameters.Add(new SqlParameter("@user_id", /* Set user_id here */));
            showMessagesProc.Parameters.Add(new SqlParameter("@sender_id", txtSenderId.Text));

            conn.Open();

            SqlDataReader reader = showMessagesProc.ExecuteReader();
            if (reader.HasRows)
            {
                reader.Read();
                string content = reader["content"].ToString();

                // Check if the SenderID matches the user-entered ID
                if (reader["sender_id"].ToString() == txtSenderId.Text)
                {
                    lblContent.Text = content;
                    lblNoMessages.Visible = false;
                    lblContent.Visible = true;
                }
                else
                {
                    lblContent.Visible = false;
                    lblNoMessages.Visible = true;
                }
            }
            else
            {
                lblContent.Visible = false;
                lblNoMessages.Visible = true;
            }

            conn.Close();
        }
    }
}
