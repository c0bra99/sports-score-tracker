using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportsScoreTracker.BusinessLogicLayer;

namespace SportsScoreTracker.PresentationLayer
{
    public partial class AddNewLeague : System.Web.UI.Page
    {
        /// <summary>
        /// Fires on page load
        /// </summary>
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

                League league = new League(sportID, user.ID, txtName.Text);
                league.Save();
            }

            Response.Redirect(ResolveUrl("~/MyLeagues.aspx"));
        }
    }
}
