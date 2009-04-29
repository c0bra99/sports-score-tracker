<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ModifyTeams.aspx.cs" Inherits="SportsScoreTracker.PresentationLayer.ModifyTeams" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <asp:Table runat="server" ID="tblModifyTeams" BorderWidth="2px" CellPadding="5">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell>Team Name</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Edit</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Delete</asp:TableHeaderCell>
                </asp:TableHeaderRow>
           </asp:Table>
               <br />
    <asp:HyperLink ID="HyperLink1" runat="server" Text="Add New Team" NavigateUrl="~/AddNewTeam.aspx" />
</asp:Content>
