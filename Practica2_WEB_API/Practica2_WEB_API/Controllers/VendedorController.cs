using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Practica2_WEB_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VendedorController : ControllerBase
    {
        [HttpPost]
        [Route("RegistrarVendedores")]
        public IActionResult RegistrarVendedores()
        {
            return Ok();
        }
    }
}
