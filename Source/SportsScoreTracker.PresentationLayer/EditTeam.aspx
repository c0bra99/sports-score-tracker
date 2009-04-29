<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EditTeam.aspx.cs" Inherits="SportsScoreTracker.PresentationLayer.EditTeam" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<table runat="server" id="editTeamTable" style="width:350px">
        <tr>
            <td colspan="2">
                <h2>Edit Team</h2>
            </td>
        </tr>
        <tr>
            <td align="right">
                Team Name</td>
            <td>
                <asp:TextBox ID="txtTeamName" runat="server" />
                <asp:RequiredFieldValidator ID="NameRequired" runat="server" ControlToValidate="txtTeamName" ErrorMessage="Name is required." ToolTip="Name is required." Text="*" />
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2" class="Error">
                <asp:Label ID="lblErrorMessage" runat="server" EnableViewState="False" />
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2" class="Error">
                <asp:Button ID="btnEditTeam" runat="server" Text="Edit Team" CssClass="Button" onclick="btnEditTeam_Click"/>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblConfirmation" runat="server" Visible="False" Text="Your team has been modified." />
</asp:Content>
