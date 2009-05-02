using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportsScoreTracker.BusinessLogicLayer;

namespace SportsScoreTracker.PresentationLayer
{
    public partial class MyLeagues : System.Web.UI.Page
    {
        /// <summary>
        /// Fires on page load
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            Authorization.Authorize(this, Authorization.AuthorizationLevel.RegisteredUser);
            if (((MasterPage)this.Master).IsLoggedIn())
            {
                FillLeaguesTable();
            }
        }


        /// <summary>
        /// Fills the league table 
        /// </summary>
        private void FillLeaguesTable()
        {
            RegisteredUser reguser = ((MasterPage)this.Master).GetLoggedInUser();
            int reguserid = reguser.ID;

            tblMyLeagues.Rows.Clear();

            //setup the header
            TableHeaderRow header = new TableHeaderRow();
            tblMyLeagues.Rows.Add(header);

            TableHeaderCell sportHeader = new TableHeaderCell();
            sportHeader.Text = "Sport";
            header.Cells.Add(sportHeader);

            TableHeaderCell leagueNameHeader = new TableHeaderCell();
            leagueNameHeader.Text = "League Name";
            header.Cells.Add(leagueNameHeader);

            TableHeaderCell editHeader = new TableHeaderCell();
            editHeader.Text = "Edit";
            header.Cells.Add(editHeader);

            TableHeaderCell deleteHeader = new TableHeaderCell();
            deleteHeader.Text = "Delete";
            header.Cells.Add(deleteHeader);

            TableHeaderCell gamesHeader = new TableHeaderCell();
            gamesHeader.Text = "Teams";
            header.Cells.Add(gamesHeader);

            List<Sport> sports = Sport.GetSports();
            Dictionary<int, Sport> sportLookup = new Dictionary<int,Sport>(sports.Count);
            foreach (Sport sport in sports)
            {
                sportLookup.Add(sport.ID, sport);
            }

            List<League> leagues = League.GetLeaguesByUserID(reguserid);
            foreach (League league in leagues)
            {
                if (league.RegisteredUserID == reguserid)
                {
                    TableRow row = new TableRow();
                    TableCell sportCell = new TableCell();
                    row.Cells.Add(sportCell);
                    sportCell.Text = sportLookup[league.SportID].Name;

                    TableCell nameCell = new TableCell();
                    row.Cells.Add(nameCell);
                    nameCell.Text = league.Name;
                 
                    TableCell modifyCell = new TableCell();
                    row.Cells.Add(modifyCell);

                    ImageButton modifyLeagueLink = new ImageButton();
                    modifyLeagueLink.ImageUrl = ResolveUrl("~/images/edit-icon.gif");
                    modifyLeagueLink.PostBackUrl = ResolveUrl("~/ModifyLeague.aspx") + "?LeagueID=" + league.ID;

                    modifyCell.Controls.Add(modifyLeagueLink);
                    
                    TableCell deleteCell = new TableCell();
                    row.Cells.Add(deleteCell);

                    ImageButton deleteLeagueLink = new ImageButton();
                    deleteLeagueLink.ImageUrl = ResolveUrl("~/images/deleteX.gif");
                    deleteLeagueLink.Click += new ImageClickEventHandler(deleteLeagueLink_Click);
                    deleteLeagueLink.Attributes.Add("LeagueID", league.ID.ToString());

                    deleteCell.Controls.Add(deleteLeagueLink);

                    TableCell teamsCell = new TableCell();
                    row.Cells.Add(teamsCell);

                    HyperLink teamsLink = new HyperLink();
                    teamsLink.Text = "Teams";
                    teamsLink.NavigateUrl = ResolveUrl("~/ModifyTeams.aspx") + "?LeagueID=" + league.ID;
                    teamsCell.Controls.Add(teamsLink);

                    tblMyLeagues.Rows.Add(row);
                }
            }
        }


        /// <summary>
        /// Fires when an admin clicks the red X to delete a league
        /// </summary>
        void deleteLeagueLink_Click(object sender, ImageClickEventArgs e)
        {
            if (((MasterPage)this.Master).IsLoggedIn())
            {
                ImageButton deleteLeagueLink = (ImageButton)sender;
                int leagueID = int.Parse(deleteLeagueLink.Attributes["LeagueID"]);

                League.Delete(leagueID);
                FillLeaguesTable();
            }
        }
    }
}
