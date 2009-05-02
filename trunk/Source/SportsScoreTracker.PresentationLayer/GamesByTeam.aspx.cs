using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportsScoreTracker.BusinessLogicLayer;

namespace SportsScoreTracker.PresentationLayer
{
    public partial class GamesByTeam : System.Web.UI.Page
    {
        /// <summary>
        /// Fires on page load
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (((MasterPage)this.Master).IsLoggedIn())
            {
                int leagueID = int.Parse(Request.QueryString["LeagueID"]);
                lnkAddNewGame.NavigateUrl = ResolveUrl("~/AddGame.aspx") + "?LeagueID=" + leagueID;
                FillGamesTable();
            }
        }


        /// <summary>
        /// Fills the games table 
        /// </summary>
        private void FillGamesTable()
        {
            int leagueID = int.Parse(Request.QueryString["LeagueID"]);
            int teamID = int.Parse(Request.QueryString["TeamID"]);
            RegisteredUser reguser = ((MasterPage)this.Master).GetLoggedInUser();
            int reguserid = reguser.ID;

            tblGames.Rows.Clear();

            //setup the header
            TableHeaderRow header = new TableHeaderRow();
            tblGames.Rows.Add(header);

            TableHeaderCell leagueNameHeader = new TableHeaderCell();
            leagueNameHeader.Text = "Game Date";
            header.Cells.Add(leagueNameHeader);

            TableHeaderCell awayHeader = new TableHeaderCell();
            awayHeader.Text = "Away";
            header.Cells.Add(awayHeader);

            TableHeaderCell homeHeader = new TableHeaderCell();
            homeHeader.Text = "Home";
            header.Cells.Add(homeHeader);

            TableHeaderCell editHeader = new TableHeaderCell();
            editHeader.Text = "Edit";
            header.Cells.Add(editHeader);

            TableHeaderCell deleteHeader = new TableHeaderCell();
            deleteHeader.Text = "Delete";
            header.Cells.Add(deleteHeader);

            TableHeaderCell gamesHeader = new TableHeaderCell();
            gamesHeader.Text = "View";
            header.Cells.Add(gamesHeader);

            List<Game> games = Game.GetGamesByTeamID(teamID, false, false);
            foreach (Game game in games)
            {
                Team awayTeam = Team.GetTeam(game.AwayTeamID);
                Team homeTeam = Team.GetTeam(game.HomeTeamID);

                TableRow row = new TableRow();
                TableCell dateCell = new TableCell();
                row.Cells.Add(dateCell);
                dateCell.Text = game.Date.ToString("g");

                TableCell awayCell = new TableCell();
                row.Cells.Add(awayCell);
                awayCell.Text = awayTeam.Name;

                TableCell homeCell = new TableCell();
                row.Cells.Add(homeCell);
                homeCell.Text = homeTeam.Name;

                TableCell modifyCell = new TableCell();
                row.Cells.Add(modifyCell);

                ImageButton modifyLink = new ImageButton();
                modifyLink.ImageUrl = ResolveUrl("~/images/edit-icon.gif");
                modifyLink.PostBackUrl = ResolveUrl("~/ModifyGame.aspx") + "?GameID=" + game.ID + "&LeagueID=" + leagueID; ;
                modifyCell.Controls.Add(modifyLink);

                TableCell deleteCell = new TableCell();
                row.Cells.Add(deleteCell);

                ImageButton deleteLink = new ImageButton();
                deleteLink.ImageUrl = ResolveUrl("~/images/deleteX.gif");
                deleteLink.Click += new ImageClickEventHandler(deleteGameLink_Click);
                deleteLink.Attributes.Add("GameID", game.ID.ToString());

                deleteCell.Controls.Add(deleteLink);

                TableCell teamsCell = new TableCell();
                row.Cells.Add(teamsCell);

                HyperLink teamsLink = new HyperLink();
                teamsLink.Text = "View";
                teamsLink.NavigateUrl = ResolveUrl("~/ViewGame.aspx") + "?GameID=" + game.ID;
                teamsCell.Controls.Add(teamsLink);

                tblGames.Rows.Add(row);
            }
        }


        /// <summary>
        /// Fires when an admin clicks the red X to delete a league
        /// </summary>
        void deleteGameLink_Click(object sender, ImageClickEventArgs e)
        {
            if (((MasterPage)this.Master).IsLoggedIn())
            {
                ImageButton deleteLink = (ImageButton)sender;
                int gameID = int.Parse(deleteLink.Attributes["GameID"]);

                Game.Delete(gameID);
                FillGamesTable();
            }
        }
    }
}
