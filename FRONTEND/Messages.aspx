<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowMessages.aspx.cs" Inherits="HOMESYNC_1.ShowMessages" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Show Messages</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Show Messages</h2>
            
            <div>
                <label for="txtSenderId">Sender ID:</label>
                <asp:TextBox ID="txtSenderId" runat="server" required></asp:TextBox>
            </div>
            
            <div>
                <asp:Button ID="btnShowMessages" runat="server" Text="Show Messages" OnClick="btnShowMessages_Click" />
            </div>
            
            <div>
                <asp:Label ID="lblContent" runat="server" EnableViewState="false" Visible="false"></asp:Label>
                <asp:Label ID="lblNoMessages" runat="server" EnableViewState="false" Visible="false">No messages received</asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
