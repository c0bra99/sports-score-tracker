<%@ Page Title="Add New Team" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AddNewTeam.aspx.cs" Inherits="SportsScoreTracker.PresentationLayer.AddNewTeam" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Enter New Team Information:</h2>
    <table>
        <tr>
            <td>
                Sport: 
            </td>
            <td>
                <asp:DropDownList ID="ddlSports" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ddlSports_SelectedIndexChanged" />
            </td>
        </tr>
         <tr>
            <td>
                League: 
            </td>
            <td>
                <asp:DropDownList ID="ddlLeagues" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                Name: 
            </td>
            <td>
                <asp:TextBox ID="txtName" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center;">
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="Button" 
                    onclick="btnSave_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
