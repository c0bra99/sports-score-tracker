using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using SportsScoreTracker.BusinessLogicLayer;

namespace SportsScoreTracker.PresentationLayer
{
    public partial class ModifyPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Fires when user clicks on the modify password button after putting in 
        /// old password and new password twice
        /// </summary>
        protected void btnModifyPassword_Click(object sender, EventArgs e)
        {
            string password = RegisteredUser.GetMD5Hash(txtPassword.Text);

            MasterPage master = (MasterPage)this.Master;

            if (master.IsLoggedIn())
            {
                RegisteredUser reguser = master.GetLoggedInUser();
                if (password.Equals(reguser.Password))
                {
                    if (!RegisteredUser.IsPasswordSecure(txtNewPassword.Text))
                    {
                        lblErrorMessage.Text = "The password you entered does not meet the complexity requirements. Please choose a password at least 8 characters long, and contains alphanumeric and special characters.";
                        return;
                    }
                    string newPassword = RegisteredUser.GetMD5Hash(txtNewPassword.Text);
                    reguser.Password = newPassword;
                    reguser.Save();

                    modifyPasswordTable.Visible = false;
                    lblConfirmation.Visible = true;
                }
            }

        }
    }
}
