using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace HOMESYNC_1
{
    public partial class Location_of_2_or_more : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                NeedCharge();
            }
        }
        protected void NeedCharge()
        {
            string connstr = WebConfigurationManager.ConnectionStrings["HOMESYNC_DB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connstr))
            {
                using (SqlCommand cmd = new SqlCommand("NeedCharge", conn))
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    int row = 1;
                    while (reader.Read())
                    {
                        string room = reader["room"].ToString();
                        AddLocation(room,row);
                        row++;
                    }

                    reader.Close();

                    conn.Close();
                }
            }
        }
        protected void AddLocation(string room, int rowNumber)
        {
            HtmlGenericControl row = new HtmlGenericControl("tr");
            HtmlGenericControl numberCell = new HtmlGenericControl("td");
            numberCell.InnerText = rowNumber.ToString();
            row.Controls.Add(numberCell);
            HtmlGenericControl cell = new HtmlGenericControl("td");
            cell.InnerText = room;
            row.Controls.Add(cell);
            multipleDevicesTableBody.Controls.Add(row);
        }
    }
}