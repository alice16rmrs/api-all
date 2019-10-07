using System.Collections.Generic;

namespace api_all.Entities
{
    public class Pedido : BaseEntity
    {

        public List<PedidoDetalhe> PedidoItens { get; set; }


    }
}
