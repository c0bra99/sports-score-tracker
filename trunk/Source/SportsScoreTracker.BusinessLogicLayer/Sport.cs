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


        /// <summary>
        /// saves the new / updated sport info to the database
        /// </summary>
        public void Save()
        {
            SportsTrackerDBDataContext db = new SportsTrackerDBDataContext();

            if (this.ID == -1) //new sport, need to insert
            {
                db.Sport_Insert(this.Name);
            }
            else //old sport, need to update
            {
                db.Sport_Update(this.ID, this.Name);
            }
        }
    }
}
