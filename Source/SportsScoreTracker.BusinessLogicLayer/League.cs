using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SportsScoreTracker.DataAccessLayer;

namespace SportsScoreTracker.BusinessLogicLayer
{
    public class League
    {
        public int ID;
        public int SportID;
        public int RegisteredUserID;
        public string Name;

        /// <summary>
        /// Default constructor
        /// </summary>
        public League()
        { }


        /// <summary>
        /// Constructor taking all parameters
        /// </summary>
        public League(int id, int sportid, int registereduserid, string name)
        {
            ID = id;
            SportID = sportid;
            RegisteredUserID = registereduserid;
            Name = name;
        }


        /// <summary>
        /// Gets all the sports currently known to the system
        /// </summary>
        public static List<League> GetLeaguesBySportID(int sportID)
        {
            SportsTrackerDBDataContext db = new SportsTrackerDBDataContext();

            IEnumerable<League> leagues = from c in db.GetLeaguesBySportID(sportID)
                                        select new League
                                        {
                                            ID = c.ID,
                                            Name = c.Name
                                        };
            return leagues.ToList();
        }
    }
}
