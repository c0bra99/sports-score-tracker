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
            MasterPage master = (MasterPage)this.Master;
            if (master.IsLoggedIn())
            {
                RegisteredUser reguser = master.GetLoggedInUser();
                int reguserid = reguser.ID;
                FillLeaguesTable(reguserid);
            }
        }

        /// <summary>
        /// Fills the league table 
        /// </summary>
        private void FillLeaguesTable(int reguserid)
        {
            List<League> leagues = League.GetLeaguesByUserID(reguserid);
            foreach (League league in leagues)
            {
                if (league.RegisteredUserID == reguserid)
                {
                    TableRow row = new TableRow();
                    TableCell nameCell = new TableCell();

                    row.Cells.Add(nameCell);

                    nameCell.Text = league.Name;

                    if (((MasterPage)this.Master).IsAdminLoggedIn())
                    {
                        TableCell deleteCell = new TableCell();
                        row.Cells.Add(deleteCell);

                        ImageButton deleteLeagueLink = new ImageButton();
                        deleteLeagueLink.ImageUrl = ResolveUrl("~/images/deleteX.gif");
                        deleteLeagueLink.Click += new ImageClickEventHandler(deleteLeagueLink_Click);
                        deleteLeagueLink.Attributes.Add("LeagueID", league.ID.ToString());

                        deleteCell.Controls.Add(deleteLeagueLink);
                    }

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

                Comment.Delete(leagueID);
            }
        }

    }
}
