using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SportsScoreTracker.DataAccessLayer;

namespace SportsScoreTracker.BusinessLogicLayer
{
    public class Prediction
    {
        public int GameID;
        public int UserID;
        public int TeamID;

        /// <summary>
        /// Default constructor
        /// </summary>
        public Prediction()
        { }


        /// <summary>
        /// Constructor taking all parameters
        /// </summary>
        public Prediction(int gameid, int userid, int teamid)
        {
            GameID = gameid;
            UserID = userid;
            TeamID = teamid;
        }


        /// <summary>
        /// Saves this new prediction to the database
        /// </summary>
        public void Save()
        {
            SportsTrackerDBDataContext db = new SportsTrackerDBDataContext();
            db.Prediction_Insert(GameID, UserID, TeamID);
        }

    }
}
