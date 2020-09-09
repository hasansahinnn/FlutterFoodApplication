using Dal.Abstract;
using Entities.Models;
using Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SiparisTakip.Bll
{
    public class ProductManager : GenericManager<Products>, IProductService
    {
        IProductRepository productRepository;

        public ProductManager(IProductRepository productRepository) : base(productRepository)
        {
            this.productRepository = productRepository;
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
            return productRepository.GetMostPopular();
        }

        public List<Products> GetMostSold()
        {
            throw new NotImplementedException();
        }

        public Products GetProduct(int userId, int productId)
        {
          return  productRepository.GetProduct(userId, productId);
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
