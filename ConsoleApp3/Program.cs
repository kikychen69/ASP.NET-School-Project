using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Data.Entity.Validation;

namespace ConsoleApp3
{
    class Program
    {
        static Mybooks shop;

        static int Name2Cat(string cat)
        {
            List<Category> result = shop.Categories.Where
                     (c => c.Name.Equals(cat)).ToList<Category>();
            if (result.Count == 0)
            {
                Category c = new Category { Name = cat };
                shop.Categories.Add(c);
                shop.SaveChanges();
                return c.CategoryID;
            }
            else
                return result[0].CategoryID;
        }

        static void Main(string[] args)
        {
            using (shop = new Mybooks())

            {
                int k = 1;
                StreamReader r = new StreamReader("books.txt");
                string line;
                while ((line = r.ReadLine()) != null)
                {
                    string title = line;
                    string cat = r.ReadLine();
                    string isbn = r.ReadLine();
                    string author = r.ReadLine();
                    string price = r.ReadLine();
                    string description = r.ReadLine();
                    r.ReadLine();
                    Console.WriteLine("{0}/{1}", isbn, title);
                    Book b = new Book
                    {
                        Title = title,
                        CategoryID = Name2Cat(cat),
                        ISBN = isbn,
                        Author = author,
                        Price = Decimal.Parse(price),
                        Stock = 10,
                        Description = description
                    };
                    try
                    {
                        shop.Books.Add(b);
                        shop.SaveChanges();
                    }
                    catch (Exception e)
                    {
                        foreach (DbEntityValidationResult v in shop.GetValidationErrors())
                            foreach (DbValidationError err in v.ValidationErrors)
                                Console.WriteLine("{0}/{1}", err.ErrorMessage,
                                                             err.PropertyName);
                    }
                }
                r.Close();
            }
        }
    }
}
