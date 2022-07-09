namespace Hoai_Vitaminhouse.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Product")]
    public partial class Product
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Product()
        {
            OrderDetails = new HashSet<OrderDetail>();
        }

        [Key]
        public int ProductId { get; set; }

        [Required(ErrorMessage = "Tên sản phẩm không được để trống!")]
        [StringLength(100)]
        public string ProductName { get; set; }

        [Required(ErrorMessage = "Ảnh của sản phẩm không được để trống!")]
        [StringLength(50)]
        public string ProductImage { get; set; }

        [Required(ErrorMessage = "Đơn vị sản phẩm không được để trống!")]
        [StringLength(50)]
        public string ProductUnit { get; set; }

        [Required(ErrorMessage = "Tên nhà cung cấp không được để trống!")]
        [StringLength(100)]
        public string ProductProviders { get; set; }

        [Required(ErrorMessage = "Giá tiền của sản phẩm không được để trống!")]
        [Column(TypeName = "money")]
        [Range(0, Double.PositiveInfinity, ErrorMessage = "Gía tiền không thể nhỏ hơn 0")]
        public decimal ProductPrice { get; set; }

        [Required(ErrorMessage = "Số lượng sản phẩm không được để trống!")]
        public int ProductNumber { get; set; }

        [Column(TypeName = "ntext")]
        [DataType(DataType.MultilineText)]
        public string ProductDescription { get; set; }

        [Range(0, 100, ErrorMessage ="Phần trăm giảm giá nằm từ khoảng >=0 hoặc <=100" )]
        public double? ProductDiscount { get; set; }

        public int CategoryId { get; set; }

        public virtual Category Category { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
}
