using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Team7
{
    public class BusinessLogic
    {
        public static List<Book> ListAllBooks()
        {
            using (Mybooks entities = new Mybooks())
            {
                return entities.Books.ToList<Book>();
            }
        }


        public static List<Category> ListCategories()
        {
            using (Mybooks entities = new Mybooks())
            {
                return entities.Categories.ToList<Category>();
            }
        }

        public static UserTable GetUserIDByUserName(string username)
        {
            using (Mybooks entities = new Mybooks())
            {
                return entities.UserTables.Where(x => x.Username == username).FirstOrDefault();
            }
        }

        public static Book GetBookByID(int bookid)
        {
            using (Mybooks entities = new Mybooks())
            {
                return entities.Books.Where(x => x.BookID == bookid).FirstOrDefault();
            }
        }

        public static List<Book> GetTopBestsellers()
        {
            using (Mybooks entities = new Mybooks())
            {
                return entities.Books.SqlQuery("SELECT * FROM Book WHERE BookID IN(SELECT TOP 4 BookID FROM OrderDetails GROUP BY BookID ORDER BY SUM(Quantity) DESC)").ToList();
            }
        }

        public static List<Book> SearchBooks(int cat, string stitle, string sauthor, string sisbn)
        {
            Mybooks entities = new Mybooks();

            if (cat == 0) //All Categories
            {
                return entities.Books.Where(x => x.Title.Contains(stitle) && x.Author.Contains(sauthor) && x.ISBN.Contains(sisbn)).ToList();
            }
            if (cat == -1) // Search any
            {
                return entities.Books.Where(x => x.Title.Contains(stitle) || x.Author.Contains(sauthor) || x.ISBN.Contains(sisbn)).ToList();
            }
            else
            {
                return entities.Books.Where(x => x.CategoryID == cat && x.Title.Contains(stitle) && x.Author.Contains(sauthor) && x.ISBN.Contains(sisbn)).ToList();
            }
        }

        public static List<Book> SortBooks(int n)
        {
            using (Mybooks entities = new Mybooks())
            {
                switch (n)
                {
                    case 0: return entities.Books.ToList<Book>();
                    case 1: return entities.Books.OrderBy(x => x.Title).ToList<Book>();
                    case 2: return entities.Books.OrderByDescending(x => x.Title).ToList<Book>();
                    case 3: return entities.Books.OrderBy(x => (double)x.Price*(1-(double)x.DiscountPercent)).ToList<Book>();
                    case 4: return entities.Books.OrderByDescending(x => (double)x.Price * (1 - (double)x.DiscountPercent)).ToList<Book>();
                    default: return entities.Books.ToList<Book>();
                }

            }

        }
    }
}