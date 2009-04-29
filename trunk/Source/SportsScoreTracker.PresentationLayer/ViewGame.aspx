<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ViewGame.aspx.cs" Inherits="SportsScoreTracker.PresentationLayer.ViewGame" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <table>
        <tr>
            <td class="GameTeams">
                <asp:Label ID="lblAway" runat="server" />
            </td>
            <td class="GameScores">
                <asp:Label ID="lblAwayScore" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="GameTeams">
                <asp:Label ID="lblHome" runat="server" />
            </td>
            <td class="GameScores">
                <asp:Label ID="lblHomeScore" runat="server" />
            </td>
        </tr>
        <tr><td></td><td></td></tr>
        <tr>
            <td colspan="2"> 
                <asp:Label ID="lblGameDate" runat="server" />
            </td>
        </tr>
    </table>
    <br /><br />
    <table>
        <tr style="vertical-align:top;">
            <td>
                <asp:chart id="Chart1" runat="server" ImageType="Png" 
                    ImageLocation="~/TempImages/ChartPic_#SEQ(300,3)" BackColor="#D3DFF0" 
                    Width="200px" Height="200px" BorderColor="26, 59, 105" Palette="BrightPastel" 
                    BorderDashStyle="Solid" BackGradientStyle="TopBottom" BorderWidth="2">
				    <titles>
					    <asp:title ShadowColor="32, 0, 0, 0" Font="Trebuchet MS, 14.25pt, style=Bold" ShadowOffset="3" Text="User Predictions" Alignment="MiddleLeft" ForeColor="26, 59, 105"></asp:title>
				    </titles>
				    <legends>
					    <asp:legend Enabled="False" IsTextAutoFit="False" Name="Default" BackColor="Transparent" Font="Trebuchet MS, 8.25pt, style=Bold"></asp:legend>
				    </legends>
				    <borderskin skinstyle="Emboss"></borderskin>
				    <series>
					    <asp:series XValueType="Double" Name="Series 1" ChartType="Pie" BorderColor="180, 26, 59, 105" Color="220, 65, 140, 240" YValueType="Double" font="Trebuchet MS, 8.25pt, style=Bold"></asp:series>
				    </series>
				    <chartareas>
					    <asp:chartarea Name="ChartArea1" BorderColor="64, 64, 64, 64" BackSecondaryColor="Transparent" BackColor="64, 165, 191, 228" ShadowColor="Transparent" BackGradientStyle="TopBottom">
						    <area3dstyle Rotation="-21" perspective="10" enable3d="True" Inclination="48" IsRightAngleAxes="False" wallwidth="0" IsClustered="False"></area3dstyle>
						    <axisy linecolor="64, 64, 64, 64">
							    <labelstyle font="Trebuchet MS, 8.25pt, style=Bold" />
							    <majorgrid linecolor="64, 64, 64, 64" />
						    </axisy>
						    <axisx linecolor="64, 64, 64, 64">
							    <labelstyle font="Trebuchet MS, 8.25pt, style=Bold" />
							    <majorgrid linecolor="64, 64, 64, 64" />
						    </axisx>
					    </asp:chartarea>
				    </chartareas>
			    </asp:chart>
            </td>
            <td class="SystemPredictedWinner">
                System Predicted Winner:<br />
                <asp:Label ID="lblSystemPredictedWinner" runat="server" />
            </td>
        </tr>
    </table>
    <asp:Label ID="lblLoginToVoteMessage" runat="server" Text="Login to make your own prediction..." Visible="false" />
    <asp:Panel runat="server" ID="pnlPostPrediction" Visible="false">
        <table>
            <tr>
                <td colspan="2">
                    Pick the team you predict to win:
                </td>
            </tr>
            <tr>
                <td>
                    <asp:RadioButton ID="rbtnAway" runat="server" GroupName="TeamToWin" />
                </td>
                <td>
                    <asp:RadioButton ID="rbtnHome" runat="server" GroupName="TeamToWin" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center;">
                    <asp:Button ID="btnPostPrediction" runat="server" Text="Post Prediction" CssClass="Button" onclick="btnPostPrediction_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center;">
                    <asp:Label ID="lblError" runat="server" EnableViewState="False" CssClass="Error" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Panel runat="server" ID="pnlViewComments">
                Comment Type to View: <asp:DropDownList ID="ddlCommentType" runat="server" AutoPostBack="True" onselectedindexchanged="ddlCommentType_SelectedIndexChanged" />
                &nbsp;<asp:LinkButton ID="lnkPostComment" runat="server" Text="Post Comment" onclick="lnkPostComment_Click" />
                <asp:Table runat="server" ID="tblComments" BorderWidth="2px" CellPadding="5" />
            </asp:Panel>
            <asp:Panel runat="server" ID="pnlPostComment" Visible="false">
                <table style="text-align:left;">
                    <tr>
                        <td>
                            Comment Type to Add:
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlPostCommentType" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Comment Text:
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtPostCommentText" TextMode="MultiLine" Rows="3" Width="250px" />
                            <asp:RegularExpressionValidator ID="ValidatorCommentLength" ControlToValidate="txtPostCommentText" Text="Must be <= 300 characters" ValidationExpression="^[\s\S]{0,300}$" runat="server" Enabled="true" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align:center;">
                            <asp:Button ID="btnPostComment" runat="server" Text="Post Comment" 
                                CssClass="Button" CausesValidation="true" onclick="btnPostComment_Click" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ddlCommentType" EventName="SelectedIndexChanged" />
        </Triggers>
   </asp:UpdatePanel>
</asp:Content>
