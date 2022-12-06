using Microsoft.EntityFrameworkCore;
using DatingSocialApi.Models;
using DatingSocialApi.Common;

namespace DatingSocialApi.Seeder
{
    class PostSeeder
    {
        private readonly ModelBuilder _modelBuilder;
        public PostSeeder(ModelBuilder modelBuilder)
        {
            _modelBuilder = modelBuilder;
        }

        /// <summary>
        /// Excute data
        /// </summary>
        public void SeedData()
        {
            _modelBuilder.Entity<Post>().HasData(
                new Post
                {
                    Id = 1,
                    UserId = 1,
                    Title = "Cảnh đẹp :))",
                    Image = "post/post-1-1.jpg",
                    NumberLike = 0,
                }
                );
        }
    }
}
