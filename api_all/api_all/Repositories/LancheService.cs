using api_all.Entities;
using api_all.Repositories.Interfaces;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace api_all.Repositories
{
    public class LancheService : ILancheService
    {
        private IRepository<LancheEntity> _repository;

        public LancheService(IRepository<LancheEntity> repository)
        {
            _repository = repository;
        }
        public async Task<bool> Delete(Guid Id)
        {
            return await _repository.DeletetAsync(Id);
        }

        public async Task<LancheEntity> Get(Guid Id)
        {
            return await _repository.SelectAsync(Id);
        }

        public async Task<IEnumerable<LancheEntity>> GetAll()
        {
            return await _repository.SelectAsync();
        }

        public async Task<LancheEntity> Post(LancheEntity lanche)
        {
            return await _repository.InsertAsync(lanche);
        }

        public async Task<LancheEntity> Put(LancheEntity lanche)
        {
            return await _repository.UpdatetAsync(lanche);
        }
    }
}
