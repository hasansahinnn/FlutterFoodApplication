using Dal.Abstract;
using Entities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dal.AbstractInterfaces
{
    public interface ICategoriesRepository : IGenericRepository<Categories>
    {
        List<Categories> GetCategories();


    }
}
