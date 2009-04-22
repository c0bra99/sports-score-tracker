<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="LeagueSchedule.aspx.cs" Inherits="SportsScoreTracker.PresentationLayer.LeagueSchedule" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Select a date range to view schedule for:
    <table>
        <tr>
            <td>
                <asp:Calendar ID="calFrom" runat="server" onselectionchanged="calDates_SelectionChanged"></asp:Calendar>
            </td>
            <td>
                To
            </td>
            <td>
                <asp:Calendar ID="calTo" runat="server" onselectionchanged="calDates_SelectionChanged"></asp:Calendar>
            </td>
        </tr>
    </table>

    <asp:Table runat="server" ID="tblGames">
        <asp:TableHeaderRow>
            <asp:TableHeaderCell>Date</asp:TableHeaderCell>
            <asp:TableHeaderCell>Away</asp:TableHeaderCell>
            <asp:TableHeaderCell>Home</asp:TableHeaderCell>
        </asp:TableHeaderRow>
   </asp:Table>
</asp:Content>
