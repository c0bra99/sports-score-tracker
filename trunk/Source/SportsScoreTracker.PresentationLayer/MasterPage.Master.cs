using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportsScoreTracker.BusinessLogicLayer;

namespace SportsScoreTracker.PresentationLayer
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        /// <summary>
        /// Fires on page load
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) //Only true the first time the page is visited
            {
                SetupLoginPanel(); //determine if user is logged in or not

                List<Sport> sports = Sport.GetSports();
                foreach (Sport sport in sports)
                {
                    TreeNode sportNode = new TreeNode(sport.Name);
                    treeMainMenu.Nodes.Add(sportNode);

                    List<League> leagues = League.GetLeaguesBySportID(sport.ID);
                    foreach (League league in leagues)
                    {
                        TreeNode leagueNode = new TreeNode(league.Name);
                        leagueNode.NavigateUrl = ResolveUrl("~/LeagueSchedule.aspx") + "?LeagueID=" + league.ID;
                        sportNode.ChildNodes.Add(leagueNode);
                    }
                }
            }
        }


        /// <summary>
        /// Gets the user that is logged in (or returns null if they are not logged in)
        /// </summary>
        /// <returns></returns>
        protected RegisteredUser GetLoggedInUser()
        {
            return (RegisteredUser)Session["User"];
        }


        /// <summary>
        /// Determines if a user is logged in or not
        /// </summary>
        protected bool IsLoggedIn()
        {
            RegisteredUser user = GetLoggedInUser();
            if (user != null)
                return true;
            return false;
        }


        /// <summary>
        /// Determines if an admin is logged in or not
        /// </summary>
        protected bool IsAdminLoggedIn()
        {
            RegisteredUser user = GetLoggedInUser();
            if (user != null)
                return user.IsAdmin;
            return false;
        }


        /// <summary>
        /// Fires when the user clicks the login button
        /// </summary>
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            RegisteredUser user = RegisteredUser.Authorize(txtUsername.Text.Trim(), txtPassword.Text);
            if (user != null)
            {
                //Login Success!
                Session["User"] = user;
                lblLoginFailed.Visible = false;
                SetupLoginPanel();
            }
            else
            {
                //Login Failed!
                txtPassword.Text = string.Empty;
                lblLoginFailed.Visible = true;
            }
        }


        /// <summary>
        /// Shows/hides the correct login/logged in panel
        /// </summary>
        protected void SetupLoginPanel()
        {
            if (IsLoggedIn()) //if a user is logged in
            {
                RegisteredUser user = GetLoggedInUser();
                pnlLogin.Visible = false;
                pnlLoggedIn.Visible = true;
                lblLoggedInName.Text = user.FirstName;
            }
            else //the user is not logged in
            {
                pnlLogin.Visible = true;
                pnlLoggedIn.Visible = false;
            }
        }


        /// <summary>
        /// Fires when the user clicks the logout button
        /// </summary>
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Abandon();
            SetupLoginPanel();
        }
    }
}
