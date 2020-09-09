using Dal.Abstract;
using Entities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace Dal.Concrete.EntityFramework.Repository
{
    public class EfProductRepository : EfGenericRepository<Products>, IProductRepository
    {
        public EfProductRepository():base()
        {
                   
        }

        public bool BuyProduct(int userId, int productId, int count)
        {
            throw new NotImplementedException();
        }

        public List<Products> GetDaily()
        {
            throw new NotImplementedException();
        }

        public List<Products> GetMostDiscount()
        {
            throw new NotImplementedException();
        }

        public List<Products> GetMostPopular()
        {
            return context.Products.Include(x=>x.SubCategories).Take(5).ToList();
        }

        public List<Products> GetMostSold()
        {
            throw new NotImplementedException();
        }

        public Products GetProduct(int userId, int productId)
        {
            Products product= context.Products.Where(x => x.Id == productId).Include(x=>x.ProductPhotos).Include(x=>x.SubCategories).FirstOrDefault();
            return product;
        }

        public List<Products> GetProductWithCategory(int categoryId)
        {
            throw new NotImplementedException();
        }

        public List<Products> SearchProduct(string name)
        {
            throw new NotImplementedException();
        }
    }
}
