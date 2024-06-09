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
    public partial class RegisterGuest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }
        protected void Register(object sender, EventArgs e)
        {

            if ((string.IsNullOrEmpty(inputEmail.Text)))
            {
                bottom_label.Text = "please enter your email";
            }
            else if (string.IsNullOrEmpty(inputPassword.Text))
            {
                bottom_label.Text = "please enter your password";
            }
            else if (string.IsNullOrEmpty(f_name.Text))
            {
                bottom_label.Text = "please enter your first name";
            }
            else if (string.IsNullOrEmpty(address.Text))
            {
                bottom_label.Text = "please enter your address";
            }
            else if (string.IsNullOrEmpty(room.Text))
            {
                bottom_label.Text = "please enter your room number";
            }

            else
            if (string.IsNullOrEmpty(f_name.Text))
            {
                bottom_label.Text = "please enter your first name";
            }
            else
            {
                string connstr = WebConfigurationManager.ConnectionStrings["HOMESYNC_DB"].ToString();
                SqlConnection conn = new SqlConnection(connstr);
                String email = inputEmail.Text;
                String password = inputPassword.Text;
                String first_name = f_name.Text;
                String add = address.Text;
                int guest_of = (int)Session["user"];
                int room_no = Int32.Parse(room.Text);
                SqlCommand addGuest = new SqlCommand("AddGuest", conn);
                addGuest.CommandType = CommandType.StoredProcedure;
                addGuest.Parameters.Add(new SqlParameter("@email", email));
                addGuest.Parameters.Add(new SqlParameter("@password", password));
                addGuest.Parameters.Add(new SqlParameter("@first_name", first_name));
                addGuest.Parameters.Add(new SqlParameter("@address", add));
                addGuest.Parameters.Add(new SqlParameter("@room_id", room_no));
                addGuest.Parameters.Add(new SqlParameter("@guest_of", guest_of));
                conn.Open();
                addGuest.ExecuteNonQuery();
                conn.Close();

                Response.Redirect("profile.aspx");
            }
        }
    }
}
