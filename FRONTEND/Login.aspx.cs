using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace HOMESYNC_1
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void login(object sender, EventArgs e)
        {
            string connstr = WebConfigurationManager.ConnectionStrings
                ["HOMESYNC_DB"].ToString();
            SqlConnection conn = new SqlConnection(connstr);
            string email = emailInput.Text;
            string password = passwordInput.Text;


            SqlCommand loginProc = new SqlCommand("UserLogin", conn);
            loginProc.CommandType = CommandType.StoredProcedure;
            loginProc.Parameters.Add(new SqlParameter("@email", email));
            loginProc.Parameters.Add(new SqlParameter("@password", password));

            SqlParameter success = loginProc.Parameters.Add("@success", SqlDbType.Int);
            SqlParameter userid = loginProc.Parameters.Add("@userid ", SqlDbType.Int);
            success.Direction= ParameterDirection.Output;
            userid.Direction= ParameterDirection.Output;
            conn.Open();
            loginProc.ExecuteNonQuery();
            conn.Close();
            Session["user"] = userid.Value;

            string connstr2 = WebConfigurationManager.ConnectionStrings
                ["HOMESYNC_DB"].ToString();

            SqlConnection conn2 = new SqlConnection(connstr2);
            SqlCommand getUserType = new SqlCommand("getUserType", conn2);
            getUserType.CommandType = CommandType.StoredProcedure;
            getUserType.Parameters.Add(new SqlParameter("@user_id", (int)Session["user"]));
            SqlParameter user_type = getUserType.Parameters.Add("@user_type", SqlDbType.VarChar,5);
            user_type.Direction = ParameterDirection.Output;
            conn2.Open();
            getUserType.ExecuteNonQuery();
            conn2.Close();

           
            if (success.Value.ToString() == "1")
            {
                String userType = (String)user_type.Value;
                Session["user_type"] = userType;


                bottom_label.Text = "Welcome User, Redirecting";
                Response.Redirect("Home.aspx");

            }
            else
                bottom_label.Text = "Email or password incorrect";
        }
    }
}
        
    
