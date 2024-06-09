<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CREATE EVENT.aspx.cs" Inherits="HOMESYNC_1.CREATE_EVENT" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- ... (your existing head content) ... -->
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <h2>Create Event</h2>
            <div class="form-group">
                <label for="eventName">Event Name:</label>
                <asp:TextBox ID="eventNameTextBox" runat="server" placeholder="Enter event name"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="eventDescription">Event Description:</label>
                <asp:TextBox ID="eventDescriptionTextBox" runat="server" TextMode="MultiLine" placeholder="Enter event description"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="eventLocation">Event Location:</label>
                <asp:TextBox ID="eventLocationTextBox" runat="server" placeholder="Enter event location"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="reminderDate">Reminder Date:</label>
                <asp:TextBox ID="reminderDateTextBox" runat="server" TextMode="DateTimeLocal"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="otherUserId">Other User ID:</label>
                <asp:TextBox ID="otherUserIdTextBox" runat="server" placeholder="Enter other user ID"></asp:TextBox>
            </div>
            <asp:Button ID="createEventButton" runat="server" Text="Create Event" OnClick="createEventButton_Click" />
        </div>

        <div class="output-container">
            <div class="output" id="output"></div>
        </div>

        <div class="events-container">
            <h2>Created Events</h2>
            <div class="output" id="eventsOutput"></div>
        </div>
    </form>

    <script>
        let createdEvents = [];

        function createEvent() {
            const eventName = document.getElementById('<%= eventNameTextBox.ClientID %>').value;
            const eventDescription = document.getElementById('<%= eventDescriptionTextBox.ClientID %>').value;
            const eventLocation = document.getElementById('<%= eventLocationTextBox.ClientID %>').value;
            const reminderDate = document.getElementById('<%= reminderDateTextBox.ClientID %>').value;
            const otherUserId = document.getElementById('<%= otherUserIdTextBox.ClientID %>').value;

            // Validation (you can add more sophisticated validation)
            if (!eventName || !eventDescription || !eventLocation || !reminderDate || !otherUserId) {
                document.getElementById('output').innerText = 'Please fill in all fields.';
                return;
            }

            const newEvent = {
                name: eventName,
                description: eventDescription,
                location: eventLocation,
                reminderDate: reminderDate,
                otherUserId: otherUserId
            };

            createdEvents.push(newEvent);

            document.getElementById('output').innerText = 'Event created successfully!';
            document.getElementById('eventsOutput').innerText = JSON.stringify(createdEvents, null, 2);
        }
    </script>
</body>
</html>
