using api_all.Repositories.Interfaces;
using System;
using System.Collections.Generic;
using api_all.Entities;
using System.Threading.Tasks;
using api_all.Context;
using Microsoft.EntityFrameworkCore;

namespace api_all.Repositories
{
    public class Repository<T> : IRepository<T> where T : BaseEntity
    {
        protected readonly AllDbContext _context;

        private DbSet<T> _dataset;

        public Repository(AllDbContext context)
        {
            _context = context;
            _dataset = _context.Set<T>();
        }
        public async Task<bool> DeletetAsync(Guid Id)
        {
            try
            {
                var result = await _dataset.SingleOrDefaultAsync(p => p.Id.Equals(Id));
                if (result == null)
                    return false;

                _dataset.Remove(result);
                await _context.SaveChangesAsync();
                return true;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public async Task<T> InsertAsync(T item)
        {
            try
            {
                if(item.Id == Guid.Empty)
                {
                    item.Id = Guid.NewGuid();
                }

                item.CreateAt = DateTime.UtcNow;
                _dataset.Add(item);

                await _context.SaveChangesAsync();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return item;
        }

        public async Task<IEnumerable<T>> SelectAsync()
        {
            try
            {
                return await _dataset.ToListAsync();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<bool> ExistAsync(Guid Id)
        {
            return await _dataset.AnyAsync(p => p.Id.Equals(Id));
        }


        public async Task<T> SelectAsync(Guid Id)
        {
            try
            {
                return await _dataset.SingleOrDefaultAsync(p => p.Id.Equals(Id));
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<T> UpdatetAsync(T item)
        {
            try
            {
                var result = await _dataset.SingleOrDefaultAsync(p => p.Id.Equals(item.Id));
                if(result == null)
                    return null;
                item.UpdateAt = DateTime.UtcNow;
                item.CreateAt = result.CreateAt;

                _context.Entry(result).CurrentValues.SetValues(item);
                await _context.SaveChangesAsync();
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return item;
        }

    }
}
