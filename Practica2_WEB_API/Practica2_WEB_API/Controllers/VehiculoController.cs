using Dapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Practica2_WEB_API.Entities;

namespace Practica2_WEB_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VehiculoController : ControllerBase
    {
        [HttpPost]
        [Route("RegistrarVehiculos")]

        public async Task<IActionResult> RegistrarVehiculos(Vehiculo ent)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection("Server=LIED95\\SQLEXPRESS;Database=Practica2;Trusted_Connection=True;TrustServerCertificate=True"))
            {
                var result = await context.ExecuteAsync("RegistrarVehiculo", new { ent.Marca, ent.Modelo, ent.Color, ent.Precio, ent.IdVendedor }, commandType: System.Data.CommandType.StoredProcedure);

                if (result > 0)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "El vehiculo fue registrado exitosamente";
                    resp.Contenido = true;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "Error al registrar más de dos vehiculos de la misma marca";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }

        }

        [HttpGet]
        [Route("ConsultarVehiculos")]
        public async Task<IActionResult> ConsultarVehiculos()
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection("Server=LIED95\\SQLEXPRESS;Database=Practica2;Trusted_Connection=True;TrustServerCertificate=True"))
            {
                var result = await context.QueryAsync<Vehiculo>("ConsultarVehiculos", 
                    new {  },
            commandType: System.Data.CommandType.StoredProcedure);

                if (result.Count() > 0)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "Ok";
                    resp.Contenido = result;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "Este vehiculo no se encuentra registrado";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }
    }
}