<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AssignUserToEvent.aspx.cs" Inherits="HOMESYNC_1.AssignUserToEvent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Assign User to Event</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        input {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }

        button {
            background-color: #4caf50;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div class="form-container">
            <h2>Assign User to Event</h2>
            <div class="form-group">
                <label for="userIdTextBox">User ID:</label>
                <input type="text" id="userIdTextBox" runat="server" placeholder="Enter user ID" />
            </div>
            <div class="form-group">
                <label for="eventIdTextBox">Event ID:</label>
                <input type="text" id="eventIdTextBox" runat="server" placeholder="Enter event ID" />
            </div>
            <button type="button" onclick="AssignUserToEvent()">Assign User to Event</button>
        </div>
    </form>
</body>
</html>
