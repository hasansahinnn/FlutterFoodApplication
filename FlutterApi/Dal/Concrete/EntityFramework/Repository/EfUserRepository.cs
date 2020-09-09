using Dal.Abstract;
using Entities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dal.Concrete.EntityFramework.Repository
{
    public class EfUserRepository : EfGenericRepository<Users>, IUserRepository
    {
        public EfUserRepository():base()
        {
            
        }
      

        public List<Products> FavoriteProducts(int userId)
        {
            throw new NotImplementedException();
        }

        public List<Products> PurchasedProducts(int userId)
        {
            throw new NotImplementedException();
        }

        public List<Products> StarsProducts(int userId)
        {
            throw new NotImplementedException();
        }
    }
}
