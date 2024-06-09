<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="HOMESYNC.Events" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Events</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Events Page</h2>

            <!-- Button to AssignUser page -->
            <asp:Button runat="server" Text="Assign User" OnClick="RedirectToAssignUser" /><br />

            <!-- Button to CreateEvent page -->
            <asp:Button runat="server" Text="Create Event" OnClick="RedirectToCreateEvent" /><br />

            <!-- Button to Uninvite page -->
            <asp:Button runat="server" Text="Uninvite" OnClick="RedirectToUninvite" /><br />

            <!-- Button to ViewEvent page -->
            <asp:Button runat="server" Text="View Event" OnClick="RedirectToViewEvent" /><br />
        </div>
    </form>
</body>
</html>