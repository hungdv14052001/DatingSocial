using Microsoft.EntityFrameworkCore;
using DatingSocialApi.Models;
using DatingSocialApi.Common;

namespace DatingSocialApi.Seeder
{
    class UserSeeder
    {
        private readonly ModelBuilder _modelBuilder;
        public UserSeeder(ModelBuilder modelBuilder)
        {
            _modelBuilder = modelBuilder;
        }

        /// <summary>
        /// Excute data
        /// </summary>
        public void SeedData()
        {
            _modelBuilder.Entity<User>().HasData(
                new User
                {
                    Id = 1,
                    Name = "Đặng Văn Hùng",
                    Username = "dangvanhung@gmail.com",
                    Password = Untill.CreateMD5("dangvanhung"),
                    Avatar = "avatar/hung-avatar.jpg",
                    Role = "User"
                }
                );
        }
    }
}
