using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SportsScoreTracker.DataAccessLayer;

namespace SportsScoreTracker.BusinessLogicLayer
{
    public class RegisteredUser
    {

        /// <summary>
        /// Gets all tasks of a particular state
        /// </summary>
        public static void test()
        {
            SportsScoreTracker.DataAccessLayer.SportsTrackerDBDataContext db = new SportsTrackerDBDataContext();
            var predictions = from p in db.Predictions
                              where p.GameID == 2
                              select p;

            //db.GetPredictionResultsByGameID(

            //using (RegisteredUserServerDataContext db = new RegisteredUserServerDataContext())
            //{
            //    return (from t in db.() select t).ToList<GetTasksByState>();
            //}
        }

    }
}