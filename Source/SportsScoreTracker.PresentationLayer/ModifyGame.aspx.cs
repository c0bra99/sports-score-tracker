using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportsScoreTracker.BusinessLogicLayer;

namespace SportsScoreTracker.PresentationLayer
{
    public partial class ModifyGame : System.Web.UI.Page
    {
        /// <summary>
        /// Fires on page load
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                for (int i = 0; i < 23; i++)
                {
                    ddlHour.Items.Add(new ListItem(i.ToString(), i.ToString()));
                }
                for (int i = 0; i < 59; i++)
                {
                    ddlMinute.Items.Add(new ListItem(i.ToString(), i.ToString()));
                }

                int gameID = int.Parse(Request.QueryString["GameID"]);
                Game game = Game.GetGame(gameID);
                Team awayTeam = Team.GetTeam(game.AwayTeamID);
                Team homeTeam = Team.GetTeam(game.HomeTeamID);
                lblAway.Text = awayTeam.Name;
                lblHome.Text = homeTeam.Name;
                calDate.SelectedDate = game.Date;
                ddlHour.SelectedValue = game.Date.Hour.ToString();
                ddlMinute.SelectedValue = game.Date.Minute.ToString();
                txtAwayScore.Text = game.AwayScore.ToString();
                txtHomeScore.Text = game.HomeScore.ToString();
            }
        }


        /// <summary>
        /// Fires when the user clicks the save button to update the game
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSaveGame_Click(object sender, EventArgs e)
        {
            int hour = int.Parse(ddlHour.SelectedValue);
            int minute = int.Parse(ddlMinute.SelectedValue);
            DateTime gameDate = new DateTime(calDate.SelectedDate.Year, calDate.SelectedDate.Month, calDate.SelectedDate.Day, hour, minute, 0);
            int awayScore = 0;
            int homeScore = 0;
            int.TryParse(txtAwayScore.Text, out awayScore);
            int.TryParse(txtHomeScore.Text, out homeScore);

            int gameID = int.Parse(Request.QueryString["GameID"]);
            Game game = Game.GetGame(gameID);
            game.HomeScore = homeScore;
            game.AwayScore = awayScore;
            game.Date = gameDate;
            game.Save();

            int leagueID = int.Parse(Request.QueryString["LeagueID"]);
            Response.Redirect(ResolveUrl("~/GamesByTeam.aspx") + "?TeamID=" + game.HomeTeamID + "&LeagueID=" + leagueID);
        }
    }
}
