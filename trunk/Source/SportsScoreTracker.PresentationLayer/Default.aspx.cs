using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportsScoreTracker.BusinessLogicLayer;

namespace SportsScoreTracker.PresentationLayer
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //http://dotnetslackers.com/XLinq/re-53956_Creating_a_3_tier_application_using_LINQ.aspx
            //http://www.hurricanesoftwares.com/developing-3-tier-application-in-csharp-using-linq/
            //http://www.codeproject.com/KB/aspnet/SaltAndPepper.aspx
            //http://weblogs.asp.net/scottgu/archive/2007/05/29/linq-to-sql-part-2-defining-our-data-model-classes.aspx
            //http://ajdotnet.wordpress.com/2008/04/20/linq-to-sql-reality-check/


            List<Comment> comments = Comment.GetCommentsByGameID(0);
        }
    }
}
