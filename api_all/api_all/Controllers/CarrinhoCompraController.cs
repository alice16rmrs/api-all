using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using api_all.Dto;
using api_all.Entities;
using api_all.Repositories.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace api_all.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CarrinhoCompraController : ControllerBase
    {
        private readonly ILancheRepository _lancheRepository;
        private readonly CarrinhoCompra _carrinhoCompra;

        public CarrinhoCompraController(ILancheRepository lancheRepository, CarrinhoCompra carrinhoCompra)
        {
            _lancheRepository = lancheRepository;
            _carrinhoCompra = carrinhoCompra;
        }
        [HttpGet]
        public ActionResult GetCarrinho()
        {
            try
            {
                var itens = _carrinhoCompra.GetCarrinhoCompraItens();
                _carrinhoCompra.CarrinhoCompraItens = itens;

                var carrinhoCompraDto = new CarrinhoCompraDto
                {
                    CarrinhoCompra = _carrinhoCompra,
                    CarrinhoCompraTotal = _carrinhoCompra.GetCarrinhoCompraTotal()
                };

                return Ok(carrinhoCompraDto);

            }
            catch (ArgumentException e)
            {
                return StatusCode((int)HttpStatusCode.InternalServerError, e.Message);
            }
        }

        [HttpPost]
        public ActionResult AdicionarCarrinho(Guid Id)
        {
            try
            {
                var lancheSelecionado = _lancheRepository.Lanches.FirstOrDefault(p => p.Id == Id);

                if (lancheSelecionado != null)
                {
                    _carrinhoCompra.AdicionarAoCarrinho(lancheSelecionado, 1);
                }
                return null;
            }
            catch (ArgumentException e)
            {
                return StatusCode((int)HttpStatusCode.InternalServerError, e.Message);
            }
        }
        [HttpDelete("{id}")]
        public ActionResult RemoverItemDoCarrinhoCompra(Guid Id)
        {
            try
            {
                 var lancheSelecionado = _lancheRepository.Lanches.FirstOrDefault(p => p.Id == Id);
                            if (lancheSelecionado != null)
                            {
                               _carrinhoCompra.RemoverDoCarrinho(lancheSelecionado);
                            }
                return null;
            }
            catch (ArgumentException e)
            {
                return StatusCode((int)HttpStatusCode.InternalServerError, e.Message);
            }
           
        }
    }
}