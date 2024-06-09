<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HOMESYNC_1.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
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
      width: 30%;
    }
    
    
    .display-1 {
      font-size: 80px; /* Increased font size */
      font-weight: bold;
      margin-bottom: 50px; /* Increased space between title and form */
      margin-top: 0px; /* Added margin-top to position it higher */
    }
    .bottom_label{
        font-size: 25px;

    }
    
  </style>
</head>
<body>
    <h1 class="display-1">HOMESYNC</h1> 
    <div class="container-fluid d-flex align-items-center justify-content-center">
    <div class="card">
     <div class="card-body">
    <form id="form1" runat="server">
       <div class="form-group">
            <label id="email" for="exampleInputEmail1">Email address</label>
             <asp:TextBox ID="emailInput" class="form-control form-control-sm mb-4" runat="server"></asp:TextBox>
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">Password</label>
             <asp:TextBox  type="password" ID="passwordInput" class="form-control form-control-sm mb-4" runat="server"></asp:TextBox>
          </div>
          <asp:Button ID="Loginbutton" class="btn btn-dark btn-block" runat="server" Text="login" OnClick="login" />
    </form>
         </div>

    </div>
  </div>
     <label for="Register">Dont have an account?</label>
    <asp:HyperLink ID="Register" runat="server" Text="Register" NavigateUrl="~/Register.aspx"></asp:HyperLink>
    <div>
        <br/>
    <asp:Label ID="bottom_label" Class="bottom_label" runat="server"></asp:Label>
    </div>
    
</body>
</html>
