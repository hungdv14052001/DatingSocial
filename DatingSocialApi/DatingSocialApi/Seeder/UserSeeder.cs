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
                },
                new User
                {
                    Id = 2,
                    Name = "Nguyễn Đức Cường",
                    Username = "nguyenduccuong@gmail.com",
                    Password = Untill.CreateMD5("nguyenduccuong"),
                    Avatar = "cuong-avatar.jpg",
                    Role = "User"
                }
                );
        }
    }
}
