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
            if (!ScriptManager1.IsInAsyncPostBack)
            {
                int gameID = int.Parse(Request.QueryString["GameID"]);
                FillGameInfo(gameID);
                FillCommentTable(gameID, (short)Comment.Category.All);

                MasterPage master = (MasterPage)this.Master;
                if (master.IsLoggedIn())
                {
                    lnkPostComment.Enabled = true;
                    lnkPostComment.Text = "Post Comment";
                    pnlPostPrediction.Visible = true;
                    rbtnAway.Text = lblAway.Text;
                    rbtnHome.Text = lblHome.Text;
                    RefreshPrediction();
                }
                else
                {
                    lnkPostComment.Enabled = false;
                    lnkPostComment.Text = "Login to post comments...";
                    pnlPostPrediction.Visible = false;
                    lblLoginToVoteMessage.Text = "Login to make your own prediction...";
                    lblLoginToVoteMessage.Visible = true;
                }

                if (!IsPostBack)
                {
                    FillCommentTypeList(ddlCommentType);
                    FillCommentTypeList(ddlPostCommentType);
                    ddlPostCommentType.Items.RemoveAt(0); //remove the "All" item, make user pick a type
                }
            }

            ddlCommentType_SelectedIndexChanged(null, null);
        }


        /// <summary>
        /// Refreshes the user's prediction
        /// </summary>
        private void RefreshPrediction()
        {
            int gameID = int.Parse(Request.QueryString["GameID"]);
            RegisteredUser user = ((MasterPage)this.Master).GetLoggedInUser();
            if (user != null)
            {
                string userVote = Prediction.GetPredictionByGameAndUserID(gameID, user.ID);
                if (userVote != null)
                {
                    lblLoginToVoteMessage.Text = "You have already voted for: " + userVote;
                    lblLoginToVoteMessage.Visible = true;
                    pnlPostPrediction.Visible = false;
                }
                else
                {
                    lblLoginToVoteMessage.Visible = false;
                }
            }
        }

        /// <summary>
        /// Fill the drop down list with the different types of comment categories
        /// </summary>
        private void FillCommentTypeList(DropDownList list)
        {
            list.Items.Clear();
            foreach (int i in Enum.GetValues(typeof(Comment.Category)))
            {
                list.Items.Add(new ListItem(((Comment.Category)i).ToString(), i.ToString()));
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
            tblComments.Rows.Clear();
            
            //setup the header
            TableHeaderRow header = new TableHeaderRow();
            tblComments.Rows.Add(header);

            TableHeaderCell dateHeader = new TableHeaderCell();
            dateHeader.Text = "Date";
            dateHeader.Width = new Unit(100, UnitType.Pixel);
            header.Cells.Add(dateHeader);

            TableHeaderCell userHeader = new TableHeaderCell();
            userHeader.Text = "User";
            dateHeader.Width = new Unit(100, UnitType.Pixel);
            header.Cells.Add(userHeader);

            TableHeaderCell textHeader = new TableHeaderCell();
            textHeader.Text = "Text";
            header.Cells.Add(textHeader);

            if (((MasterPage)this.Master).IsAdminLoggedIn())
            {
                TableHeaderCell deleteHeader = new TableHeaderCell();
                deleteHeader.Text = "Delete";
                header.Cells.Add(deleteHeader);
            }

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
                ddlCommentType_SelectedIndexChanged(null, null);
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


        /// <summary>
        /// Fires when the user clicks the "add comment" link
        /// </summary>
        protected void lnkPostComment_Click(object sender, EventArgs e)
        {
            pnlViewComments.Visible = false;
            pnlPostComment.Visible = true;
        }


        /// <summary>
        /// Fires when the user posts a comment
        /// </summary>
        protected void btnPostComment_Click(object sender, EventArgs e)
        {
            RegisteredUser user = ((MasterPage)this.Master).GetLoggedInUser();
            if (user != null)
            {
                int gameID = int.Parse(Request.QueryString["GameID"]);
                short commentType = short.Parse(ddlPostCommentType.SelectedValue);

                //create a new comment
                Comment comment = new Comment(user.ID, gameID, commentType, DateTime.Now, txtPostCommentText.Text);
                comment.Save(); //save it to the DB
            }

            txtPostCommentText.Text = string.Empty;
            pnlPostComment.Visible = false;
            pnlViewComments.Visible = true;
            ddlCommentType.SelectedIndex = 0;
            ddlCommentType_SelectedIndexChanged(sender, e);
        }


        /// <summary>
        /// Fires when a user posts a comment
        /// </summary>
        protected void btnPostPrediction_Click(object sender, EventArgs e)
        {
            RegisteredUser user = ((MasterPage)this.Master).GetLoggedInUser();
            int gameID = int.Parse(Request.QueryString["GameID"]);
            int teamID = -1;

            //get the game so we know the team ID's that are playing
            Game game = Game.GetGame(gameID);
            
            //get which team the user selected
            if (rbtnAway.Checked)
            {
                teamID = game.AwayTeamID;
            }
            else if (rbtnHome.Checked)
            {
                teamID = game.HomeTeamID;
            }
            else
            {
                lblError.Text = "Select a team before voting!";
                return;
            }

            Prediction prediction = new Prediction(gameID, user.ID, teamID);
            prediction.Save();
            RefreshPrediction();
            FillGameInfo(gameID); //refresh the user prediction pie chart, etc...
        }
    }
}
