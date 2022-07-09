namespace Hoai_Vitaminhouse.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Newspaper")]
    public partial class Newspaper
    {
        public int NewspaperId { get; set; }

        [Column(TypeName = "ntext")]
        [Required(ErrorMessage = "Tiêu đề tin tức không được để trống!")]
        public string NewspaperTitle { get; set; }

        [Column(TypeName = "ntext")]
        [DataType(DataType.MultilineText)]
        [Required(ErrorMessage = "Chi tiết tin tức không được để trống!")]
        public string NewspaperDescription { get; set; }

        public DateTime NewspaperDate { get; set; }

        [Required(ErrorMessage = "Hình ảnh tin tức không được để trống!")]
        [StringLength(50)]
        public string NewspaperImage { get; set; }
    }
}
