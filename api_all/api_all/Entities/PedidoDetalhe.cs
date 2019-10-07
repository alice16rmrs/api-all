using System;

namespace api_all.Entities
{
    public class PedidoDetalhe : BaseEntity
    {
        public Guid PedidoId { get; set; }
        public Guid LancheId { get; set; }
        public int Quantidade { get; set; }
        public decimal Preco { get; set; }
        public virtual LancheEntity Lanche { get; set; }
        public virtual Pedido Pedido { get; set; }
    }
}
