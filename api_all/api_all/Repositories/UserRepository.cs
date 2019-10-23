using api_all.Context;
using api_all.Entities;
using api_all.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;

namespace api_all.Repositories
{
    public class UserRepository : Repository<UserEntity>, IUserRepository
    {
        private DbSet<UserEntity> _dataset;
        public UserRepository(AllDbContext contex) : base(contex)
        {
            _dataset = contex.Set<UserEntity>();
        }
        public async Task<UserEntity> FindByLogin(string login, string senha)
        {
            return await _dataset.FirstOrDefaultAsync(u => u.Login.Equals(login) && u.Senha.Equals(senha));
        }
    }
}
