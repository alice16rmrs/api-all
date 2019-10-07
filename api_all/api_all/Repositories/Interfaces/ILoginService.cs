using api_all.Dto;
using System.Threading.Tasks;

namespace api_all.Repositories.Interfaces
{
    public interface ILoginService
    {
        Task<object> FindByLogin(LoginDto login);
    }
}
