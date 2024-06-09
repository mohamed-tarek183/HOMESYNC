<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="HOMESYNC_1.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <title>Clickable Card</title>
    <style>
        
        .card {
            width: 200px;
            height: 200px;
            background-color: #f0f0f0;
            border-radius: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
            transition: background-color 0.3s ease;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            position: relative;
        }

        .card:hover {
            background-color: #ddd;
        }

      
        .card a {
            text-decoration: none;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border-radius: 5px;
            font-weight: bold;
            transition: transform 0.3s ease;
            position: absolute;
            bottom: 20px;
            opacity: 0;
            transform: translateY(20px);
        }

        .card:hover a {
            opacity: 1;
            transform: translateY(0);
        }

        
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
        }
    </style>
</head>
<body>
   
   
    
    <form id="f1" runat="server" style="display:flex;">
    <div class="card">
        
        <h2>Profile</h2>
        
      <asp:HyperLink ID="view_profile" runat="server" Text="View Profile" NavigateUrl="~/Profile.aspx"></asp:HyperLink>
    </div>
     <div class="card">
     <h2>Room</h2>
   <asp:HyperLink ID="HyperLink1" runat="server" Text="View Rooms" NavigateUrl="~/Room.aspx"></asp:HyperLink>

 </div>
        <div class="card">
    <h2>Device</h2>
   
      <asp:LinkButton ID="lnkTutorial" runat="server" Text="View Devices" OnClick="Devices_b"/>


</div>
     <div class="card">
    <h2>Task</h2>
  
   <asp:HyperLink ID="HyperLink2" runat="server" Text="View Tasks" NavigateUrl="~/Tasks.aspx"></asp:HyperLink>
      

</div>
         <div class="card">
    <h2>Events</h2>
  <asp:HyperLink ID="HyperLink4" runat="server" Text="View Events" NavigateUrl="~/Events.aspx"></asp:HyperLink>

</div>
         <div class="card">
    <h2 style="font-size:22px;">Finance & Communication </h2>
  <asp:HyperLink ID="HyperLink5" runat="server" Style="font-size: 15px;" Text="View Finance & Communication" NavigateUrl="~/FinanceAndCommunication.aspx"></asp:HyperLink>

</div>
        </form>
        
       
        
    
    
</body>
</html>
