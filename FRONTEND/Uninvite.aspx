<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Uninvite.aspx.cs" Inherits="HOMESYNC_1.Uninvite" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Uninvite User from Event</title>
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
            background-color: #e74c3c;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #c0392b;
        }
    </style>
    <script>
        function UninviteUser() {
            // Get the values of event_id and user_id from the input fields
            var eventId = document.getElementById('<%= eventIdTextBox.ClientID %>').value;
            var userId = document.getElementById('<%= userIdTextBox.ClientID %>').value;

            // Call the UninvitedUser method in the code-behind
            PageMethods.UninvitedUser(eventId, userId, onSuccess, onError);
        }

        function onSuccess(result) {
            // Display success message or handle as needed
            alert(result);
        }

        function onError(error) {
            // Display error message or handle as needed
            alert("Error: " + error.get_message());
        }
    </script>
</head>
<body>
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>

        <div class="form-container">
            <h2>Uninvite User from Event</h2>
            <div class="form-group">
                <label for="eventIdTextBox">Event ID:</label>
                <input type="text" id="eventIdTextBox" runat="server" placeholder="Enter event ID" />
            </div>
            <div class="form-group">
                <label for="userIdTextBox">User ID:</label>
                <input type="text" id="userIdTextBox" runat="server" placeholder="Enter user ID" />
            </div>
            <button type="button" onclick="UninviteUser()">Uninvite User</button>
        </div>
    </form>
</body>
</html>

