using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Reflection.Emit;

namespace HOMESYNC_1
{
    public partial class Room : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
          
            


            int start_date = 2023;
            int end_date = 2023;
               
                    for (int i = 1; i <= 94; i++)
                    {
                        start_year_dd.Items.Add(new ListItem(start_date.ToString(), start_date.ToString()));
                        start_date--;
                    }
                    for (int i = 1; i <= 31; i++)
                    {
                        start_day_dd.Items.Add(new ListItem(i.ToString("D2"), i.ToString("D2")));
                    }
                    for (int i = 1; i <= 94; i++)
                    {
                        end_year_dd.Items.Add(new ListItem(end_date.ToString(), end_date.ToString()));
                        end_date--;
                    }
            for (int i = 1; i <= 31; i++)
            {
                end_day_dd.Items.Add(new ListItem(i.ToString("D2"), i.ToString("D2")));
            }
            
                String user_type = (String)Session["user_type"];
                if (user_type.Equals("Guest"))
                {
                    card5.Visible = false;
                    card4.Visible = false;
                    card3.Visible = false;

                }
            
            viewMyRoom(sender, e);

        }
        protected void viewMyRoom(object sender, EventArgs e)
        {
            int id = (int)Session["user"];
            int room_id = 0;
            String room_status = "";
            String room_type = "";
            String room_floor = "";

            string connstr = WebConfigurationManager.ConnectionStrings
                ["HOMESYNC_DB"].ToString();
            SqlConnection conn = new SqlConnection(connstr);
            SqlCommand viewRoom = new SqlCommand("ViewUserRoom", conn);
            viewRoom.CommandType = CommandType.StoredProcedure;
            viewRoom.Parameters.Add(new SqlParameter("@user_id ", id));
            conn.Open();
            SqlDataReader rdr = viewRoom.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                room_id = rdr.GetInt32(rdr.GetOrdinal("room_id"));
                room_status = rdr.GetString(rdr.GetOrdinal("room_status"));
                room_type = rdr.GetString(rdr.GetOrdinal("room_type"));
                room_floor = rdr.GetString(rdr.GetOrdinal("room_floor"));
            }
            room_no_text.Text = "" + room_id;
            room_floor_text.Text = room_floor;
            room_status_text.Text = room_status;
            room_type_text.Text = room_type;

        }

        protected void ViewEmptyRooms(object sender, EventArgs e)
        {
            Response.Redirect("View_Empty_rooms.aspx");
        }

        protected void ChangeStatus(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(change_status_tb1.Text))
            {
                change_status_label.Text = "Please enter room number";
            }
            else if (string.IsNullOrEmpty(change_status_tb2.Text))
            {
                change_status_label.Text = "Please enter status";
            }
            else
            {
                string connstr1 = WebConfigurationManager.ConnectionStrings
                    ["HOMESYNC_DB"].ToString();
                SqlConnection conn1 = new SqlConnection(connstr1);
                int room_no = Int32.Parse(change_status_tb1.Text);



                SqlCommand proc1 = new SqlCommand("IsRoominDB", conn1);
                proc1.CommandType = CommandType.StoredProcedure;
                proc1.Parameters.Add(new SqlParameter("@room_id", room_no));
                SqlParameter success = proc1.Parameters.Add("@success", SqlDbType.Int);
                success.Direction = ParameterDirection.Output;


                conn1.Open();
                proc1.ExecuteNonQuery();
                conn1.Close();

                if (success.Value.ToString() == "-1")
                {
                    change_status_label.Text = "Room not available in database";
                }
                else
                {


                    string connstr = WebConfigurationManager.ConnectionStrings
                        ["HOMESYNC_DB"].ToString();
                    SqlConnection conn = new SqlConnection(connstr);
                    string status = change_status_tb2.Text;


                    SqlCommand proc = new SqlCommand("RoomAvailability", conn);
                    proc.CommandType = CommandType.StoredProcedure;
                    proc.Parameters.Add(new SqlParameter("@location", room_no));
                    proc.Parameters.Add(new SqlParameter("@status", status));


                    conn.Open();
                    proc.ExecuteNonQuery();
                    conn.Close();
                    change_status_label.Text = "Success";
                }
            }
        }

        protected void CreateSchedule(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(cs_room_no_text1.Text))
            {
                s_label.Text = "Please enter room number";

            }
            else if (string.IsNullOrEmpty(cs_room_no_text4.Text))
            {
                s_label.Text = "Please enter action";
            }
            else
            {

                string connstr1 = WebConfigurationManager.ConnectionStrings
                    ["HOMESYNC_DB"].ToString();
                SqlConnection conn1 = new SqlConnection(connstr1);
                int room_no = Int32.Parse(cs_room_no_text1.Text);



                SqlCommand proc1 = new SqlCommand("IsRoominDB", conn1);
                proc1.CommandType = CommandType.StoredProcedure;
                proc1.Parameters.Add(new SqlParameter("@room_id", room_no));
                SqlParameter success = proc1.Parameters.Add("@success", SqlDbType.Int);
                success.Direction = ParameterDirection.Output;


                conn1.Open();
                proc1.ExecuteNonQuery();
                conn1.Close();

                if (success.Value.ToString() == "-1")
                {
                    s_label.Text = "Room not available in database";
                 
                
                }
                else
                {








                    int id = (int)Session["user"];
                    string connstr = WebConfigurationManager.ConnectionStrings
                        ["HOMESYNC_DB"].ToString();
                    SqlConnection conn = new SqlConnection(connstr);
                  
                    String action = cs_room_no_text4.Text;
                    int start_month_num = 0;
                    int end_month_num = 0;

                    int start_day_num = Int32.Parse(start_day_dd.Text);
                    int end_day_num = Int32.Parse(end_day_dd.Text);

                    int start_year_num = Int32.Parse(start_year_dd.Text);
                    int end_year_num = Int32.Parse(end_year_dd.Text);
                    switch (start_Month_dd.Text)
                    {
                        case "January":
                            start_month_num = 01; break;
                        case "February":
                            start_month_num = 02; break;
                        case "March":
                            start_month_num = 03; break;
                        case "April":
                            start_month_num = 04; break;
                        case "May":
                            start_month_num = 05; break;
                        case "June":
                            start_month_num = 06; break;
                        case "July":
                            start_month_num = 07; break;
                        case "August":
                            start_month_num = 08; break;
                        case "September":
                            start_month_num = 09; break;
                        case "October":
                            start_month_num = 10; break;
                        case "November":
                            start_month_num = 11; break;
                        case "December":
                            start_month_num = 12; break;


                    }
                    switch (end_month_dd.Text)
                    {
                        case "January":
                            end_month_num = 01; break;
                        case "February":
                            end_month_num = 02; break;
                        case "March":
                            end_month_num = 03; break;
                        case "April":
                            end_month_num = 04; break;
                        case "May":
                            end_month_num = 05; break;
                        case "June":
                            end_month_num = 06; break;
                        case "July":
                            end_month_num = 07; break;
                        case "August":
                            end_month_num = 08; break;
                        case "September":
                            end_month_num = 09; break;
                        case "October":
                            end_month_num = 10; break;
                        case "November":
                            end_month_num = 11; break;
                        case "December":
                            end_month_num = 12; break;


                    }

                    if (end_year_num < start_year_num || (end_year_num == start_year_num && start_month_num > end_month_num) || (end_year_num == start_year_num && start_month_num == end_month_num && start_day_num > end_day_num))
                    {
                        s_label.Text = "Incorrect date format";
                    }
                    else
                    {



                        String start_date = start_year_num + "-" + start_month_num + "-" + start_day_num;
                        String end_date = end_year_num + "-" + end_month_num + "-" + end_day_num;



                        SqlCommand proc = new SqlCommand("CreateSchedule", conn);
                        proc.CommandType = CommandType.StoredProcedure;
                        proc.Parameters.Add(new SqlParameter("@creator_id", id));
                        proc.Parameters.Add(new SqlParameter("@room_id", room_no));
                        proc.Parameters.Add(new SqlParameter("@start_time", start_date));
                        proc.Parameters.Add(new SqlParameter("@end_time", end_date));
                        proc.Parameters.Add(new SqlParameter("@action", action));
                        conn.Open();
                        proc.ExecuteNonQuery();
                        conn.Close();
                        s_label.Text = "Success";
                    }
                }

            }
        }

        protected void BookRoom(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(book_room_tb.Text))
            {
                bookRoom_bl.Text = "Please Enter Room Number";
            }
            else
            {


                string connstr1 = WebConfigurationManager.ConnectionStrings
                       ["HOMESYNC_DB"].ToString();
                SqlConnection conn1 = new SqlConnection(connstr1);
                int room_no = Int32.Parse(book_room_tb.Text);



                SqlCommand proc1 = new SqlCommand("IsRoominDB", conn1);
                proc1.CommandType = CommandType.StoredProcedure;
                proc1.Parameters.Add(new SqlParameter("@room_id", room_no));
                SqlParameter success = proc1.Parameters.Add("@success", SqlDbType.Int);
                success.Direction = ParameterDirection.Output;


                conn1.Open();
                proc1.ExecuteNonQuery();
                conn1.Close();

                if (success.Value.ToString() == "-1")
                {
                    bookRoom_bl.Text = "Room not available in database";


                }
                else
                {
                    int id = (int)Session["user"];
                    string connstr2 = WebConfigurationManager.ConnectionStrings
                       ["HOMESYNC_DB"].ToString();
                    SqlConnection conn2 = new SqlConnection(connstr2);
                    SqlCommand proc2 = new SqlCommand("AssignRoom", conn2);
                    proc2.CommandType = CommandType.StoredProcedure;
                    proc2.Parameters.Add(new SqlParameter("@user_id", id));
                    proc2.Parameters.Add(new SqlParameter("@room_id", room_no));
                    

                    conn2.Open();
                    proc2.ExecuteNonQuery();
                    conn2.Close();

                    bookRoom_bl.Text = "Success";

                }
            }
        }
    }
}