using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DatingSocialApi.Models
{
    public class User : BaseModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Avatar { get; set; }
        public string NumberPhone { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Role { get; set; }
    }
}
