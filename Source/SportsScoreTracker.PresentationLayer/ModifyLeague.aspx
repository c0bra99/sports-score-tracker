<%@ Page Title="Modify League" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ModifyLeague.aspx.cs" Inherits="SportsScoreTracker.PresentationLayer.ModifyLeague" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<table runat="server" id="modifyLeagueTable" style="width:350px">
        <tr>
            <td colspan="2">
                <h2>Modify league</h2>
            </td>
        </tr>
        <tr>
            <td align="right">
                League Name</td>
            <td>
                <asp:TextBox ID="txtLeagueName" runat="server" />
                <asp:RequiredFieldValidator ID="NameRequired" runat="server" ControlToValidate="txtLeagueName" ErrorMessage="Name is required." ToolTip="Name is required." Text="*" />
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2" class="Error">
                <asp:Label ID="lblErrorMessage" runat="server" EnableViewState="False" />
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2" class="Error">
                <asp:Button ID="btnModifyLeague" runat="server" Text="Modify League" CssClass="Button" onclick="btnModifyLeague_Click"/>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblConfirmation" runat="server" Visible="False" Text="Your league has been modified." />
</asp:Content>
