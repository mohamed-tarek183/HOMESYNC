<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View Charge.aspx.cs" Inherits="HOMESYNC_1.View_Charge" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .card {
            border: 1px solid #333;
            border-radius: 8px;
            margin-bottom: 20px;
            background-color: #fff;
            color: #333;
        }

        .card-header {
            background-color: #333;
            color: #fff;
            border-bottom: 1px solid #333;
        }

        .card-body {
            padding: 20px;
        }

        .charge-label,
        .location-label {
            font-size: 1.2em;
            font-weight: bold;
            color: #333;
        }

        .form-control {
            color: #333;
            background-color: #fff;
            border: 1px solid #333;
        }

        .btn-primary {
            background-color: #333;
            border-color: #333;
            color: #fff;
        }
    </style>
    <title>ViewCharge</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <div class="card">
                <div class="card-header">
                    Enter Device ID
                </div>
                <div class="card-body">
                    <asp:TextBox ID="txtDeviceID" runat="server" CssClass="form-control" placeholder="Enter Device ID" required></asp:TextBox>
                    <asp:Button ID="viewdata" runat="server" Text="View charge and location" OnClick="view_click" CssClass="btn btn-primary mt-2" />
                </div>
            </div>

            <div class="card mt-4">
                <div class="card-header">
                    Device Charge
                </div>
                <div class="card-body">
                    <p class="charge-label">Charge Status:</p>
                    <asp:Label ID="lblDeviceCharge" runat="server" Text=""></asp:Label>
                </div>
            </div>

            <div class="card mt-4">
                <div class="card-header">
                    Location
                </div>
                <div class="card-body">
                    <p class="location-label">Device Location:</p>
                    <asp:Label ID="lblDeviceLocation" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
