using System;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace HOMESYNC_1
{
    public partial class FinanceAndCommunication : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int userId = GetUserId(); // Implement logic to get user ID

            if (!IsPostBack)
            {
                if (GetUserType(userId) == "Admin")
                {
                    btnDeleteLastMessage.Visible = true;
                }
                else
                {
                    btnDeleteLastMessage.Visible = false;
                }
            }
        }

        private int GetUserId()
        {

            return 1;
        }

        private string GetUserType(int userId)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HOMESYNC_DB"].ToString();

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("SELECT user_type FROM USERS WHERE id = @userId", conn))
                {
                    cmd.Parameters.Add(new SqlParameter("@userId", userId));
                    string userType = cmd.ExecuteScalar() as string;

                    return userType ?? "Guest";
                }
            }
        }

        protected void btnDeleteLastMessage_Click(object sender, EventArgs e)
        {
            int loggedInUserID = GetUserId();

            DeleteLastMessage(loggedInUserID);
        }

        private void DeleteLastMessage(int userID)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HOMESYNC_DB"].ToString();

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("DELETE FROM Communication WHERE receiver_id = @userID ORDER BY time_sent DESC OFFSET 0 ROWS FETCH NEXT 1 ROW ONLY", conn))
                {
                    cmd.Parameters.Add(new SqlParameter("@userID", userID));
                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}