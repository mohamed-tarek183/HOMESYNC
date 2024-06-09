using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI.WebControls;

namespace HOMESYNC_1
{
    public partial class CreatePayment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connstr = WebConfigurationManager.ConnectionStrings
     ["HOMESYNC_DB"].ToString();
            SqlConnection conn = new SqlConnection(connstr);
            SqlCommand planpaymentproc = new SqlCommand("PlanPayment", conn);
            planpaymentproc.CommandType = CommandType.StoredProcedure;
        }

        protected void btnCreatePayment_Click(object sender, EventArgs e)
        {
            try
            {
                string connstr = WebConfigurationManager.ConnectionStrings["HOMESYNC_DB"].ToString();

                using (SqlConnection conn = new SqlConnection(connstr))
                {
                    using (SqlCommand planpaymentproc = new SqlCommand("PlanPayment", conn))
                    {
                        planpaymentproc.CommandType = CommandType.StoredProcedure;

                        planpaymentproc.Parameters.Add(new SqlParameter("@sender_id", txtSenderId.Text));
                        planpaymentproc.Parameters.Add(new SqlParameter("@reciever_id", txtReceiverId.Text));
                        planpaymentproc.Parameters.Add(new SqlParameter("@type", txtType.Text));
                        planpaymentproc.Parameters.Add(new SqlParameter("@amount", decimal.Parse(txtAmount.Text)));
                        planpaymentproc.Parameters.Add(new SqlParameter("@status", txtStatus.Text));
                        planpaymentproc.Parameters.Add(new SqlParameter("@deadline", DateTime.Parse(txtDeadline.Text)));

                        conn.Open();
                        planpaymentproc.ExecuteNonQuery();
                        conn.Close();

                        lblSuccess.Visible = true;
                        lblSuccess.Text = "Payment created successfully!";
                    }
                }
            }
            catch (Exception ex)
            {
                lblSuccess.Visible = true;
                lblSuccess.ForeColor = System.Drawing.Color.Red;
                lblSuccess.Text = "Error: " + ex.Message;
            }
        }
    }
}
