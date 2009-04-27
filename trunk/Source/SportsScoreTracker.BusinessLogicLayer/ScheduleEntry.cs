using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SportsScoreTracker.DataAccessLayer;

namespace SportsScoreTracker.BusinessLogicLayer
{
    /// <summary>
    /// A class for a single entry in the schedule
    /// </summary>
    public class ScheduleEntry
    {
        public int GameID;
        public DateTime Date;
        public string AwayTeam;
        public string HomeTeam;


        /// <summary>
        /// Gets the schedule of games between 2 dates
        /// </summary>
        public static List<ScheduleEntry> GetScheduleByDateRange(int leagueID, DateTime fromDate, DateTime toDate)
        {
            SportsTrackerDBDataContext db = new SportsTrackerDBDataContext();

            IEnumerable<ScheduleEntry> entries = from c in db.GetScheduleByDateRange(leagueID, fromDate, toDate)
                                                 select new ScheduleEntry
                                                 {
                                                     GameID = c.GameID,
                                                     Date = c.Date,
                                                     AwayTeam = c.AwayTeam,
                                                     HomeTeam = c.HomeTeam
                                                 };
            return entries.ToList();
        }
    }
}
