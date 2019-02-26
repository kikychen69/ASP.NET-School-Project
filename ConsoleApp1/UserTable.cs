namespace ConsoleApp1
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("UserTable")]
    public partial class UserTable
    {
        [Key]
        public int UserID { get; set; }

        [Required]
        [StringLength(64)]
        public string FirstName { get; set; }

        [Required]
        [StringLength(64)]
        public string LastName { get; set; }

        [Required]
        [StringLength(22)]
        public string PhoneNo { get; set; }

        [Required]
        [StringLength(22)]
        public string PostalCode { get; set; }

        [Required]
        [StringLength(120)]
        public string Address { get; set; }

        [Required]
        [StringLength(120)]
        public string Email { get; set; }
    }
}
