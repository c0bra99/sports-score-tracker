<%@ Page Title="Modify Game" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ModifyGame.aspx.cs" Inherits="SportsScoreTracker.PresentationLayer.ModifyGame" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Edit Game Information:</h2>
    <table>
        <tr>
            <td>
                Away Team:
            </td>
            <td>
                <asp:Label ID="lblAway" runat="server" Text="Away Team Name" />
            </td>
        </tr>
        <tr>
            <td>
                Home Team:
            </td>
            <td>
                <asp:Label ID="lblHome" runat="server" Text="Home Team Name" />
            </td>
        </tr>
        <tr>
            <td>
                Game Date:
            </td>
            <td>
                <asp:Calendar ID="calDate" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                Game Time:
            </td>
            <td>
                <asp:DropDownList ID="ddlHour" runat="server" />&nbsp;:&nbsp;
                <asp:DropDownList ID="ddlMinute" runat="server" />&nbsp;
            </td>
        </tr>
        <tr>
            <td>
                Away Score (if known):
            </td>
            <td>
                <asp:TextBox ID="txtAwayScore" runat="server" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtAwayScore" ErrorMessage="Score must be numeric" ValidationExpression="[0-9]*" />
            </td>
        </tr>
        <tr>
            <td>
                Home Score (if known):
            </td>
            <td>
                <asp:TextBox ID="txtHomeScore" runat="server" />
                       <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtHomeScore" ErrorMessage="Score must be numeric" ValidationExpression="[0-9]*" />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center;">
                <asp:Button ID="btnSaveGame" runat="server" Text="Save Game" onclick="btnSaveGame_Click" CssClass="Button" />
            </td>
        </tr>
    </table>
</asp:Content>
