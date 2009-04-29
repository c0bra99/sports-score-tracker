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

            TableHeaderCell leagueNameHeader = new TableHeaderCell();
            leagueNameHeader.Text = "League Name";
            header.Cells.Add(leagueNameHeader);

            TableHeaderCell editHeader = new TableHeaderCell();
            editHeader.Text = "Edit";
            header.Cells.Add(editHeader);

            TableHeaderCell deleteHeader = new TableHeaderCell();
            deleteHeader.Text = "Delete";
            header.Cells.Add(deleteHeader);

            List<League> leagues = League.GetLeaguesByUserID(reguserid);
            foreach (League league in leagues)
            {
                if (league.RegisteredUserID == reguserid)
                {
                    TableRow row = new TableRow();
                    TableCell nameCell = new TableCell();

                    row.Cells.Add(nameCell);

                    nameCell.Text = league.Name;

                    if (((MasterPage)this.Master).IsLoggedIn())
                    {
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

                League.Delete(leagueID);
                FillLeaguesTable();
            }
        }

    }
}
