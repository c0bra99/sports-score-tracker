using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SportsScoreTracker.DataAccessLayer;

namespace SportsScoreTracker.BusinessLogicLayer
{
    public class Sport
    {
        public int ID;
        public string Name;
        
        /// <summary>
        /// Default constructor
        /// </summary>
        public Sport() 
        { }
        

        /// <summary>
        /// Constructor taking all parameters
        /// </summary>
        public Sport(int id, string name)
        {
            ID = id;
            Name = name;
        }


        /// <summary>
        /// Gets all the sports currently known to the system
        /// </summary>
        public static List<Sport> GetSports()
        {
            SportsTrackerDBDataContext db = new SportsTrackerDBDataContext();

            IEnumerable<Sport> sports = from c in db.GetSports()
                                            select new Sport
                                            {
                                                ID = c.ID,
                                                Name = c.Name
                                            };
            return sports.ToList();
        }
    }
}
