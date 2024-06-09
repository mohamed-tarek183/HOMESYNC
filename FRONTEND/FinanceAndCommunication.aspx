<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FinanceAndCommunication.aspx.cs" Inherits="HOMESYNC_1.FinanceAndCommunication" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Finance and Communication</title>
    <style>
        body {
            text-align: center;
            margin: 50px;
        }

        h1 {
            color: #333;
        }

        .button {
  display: inline-block;
  padding: 12px 24px;
  margin: 10px;
  text-decoration: none;
  font-size: 16px;
  font-weight: bold;
  border-radius: 5px;
  transition: background-color 0.3s ease;
  color: #fff;
  background-color: #3498db;
  border: 2px solid #2980b9;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.button:hover {
  background-color: #2980b9;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Finance and Communication</h1>
            <p>&nbsp;</p>
            <a href="Transactions.aspx" class="button">Transactions</a>
            <a href="CreatePayment.aspx" class="button">Create Payment</a>
            <a href="SendMessage.aspx" class="button">Send Message</a>
            <a href="Messages.aspx" class="button">Messages</a>

            <asp:Button ID="btnDeleteLastMessage" runat="server" Text="Delete Last Message" OnClick="btnDeleteLastMessage_Click" Visible="false" Height="38px" Width="207px" />
        </div>
    </form>
</body>
</html>