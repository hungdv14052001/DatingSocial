using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DatingSocialApi.Models
{
    public class FriendUser : BaseModel
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public int FriendId { get; set; }
    }
}
