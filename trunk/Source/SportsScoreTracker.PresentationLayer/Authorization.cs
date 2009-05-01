using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SportsScoreTracker.PresentationLayer
{
    public class Authorization
    {
        /// <summary>
        /// The different types of authorization levels in our system.
        /// </summary>
        public enum AuthorizationLevel
        {
            RegisteredUser,
            Administrator,
            Guest
        }


        /// <summary>
        /// Authorizes a user
        /// </summary>
        /// 
        /// <param name="authLevel">This should be the minimum authorization level required for the page</param>
        public static void Authorize(System.Web.UI.Page page, AuthorizationLevel authLevel)
        {
            if (page.Master != null && page.Master is MasterPage)
            {
                MasterPage master = (MasterPage)page.Master;
                if (authLevel == AuthorizationLevel.Administrator)
                {
                    if (!master.IsAdminLoggedIn())
                    {
                        master.GoHome();
                    }
                }
                else if (authLevel == AuthorizationLevel.RegisteredUser)
                {
                    if (!master.IsLoggedIn())
                    {
                        master.GoHome();
                    }
                }
                //Anyone can view Guest level
            }
        }
    }
}
