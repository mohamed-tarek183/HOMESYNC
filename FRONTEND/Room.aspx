<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Room.aspx.cs" Inherits="HOMESYNC_1.Room" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <title>Room Dashboard</title>
    <style>
        body.dark-mode {
            background-color: #1a1a1a;
            color: #ffffff;
        }

        .card-title {
            background-color: #262627;
            color: #ffffff;
            padding: 10px;
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 10px;
        }

        .card-content {
            padding: 20px;
        }


        .card-text {
            font-size: 16px;
            line-height: 1.6;
        }
    </style>
</head>
<body>
    <form id="room_form" runat="server">
        <h1 style="text-align: center" class="display-1">Room Dashboard</h1>

        <div class="container mt-5">


            <div class="row">
                <div class="col-md-6 mx-auto">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Your Room Details</h5>
                            <div>
                                <asp:Label runat="server" ID="room_no_label"> Room Number: </asp:Label>
                                <asp:Label runat="server" ID="room_no_text">  </asp:Label>
                            </div>
                            <div>
                                <asp:Label runat="server" ID="room_type_label"> Room Type: </asp:Label>
                                <asp:Label runat="server" ID="room_type_text">  </asp:Label>
                            </div>
                            <div>
                                <asp:Label runat="server" ID="room_floor_label"> Room Floor: </asp:Label>
                                <asp:Label runat="server" ID="room_floor_text">  </asp:Label>
                            </div>
                            <div>
                                <asp:Label runat="server" ID="room_status_label"> Room Status: </asp:Label>
                                <asp:Label runat="server" ID="room_status_text">  </asp:Label>
                            </div>

                        </div>
                    </div>



                    <div class="card mt-3">
                        <div class="card-body">

                            <div class="card-title">Book a Room</div>

                            <div class="card-content">
                                <div>
                                    <asp:Label runat="server" ID="Label1">Enter Room Number: </asp:Label>

                                </div>
                                <div>
                                    <asp:TextBox class="form-control mb-3 mt-3" runat="server" type="text" ID="book_room_tb" pattern="\d*" title="Please enter only numeric values" />
                                </div>
                                <div>
                                    <asp:Button runat="server" class="btn btn-secondary btn-block " ID="book_room_button" Text="Book" OnClick="BookRoom" />
                                    <asp:Label runat="server" ID="bookRoom_bl"></asp:Label>
                                </div>

                            </div>


                        </div>
                    </div>



                    <div class="card mt-3" runat="server" visible="true" id="card3">
                        <div class="card-body">
                            <div class="card-title">View rooms that are not being used</div>
                            <asp:Button ID="viewRooms_button" class="btn btn-secondary btn-block" runat="server" Text="View" OnClick="ViewEmptyRooms" />





                        </div>
                    </div>


                    <div class="card mt-3" runat="server" visible="true" id="card4">
                        <div class="card-body">
                            <div class="card-title">Change Status of a Room </div>
                            <div>
                                <asp:Label runat="server" ID="Label2"> Enter Room Number: </asp:Label>
                                <asp:TextBox runat="server" class="form-control mb-3 mt-3" type="text" ID="change_status_tb1" pattern="\d*" title="Please enter only numeric values" />
                            </div>
                            <div>
                                <asp:Label runat="server" ID="Label3"> Enter new status: </asp:Label>
                                <asp:TextBox runat="server" class="form-control mb-3 mt-3" type="text" ID="change_status_tb2" />
                            </div>
                            <div>
                                <asp:Button ID="change_status_button" class="btn btn-secondary btn-block" runat="server" Text="Change" OnClick="ChangeStatus" />
                                <asp:Label runat="server" ID="change_status_label" />


                            </div>


                        </div>
                    </div>

                    <div class="card mt-3" runat="server" visible="true" id="card5">
                        <div class="card-body">
                            <h5 class="card-title">Create schedule for a room</h5>
                            <div>
                                <asp:Label runat="server" ID="cs_room_no_label1"> Enter Room Number: </asp:Label>
                                <asp:TextBox runat="server" class="form-control mb-3 mt-3" type="text" ID="cs_room_no_text1" pattern="\d*" title="Please enter only numeric values" />
                              
                            </div>
                            <div>
                                <asp:Label runat="server" ID="Label4"> Enter start date: </asp:Label>
                                <asp:DropDownList ID="start_day_dd" runat="server">
                                </asp:DropDownList>
                                <label for="start_Month" class="form-label">Month:</label> 
                                <asp:DropDownList ID="start_Month_dd" runat="server">
                                    <asp:ListItem>January</asp:ListItem>
                                    <asp:ListItem>February</asp:ListItem>
                                    <asp:ListItem>March</asp:ListItem>
                                    <asp:ListItem>April</asp:ListItem>
                                    <asp:ListItem>May</asp:ListItem>
                                    <asp:ListItem>June</asp:ListItem>
                                    <asp:ListItem>July</asp:ListItem>
                                    <asp:ListItem>August</asp:ListItem>
                                    <asp:ListItem>September</asp:ListItem>
                                    <asp:ListItem>October</asp:ListItem>
                                    <asp:ListItem>November</asp:ListItem>
                                    <asp:ListItem>December</asp:ListItem>
                                </asp:DropDownList>
                                <label for="Year" class="form-label">Year:</label>
                                <asp:DropDownList ID="start_year_dd" runat="server"></asp:DropDownList>
                            </div>
                        
                        <div>
                            <asp:Label runat="server" ID="Label5"> Enter end date:     </asp:Label>
                            <asp:DropDownList ID="end_day_dd" runat="server">
                            </asp:DropDownList>
                            <label for="Month" class="form-label">Month:</label>
                            <asp:DropDownList ID="end_month_dd" runat="server">
                                <asp:ListItem>January</asp:ListItem>
                                <asp:ListItem>February</asp:ListItem>
                                <asp:ListItem>March</asp:ListItem>
                                <asp:ListItem>April</asp:ListItem>
                                <asp:ListItem>May</asp:ListItem>
                                <asp:ListItem>June</asp:ListItem>
                                <asp:ListItem>July</asp:ListItem>
                                <asp:ListItem>August</asp:ListItem>
                                <asp:ListItem>September</asp:ListItem>
                                <asp:ListItem>October</asp:ListItem>
                                <asp:ListItem>November</asp:ListItem>
                                <asp:ListItem>December</asp:ListItem>
                            </asp:DropDownList>
                            <label for="Year" class="form-label">Year:</label>
                            <asp:DropDownList ID="end_year_dd" runat="server"></asp:DropDownList>
                        </div>
                        <div>
                            <asp:Label runat="server" ID="cs_room_no_label4"> Enter Action: </asp:Label>
                            <asp:TextBox runat="server" class="form-control mb-3 mt-3" type="text" ID="cs_room_no_text4" />
                                
                        </div>
                            <div>
                            <asp:Button ID="create_s_button" class="btn btn-secondary btn-block" runat="server" Text="Create" OnClick="CreateSchedule" />
                               <asp:Label runat="server" ID="s_label" />

                            </div>
                    </div>

                </div>
            </div>
        </div>
        </div>
        


       
    </form>
</body>
</html>
