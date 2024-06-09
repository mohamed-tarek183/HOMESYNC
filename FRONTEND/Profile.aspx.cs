using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace HOMESYNC_1
{
    public partial class Profile_page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            int id = (int)Session["user"];

            viewMyProfile(sender, e, id);
            viewMyGuests(sender,e,id);





        }

        protected void viewMyProfile(object sender, EventArgs e, int id)
        {
           
            String user_type = (String)Session["user_type"];
            DateTime birthdate = DateTime.Now;
            DateTime ArrivalDate = DateTime.Now;



            string connstr = WebConfigurationManager.ConnectionStrings
                ["HOMESYNC_DB"].ToString();
            SqlConnection conn = new SqlConnection(connstr);
            SqlCommand viewProfile = new SqlCommand("ViewProfile", conn);
            viewProfile.CommandType = CommandType.StoredProcedure;
            viewProfile.Parameters.Add(new SqlParameter("@user_id ", id));
            conn.Open();
            SqlDataReader rdr = viewProfile.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                if (user_type.Equals("Admin"))
                {
                    name.Text= rdr.GetString(rdr.GetOrdinal("f_name"))+" "+ rdr.GetString(rdr.GetOrdinal("l_name"));
                    password_text.Text = rdr.GetString(rdr.GetOrdinal("user_password"));
                    email_text.Text = rdr.GetString(rdr.GetOrdinal("email"));
                    birthdate = rdr.GetDateTime(rdr.GetOrdinal("birthdate"));
                    String birthate_string = birthdate.ToString("yyyy-MM-dd");
                    birthdate_text.Text = birthate_string;
                    age_text.Text = "" +rdr.GetInt32(rdr.GetOrdinal("age"));
                    if (rdr.IsDBNull(rdr.GetOrdinal("preference")))
                    {
                        prefDiv.Visible = false;
                    }
                    else
                    {
                        Preference_text.Text = rdr.GetString(rdr.GetOrdinal("preference"));
                    }


                    if (rdr.IsDBNull(rdr.GetOrdinal("room")))
                    {
                        roomDiv.Visible = false;

                    }
                    else
                    {
                        room_text.Text=""+ rdr.GetInt32(rdr.GetOrdinal("room"));

                    }
                }
                else if(user_type.Equals("Guest"))
                {   
                    prefDiv.Visible = false;
                    ageDiv.Visible = false;
                    birthdateDiv.Visible = false;
                    deleteDiv.Visible = false;
                    no_div.Visible = false;


                    addDiv.Visible = true;
                    guestOfDiv.Visible = true;
                    arrivalDiv.Visible = true;

                    name.Text = rdr.GetString(rdr.GetOrdinal("f_name"));
                    password_text.Text = rdr.GetString(rdr.GetOrdinal("user_password"));
                    email_text.Text = rdr.GetString(rdr.GetOrdinal("email"));
                    room_text.Text = ""+ rdr.GetInt32(rdr.GetOrdinal("room"));
                    Adress_text.Text= rdr.GetString(rdr.GetOrdinal("guest_address"));
                    guest_of_text.Text="" + rdr.GetInt32(rdr.GetOrdinal("guest_of"));
                    ArrivalDate= rdr.GetDateTime(rdr.GetOrdinal("arrival_date"));
                    String arrival_string = ArrivalDate.ToString("yyyy-MM-dd");
                    arrival_text.Text = arrival_string;


                }



            }
            int ID= (int)Session["user"]; ;

            id_text.Text = "" + ID;
            user_type_text.Text = user_type;
           
           



        }

        protected void viewMyGuests(object sender, EventArgs e, int id)
        {
            int no_guests = 0;
            string connstr = WebConfigurationManager.ConnectionStrings
               ["HOMESYNC_DB"].ToString();
            SqlConnection conn = new SqlConnection(connstr);
            SqlCommand GuestNumber = new SqlCommand("GuestNumber", conn);
            GuestNumber.CommandType = CommandType.StoredProcedure;
            GuestNumber.Parameters.Add(new SqlParameter("@admin_id ", id));
            conn.Open();
            SqlDataReader rdr = GuestNumber.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                no_guests = rdr.GetInt32(0);

            }
            no_guests_text.Text = "" + no_guests;

        }
        protected void setNoGuests(object sender, EventArgs e)
        {
            int id = (int)Session["user"];

            if (string.IsNullOrEmpty(no_guests_tb.Text))
            {
                return;
            }
            else
            {

                int n = Int16.Parse(no_guests_tb.Text);
                string connstr = WebConfigurationManager.ConnectionStrings
                    ["HOMESYNC_DB"].ToString();
                SqlConnection conn = new SqlConnection(connstr);
                SqlCommand GuestsAllowed = new SqlCommand("GuestsAllowed", conn);
                GuestsAllowed.CommandType = CommandType.StoredProcedure;
                GuestsAllowed.Parameters.Add(new SqlParameter("@admin_id ", id));
                GuestsAllowed.Parameters.Add(new SqlParameter("@number_of_guests ", n));

                using (conn)
                {
                    using (GuestsAllowed)
                    {
                        conn.Open();
                        GuestsAllowed.ExecuteNonQuery();


                    }

                }

                viewMyGuests(sender, e, id);
            }

        }
        protected void delete_guest(object sender, EventArgs e)
        {
            int guest_id = Int32.Parse(delete_guest_tb.Text);
            int admin_id = (int)Session["user"];
            string connstr = WebConfigurationManager.ConnectionStrings
                ["HOMESYNC_DB"].ToString();
            SqlConnection conn1 = new SqlConnection(connstr);
            SqlCommand checkGuest = new SqlCommand("checkGuest", conn1);
            checkGuest.CommandType = CommandType.StoredProcedure;
            checkGuest.Parameters.Add(new SqlParameter("@guest_id", guest_id));
            checkGuest.Parameters.Add(new SqlParameter("@admin_id", admin_id));
            
            SqlParameter success = checkGuest.Parameters.Add("@success", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;
            conn1.Open();
            checkGuest.ExecuteNonQuery();
            conn1.Close();

            if(success.Value.ToString() == "-1")
            {
                delete_guest_error_label.Text = "This user is not a guest of this admin";
            }
            else
            {
                string connstr2 = WebConfigurationManager.ConnectionStrings
               ["HOMESYNC_DB"].ToString();
                SqlConnection conn2 = new SqlConnection(connstr2);
                SqlCommand GuestRemove = new SqlCommand("GuestRemove", conn2);
                GuestRemove.CommandType = CommandType.StoredProcedure;
                GuestRemove.Parameters.Add(new SqlParameter("@guest_id", guest_id));
                GuestRemove.Parameters.Add(new SqlParameter("@admin_id", admin_id));
                SqlParameter no = GuestRemove.Parameters.Add("@number_of_allowed_guests", SqlDbType.Int);
                no.Direction = ParameterDirection.Output;
                conn2.Open();
                GuestRemove.ExecuteNonQuery();
                conn2.Close();
                delete_guest_error_label.Text = "Success";
            }

        }


    }
}
        
    
        




    