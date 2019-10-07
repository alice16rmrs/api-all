using System.ComponentModel.DataAnnotations;

namespace api_all.Entities
{
    public class CarrinhoCompraItem : BaseEntity
    {
        public LancheEntity Lanche { get; set; }
        public int Quantidade { get; set; }
        [StringLength(200)]
        public string CarrinhoCompraId { get; set; }
    }
}
