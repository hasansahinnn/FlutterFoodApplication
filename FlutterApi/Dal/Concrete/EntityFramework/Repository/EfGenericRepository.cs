using Dal.Abstract;
using Dal.Concrete.EntityFramework.Context;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Dal.Concrete.EntityFramework.Repository
{
    public class EfGenericRepository<T> : IGenericRepository<T> where T : class
    {
        public FlutterContext context;

        public EfGenericRepository()
        {
            context = new FlutterContext();
            context.ChangeTracker.LazyLoadingEnabled = false;
        }

        public T Add(T entity)
        {
            context.Set<T>().Add(entity);
            context.SaveChanges();
            return entity;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
        protected virtual void Dispose(bool dispose)
        {
            if (dispose)
            {
                context.Dispose();
            }
        }
        public T Get(int id)
        {
            var entity = context.Set<T>().Find(id);
            context.Entry(entity).State = EntityState.Deleted;
            context.Entry(entity).State = EntityState.Modified;
            return entity;
        }

        public List<T> GetAll()
        {
            return context.Set<T>().AsNoTracking().ToList();
        }

        public List<T> GetAll(Expression<Func<T, bool>> predicate)
        {
            return context.Set<T>().AsNoTracking().Where(predicate).ToList();
        }

        public bool Remove(int id)
        {
            return Remove(Get(id));
        }

        public bool Remove(T entity)
        {
            context.Set<T>().Remove(entity);
            return context.SaveChanges() > 0;
        }

        public T Update(T entity)
        {
            context.Set<T>().Update(entity);
            context.SaveChanges();
            return entity;
        }

        public IQueryable<TResult> GetAllSelect<TResult>(Expression<Func<T, TResult>> select)
        {
            //select adi,soyadi from personel
            return context.Set<T>().Select(select);
        }

        public IQueryable<TResult> GetAllSelect<TResult>(Expression<Func<T, bool>> predicate, Expression<Func<T, TResult>> select)
        {
            //select adi,soyadi from personel where il='kocaeli'
            return context.Set<T>().Where(predicate).Select(select);
        }

        public bool Remove(Expression<Func<T, bool>> predicate)
        {
            context.Set<T>().RemoveRange(GetAll(predicate));
            return context.SaveChanges() > 0;
        }

        public decimal Max(Expression<Func<T, bool>> predicate, Expression<Func<T, decimal>> column)
        {
            return context.Set<T>().Where(predicate).Max(column);
        }

        public decimal Min(Expression<Func<T, bool>> predicate, Expression<Func<T, decimal>> column)
        {
            return context.Set<T>().Where(predicate).Min(column);
        }

        public int? Max(Expression<Func<T, bool>> predicate, Expression<Func<T, int?>> column)
        {
            return context.Set<T>().Where(predicate).Max(column);
        }

        public int? Min(Expression<Func<T, bool>> predicate, Expression<Func<T, int?>> column)
        {
            return context.Set<T>().Where(predicate).Min(column);
        }

        public decimal Sum(Expression<Func<T, bool>> predicate, Expression<Func<T, decimal?>> column)
        {
            return context.Set<T>().Where(predicate).Sum(column) ?? 0;
        }

        public int Count(Expression<Func<T, bool>> predicate)
        {
            return context.Set<T>().Where(predicate).Count();
        }

        //public abstract void Topla();
    }
}
