using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportsScoreTracker.BusinessLogicLayer;

namespace SportsScoreTracker.PresentationLayer
{
    public partial class EditTeam : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Authorization.Authorize(this, Authorization.AuthorizationLevel.RegisteredUser);
            editTeamTable.Visible = true;
            lblConfirmation.Visible = false;
        }

        /// <summary>
        /// Fires when edit team button is clicked after a user puts in a new team name
        /// </summary>
        protected void btnEditTeam_Click(object sender, EventArgs e)
        {
            string teamName = txtTeamName.Text.Trim();
            int teamID = int.Parse(Request.QueryString["TeamID"]);

            //create user
            Team team = Team.GetTeam(teamID);
            team.Name = teamName;
            team.Save();

            //hide the modify league table
            editTeamTable.Visible = false;
            //show the modified league label
            lblConfirmation.Visible = true;
        }
    }
}
