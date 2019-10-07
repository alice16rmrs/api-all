using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using api_all.Entities;

namespace api_all.Repositories.Interfaces
{
    public class UserService : IUserService
    {
        private IRepository<UserEntity> _repository;

        public UserService(IRepository<UserEntity> repository)
        {
            _repository = repository;
        }
        public async Task<bool> Delete(Guid Id)
        {
            return await _repository.DeletetAsync(Id);
        }

        public async Task<UserEntity> Get(Guid Id)
        {
            return await _repository.SelectAsync(Id);
        }

        public async Task<IEnumerable<UserEntity>> GetAll()
        {
           return await _repository.SelectAsync();
        }

        public async Task<UserEntity> Post(UserEntity user)
        {
            return await _repository.InsertAsync(user);
        }

        public async Task<UserEntity> Put(UserEntity user)
        {
            return await _repository.UpdatetAsync(user);
        }
    }
}
