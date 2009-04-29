<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MyLeagues.aspx.cs" Inherits="SportsScoreTracker.PresentationLayer.MyLeagues" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <asp:Table runat="server" ID="tblMyLeagues" BorderWidth="2px" CellPadding="5">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell>League Name</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Edit</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Delete</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Teams</asp:TableHeaderCell>
                </asp:TableHeaderRow>
           </asp:Table>
</asp:Content>
