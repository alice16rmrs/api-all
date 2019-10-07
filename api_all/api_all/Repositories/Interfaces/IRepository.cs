using api_all.Entities;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace api_all.Repositories.Interfaces
{
    public interface IRepository<T> where T: BaseEntity
    {
        Task<T> InsertAsync(T item);
        Task<T> UpdatetAsync(T item);
        Task<bool> DeletetAsync(Guid Id);
        Task<T> SelectAsync(Guid Id);
        Task<IEnumerable<T>> SelectAsync();
        Task<bool> ExistAsync(Guid Id);
    }
}
