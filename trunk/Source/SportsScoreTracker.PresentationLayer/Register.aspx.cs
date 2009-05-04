using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportsScoreTracker.BusinessLogicLayer;

namespace SportsScoreTracker.PresentationLayer
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        /// <summary>
        /// Fires when the user clicks create account button after filling out the form
        /// </summary>
        protected void btnCreateAccount_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            
            //make sure email is a valid email address
            if (!RegisteredUser.IsEmailAddress(email))
            {
                lblErrorMessage.Text = "The email address you entered is not a valid email address!";
                return;
            }

            //check if email is registered
            if (RegisteredUser.IsEmailRegistered(email))
            {
                lblErrorMessage.Text = "Email is already registered! If you forgot your password, use the reset password link.";
                return;
            }

            //make sure the password meets the required complexity
            if (!RegisteredUser.IsPasswordSecure(txtPassword.Text))
            {
                lblErrorMessage.Text = "The password you entered does not meet the complexity requirements. Please choose a password at least 8 characters long, and contains alphanumeric and special characters.";
                return;
            }

            string password = RegisteredUser.GetMD5Hash(txtPassword.Text);

            //create user
            RegisteredUser user = new RegisteredUser(email, txtFirstName.Text, txtLastName.Text, password, false);
            user.Save();

            //RegisteredUser.SendEmail("SportsScoreTracker@SportsScoreTracker.com", email, "Sports Score Tracker - Account Created", "Your account has successfully been created.");

            //hide the create user table
            createUserTable.Visible = false;
            //show the user created label
            lblConfirmation.Visible = true;
        }

    }
}
