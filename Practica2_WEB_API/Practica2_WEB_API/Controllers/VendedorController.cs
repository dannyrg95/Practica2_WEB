using Dapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Practica2_WEB_API.Entities;

namespace Practica2_WEB_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VendedorController : ControllerBase
    {
        [HttpPost]
        [Route("RegistrarVendedores")]
        public async Task <IActionResult> RegistrarVendedores(Vendedor ent)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection("Server=LIED95\\SQLEXPRESS;Database=Practica2;Trusted_Connection=True;TrustServerCertificate=True")) 
            {
                var result = await context.ExecuteAsync("RegistrarVendedor", new { ent.Cedula, ent.Nombre, ent.Correo }, commandType: System.Data.CommandType.StoredProcedure);

                if (result > 0)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "El vendedor fue registrado exitosamente";
                    resp.Contenido = true;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "La informacion del vendedor ya se encuentra registrada";
                    resp.Contenido = false;
                    return Ok(resp);
                }
                    
            }
            
        }
    }
}
