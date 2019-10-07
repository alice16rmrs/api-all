using System;
using System.Net;
using System.Threading.Tasks;
using api_all.Dto;
using api_all.Repositories.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace api_all.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        [HttpPost]
        public async Task<object> Login([FromBody] LoginDto login, [FromServices] ILoginService service)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            if(login == null)
            {
                return BadRequest();
            }
            try
            {
                var result = await service.FindByLogin(login);
                if(result != null)
                {
                    return Ok(result);
                }
                else
                {
                    return NotFound();
                }
            }
            catch (ArgumentException e)
            {
                return StatusCode((int)HttpStatusCode.InternalServerError, e.Message);
            }
        }
    }
}