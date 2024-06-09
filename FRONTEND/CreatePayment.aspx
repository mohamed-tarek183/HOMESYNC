<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreatePayment.aspx.cs" Inherits="HOMESYNC_1.CreatePayment" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create Payment</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Create Payment</h2>

            <div>
                <label for="txtSenderId">Sender ID:</label>
                <asp:TextBox ID="txtSenderId" runat="server" required></asp:TextBox>
            </div>

            <div>
                <label for="txtReceiverId">Receiver ID:</label>
                <asp:TextBox ID="txtReceiverId" runat="server" required></asp:TextBox>
            </div>

            <div>
                <label for="txtType">Payment Type:</label>
                <asp:TextBox ID="txtType" runat="server" required></asp:TextBox>
            </div>

            <div>
                <label for="txtAmount">Amount:</label>
                <asp:TextBox ID="txtAmount" runat="server" type="number" step="0.01" required></asp:TextBox>
            </div>

            <div>
                <label for="txtStatus">Payment Status:</label>
                <asp:TextBox ID="txtStatus" runat="server" required></asp:TextBox>
            </div>

            <div>
                <label for="txtDeadline">Deadline:</label>
                <asp:TextBox ID="txtDeadline" runat="server" type="datetime-local" required></asp:TextBox>
            </div>

            <div>
                <asp:Button ID="btnCreatePayment" runat="server" Text="Create Payment" OnClick="btnCreatePayment_Click" Width="216px" />
            </div>

            <div>
                <asp:Label ID="lblSuccess" runat="server" EnableViewState="false" Visible="false" ForeColor="Green"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
