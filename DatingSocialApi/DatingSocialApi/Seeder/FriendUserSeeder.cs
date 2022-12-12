using Microsoft.EntityFrameworkCore;
using DatingSocialApi.Models;
using DatingSocialApi.Common;

namespace DatingSocialApi.Seeder
{
    class FriendUserSeeder
    {
        private readonly ModelBuilder _modelBuilder;
        public FriendUserSeeder(ModelBuilder modelBuilder)
        {
            _modelBuilder = modelBuilder;
        }

        /// <summary>
        /// Excute data
        /// </summary>
        public void SeedData()
        {
            _modelBuilder.Entity<FriendUser>().HasData(
                new FriendUser
                {
                    Id = 1,
                    UserId = 1,
                    FriendId = 2,
                },
                new FriendUser
                {
                    Id = 2,
                    UserId = 2,
                    FriendId = 1,
                }
                );
        }
    }
}
