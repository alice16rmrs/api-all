using api_all.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace api_all.Repositories.Interfaces
{
    public interface IUserRepository : IRepository<UserEntity>
    {

        Task<UserEntity> FindByLogin(string login, string senha);
    }
}
