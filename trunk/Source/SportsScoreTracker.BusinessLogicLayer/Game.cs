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


        /// <summary>
        /// Gets a game to display to the user
        /// </summary>
        public static DisplayGame GetGameToDisplay(int gameID)
        {
            SportsTrackerDBDataContext db = new SportsTrackerDBDataContext();

            IEnumerable<DisplayGame> games = from o in db.GetGameToDisplay(gameID)
                                             select new DisplayGame
                                               {
                                                   GameDate = o.GameDate,
                                                   AwayTeam = o.AwayTeam,
                                                   HomeTeam = o.HomeTeam,
                                                   AwayScore = o.AwayScore.GetValueOrDefault(-1),
                                                   HomeScore = o.HomeScore.GetValueOrDefault(-1),
                                                   AwayTeamVotes = o.AwayTeamVotes.GetValueOrDefault(0),
                                                   HomeTeamVotes = o.HomeTeamVotes.GetValueOrDefault(0),
                                                   AwayWins = o.AwayWins.GetValueOrDefault(0),
                                                   AwayLosses = o.AwayLosses.GetValueOrDefault(0),
                                                   AwayWinningPercentage = o.AwayWinningPercentage.GetValueOrDefault(0.0),
                                                   HomeWins = o.HomeWins.GetValueOrDefault(0),
                                                   HomeLosses = o.HomeLosses.GetValueOrDefault(0),
                                                   HomeWinningPercentage = o.HomeWinningPercentage.GetValueOrDefault(0.0)
                                               };
            List<DisplayGame> gameList = games.ToList();

            return gameList.First();
        }
    }
}