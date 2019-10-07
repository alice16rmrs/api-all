using System.ComponentModel.DataAnnotations;

namespace api_all.Entities
{
    public class LancheEntity : BaseEntity
    {
        
        [Required]
        [StringLength(45)]
        public string Nome { get; set; }

        [Required]
        [MaxLength(80)]
        public string Descricao { get; set; }

        [Required]
        public decimal Preco { get; set; }

        [StringLength(200)]
        public string ImagemUrl { get; set; }

        [StringLength(200)]
        public string ImagemThumbnailUrl { get; set; }
    }
}
