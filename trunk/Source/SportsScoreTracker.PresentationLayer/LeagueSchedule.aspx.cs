using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportsScoreTracker.BusinessLogicLayer;

namespace SportsScoreTracker.PresentationLayer
{
    public partial class LeagueSchedule : System.Web.UI.Page
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
                calFrom.SelectedDate = DateTime.Today.AddDays(-(int)DateTime.Today.DayOfWeek);
                calTo.SelectedDate = calFrom.SelectedDate.AddDays(6);
                calDates_SelectionChanged(sender, e); //show the games for the selected date range
            }
        }


        /// <summary>
        /// Fires when the user changes a date in either calendar
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void calDates_SelectionChanged(object sender, EventArgs e)
        {
            int leagueID = int.Parse(Request.QueryString["LeagueID"]);

            List<ScheduleEntry> entries = ScheduleEntry.GetScheduleByDateRange(leagueID, calFrom.SelectedDate, calTo.SelectedDate.AddDays(1).AddSeconds(-1));

            foreach (ScheduleEntry entry in entries)
            {
                TableRow row = new TableRow();
                TableCell dateCell = new TableCell();
                TableCell awayCell = new TableCell();
                TableCell homeCell = new TableCell();
                row.Cells.Add(dateCell);
                row.Cells.Add(awayCell);
                row.Cells.Add(homeCell);

                HyperLink linkToGame = new HyperLink();
                linkToGame.Text = entry.Date.ToString("g");
                linkToGame.NavigateUrl = ResolveUrl("~/ViewGame.aspx") + "?GameID=" + entry.GameID;

                dateCell.Controls.Add(linkToGame);
                
                awayCell.Text = entry.AwayTeam;
                homeCell.Text = entry.HomeTeam;

                tblGames.Rows.Add(row);
            }
        }
    }
}
