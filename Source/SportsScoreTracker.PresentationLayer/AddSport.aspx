﻿<%@ Page Title="Add Sport" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AddSport.aspx.cs" Inherits="SportsScoreTracker.PresentationLayer.AddSport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlAddSport" runat="server">
        <table>
            <tr>
                <td>
                    Please enter the name of the sport you want to add:
                </td>
                <td>
                    <asp:TextBox ID="txtNewSportName" runat="server" />
                </td>
            </tr>
            <tr>
                <td align=right>
                    <asp:Button ID="btnAddSport" runat="server" Text="Add Sport" CssClass="Button" onclick="btnAddSport_Click" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Label ID="lblAddSportConfirm" runat="server" Text="New sport created successfully!"></asp:Label>
</asp:Content>
