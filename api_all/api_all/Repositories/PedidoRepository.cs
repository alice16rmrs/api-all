using api_all.Context;
using api_all.Entities;
using api_all.Repositories.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace api_all.Repositories
{
    public class PedidoRepository : IPedidoRepository
    {
        private  AllDbContext _allDbContext;
        private  CarrinhoCompra _carrinhoCompra;


        public PedidoRepository(AllDbContext appDbContext, CarrinhoCompra carrinhoCompra)
        {
            _allDbContext = appDbContext;
            _carrinhoCompra = carrinhoCompra;
        }

        public void CriarPedido(Pedido pedido)
        {

            _allDbContext.Pedidos.Add(pedido);

            var carrinhoCompraItens = _carrinhoCompra.CarrinhoCompraItens;

            foreach (var carrinhoItem in carrinhoCompraItens)
            {
                var pedidoDetail = new PedidoDetalhe()
                {
                    Quantidade = carrinhoItem.Quantidade,
                    LancheId = carrinhoItem.Lanche.Id,
                    PedidoId = pedido.Id,
                    Preco = carrinhoItem.Lanche.Preco
                };

                _allDbContext.PedidoDetalhes.Add(pedidoDetail);
            }

            _allDbContext.SaveChanges();
        }

    }
}
