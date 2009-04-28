using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportsScoreTracker.BusinessLogicLayer;

namespace SportsScoreTracker.PresentationLayer
{
    public partial class ViewGame : System.Web.UI.Page
    {
        /// <summary>
        /// Fires on page load
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && !ScriptManager1.IsInAsyncPostBack)
            {
                int gameID = int.Parse(Request.QueryString["GameID"]);
                FillGameInfo(gameID);
                FillCommentTable(gameID, (short)Comment.Category.All);

                //Fill the drop down list with the different types of comment categories
                foreach (int i in Enum.GetValues(typeof(Comment.Category)))
                {
                    ddlCommentType.Items.Add(new ListItem(((Comment.Category)i).ToString(), i.ToString()));
                }
            }
        }


        /// <summary>
        /// Fills all the info related to a game on the screen
        /// </summary>
        /// <param name="gameID"></param>
        private void FillGameInfo(int gameID)
        {
            DisplayGame game = Game.GetGameToDisplay(gameID);
            this.lblGameDate.Text = game.GameDate.ToString("g");

            this.lblAway.Text = game.AwayTeam;
            this.lblAwayScore.Text = game.AwayScore.ToString();
            

            this.lblHome.Text = game.HomeTeam;
            this.lblHomeScore.Text = game.HomeScore.ToString();


            //show the user prediction results
            double[] yval = { game.AwayTeamVotes, game.HomeTeamVotes};
            string[] xval = { game.AwayTeam, game.HomeTeam};

            // bind the double array to the Y axis points of the Default data series
            Chart1.Series["Series 1"].Points.DataBindXY(xval, yval);

            //show the system estimated predictions
            if (game.HomeWinningPercentage > game.AwayWinningPercentage)
            {
                lblSystemPredictedWinner.Text = game.HomeTeam;
            }
            else if (game.AwayWinningPercentage > game.HomeWinningPercentage)
            {
                lblSystemPredictedWinner.Text = game.AwayTeam;
            }
            else
            {
                //if either team is just as likely to win
                lblSystemPredictedWinner.Text = "Pick'em";
            }

        }


        /// <summary>
        /// Fills the comment table 
        /// </summary>
        private void FillCommentTable(int gameID, short commentType)
        {
            List<DisplayComment> comments = Comment.GetCommentsByGameID(gameID);
            foreach (DisplayComment comment in comments)
            {
                if (comment.Type == commentType || commentType == (short)Comment.Category.All)
                {
                    TableRow row = new TableRow();
                    TableCell dateCell = new TableCell();
                    TableCell userCell = new TableCell();
                    TableCell textCell = new TableCell();

                    row.Cells.Add(dateCell);
                    row.Cells.Add(userCell);
                    row.Cells.Add(textCell);

                    dateCell.Text = comment.Timestamp.ToString("g");
                    userCell.Text = comment.UserName;
                    textCell.Text = comment.Text;

                    if (((MasterPage)this.Master).IsAdminLoggedIn())
                    {
                        TableCell deleteCell = new TableCell();
                        row.Cells.Add(deleteCell);

                        ImageButton deleteCommentLink = new ImageButton();
                        deleteCommentLink.ImageUrl = ResolveUrl("~/images/deleteX.gif");
                        deleteCommentLink.Click += new ImageClickEventHandler(deleteCommentLink_Click);
                        deleteCommentLink.Attributes.Add("CommentID", comment.CommentID.ToString());

                        deleteCell.Controls.Add(deleteCommentLink);
                    }

                    tblComments.Rows.Add(row);
                }
            }
        }


        /// <summary>
        /// Fires when an admin clicks the red X to delete a comment
        /// </summary>
        void deleteCommentLink_Click(object sender, ImageClickEventArgs e)
        {
            if (((MasterPage)this.Master).IsAdminLoggedIn())
            {
                ImageButton deleteCommentLink = (ImageButton)sender;
                int commentID = int.Parse(deleteCommentLink.Attributes["CommentID"]);

                Comment.Delete(commentID);
            }
        }


        /// <summary>
        /// Fires when the user changes the comment type they wish to view
        /// </summary>
        protected void ddlCommentType_SelectedIndexChanged(object sender, EventArgs e)
        {
            int gameID = int.Parse(Request.QueryString["GameID"]);
            short commentType = short.Parse(ddlCommentType.SelectedValue);

            FillCommentTable(gameID, commentType);
        }
    }
}
