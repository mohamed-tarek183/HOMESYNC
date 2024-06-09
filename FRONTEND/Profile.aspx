<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="HOMESYNC_1.Profile_page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
    <title>Profile Page</title>
<style>
        body {
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #f8f9fa; /* Bootstrap default background color */
        }

        .profile-card {
            width: 600px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #ffffff; /* Card background color */
        }

        .profile-picture {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 20px;
        }

        /* Additional styles for better layout */
        .profile-info {
            text-align: left;
            margin-top: 20px;
        }

        .profile-info p {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
     <form id="profile_form" runat="server">

    <div class="profile-card">
        <div>
            <asp:Image ID="profileImage" runat="server" ImageUrl="~/Icons/profile.png" Class="profile-picture" AlternateText="Profile Picture" />
        </div>
       
        <div>
             <asp:Label ID="name" runat="server" Text="Name"  Font-Bold="true" style="font-size: 26px; color: black;" />
        </div>
       
       
        <div class="profile-info">
            <div>
                   <asp:Label runat="server" text="ID:"  Font-Bold="true" />
                    <asp:Label runat="server" id="id_text"/>

            </div>
            <div runat="server" visible="false" id ="guestOfDiv">
                <asp:Label runat="server" text="guest_of:"  Font-Bold="true" />
                        <asp:Label runat="server" id="guest_of_text"/>

            </div>
          <div>
               <asp:Label runat="server" text="Email:"  Font-Bold="true" />
                <asp:Label runat="server" id="email_text"/>

          </div>
            
             <div>
              <asp:Label runat="server" text="Password:"  Font-Bold="true" />
             <asp:Label runat="server" id="password_text"/>

             </div>
            
            <div>
                 <asp:Label runat="server" text="User Type:"  Font-Bold="true" />
                  <asp:Label runat="server" id="user_type_text"/>


            </div>
            <div runat="server" visible="false" id="addDiv">
                <asp:Label runat="server" text="Adress:"  Font-Bold="true" />
                <asp:Label runat="server" id="Adress_text"/>


            </div>
            <div runat="server" visible="false" id="arrivalDiv">
                 <asp:Label runat="server" text="Arrival Date:"  Font-Bold="true" />
                     <asp:Label runat="server" id="arrival_text"/>


            </div>
            <div runat="server" visible="true" id="ageDiv">
            <asp:Label runat="server" text="Age:"  Font-Bold="true" />
                 <asp:Label runat="server" id="age_text"/>


            </div>
            <div runat="server" visible="true" id="birthdateDiv">
                <asp:Label runat="server" text="Birthdate:"  Font-Bold="true" />
                    <asp:Label runat="server" id="birthdate_text"/>


                </div>

            <div runat="server" visible="true" id="no_div">
            <asp:Label runat="server" text="Number of guests allowed:"  Font-Bold="true" />
             <asp:Label runat="server" id="no_guests_text" style="width: 40px; display: inline-block; margin-right: 10px;"/>
                <asp:TextBox runat="server" ID="no_guests_tb" class="form-control form-control-sm mb-3 mt-3" type="text"  style="width: 40px; display: inline-block;" pattern="\d*" title="Please enter only numeric values" />
                 <asp:Button runat="server" class="btn btn-secondary " ID="no_guests_button" Text="Set" OnClick="setNoGuests" />
               <asp:HyperLink ID="Register_guest" runat="server" Text="Register Guest" NavigateUrl="~/RegisterGuest.aspx"></asp:HyperLink>


             </div>
            <div runat="server" visible="true" id="deleteDiv">
                <asp:Label runat="server" text="Delete a guest:"  Font-Bold="true" />
                    <asp:TextBox runat="server" ID="delete_guest_tb" class="form-control form-control-sm mb-3 mt-3" type="text"  style="width: 60px; display: inline-block;" pattern="\d*" title="Please enter only numeric values" />
                     <asp:Button runat="server" class="btn btn-secondary " ID="Button1" Text="Delete" OnClick="delete_guest" />
                         <asp:Label runat="server" id="delete_guest_error_label"  />
                   

                 </div>
            <div runat="server" id="prefDiv" visible="true">
                <asp:Label runat="server" text="Preference:"  Font-Bold="true" />
                 <asp:Label runat="server" id="Preference_text"/>


                </div>
            <div runat="server" id="roomDiv" visible="true">
            <asp:Label runat="server" text="Room:"  Font-Bold="true" />
             <asp:Label runat="server" id="room_text"/>


                  </div>
            </div>
        </div>
            

    

    <!-- Include Bootstrap JS and Popper.js (if needed) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </form>
</body>
</html>
