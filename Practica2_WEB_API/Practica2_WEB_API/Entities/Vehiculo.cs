using System.Drawing;
using System.Numerics;
using System.Reflection;
using System.Text.RegularExpressions;

namespace Practica2_WEB_API.Entities
{
    public class Vehiculo
    {
        public string? Marca { get; set; }
        public string? Modelo { get; set; }
        public string? Color { get; set; }
        public decimal Precio { get; set; }
        public long IdVendedor { get; set; }

    }
}
