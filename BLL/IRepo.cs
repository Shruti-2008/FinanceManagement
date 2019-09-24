using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public interface IRepo<T>
    {
        

            T GetById(Int64 id);

            void Create(T entity);

            void Delete(T entity);

            void Update(T entity);

            List<T> GetALL();

        
    }
}
