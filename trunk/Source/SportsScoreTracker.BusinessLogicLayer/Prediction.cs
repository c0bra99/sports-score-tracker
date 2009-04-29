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


        /// <summary>
        /// Gets what team a user voted would win for a specific game, or null if they haven't voted for this game.
        /// </summary>
        public static string GetPredictionByGameAndUserID(int gameID, int userID)
        {
            SportsTrackerDBDataContext db = new SportsTrackerDBDataContext();
            GetPredictionByGameAndUserIDResult result = db.GetPredictionByGameAndUserID(gameID, userID).SingleOrDefault();
            if (result != null)
                return result.Name;
            return null;
        }
    }
}
