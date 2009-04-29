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
                List<Sport> sports = Sport.GetSports();
                foreach (Sport sport in sports)
                {
                    TreeNode sportNode = new TreeNode(sport.Name);
                    sportNode.SelectAction = TreeNodeSelectAction.Expand; //remove the link for the root nodes
                    treeMainMenu.Nodes.Add(sportNode);

                    List<League> leagues = League.GetLeaguesBySportID(sport.ID);
                    foreach (League league in leagues)
                    {
                        TreeNode leagueNode = new TreeNode(league.Name);
                        leagueNode.NavigateUrl = ResolveUrl("~/LeagueSchedule.aspx") + "?LeagueID=" + league.ID;
                        sportNode.ChildNodes.Add(leagueNode);
                    }
                }

                SetupLoginPanel(); //determine if user is logged in or not
            }
        }


        /// <summary>
        /// Gets the user that is logged in (or returns null if they are not logged in)
        /// </summary>
        /// <returns></returns>
        public RegisteredUser GetLoggedInUser()
        {
            return (RegisteredUser)Session["User"];
        }


        /// <summary>
        /// Determines if a user is logged in or not
        /// </summary>
        public bool IsLoggedIn()
        {
            RegisteredUser user = GetLoggedInUser();
            if (user != null)
                return true;
            return false;
        }


        /// <summary>
        /// Determines if an admin is logged in or not
        /// </summary>
        public bool IsAdminLoggedIn()
        {
            RegisteredUser user = GetLoggedInUser();
            if (user != null)
                return user.IsAdmin;
            return false;
        }


        /// <summary>
        /// Fires when the user clicks the login button
        /// </summary>
        protected void lnkLogin_Click(object sender, EventArgs e)
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

                TreeNode myLeagueNode = new TreeNode("My Leagues");
                myLeagueNode.NavigateUrl = ResolveUrl("~/MyLeagues.aspx");
                treeMainMenu.Nodes.Add(myLeagueNode);

                TreeNode addSportNode = new TreeNode("Add Sport");
                addSportNode.NavigateUrl = ResolveUrl("~/AddSport.aspx");
                treeMainMenu.Nodes.Add(addSportNode);
            }
            else //the user is not logged in
            {
                pnlLogin.Visible = true;
                pnlLoggedIn.Visible = false;

                TreeNode myLeagueNode = treeMainMenu.FindNode("My Leagues");
                if (myLeagueNode != null)
                {
                    treeMainMenu.Nodes.Remove(myLeagueNode);
                }

                TreeNode addSportNode = treeMainMenu.FindNode("Add Sport");
                if (myLeagueNode != null)
                {
                    treeMainMenu.Nodes.Remove(addSportNode);
                }
            }
        }


        /// <summary>
        /// Fires when the user clicks the logout button
        /// </summary>
        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Abandon();
            SetupLoginPanel();
        }
    }
}
