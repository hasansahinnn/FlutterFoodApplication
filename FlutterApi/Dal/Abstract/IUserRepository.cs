using Entities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dal.Abstract
{
    public interface IUserRepository : IGenericRepository<Users>
    {
        List<Products> FavoriteProducts(int userId);
        List<Products> StarsProducts(int userId);
        List<Products> PurchasedProducts(int userId);


    }
}
