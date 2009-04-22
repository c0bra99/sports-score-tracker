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
    }
}
