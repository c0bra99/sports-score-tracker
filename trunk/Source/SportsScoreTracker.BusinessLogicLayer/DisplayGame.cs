using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SportsScoreTracker.BusinessLogicLayer
{
    /// <summary>
    /// A class to hold the stuff that will be displayed with a game
    /// </summary>
    public class DisplayGame
    {
        public DateTime GameDate;
        public string AwayTeam;
        public string HomeTeam;
        public int AwayScore;
        public int HomeScore;
        public int AwayTeamVotes;
        public int HomeTeamVotes;
        public int AwayWins;
        public int AwayLosses;
        public double AwayWinningPercentage;
        public int HomeWins;
        public int HomeLosses;
        public double HomeWinningPercentage;
    }
}
