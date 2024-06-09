<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="HOMESYNC_1.RegisterPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
<title>Login Page</title>
    <style>
    body {
         
      height: 100vh;
      margin: 0;
      display: flex;
      align-items: center;
      justify-content: center;
      flex-direction: column; /* Align content in a column */
    }
    
    .card {
      width: 60%;
    }
   
        .button-container button {
            margin-right: px; /* Adjust the value as needed */
        }

         .bottom_label{
     font-size: 25px;

 }
    
    /* Style for the "HOME SYNC" title */
    .display-1 {
      font-size: 80px; /* Increased font size */
      font-weight: bold;
      margin-bottom: 50px; /* Increased space between title and form */
      margin-top: 0px; /* Added margin-top to position it higher */
    }
  </style>
</head>
<body>
   <h1 class="display-1">HOMESYNC</h1>
  <div class="container-fluid d-flex align-items-center justify-content-center">
    
    
    <div class="card">
      <div class="card-body">
        <form class="row g-3" id="form1" runat="server">
            <div class="col-md-6">
              <label for="inputEmail" class="form-label">Email</label>
            <asp:TextBox ID="inputEmail" class="form-control mb-4" runat="server"></asp:TextBox>
    
            </div>
            <div class="col-md-6">
              <label for="inputPassword" class="form-label">Password</label>
             <asp:TextBox ID="inputPassword" type="password" class="form-control mb-4" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-6">
              <label for="First Name" class="form-label">First Name</label>
             <asp:TextBox ID="f_name" class="form-control mb-4" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-6">
              <label for="Last Name" class="form-label">Last Name</label>
              <asp:TextBox ID="l_name" class="form-control mb-4" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-6">
            </div>  
            <div class="col-md-6">
                <label for="Birthdate" class="form-label">Birthdate</label>
                <div>
                    <label for="Day" class="form-label">Day:</label>
                    <asp:DropDownList ID="day" runat="server">
                         </asp:DropDownList>
                        <label for="Month" class="form-label">Month:</label>
                     <asp:DropDownList ID="Month" runat="server">
                        <asp:ListItem>January</asp:ListItem>
                        <asp:ListItem>February</asp:ListItem>
                        <asp:ListItem>March</asp:ListItem>
                        <asp:ListItem>April</asp:ListItem>
                        <asp:ListItem>May</asp:ListItem>
                        <asp:ListItem>June</asp:ListItem>
                        <asp:ListItem>July</asp:ListItem>
                        <asp:ListItem>August</asp:ListItem>
                        <asp:ListItem>September</asp:ListItem>
                        <asp:ListItem>October</asp:ListItem>
                        <asp:ListItem>November</asp:ListItem>
                        <asp:ListItem>December</asp:ListItem>
                        </asp:DropDownList>
                     <label for="Year" class="form-label">Year:</label>
                     <asp:DropDownList ID="year" runat="server"></asp:DropDownList>
                </div>
           
                
            </div>
            <div class="col-12">
               <asp:Button ID="RegisterButton" class="btn btn-dark" runat="server" Text="Register" OnClick="Register" />
            </div>
          </form>
      </div>
        </div>
    </div>
    <br>
    <asp:Label ID="bottom_label" Class="bottom_label" runat="server"></asp:Label>
</body>

</html>
