using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace HOMESYNC_1
{
    public partial class Location : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                outofbattery();
            }
        }
        protected void outofbattery()
        {
            string connstr = WebConfigurationManager.ConnectionStrings["HOMESYNC_DB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connstr))
            {
                using(SqlCommand cmd=new SqlCommand("OutOfBattery", conn))
                {
                   cmd.CommandType= CommandType.StoredProcedure;
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    int row = 1;
                    while (reader.Read())
                    {
                        
                
                        string room = reader["room"].ToString();
                        AddLocationToTable(room,row);
                        row++;
                       
                    }

                    reader.Close();
                    conn.Close();
                }
            }

        }
        protected void AddLocationToTable(string room, int numcell)
        {
            HtmlTableRow row = new HtmlTableRow();

            HtmlTableCell numberCell = new HtmlTableCell();
            numberCell.InnerText = numcell.ToString(); 
            row.Cells.Add(numberCell);

            HtmlTableCell cell = new HtmlTableCell();
            cell.InnerText = room;
            row.Cells.Add(cell);

            
            deadDevicesTableBody.Controls.Add(row);
        }

    }
}