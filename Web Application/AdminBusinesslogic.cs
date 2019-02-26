using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.ComponentModel;

namespace Team7
{
    public static class AdminBusinesslogic
    {
        public static void AddBook(string title, int categoryID, string iSBN, string author, int stock, decimal price, float discountPercent, bool isDiscount,string description)
        {
            using (Mybooks entities = new Mybooks())
            {
                Book book = new Book
                {
                    Title = title,
                    CategoryID = categoryID,
                    ISBN = iSBN,
                    Author = author,
                    Stock = stock,
                    Price = price,
                    DiscountPercent = discountPercent,
                    IsDiscount = isDiscount,
                    Description = description,
                };
                entities.Books.Add(book);
                entities.SaveChanges();
            }
        }
    
        public static void AddCategory(int bookID,int categoryID,  float discountPercent, bool isDiscount)
        {
            using (Mybooks entities = new Mybooks())
            {
                Book book = new Book
                {
                    BookID=bookID,
                    CategoryID = categoryID,
                    DiscountPercent = discountPercent,
                    IsDiscount = isDiscount,
                };
                entities.Books.Add(book);
                entities.SaveChanges();
            }
        }
        public static void DeleteBook(int bookID)
        {
            using (Mybooks entities = new Mybooks())
            {
                Book book = entities.Books.Where(p => p.BookID == bookID).First<Book>();
                entities.Books.Remove(book);
                entities.SaveChanges();
            }
        }
        public static void EditBook(int bookID,int stock, decimal price, float discountPercent, bool isDiscount)
        {
            using (Mybooks entities = new Mybooks())
            {

                Book book = entities.Books.Where(p => p.BookID == bookID).First<Book>();
                book.Stock = stock;
                book.Price = price;
                book.DiscountPercent = discountPercent;
                book.IsDiscount = isDiscount;
                entities.SaveChanges();
            }
        }
        public static void SaleBook(int categoryID, float discountPercent)
        {
            List < Book > books= new List<Book>();
            using (Mybooks entities = new Mybooks())
            {
                books = entities.Books.Where(p => p.CategoryID == categoryID).ToList<Book>();
                foreach (var bk in books )
                {
                    bk.DiscountPercent = discountPercent;
                    if (discountPercent > 0)
                    {
                        bk .IsDiscount = true;

                    }
                }
                entities.SaveChanges();
            }
        }
        public static List<Book> ListBooksBy(int  bookID)
        {
            using (Mybooks entities =new Mybooks())
            {
                return entities.Books.Where(p => p.BookID == bookID).ToList<Book>();
            }
        }
        public static List<Category> ListCategory()
        {
            using (Mybooks entities=new Mybooks())
            {
                
                return entities.Categories.ToList<Category>();
               
            }
        }
        public static List<Book> ListCategoryBy( int categoryID)
        {
            using (Mybooks entities = new Mybooks())
            {
                return entities.Books.Where(p => p.CategoryID == categoryID).ToList<Book>();
            }
        }
    }
}