namespace Hoai_Vitaminhouse.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Order")]
    public partial class Order
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Order()
        {
            OrderDetails = new HashSet<OrderDetail>();
        }

        [Key]
        public int OrderId { get; set; }

        //Dòng này là ??nh d?ng ch? hi?n th? ki?u ngày mà không hi?n th? th?i gian
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        public DateTime OrderDate { get; set; }

        [Required(ErrorMessage = "Địa chỉ giao hàng không được để trống!")]
        [StringLength(255)]
        public string OrderAddress { get; set; }

        public int OrderStatus { get; set; }

        [Required(ErrorMessage = "Họ và tên người nhận không được để trống!")]
        [StringLength(100)]
        public string OrderRecipientName { get; set; }

        [RegularExpression(@"^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$",
                  ErrorMessage = "Phải đúng định dạng số điện thoại! ")]
        [Required(ErrorMessage = "Số điện thoại người nhận không được để trống")]
        [StringLength(15)]
        public string OrderRecipientPhone { get; set; }

        [Required]
        [Column(TypeName = "money")]
        public decimal OrderTotalMoney { get; set; }

        [Column(TypeName = "ntext")]
        public string OrderNotes { get; set; }

        public int AccountId { get; set; }

        public virtual Account Account { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
}
