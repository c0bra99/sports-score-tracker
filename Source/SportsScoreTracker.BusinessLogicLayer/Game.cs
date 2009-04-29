using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SportsScoreTracker.DataAccessLayer;

namespace SportsScoreTracker.BusinessLogicLayer
{
    /// <summary>
    /// Class for an instance of a game
    /// </summary>
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
        /// Constructor for a NEW game
        /// </summary>
        public Game(int hometeamid, int awayteamid, DateTime date, int homescore, int awayscore)
        {
            ID = -1;
            HomeTeamID = hometeamid;
            AwayTeamID = awayteamid;
            Date = date;
            HomeScore = homescore;
            AwayScore = awayscore;
        }


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


        /// <summary>
        /// Gets a game to display to the user
        /// </summary>
        public static Game GetGame(int gameID)
        {
            SportsTrackerDBDataContext db = new SportsTrackerDBDataContext();

            IEnumerable<Game> games = from o in db.Game_Select(gameID)
                                         select new Game
                                         { 
                                             ID = o.ID,
                                             HomeTeamID = o.HomeTeamID,
                                             AwayTeamID = o.AwayTeamID,
                                             Date = o.Date,
                                             HomeScore = o.HomeScore.GetValueOrDefault(-1),
                                             AwayScore = o.AwayScore.GetValueOrDefault(-1)
                                         };
            List<Game> gameList = games.ToList();

            return gameList.First();
        }


        /// <summary>
        /// Deletes this Game
        /// </summary>
        public void Delete()
        {
            Delete(this.ID);
        }


        /// <summary>
        /// Deletes a game given the game ID
        /// </summary>
        public static void Delete(int gameID)
        {
            SportsTrackerDBDataContext db = new SportsTrackerDBDataContext();
            db.Game_Delete(gameID);
        }


        /// <summary>
        /// Saves the new / updated Game info to the database
        /// </summary>
        public void Save()
        {
            SportsTrackerDBDataContext db = new SportsTrackerDBDataContext();

            if (this.ID == -1) //new game, need to insert
            {
                db.Game_Insert(this.HomeTeamID, this.AwayTeamID, this.Date, this.HomeScore, this.AwayScore);
            }
            else //old game, need to update
            {
                db.Game_Update(this.ID, this.HomeTeamID, this.AwayTeamID, this.Date, this.HomeScore, this.AwayScore);
            }
        }


        /// <summary>
        /// Gets the games for a single team
        /// </summary>
        public static List<Game> GetGamesByTeamID(int teamID, bool homeOnly, bool awayOnly)
        {
            SportsTrackerDBDataContext db = new SportsTrackerDBDataContext();

            IEnumerable<Game> games = from o in db.GetGamesByTeamID(teamID, homeOnly, awayOnly)
                                      select new Game
                                      {
                                          ID = o.ID, 
                                          AwayScore = o.AwayScore.GetValueOrDefault(-1),
                                          HomeScore = o.HomeScore.GetValueOrDefault(-1),
                                          AwayTeamID = o.AwayTeamID,
                                          HomeTeamID = o.HomeTeamID, 
                                          Date = o.Date
                                      };
            return games.ToList();
        }
    }
}