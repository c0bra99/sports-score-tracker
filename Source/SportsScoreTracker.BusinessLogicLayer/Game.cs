using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SportsScoreTracker.DataAccessLayer;

namespace SportsScoreTracker.BusinessLogicLayer
{
    public class Game
    {
        public int ID;
        public int HomeTeamID;
        public int AwayTeamID;
        public DateTime Date;
        public int HomeScore;
        public int AwayScore;

        /// <summary>
        /// Default constructor
        /// </summary>
        public Game()
        { }


        /// <summary>
        /// Constructor taking all parameters
        /// </summary>
        public Game(int id, int hometeamid, int awayteamid, DateTime date, int homescore, int awayscore)
        {
            ID = id;
            HomeTeamID = hometeamid;
            AwayTeamID = awayteamid;
            Date = date;
            HomeScore = homescore;
            AwayScore = awayscore;
        }
    }
}
