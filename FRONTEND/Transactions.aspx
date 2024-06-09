<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Transactions.aspx.cs" Inherits="HOMESYNC_1.Transactions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 66px; width: 269px; font-size: xx-large">
            Transactions:</div>
        <label for="receiverId">Receiver ID:</label>
        <asp:TextBox ID="receiverId" runat="server"></asp:TextBox><br />

        <label for="type">Type:</label>
        <asp:TextBox ID="type" runat="server"></asp:TextBox><br />

        <label for="amount">Amount:</label>
        <asp:TextBox ID="amount" runat="server"></asp:TextBox><br />

        <label for="status">Status:</label>
        <asp:TextBox ID="status" runat="server"></asp:TextBox><br />

        <label for="date">Date:</label>
        <asp:TextBox ID="date" runat="server"></asp:TextBox><br />
        
        <p>
            <asp:Button ID="recieve" runat="server" Height="127px" OnClick="recievetransaction" Text="Receive Transactions" Width="208px" />
        </p>
        <asp:Label ID="Success" runat="server" Text="" ForeColor="Green"></asp:Label>
    </form>
</body>
</html>