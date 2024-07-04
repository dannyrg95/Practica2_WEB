using Practica2_WEB.Entities;

namespace Practica2_WEB.Models
{
    public interface IVehiculoModel
    {
        void RegistrarVehiculos(Vehiculo ent);

        void ConsultarVehiculos(Vehiculo ent);
    }
}
