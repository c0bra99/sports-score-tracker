using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportsScoreTracker.BusinessLogicLayer;

namespace SportsScoreTracker.PresentationLayer
{
    public partial class AddNewTeam : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<Sport> sports = Sport.GetSports();
                foreach (Sport sport in sports)
                {
                    ddlSports.Items.Add(new ListItem(sport.Name, sport.ID.ToString()));
                }
            }
        }

        protected void ddlSports_SelectedIndexChanged(object sender, EventArgs e)
        {
            int sportID = int.Parse(ddlSports.SelectedValue);
            List<League> leagues = League.GetLeaguesBySportID(sportID);
            foreach (League league in leagues)
            {
                ddlLeagues.Items.Add(new ListItem(league.Name, league.ID.ToString()));
            }
        }

        /// <summary>
        /// Fires when user clicks the save button
        /// </summary>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            MasterPage master = (MasterPage)this.Master;

            if (master.IsLoggedIn())
            {
                RegisteredUser user = master.GetLoggedInUser();
                int sportID = int.Parse(ddlSports.SelectedValue);
                int leagueID = int.Parse(ddlLeagues.SelectedValue);
                string teamName = txtName.Text;

                Team team = new Team(leagueID, teamName); 
                team.Save();
            }

            Response.Redirect(ResolveUrl("~/MyLeagues.aspx"));
        }
    }
}
