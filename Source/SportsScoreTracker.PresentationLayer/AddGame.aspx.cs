using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportsScoreTracker.BusinessLogicLayer;

namespace SportsScoreTracker.PresentationLayer
{
    public partial class AddGame : System.Web.UI.Page
    {
        /// <summary>
        /// Fires on page load
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            Authorization.Authorize(this, Authorization.AuthorizationLevel.RegisteredUser);

            if (!IsPostBack)
            {
                calDate.SelectedDate = DateTime.Now;
                int leagueID = int.Parse(Request.QueryString["LeagueID"]);

                List<Team> teams = Team.GetTeamsByLeagueID(leagueID);
                foreach (Team team in teams)
                {
                    ddlAwayTeam.Items.Add(new ListItem(team.Name, team.ID.ToString()));
                    ddlHomeTeam.Items.Add(new ListItem(team.Name, team.ID.ToString()));
                }

                for (int i = 0; i < 23; i++)
                {
                    ddlHour.Items.Add(new ListItem(i.ToString(), i.ToString()));
                }
                for (int i = 0; i < 59; i++)
                {
                    ddlMinute.Items.Add(new ListItem(i.ToString(), i.ToString()));
                }
            }
        }


        /// <summary>
        /// Fires when the user clicks the button to save the game
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSaveGame_Click(object sender, EventArgs e)
        {
            int awayTeamID = int.Parse(ddlAwayTeam.SelectedValue);
            int homeTeamID = int.Parse(ddlHomeTeam.SelectedValue);
            int hour = int.Parse(ddlHour.SelectedValue);
            int minute = int.Parse(ddlMinute.SelectedValue);
            DateTime gameDate = new DateTime(calDate.SelectedDate.Year, calDate.SelectedDate.Month, calDate.SelectedDate.Day, hour, minute, 0);
            int awayScore = 0;
            int homeScore = 0;
            int.TryParse(txtAwayScore.Text, out homeScore);
            int.TryParse(txtHomeScore.Text, out homeScore);

            Game newGame = new Game(homeTeamID, awayTeamID, gameDate, homeScore, awayScore);
            newGame.Save();

            int leagueID = int.Parse(Request.QueryString["LeagueID"]);
            Response.Redirect(ResolveUrl("~/GamesByTeam.aspx") + "?TeamID=" + homeTeamID + "&LeagueID=" + leagueID);
        }
    }
}
