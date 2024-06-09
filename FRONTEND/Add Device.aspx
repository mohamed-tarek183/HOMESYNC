<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add Device.aspx.cs" Inherits="HOMESYNC_1.Add_Device" %>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Add Device</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f5f5f5;
            color: #fff;
            overflow: hidden;
            position: relative;
        }

        .container {
            max-width: 600px;
            margin: auto;
            background: #333;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            position: relative;
            z-index: 1;
        }

        .car-button {
            padding: 10px 5px;
            width: 100%;
            background-color: #000;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 20px;
        }

        .car-button:hover {
            background-color: #222;
        }

        .form-control {
            background-color: #eee;
            color: #000;
            border-color: #ccc;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <form id="deviceForm" runat="server">
        <div class="container">
            <h2 style="text-align: center; margin-bottom: 30px;">Add Device</h2>
            <div class="form-group" runat="server">
                <asp:Label ID="lblDeviceID" runat="server" Text="Device ID:"></asp:Label>
                <asp:TextBox ID="txtDeviceID" runat="server" CssClass="form-control" TextMode="Number" placeholder="Enter Device ID" required></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblStatus" runat="server" Text="Status:"></asp:Label>
                <asp:TextBox ID="txtStatus" runat="server" CssClass="form-control" placeholder="Enter Status" required></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblBattery" runat="server" Text="Battery:"></asp:Label>
                <asp:TextBox ID="txtBattery" runat="server" CssClass="form-control" TextMode="Number" placeholder="Enter Battery" required></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblLocation" runat="server" Text="Location:"></asp:Label>
                <asp:TextBox ID="txtLocation" runat="server" CssClass="form-control" placeholder="Enter Location" required></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblType" runat="server" Text="Type:"></asp:Label>
                <asp:TextBox ID="txtType" runat="server" CssClass="form-control" placeholder="Enter Type" required></asp:TextBox>
            </div>
            <asp:Button runat="server" ID="Add" CssClass="car-button" Text="Add" OnClick="AddDevice_Click"/>
            <asp:Button runat="server" ID="RetryButton" CssClass="car-button" Text="Retry" Visible="false" OnClick="Retry_Click"/>
            <asp:Label ID="ErrorMessage" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>
        </div>
    </form>
</body>
</html>
