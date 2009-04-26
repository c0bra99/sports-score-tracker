using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportsScoreTracker.BusinessLogicLayer;

namespace SportsScoreTracker.PresentationLayer
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        /// <summary>
        /// Fires when a user clicks the button to reset their password
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            if (!RegisteredUser.ResetPassword(txtEmailAddress.Text))
                lblErrorMessage.Text = "The email address you entered is not recognized.";
            else
                lblErrorMessage.Text = "An email has been sent with your new password.";
        }
    }
}
