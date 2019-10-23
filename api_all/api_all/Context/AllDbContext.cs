using api_all.Entities;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace api_all.Context
{
    public class AllDbContext : IdentityDbContext<IdentityUser>
    {
        public AllDbContext(DbContextOptions<AllDbContext> options) : base(options)
        { }

        public DbSet<LancheEntity> Lanches { get; set; }
        public DbSet<UserEntity> Usuarios { get; set; }
        public DbSet<CarrinhoCompraItem> CarrinhoCompraItens { get; set; }
        public DbSet<Pedido> Pedidos { get; set; }
        public DbSet<PedidoDetalhe> PedidoDetalhes { get; set; }

    }
}
