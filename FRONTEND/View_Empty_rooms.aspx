<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View_Empty_rooms.aspx.cs" Inherits="HOMESYNC_1.View_Empty_rooms" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <title>View rooms that are not being used</title>
    <style>
         body {
   height: 100vh;
   margin: 0;
   display: flex;
   align-items: center;
   justify-content: center;
   flex-direction: column; /* Align content in a column */
 }
        .Grid {
            border: solid 1px Tan;
        }
        .Grid td
            {
    border: solid 3px #FFFFFF;
    margin: 3px 3px 3px 3px;
    font-family: Arial;
    padding: 5px 5px 5px 5px;
    text-align: center;
        }
         .card {
   width: 100%;
 }

        .GridHeader
{
    font-weight: bold;
    background-color: darkcyan;
}

        .GridHeader a:hover
{
    text-decoration: underline;
    background: Tan url(images/spin.gif) no-repeat 0 100%;
}
        .GridHeader a
{
    text-decoration: none;
    color: darkgrey;
    padding: 0px 15px 0px 15px;
}

        .GridItem, .GridAltItem
{
    font-size: smaller;
}
        .GridItem
{
    background-color: darkgrey;
}

.GridAltItem
{
    background-color: darkgray;
}
 .card-text {
     font-size: 16px;
     line-height: 1.6;
 }
  .card-title {
    
    
     padding: 10px;
     font-size: 24px;
   
     text-align: center;
     margin-bottom: 10px;
 }


    </style>
      
</head>
<body>
   <form id="emptyRooms_dataGrid" runat="server">  
        <div class="container-fluid d-flex align-items-center justify-content-center">  
            <div class="card">
              <h5 class="card-title">Rooms not in use</h5>
            <div class="card-body">
            
            

            <asp:datagrid id="DataGrid1" runat="server" CssClass="Grid">
                 <HeaderStyle CssClass="GridHeader"></HeaderStyle>
                 <ItemStyle CssClass="GridItem"></ItemStyle>
                 <AlternatingItemStyle CssClass="GridAltItem"></AlternatingItemStyle>
</asp:datagrid>
        </div>  
                </div>
            </div>
    </form>  
</body>
</html>
