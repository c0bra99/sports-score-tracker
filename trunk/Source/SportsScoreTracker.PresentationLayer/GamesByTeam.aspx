<%@ Page Title="Game Listing By Team" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="GamesByTeam.aspx.cs" Inherits="SportsScoreTracker.PresentationLayer.GamesByTeam" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table runat="server" ID="tblGames" BorderWidth="2px" CellPadding="5">
        <asp:TableHeaderRow>
            <asp:TableHeaderCell>Game Date</asp:TableHeaderCell>
            <asp:TableHeaderCell>Away</asp:TableHeaderCell>
            <asp:TableHeaderCell>Home</asp:TableHeaderCell>
            <asp:TableHeaderCell>Edit</asp:TableHeaderCell>
            <asp:TableHeaderCell>Delete</asp:TableHeaderCell>
            <asp:TableHeaderCell>View</asp:TableHeaderCell>
        </asp:TableHeaderRow>
    </asp:Table>
    <br />
    <asp:HyperLink ID="lnkAddNewGame" runat="server" Text="Add New Game" />
</asp:Content>
