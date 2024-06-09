<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view event.aspx.cs" Inherits="HOMESYNC_1.view_event" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-- Define TextBoxes with corresponding IDs -->
            <asp:TextBox ID="userIdTextBox" runat="server"></asp:TextBox>
            <asp:TextBox ID="eventIdTextBox" runat="server"></asp:TextBox>
            
            <!-- Add buttons for ViewEvent and RemoveEvent -->
            <asp:Button ID="viewEventButton" runat="server" Text="View Event" OnClick="ViewEvent" />
            <asp:Button ID="removeEventButton" runat="server" Text="Remove Event" OnClick="RemoveEvent" />

            <!-- Add buttons for User ID and Event ID -->
            <asp:Button ID="viewUserIdButton" runat="server" Text="View User ID" OnClick="ViewUserId" />
            <asp:Button ID="viewEventIdButton" runat="server" Text="View Event ID" OnClick="ViewEventId" />
            
            <!-- Add a container for displaying results -->
            <div id="resultContainer" runat="server"></div>
        </div>
    </form>
</body>
</html>

