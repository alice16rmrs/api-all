using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace api_all.Entities
{
    [Table("CarrinhoCompraItens")]
    public class CarrinhoCompraItem
    {
        public int CarrinhoCompraItemId { get; set; }
        public LancheEntity Lanche { get; set; }
        public int Quantidade { get; set; }
        [StringLength(100)]
        public string CarrinhoCompraId { get; set; }
    }
}
