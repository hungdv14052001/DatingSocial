using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DatingSocialApi.Models
{
    public class Post : BaseModel
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public string Title { get; set; }
        public string Image { get; set; }
        public int NumberLike { get; set; }
    }
}
