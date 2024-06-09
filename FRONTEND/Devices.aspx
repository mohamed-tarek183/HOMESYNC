<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Devices.aspx.cs" Inherits="HOMESYNC_1.Devices" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <title>Devices</title>

<style>
   
    .devices-background {
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        background: linear-gradient(to bottom, #051937, #004d7a);
        overflow: hidden;
    }

  
    @keyframes techBackground {
        0% { transform: translateY(0); }
        100% { transform: translateY(-200vh); }
    }

    .devices-background::before {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: calc(200vh + 100%);
        background-size: auto;
        background-position: center;
        animation: techBackground 30s linear infinite;
    }

    
    .button-container {
        text-align: center;
        padding: 40vh 0; 
    }

    .car-button {
        background-color: #3498db;
        border: none;
        color: white;
        padding: 80px 50px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 20px;
        margin: 10px;
        position: relative;
        overflow: hidden;
        border-radius: 15px; 
        transition: 0.5s;
        cursor: pointer;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        z-index: 1; 
    }

    .car-button:before {
        content: '';
        position: absolute;
        top: -15px;
        left: 50%;
        transform: translateX(-50%);
        width: 0;
        height: 0;
        border-left: 30px solid transparent;
        border-right: 30px solid transparent;
        border-bottom: 50px solid #3498db;
        z-index: -1; 
    }

    
    .car-button:hover {
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
        transform: scale(1.1) rotate(10deg);
    }

    .car-button:active:before {
        transition: 0.2s;
        top: 0px;
    }


    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box !important;
    }

    html, body {
        height: 100%;
        overflow: hidden; 
    }

    body {
        display: table;
        width: 100%;
        background-color: #171717;
        color: #000;
        line-height: 1.6;
        position: relative;
        font-family: sans-serif;
    }

    .lines {
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        height: 100%;
        margin: auto;
        width: 90vw;
        pointer-events: none; 
    }

    .line {
        position: absolute;
        width: 1px;
        height: 100%;
        top: 0;
        left: 50%;
        background: rgba(255, 255, 255, 0.1);
        overflow: hidden;
        z-index: -1;
    }

    .line::after {
        content: '';
        display: block;
        position: absolute;
        height: 15vh;
        width: 100%;
        top: -50%;
        left: 0;
        background: linear-gradient(to bottom, rgba(255, 255, 255, 0) 0%, #ffffff 75%, #ffffff 100%);
        animation: drop 7s infinite;
        animation-fill-mode: forwards;
        animation-timing-function: cubic-bezier(0.4, 0.26, 0, 0.97);
    }

    
    .line:nth-child(1) {
        margin-left: -40%;
        animation-delay: 0s;
    }

    .line:nth-child(2) {
        margin-left: -20%;
        animation-delay: 1s;
    }

    .line:nth-child(3) {
        margin-left: 0;
        animation-delay: 2s;
    }

    .line:nth-child(4) {
        margin-left: 20%;
        animation-delay: 3s;
    }

    .line:nth-child(5) {
        margin-left: 40%;
        animation-delay: 4s;
    }

    .line:nth-child(6) {
        margin-left: 60%;
        animation-delay: 5s;
    }

    .line:nth-child(7) {
        margin-left: 80%;
        animation-delay: 6s;
    }

    @keyframes drop {
        0% {
            top: -50%;
        }
        100% {
            top: 100%;
        }
    }

 
    .button-container {
        text-align: center;
        padding: 40vh 0; 
    }
</style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="button-container">
            <asp:Button runat="server" ID="Button1" CssClass="car-button" Text="View charge" OnClick="Button1_Click" />
            <asp:Button runat="server" ID="Button2" CssClass="car-button" Text="Add device" OnClick="Button2_Click"/>
            <asp:Button runat="server" ID="Button3" CssClass="car-button" Text="Location dead" onclick="Button3_Click"/>
            <asp:Button runat="server" ID="Button4" CssClass="car-button" Text="     Charge    " OnClick="Button4_Click"/>
            <asp:Button runat="server" ID="Button5" CssClass="car-button" Text="Multiple Devices" OnClick="Button5_Click" />

        </div>
        <div class="lines">
            <div class="line"></div>
            <div class="line"></div>
            <div class="line"></div>
            <div class="line"></div>
            <div class="line"></div>
            
        </div>
    </form>
</body>
</html>
