<%@ Page Title="Add New League" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AddNewLeague.aspx.cs" Inherits="SportsScoreTracker.PresentationLayer.AddNewLeague" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Enter New League Information:</h2>
    <table>
        <tr>
            <td>
                Sport: 
            </td>
            <td>
                <asp:DropDownList ID="ddlSports" runat="server" />
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
