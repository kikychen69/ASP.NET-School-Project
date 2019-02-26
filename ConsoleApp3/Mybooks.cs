namespace ConsoleApp3
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class Mybooks : DbContext
    {
        public Mybooks()
            : base("name=Mybooks")
        {
        }

        public virtual DbSet<Book> Books { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<OrderDetail> OrderDetails { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<UserCart> UserCarts { get; set; }
        public virtual DbSet<UserTable> UserTables { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Book>()
                .Property(e => e.Title)
                .IsUnicode(false);

            modelBuilder.Entity<Book>()
                .Property(e => e.ISBN)
                .IsUnicode(false);

            modelBuilder.Entity<Book>()
                .Property(e => e.Author)
                .IsUnicode(false);

            modelBuilder.Entity<Book>()
                .Property(e => e.Description)
                .IsUnicode(false);

            modelBuilder.Entity<Category>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<UserTable>()
                .Property(e => e.FirstName)
                .IsUnicode(false);

            modelBuilder.Entity<UserTable>()
                .Property(e => e.LastName)
                .IsUnicode(false);

            modelBuilder.Entity<UserTable>()
                .Property(e => e.PhoneNo)
                .IsUnicode(false);

            modelBuilder.Entity<UserTable>()
                .Property(e => e.PostalCode)
                .IsUnicode(false);

            modelBuilder.Entity<UserTable>()
                .Property(e => e.Address)
                .IsUnicode(false);

            modelBuilder.Entity<UserTable>()
                .Property(e => e.Email)
                .IsUnicode(false);
        }
    }
}
