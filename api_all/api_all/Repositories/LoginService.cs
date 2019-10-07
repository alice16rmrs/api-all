using api_all.Dto;
using api_all.Entities;
using api_all.Repositories.Interfaces;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace api_all.Repositories
{
    public class LoginService : ILoginService
    {
        private IUserRepository _repository;
        private IConfiguration _configuration;

        public LoginService(IUserRepository userRepository, IConfiguration configuration)
        {
            _repository = userRepository;
            _configuration = configuration;
        }

        public  async Task<object> FindByLogin(LoginDto login)
        {
            var baseUser = new UserEntity();

            if (login != null && !string.IsNullOrWhiteSpace(login.Login) && !string.IsNullOrWhiteSpace(login.Senha))
            {
                baseUser = await _repository.FindByLogin(login.Login, login.Senha);
                if (baseUser == null)
                {
                    return new
                    {
                        authenticated = false,
                        mesagge = "Falha ao autenticar"
                    };
                }
                else
                {
                    var claims = new[]
                    {
                     new Claim(ClaimTypes.Name, login.Login)
                    };

                    //recebe uma instancia da classe SymmetricSecurityKey 
                    //armazenando a chave de criptografia usada na criação do token
                    var key = new SymmetricSecurityKey(
                                Encoding.UTF8.GetBytes(_configuration["SecurityKey"]));

                    //recebe um objeto do tipo SigninCredentials contendo a chave de 
                    //criptografia e o algoritmo de segurança empregados na geração 
                    // de assinaturas digitais para tokens
                    var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

                    var token = new JwtSecurityToken(
                         issuer: "all.com",
                         audience: "all.com",
                         claims: claims,
                         expires: DateTime.Now.AddMinutes(30),
                         signingCredentials: creds);

                    return new
                    {
                        token = new JwtSecurityTokenHandler().WriteToken(token)
                    };
                }
            }
            else
            {
                return null;
            }
        }
    }
}
