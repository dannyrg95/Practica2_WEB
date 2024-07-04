using Practica2_WEB.Entities;

namespace Practica2_WEB.Models
{

    public class VendedorModel (HttpClient httpClient) : IVendedorModel
    {
        public void RegistrarVendedores(Vendedor ent)
        {
            using (httpClient)
            {
                string url = "https://localhost:7017/api/Vendedor/RegistrarVendedores";
                JsonContent body = JsonContent.Create(ent);
                var resp = httpClient.PostAsJsonAsync(url, body).Result;
            }
            
        }
    }
}