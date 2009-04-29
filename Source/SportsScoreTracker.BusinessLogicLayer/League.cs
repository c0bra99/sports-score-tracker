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
        /// Constructor taking all parameters except for ID
        /// </summary>
        public League(int sportid, int registereduserid, string name)
        {
            ID = -1;
            SportID = sportid;
            RegisteredUserID = registereduserid;
            Name = name;
        }

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

        /// <summary>
        /// saves the new / updated league info to the database
        /// </summary>
        public void Save()
        {
            SportsTrackerDBDataContext db = new SportsTrackerDBDataContext();

            if (this.ID == -1) //new league, need to insert
            {
                db.League_Insert(this.SportID, this.RegisteredUserID, this.Name);
            }
            else //old league, need to update
            {
                db.League_Update(this.ID, this.SportID, this.RegisteredUserID, this.Name);
            }
        }

        /// <summary>
        /// Gets the leagues for a given user
        /// </summary>
        public static List<League> GetLeaguesByUserID(int registereduserID)
        {
            SportsTrackerDBDataContext db = new SportsTrackerDBDataContext();

            IEnumerable<League> leagues = from l in db.GetLeaguesByUserID(registereduserID)
                                                   select new League
                                                   {
                                                       ID = l.ID,
                                                       SportID = l.SportID,
                                                       RegisteredUserID = l.RegisteredUserID,
                                                       Name = l.Name
                                                   };
            return leagues.ToList();
        }


        /// <summary>
        /// Deletes this league
        /// </summary>
        public void Delete()
        {
            Delete(this.ID);
        }


        /// <summary>
        /// Deletes a league given the league ID
        /// </summary>
        public static void Delete(int ID)
        {
            SportsTrackerDBDataContext db = new SportsTrackerDBDataContext();
            db.League_Delete(ID);
        }
    }
}
