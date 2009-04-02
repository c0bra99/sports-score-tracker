using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SportsScoreTracker.DataAccessLayer;

namespace SportsScoreTracker.BusinessLogicLayer
{
    public class Comment
    {
        public int ID;
        public int UserID;
        public int GameID;
        public short Type;
        public DateTime Timestamp;
        public string Text;
        
        public Comment() 
        { }
        
        public Comment(int id, int userid, int gameid, short type, DateTime timestamp, string text)
        {
            ID = id;
            UserID = userid;
            GameID = gameid;
            Type = type;
            Timestamp = timestamp;
            Text = text;
        }

        public static List<Comment> GetCommentsByGameID(int gameID)
        {
            SportsTrackerDBDataContext db = new SportsTrackerDBDataContext();

            IEnumerable<Comment> comments = from c in db.GetCommentsByGameID(gameID)
                                            select new Comment
                                            {
                                                ID = c.ID,
                                                UserID = c.UserID,
                                                GameID = c.GameID,
                                                Type = (short)c.Type,
                                                Timestamp = c.Timestamp,
                                                Text = c.Text
                                            };
            return (List<Comment>)comments;
        }
    }
}
