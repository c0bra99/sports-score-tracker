<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ModifyPassword.aspx.cs" Inherits="SportsScoreTracker.PresentationLayer.ModifyPassword"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<table runat="server" id="modifyPasswordTable" style="width:350px">
        <tr>
            <td colspan="2">
                <h2>Modify Password</h2>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="lblPassword" runat="server" AssociatedControlID="txtPassword" Text="Old Password:" />
            </td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Wrap="False" />
                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="txtPassword" ErrorMessage="Old Password is required." ToolTip="Old Password is required." Text="*" />
            </td>
        </tr>
                <tr>
            <td align="right">
                <asp:Label ID="lblNewPassword" runat="server" AssociatedControlID="txtNewPassword" Text="New Password:" />
            </td>
            <td>
                <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" Wrap="False" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNewPassword" ErrorMessage="New Password is required." ToolTip="New Password is required." Text="*" />
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="lblPasswordConfirm" runat="server" AssociatedControlID="txtPasswordConfirm" Text="Confirm Password:" />
            </td>
            <td>
                <asp:TextBox ID="txtPasswordConfirm" runat="server" TextMode="Password" />
                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="txtPasswordConfirm" ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required." Text="*" />
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="txtNewPassword" ControlToValidate="txtPasswordConfirm" Display="Dynamic" ErrorMessage="The New Password and Confirmation Password must match."/>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2" class="Error">
                <asp:Label ID="Label1" runat="server" EnableViewState="False" />
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2" class="Error">
                <asp:Button ID="btnModifyPassword" runat="server" Text="Modify Password" CssClass="Button" onclick="btnModifyPassword_Click"/>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblConfirmation" runat="server" Visible="False" Text="Your password has been modified successfully." />
    <asp:Label ID="lblErrorMessage" runat="server" EnableViewState="False" CssClass="Error" />
</asp:Content>
