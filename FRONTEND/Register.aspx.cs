using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HOMESYNC_1
{
    public partial class RegisterPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int start_date = 2023;
            if (!IsPostBack)
            {
                for (int i = 1; i <= 94; i++)
                {
                    year.Items.Add(new ListItem(start_date.ToString(), start_date.ToString()));
                    start_date--;
                }
                for (int i = 1; i <= 31; i++)
                {
                    day.Items.Add(new ListItem(i.ToString("D2"), i.ToString("D2")));
                }


            }
        }

        protected void Register(object sender, EventArgs e)
        {
            string connstr = WebConfigurationManager.ConnectionStrings
                ["HOMESYNC_DB"].ToString();
            SqlConnection conn = new SqlConnection(connstr);
            String email = inputEmail.Text;
            String password = inputPassword.Text;
            String first_name = f_name.Text;
            String last_name = l_name.Text;



            int day_num = Int16.Parse(day.Text);
            int year_num = Int16.Parse(year.Text);
            int month_num = 0;
            switch (Month.Text)
            {
                case "January":
                    month_num = 01; break;
                case "February":
                    month_num = 02; break;
                case "March":
                    month_num = 03; break;
                case "April":
                    month_num = 04; break;
                case "May":
                    month_num = 05; break;
                case "June":
                    month_num = 06; break;
                case "July":
                    month_num = 07; break;
                case "August":
                    month_num = 08; break;
                case "September":
                    month_num = 09; break;
                case "October":
                    month_num = 10; break;
                case "November":
                    month_num = 11; break;
                case "December":
                    month_num = 12; break;


            }

            String birthdate = year_num + "-" + month_num + "-" + day_num;
            DateTime bd = DateTime.Parse(birthdate);


            SqlCommand UserRegister = new SqlCommand("UserRegister", conn);
            UserRegister.CommandType = CommandType.StoredProcedure;
            UserRegister.Parameters.Add(new SqlParameter("@usertype", "Admin"));
            UserRegister.Parameters.Add(new SqlParameter("@email", email));
            UserRegister.Parameters.Add(new SqlParameter("@first_name", first_name));
            UserRegister.Parameters.Add(new SqlParameter("@last_name", last_name));
            UserRegister.Parameters.Add(new SqlParameter("@birth_date", birthdate));
            UserRegister.Parameters.Add(new SqlParameter("@password", password));
            SqlParameter uid = UserRegister.Parameters.Add("@userid", SqlDbType.Int);
            uid.Direction = ParameterDirection.Output;
            conn.Open();
            UserRegister.ExecuteNonQuery();
            conn.Close();
            int id = Int16.Parse(uid.Value.ToString());
            Session["user"] =id ;
            if ((string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(first_name) || string.IsNullOrEmpty(last_name) || string.IsNullOrEmpty(birthdate)) && id == -1)
            {
                bottom_label.Text = "Error registering user. please enter your email";
            }

            else if (id == -1)
            {
                bottom_label.Text = "Error registering user. Email is already registered.";
            }
            else if (id > 0)
            {
                bottom_label.Text = "User registered successfully.";
                Response.Redirect("Home.aspx");
            }



        }
    }
}