using Practica2_WEB.Entities;

namespace Practica2_WEB.Models
{

    public class VehiculoModel (HttpClient httpClient) : IVehiculoModel
    {
        public void RegistrarVehiculos(Vehiculo ent)
        {
            using (httpClient)
            {
                string url = "https://localhost:7017/api/Vendedor/RegistrarVehiculos";
                JsonContent body = JsonContent.Create(ent);
                var resp = httpClient.PostAsJsonAsync(url, body).Result;
            }

        }
        public void ConsultarVehiculos(Vehiculo ent)
        {
            using (httpClient)
            {
                string url = "https://localhost:7017/api/Vendedor/ConsultarVehiculos";
                JsonContent body = JsonContent.Create(ent);
                var resp = httpClient.GetFromJsonAsync<List<Vehiculo>>(url).Result;
            }

        }
    }
}