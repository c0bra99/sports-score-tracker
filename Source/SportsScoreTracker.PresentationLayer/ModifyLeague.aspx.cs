using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportsScoreTracker.BusinessLogicLayer;

namespace SportsScoreTracker.PresentationLayer
{
    public partial class ModifyLeague : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            modifyLeagueTable.Visible = true;
            lblConfirmation.Visible = false;
        }


        /// <summary>
        /// Fires when modify league button is clicked after a user puts in a new league name
        /// </summary>
        protected void btnModifyLeague_Click(object sender, EventArgs e)
        {
            string leagueName = txtLeagueName.Text.Trim();
            int leagueID = int.Parse(Request.QueryString["LeagueID"]);

            //create user
            League league = League.GetLeague(leagueID);
            league.Name = leagueName;
            league.Save();

            //hide the modify league table
            modifyLeagueTable.Visible = false;
            //show the modified league label
            lblConfirmation.Visible = true;
        }
    }
}
