using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SportsScoreTracker.BusinessLogicLayer
{
    /// <summary>
    /// A class to hold the stuff that will be displayed with a comment
    /// </summary>
    public class DisplayComment
    {
        public string UserName;
        public int CommentID;
        public short Type;
        public DateTime Timestamp;
        public string Text;
    }
}
