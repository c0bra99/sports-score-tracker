using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportsScoreTracker.BusinessLogicLayer;

namespace SportsScoreTracker.PresentationLayer
{
    public partial class AddSport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Authorization.Authorize(this, Authorization.AuthorizationLevel.RegisteredUser);
            pnlAddSport.Visible = true;
            lblAddSportConfirm.Visible = false;
        }

        protected void btnAddSport_Click(object sender, EventArgs e)
        {
            MasterPage master = (MasterPage)this.Master;

            string newsportname = txtNewSportName.Text;

            Sport newsport = new Sport(newsportname);
            newsport.Save();

            pnlAddSport.Visible = false;
            lblAddSportConfirm.Visible = true;
        }
    }
}
