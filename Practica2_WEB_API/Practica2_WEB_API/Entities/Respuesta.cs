using System.Reflection.Metadata.Ecma335;

namespace Practica2_WEB_API.Entities
{
    public class Respuesta
    {
        public int Codigo { get; set; }
        public string? Mensaje { get; set; }
        public object? Contenido { get; set; }
    }
}
