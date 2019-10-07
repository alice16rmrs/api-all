using api_all.Entities;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace api_all.Repositories.Interfaces
{
    public interface IUserService
    {
        Task<UserEntity> Get(Guid Id);
        Task<IEnumerable<UserEntity>> GetAll ();
        Task<UserEntity> Post(UserEntity user);
        Task<UserEntity> Put(UserEntity user);
        Task<bool> Delete(Guid Id);
    }
}
