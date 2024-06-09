<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SendMessage.aspx.cs" Inherits="HOMESYNC_1.SendMessage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Send Message</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Send Message</h2>

            <div>
                <label for="txtSenderId">Sender ID:</label>
                <asp:TextBox ID="txtSenderId" runat="server" required></asp:TextBox>
            </div>

            <div>
                <label for="txtReceiverId">Receiver ID:</label>
                <asp:TextBox ID="txtReceiverId" runat="server" required></asp:TextBox>
            </div>

            <div>
                <label for="txtTitle">Title:</label>
                <asp:TextBox ID="txtTitle" runat="server" required></asp:TextBox>
            </div>

            <div>
                <label for="txtContent">Content:</label>
                <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" Rows="4" required Height="31px" style="margin-top: 4px" Width="241px"></asp:TextBox>
            </div>

            <div>
                <label for="txtTimeSent">Time Sent:</label>
                <asp:TextBox ID="txtTimeSent" runat="server" type="time" required Height="16px" Width="165px"></asp:TextBox>
            </div>

            <div>
                <label for="txtTimeReceived" style="font-size: large">Time Received:</label>
                <asp:TextBox ID="txtTimeReceived" runat="server" type="time" required Height="16px" Width="179px"></asp:TextBox>
            </div>

            <div>
            </div>
        </div>
        <p>
                <asp:Button ID="btnSendMessage" runat="server" Text="Send Message" OnClick="btnSendMessage_Click" Height="37px" Width="227px" />
            </p>
    </form>
</body>
</html>
