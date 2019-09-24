using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    class Repo:IRepo<Object>
    {

        public object GetById(long id)
        {
            throw new NotImplementedException();
        }

        public void Create(object entity)
        {
            throw new NotImplementedException();
        }

        public void Delete(object entity)
        {
            throw new NotImplementedException();
        }

        public void Update(object entity)
        {
            throw new NotImplementedException();
        }

        public List<object> GetALL()
        {
            throw new NotImplementedException();
        }
    }
}
