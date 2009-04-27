using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SportsScoreTracker.DataAccessLayer;

namespace SportsScoreTracker.BusinessLogicLayer
{
    public class Comment
    {
        /// <summary>
        /// The different categories a comment can belong to
        /// </summary>
        public enum Category
        {
            All = 0,
            Injury = 1,
            Score = 2,
            Random = 3
        }


        public int ID;
        public int UserID;
        public int GameID;
        public short Type;
        public DateTime Timestamp;
        public string Text;
        
        public Comment() 
        { }
        

        /// <summary>
        /// Constructor taking all parameters
        /// </summary>
        public Comment(int id, int userid, int gameid, short type, DateTime timestamp, string text)
        {
            ID = id;
            UserID = userid;
            GameID = gameid;
            Type = type;
            Timestamp = timestamp;
            Text = text;
        }


        /// <summary>
        /// Gets the comments for a single game
        /// </summary>
        public static List<DisplayComment> GetCommentsByGameID(int gameID)
        {
            SportsTrackerDBDataContext db = new SportsTrackerDBDataContext();

            IEnumerable<DisplayComment> comments = from o in db.GetCommentsByGameID(gameID)
                                            select new DisplayComment
                                            {
                                                CommentID = o.CommentID,
                                                UserName = o.FirstName,
                                                Type = o.Type.GetValueOrDefault(-1),
                                                Timestamp = o.Timestamp,
                                                Text = o.Text
                                            };
            return comments.ToList();
        }


        /// <summary>
        /// Deletes this comment
        /// </summary>
        public void Delete()
        {
            Delete(this.ID);
        }


        /// <summary>
        /// Deletes a comment given the comment ID
        /// </summary>
        public static void Delete(int commentID)
        {
            SportsTrackerDBDataContext db = new SportsTrackerDBDataContext();
            db.Comment_Delete(commentID);
        }

    }
}
