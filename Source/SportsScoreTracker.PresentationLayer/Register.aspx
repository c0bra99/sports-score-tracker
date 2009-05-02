<%@ Page Title="Register New Account" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SportsScoreTracker.PresentationLayer.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table runat="server" id="createUserTable" style="width:350px">
        <tr>
            <td colspan="2">
                <h2>Sign Up for Your New Account</h2>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail" Text="Email Address:" />
            </td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" />
                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required." ToolTip="Email is required." Text="*" />
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="lblFirstName" runat="server" AssociatedControlID="txtFirstName" Text="First Name:" />
            </td>
            <td>
                <asp:TextBox ID="txtFirstName" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="lblLastName" runat="server" AssociatedControlID="txtLastName" Text="Last Name:" />
            </td>
            <td>
                <asp:TextBox ID="txtLastName" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="lblPassword" runat="server" AssociatedControlID="txtPassword" Text="Password:" />
            </td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Wrap="False" />
                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required." ToolTip="Password is required." Text="*" />
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
                <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtPasswordConfirm" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match."/>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2" class="Error">
                <asp:Label ID="lblErrorMessage" runat="server" EnableViewState="False" />
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2" class="Error">
                <asp:Button ID="btnCreateAccount" runat="server" Text="Create Account" CssClass="Button" onclick="btnCreateAccount_Click"/>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblConfirmation" runat="server" Visible="False" Text="Your account has been created successfully, a confirmation email will be sent to the address you registered with." />
</asp:Content>