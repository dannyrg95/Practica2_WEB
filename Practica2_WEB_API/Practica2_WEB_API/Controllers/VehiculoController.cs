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
        public async Task<IActionResult> ConsultarVehiculos(string cedulaVendedor = null, string nombreVendedor = null, string marca = null, string modelo = null)
        {
            using (var context = new SqlConnection("Server=LIED95\\SQLEXPRESS;Database=Practica2;Trusted_Connection=True;TrustServerCertificate=True"))
            {
                try
                {
                    var parameters = new DynamicParameters();
                    parameters.Add("@CedulaVendedor", cedulaVendedor);
                    parameters.Add("@NombreVendedor", nombreVendedor);
                    parameters.Add("@Marca", marca);
                    parameters.Add("@Modelo", modelo);

                }
                catch (SqlException ex)
                {
                    return StatusCode(500, $"Error SQL: {ex.Message}");
                }
            }
        }
    }
}