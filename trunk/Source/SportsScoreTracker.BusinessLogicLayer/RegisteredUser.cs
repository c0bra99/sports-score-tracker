using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SportsScoreTracker.DataAccessLayer;
using System.Net.Mail;
using System.Text.RegularExpressions;

namespace SportsScoreTracker.BusinessLogicLayer
{
    public class RegisteredUser
    {
        public int ID;
        public string Email;
        public string FirstName;
        public string LastName;
        public string Password;
        public bool IsAdmin;

        /// <summary>
        /// Default constructor
        /// </summary>
        public RegisteredUser()
        { }


        /// <summary>
        /// Constructor taking all parameters for a new user
        /// </summary>
        public RegisteredUser(string email, string firstname, string lastname, string password, bool isadmin)
        {
            ID = -1; //new user
            Email = email;
            FirstName = firstname;
            LastName = lastname;
            Password = password;
            IsAdmin = isadmin;
        }


        /// <summary>
        /// Constructor taking all parameters
        /// </summary>
        public RegisteredUser(int id, string email, string firstname, string lastname, string password, bool isadmin)
        {
            ID = id;
            Email = email;
            FirstName = firstname;
            LastName = lastname;
            Password = password;
            IsAdmin = isadmin;
        }


        /// <summary>
        /// Authorizes a user, returns null if not authorized, returns the user if authorization is successful
        /// </summary>
        public static RegisteredUser Authorize(string email, string password)
        {
            //get the MD5 hash of the password before authenticating
            string passwordHash = GetMD5Hash(password);

            SportsTrackerDBDataContext db = new SportsTrackerDBDataContext();

            IEnumerable<RegisteredUser> users = from o in db.AuthorizeUser(email, passwordHash)
                                                select new RegisteredUser   
                                                {
                                                    ID = o.ID,
                                                    Email = o.Email,
                                                    FirstName = o.FirstName,
                                                    LastName = o.LastName,
                                                    Password = o.Password,
                                                    IsAdmin = o.IsAdmin
                                                };

            List<RegisteredUser> userList = users.ToList();
            if (userList.Count > 0)
                return userList[0];
            return null;
        }


        /// <summary>
        /// Determines if the email address is already registered in teh database
        /// </summary>
        public static bool IsEmailRegistered(string email)
        {
            SportsTrackerDBDataContext db = new SportsTrackerDBDataContext();

            IEnumerable<int> emailRegistered = from o in db.CountEmailsRegistered(email)
                                                select o.UsersFoundWithEmailAddress.GetValueOrDefault(0);
            if (emailRegistered.First() > 0)
                return true;
            return false;
        }


        /// <summary>
        /// Gets a MD5 hash for the given string
        /// </summary>
        public static string GetMD5Hash(String input)
        {
            //if the input is null, we cannot hash it
            if (input == null)
                return null;

            // Create a new instance of the MD5CryptoServiceProvider object.
            System.Security.Cryptography.MD5 md5Hasher = System.Security.Cryptography.MD5.Create();

            // Convert the input string to a byte array and compute the hash.
            byte[] data = md5Hasher.ComputeHash(Encoding.Default.GetBytes(input));

            // Create a new Stringbuilder to collect the bytes and create a string.
            StringBuilder sBuilder = new StringBuilder();

            // Loop through each byte of the hashed data and format each one as a hexadecimal string.
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }

            // Return the hexadecimal string.
            return sBuilder.ToString();
        }


        /// <summary>
        /// Saves this user to the database
        /// </summary>
        public void Save()
        {
            SportsTrackerDBDataContext db = new SportsTrackerDBDataContext();

            if (this.ID == -1) //new user, need to insert
            {
                db.RegisteredUser_Insert(this.Email, this.FirstName, this.LastName, this.Password, this.IsAdmin);
            }
            else //old user, need to update
            {
                db.RegisteredUser_Update(this.ID, this.Email, this.FirstName, this.LastName, this.Password, this.IsAdmin);
            }
        }



        /// <summary>
        /// Function that sends an email, does some basic formatting as well. Only sends if something is in the body.
        /// </summary>
        public static void SendEmail(string from, string to, string subject, string body)
        {
            MailMessage email = new MailMessage(from, to, subject, body);
            SmtpClient client = new SmtpClient("mail.test.com");
            
            client.Send(email);
        }


        /// <summary>
        /// Checks if a string is actually an email address
        /// </summary>
        /// 
        /// <param name="stringValue" type = "String">The stringValue to check if it is an email address or not.</param>
        /// 
        /// <returns>Boolean true/false</returns>
        public static bool IsEmailAddress(string stringValue)
        {
            Regex emailregex = new Regex(@"^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$", RegexOptions.IgnoreCase);
            Match match = emailregex.Match(stringValue);

            if (match.Success)
                return true;
            return false;
        }


        /// <summary>
        /// Checks to make sure the password is secure according to the password 
        /// Complexity policy. (>= 8 length, has numbers or letters, and has special character)
        /// </summary>
        public static bool IsPasswordSecure(string password)
        {
            if (string.IsNullOrEmpty(password) || password.Length < 8)
            {
                return false;
            }
            else
            {
                bool hasChar = false;
                bool hasNum = false;
                bool hasSpecChar = false;

                foreach (char c in password)
                {
                    if (char.IsLetter(c))
                    {
                        hasChar = true;
                    }
                    else if (char.IsNumber(c))
                    {
                        hasNum = true;
                    }
                    else
                    {
                        //if its not a number, and not a letter, than must be special character
                        hasSpecChar = true;
                    }
                    if ((hasChar || hasNum) && hasSpecChar)
                        return true;
                }
            }
            return false;
        }


        /// <summary>
        /// Resets and emails the user their new password, also returns the new password
        /// </summary>
        public static bool ResetPassword(string userEmail)
        {
            if (!RegisteredUser.IsEmailRegistered(userEmail))
            {
                return false;
            }

            string newPassword = null;

            //purposely leaving out IL0O as they look too similiar
            string allowedChars = "ABCDEFGHJKMNPQRSTUVWXYZ123456789-!?@$_+#~%*";
            Random rNum = new Random();

            //added these 2 integers to prevent an endless loop if the password policy is never met for some reason.
            int maxSecurePasswordTries = 1024;
            int maxPasswordTry = 0;
            do
            {
                newPassword = string.Empty; //empty the string in case we are having to redo the password b/c of insecure

                for (int i = 0; i < 10; i++)
                {
                    newPassword += allowedChars[rNum.Next(allowedChars.Length)];
                }
                maxPasswordTry++;
            } while (!IsPasswordSecure(newPassword) && maxPasswordTry < maxSecurePasswordTries);
            //make sure the password meets our complexity policies before continuing

            string passHash = GetMD5Hash(newPassword); //Get the MD5 hash of the new password

            SportsTrackerDBDataContext db = new SportsTrackerDBDataContext();
            db.ChangePassword(userEmail, passHash); //change the password in the DB

            SendEmail("PasswordReset@SportsScoreTracker.com", userEmail, "Password Reset Notification", "Your password has been reset\r\nYour new password is: " + newPassword);
     
            return true;
        }
    }
}