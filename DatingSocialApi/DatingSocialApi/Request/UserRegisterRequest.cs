using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DatingSocialApi.Request
{
    public class UserRegisterRequest
    {
        public string NumberPhone { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
    }
}
