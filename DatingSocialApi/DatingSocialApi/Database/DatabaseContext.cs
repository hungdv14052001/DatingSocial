using DatingSocialApi.Models;
using DatingSocialApi.Seeder;
using Microsoft.EntityFrameworkCore;

namespace DatingSocialApi.Database
{
    public class DatabaseContext : DbContext
    {
        public DatabaseContext(DbContextOptions<DatabaseContext> options) : base(options)
        {
        }
        #region User
        public DbSet<User> users { get; set; }
        #endregion

        #region LikePost
        public DbSet<LikePost> like_posts { get; set; }
        #endregion

        #region Post
        public DbSet<Post> posts { get; set; }
        #endregion

        #region ReviewPost
        public DbSet<ReviewPost> review_posts { get; set; }
        #endregion

        #region FriendUser
        public DbSet<FriendUser> friend_users { get; set; }
        #endregion

        public static void UpdateDatabase(DatabaseContext context)
        {
            context.Database.Migrate();
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                var sqlConnection = "Server=localhost;Port=3306;Database=dating_social;Uid=root;Pwd=1234$;MaximumPoolSize=500;";
                optionsBuilder.UseMySql(sqlConnection,
                    MySqlServerVersion.LatestSupportedServerVersion);
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            #region User
            new UserSeeder(modelBuilder).SeedData();
            #endregion

            #region Post
            new PostSeeder(modelBuilder).SeedData();
            #endregion

            #region FriendUser
            new FriendUserSeeder(modelBuilder).SeedData();
            #endregion

            modelBuilder.ApplyConfigurationsFromAssembly(typeof(DatabaseContext).Assembly);
            base.OnModelCreating(modelBuilder);
        }
    }
}