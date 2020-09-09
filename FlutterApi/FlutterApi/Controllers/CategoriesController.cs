using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace FlutterApi.Controllers
{
    [Route("api/[controller]/[Action]")]
    [ApiController]
    public class CategoriesController : Controller
    {
        ICategoriesService categoriesContext;
        public CategoriesController(ICategoriesService category)
        {
            this.categoriesContext = category;
        }
        [HttpGet("")]
        public IActionResult GetAll()
        {
            var categories = categoriesContext.GetAll();
            return Ok(categories);
        }
    }
}