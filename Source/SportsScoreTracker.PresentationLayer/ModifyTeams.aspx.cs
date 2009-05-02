using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportsScoreTracker.BusinessLogicLayer;

namespace SportsScoreTracker.PresentationLayer
{
    public partial class ModifyTeams : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Authorization.Authorize(this, Authorization.AuthorizationLevel.RegisteredUser);
            if (((MasterPage)this.Master).IsLoggedIn())
            {
                FillTeamsTable();
            }
        }

               /// <summary>
        /// Fills the team table 
        /// </summary>
        private void FillTeamsTable()
        {
            int leagueID = int.Parse(Request.QueryString["LeagueID"]);

            tblModifyTeams.Rows.Clear();

            //setup the header
            TableHeaderRow header = new TableHeaderRow();
            tblModifyTeams.Rows.Add(header);

            TableHeaderCell teamNameHeader = new TableHeaderCell();
            teamNameHeader.Text = "Team Name";
            header.Cells.Add(teamNameHeader);

            TableHeaderCell editHeader = new TableHeaderCell();
            editHeader.Text = "Edit";
            header.Cells.Add(editHeader);

            TableHeaderCell deleteHeader = new TableHeaderCell();
            deleteHeader.Text = "Delete";
            header.Cells.Add(deleteHeader);

            TableHeaderCell gamesHeader = new TableHeaderCell();
            gamesHeader.Text = "Games";
            header.Cells.Add(gamesHeader);

            List<Team> teams = Team.GetTeamsByLeagueID(leagueID);
            foreach (Team team in teams)
            {
                if (team.LeagueID == leagueID)
                {
                    TableRow row = new TableRow();
                    TableCell nameCell = new TableCell();
                    row.Cells.Add(nameCell);
                    nameCell.Text = team.Name;
                 
                    TableCell modifyCell = new TableCell();
                    row.Cells.Add(modifyCell);
                    
                    ImageButton modifyTeamLink = new ImageButton();
                    modifyTeamLink.ImageUrl = ResolveUrl("~/images/edit-icon.gif");
                    modifyTeamLink.PostBackUrl = ResolveUrl("~/EditTeam.aspx") + "?TeamID=" + team.ID;

                    modifyCell.Controls.Add(modifyTeamLink);
                    
                    TableCell deleteCell = new TableCell();
                    row.Cells.Add(deleteCell);

                    ImageButton deleteTeamLink = new ImageButton();
                    deleteTeamLink.ImageUrl = ResolveUrl("~/images/deleteX.gif");
                    deleteTeamLink.Click += new ImageClickEventHandler(deleteTeamLink_Click);
                    deleteTeamLink.Attributes.Add("TeamID", team.ID.ToString());

                    deleteCell.Controls.Add(deleteTeamLink);

                    TableCell gamesCell = new TableCell();
                    row.Cells.Add(gamesCell);

                    HyperLink gamesLink = new HyperLink();
                    gamesLink.Text = "Games";
                    gamesLink.NavigateUrl = ResolveUrl("~/GamesByTeam.aspx") + "?TeamID=" + team.ID + "&LeagueID=" + leagueID;
                    gamesCell.Controls.Add(gamesLink);

                    tblModifyTeams.Rows.Add(row);
                }
            }
        }


        /// <summary>
        /// Fires when an admin clicks the red X to delete a league
        /// </summary>
        void deleteTeamLink_Click(object sender, ImageClickEventArgs e)
        {
            if (((MasterPage)this.Master).IsLoggedIn())
            {
                ImageButton deleteTeamLink = (ImageButton)sender;
                int teamID = int.Parse(deleteTeamLink.Attributes["TeamID"]);

                Team.Delete(teamID);
                FillTeamsTable();
            }
        }

    }
}