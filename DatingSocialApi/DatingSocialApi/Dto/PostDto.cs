using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DatingSocialApi.Dto
{
    public class PostDto
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public string Name { get; set; }
        public string Avatar { get; set; }
        public string Title { get; set; }
        public string Image { get; set; }
        public int NumberLike { get; set; }
    }
}
