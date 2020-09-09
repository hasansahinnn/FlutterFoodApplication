using Entities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dal.Abstract
{
    public interface IProductRepository : IGenericRepository<Products>
    {
        List<Products> GetMostPopular();
        List<Products> GetMostSold();
        List<Products> GetMostDiscount();
        List<Products> GetDaily();
        List<Products> GetProductWithCategory(int categoryId);
        List<Products> SearchProduct(string name);
        Products GetProduct(int userId, int productId);

        bool BuyProduct(int userId,int productId,int count);

    }
}
