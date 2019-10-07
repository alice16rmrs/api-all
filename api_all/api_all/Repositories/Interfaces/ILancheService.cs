using api_all.Entities;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace api_all.Repositories.Interfaces
{
    public interface ILancheService
    {
        Task<LancheEntity> Get(Guid Id);
        Task<IEnumerable<LancheEntity>> GetAll();
        Task<LancheEntity> Post(LancheEntity lanche);
        Task<LancheEntity> Put(LancheEntity lanche);
        Task<bool> Delete(Guid Id);
    }
}
