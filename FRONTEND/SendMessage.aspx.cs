using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HOMESYNC_1
{
    public partial class SendMessage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSendMessage_Click(object sender, EventArgs e)
            {
                string connstr = WebConfigurationManager.ConnectionStrings["HOMESYNC_DB"].ToString();

                using (SqlConnection conn = new SqlConnection(connstr))
                {
                    using (SqlCommand sendMessageProc = new SqlCommand("SendMessage", conn))
                    {
                        sendMessageProc.CommandType = CommandType.StoredProcedure;

                        sendMessageProc.Parameters.Add(new SqlParameter("@sender_id", int.Parse(txtSenderId.Text)));
                        sendMessageProc.Parameters.Add(new SqlParameter("@receiver_id", int.Parse(txtReceiverId.Text)));
                        sendMessageProc.Parameters.Add(new SqlParameter("@title", txtTitle.Text));
                        sendMessageProc.Parameters.Add(new SqlParameter("@content", txtContent.Text));
                        sendMessageProc.Parameters.Add(new SqlParameter("@timesent", TimeSpan.Parse(txtTimeSent.Text)));
                        sendMessageProc.Parameters.Add(new SqlParameter("@timereceived", TimeSpan.Parse(txtTimeReceived.Text)));

                        conn.Open();
                        sendMessageProc.ExecuteNonQuery();
                    }
                }
            }
        }
    }
