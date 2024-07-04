using Microsoft.AspNetCore.Mvc;
using Practica2_WEB.Models;
using System.Diagnostics;

namespace Practica2_WEB.Controllers
{
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public class HomeController(IVendedorModel iVendedorModel) : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
