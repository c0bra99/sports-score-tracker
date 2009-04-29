using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SportsScoreTracker.DataAccessLayer;

namespace SportsScoreTracker.BusinessLogicLayer
{
    /// <summary>
    /// Class for an instance of a team
    /// </summary>
    public class Team
    {
        public int ID;
        public int LeagueID;
        public string Name;

        /// <summary>
        /// Default constructor
        /// </summary>
        public Team()
        { }


        /// <summary>
        /// Constructor for a NEW instance of a team
        /// </summary>
        public Team(int leagueid, string name)
        {
            ID = -1;
            LeagueID = leagueid;
            Name = name;
        }


        /// <summary>
        /// Constructor taking all parameters
        /// </summary>
        public Team(int id, int leagueid, string name)
        {
            ID = id;
            LeagueID = leagueid;
            Name = name;
        }


        /// <summary>
        /// Deletes this team
        /// </summary>
        public void Delete()
        {
            Delete(this.ID);
        }


        /// <summary>
        /// Deletes a team given the team ID
        /// </summary>
        public static void Delete(int teamID)
        {
            SportsTrackerDBDataContext db = new SportsTrackerDBDataContext();
            db.Team_Delete(teamID);
        }


        /// <summary>
        /// Saves the new / updated team info to the database
        /// </summary>
        public void Save()
        {
            SportsTrackerDBDataContext db = new SportsTrackerDBDataContext();

            if (this.ID == -1) //new team, need to insert
            {
                db.Team_Insert(this.LeagueID, this.Name);
            }
            else //old team, need to update
            {
                db.Team_Update(this.ID, this.LeagueID, this.Name);
            }
        }
    }
}
