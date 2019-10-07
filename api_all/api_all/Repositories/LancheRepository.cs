using api_all.Context;
using api_all.Entities;
using api_all.Repositories.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace api_all.Repositories
{
    public class LancheRepository : ILancheRepository
    {
        private AllDbContext _context;

        public LancheRepository(AllDbContext context)
        {
            _context = context;
        }

        public IEnumerable<LancheEntity> Lanches => throw new NotImplementedException();

        public LancheEntity GetLancheById(Guid Id)
        {
            return _context.Lanches.FirstOrDefault(l => l.Id == Id);
        }
    }
}
