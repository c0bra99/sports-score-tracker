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
        
        /// <summary>
        /// Default constructor
        /// </summary>
        public Comment() 
        { }


        /// <summary>
        /// Constructor for a NEW comment
        /// </summary>
        public Comment(int userid, int gameid, short type, DateTime timestamp, string text)
        {
            ID = -1;
            UserID = userid;
            GameID = gameid;
            Type = type;
            Timestamp = timestamp;
            Text = text;
        }


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


        /// <summary>
        /// Saves the new / updated Comment info to the database
        /// </summary>
        public void Save()
        {
            SportsTrackerDBDataContext db = new SportsTrackerDBDataContext();

            if (this.ID == -1) //new comment, need to insert
            {
                db.Comment_Insert(this.UserID, this.GameID, this.Type, this.Timestamp, this.Text);
            }
            else //old comment, need to update
            {
                db.Comment_Update(this.ID, this.UserID, this.GameID, this.Type, this.Timestamp, this.Text);
            }
        }
    }
}
