<%@ Page Title="League Schedule" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="LeagueSchedule.aspx.cs" Inherits="SportsScoreTracker.PresentationLayer.LeagueSchedule" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Select a date range to view schedule for:
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
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
            <asp:Table runat="server" ID="tblGames" Visible="false">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell>Date</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Away</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Home</asp:TableHeaderCell>
                </asp:TableHeaderRow>
           </asp:Table>
           <asp:Label ID="lblErrorMessage" runat="server" EnableViewState="False" CssClass="Error" Visible="false" />
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="calFrom" EventName="SelectionChanged" />
            <asp:AsyncPostBackTrigger ControlID="calTo" EventName="SelectionChanged" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
