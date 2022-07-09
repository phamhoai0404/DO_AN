namespace Hoai_Vitaminhouse.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Account")]
    public partial class Account
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Account()
        {
            Orders = new HashSet<Order>();
        }

        [Key]
        public int AccountId { get; set; }

        [Required(ErrorMessage = "Họ tên không được để trống!")]
        [DisplayName("Họ tên")]
        [StringLength(100)]
        public string AccountName { get; set; }

        [Required(ErrorMessage = "Mật khẩu không được để trống!")]
        [StringLength(30, MinimumLength = 3, ErrorMessage = "Tối thiểu 3 kí tự,Tối đa 30 kí tự")]
        [DisplayName("Mật Khẩu"), DataType(DataType.Password)]
        public string AccountPassword { get; set; }

        [DisplayName("Quyền")]
        public int AccountRole { get; set; }

        public bool AccountStatus { get; set; }



        [Required(ErrorMessage = "Email không được để trống!")]
        [StringLength(100)]
        [RegularExpression("^[a-zA-Z0-9_\\.-]+@([a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$", ErrorMessage = "Phải đúng định dạng email!")]
        public string AccountEmail { get; set; }



        [Required(ErrorMessage = "Số điện thoại không được để trống!")]

        [DisplayName("Số điện thoại")]
        [RegularExpression(@"^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$",
                   ErrorMessage = "Phải đúng định dạng số điện thoại! ")]
        [StringLength(10)]
        public string AccountPhone { get; set; }



        [StringLength(255)]
        public string AccountAddress { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Order> Orders { get; set; }
    }
}
