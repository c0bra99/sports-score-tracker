<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="SportsScoreTracker.PresentationLayer.ResetPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>
                Please enter the email address you registered with:
            </td>
            <td>
                <asp:TextBox ID="txtEmailAddress" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
            
            </td>
            <td>
                <asp:Button ID="btnResetPassword" runat="server" Text="Reset Password" CssClass="Button" onclick="btnResetPassword_Click" />
            </td>
        </tr>
    </table>
    <asp:Label ID="lblErrorMessage" runat="server" EnableViewState="False" CssClass="Error" />
</asp:Content>
