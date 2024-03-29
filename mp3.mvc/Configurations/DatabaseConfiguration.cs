using App.Infrastructure;
using Microsoft.EntityFrameworkCore;
using PostgreSQLProjectAssembly = App.PostgreSQL.MigrationAssembly;
using SqlServerSQLProjectAssembly = App.SQLServer.MigrationAssembly;

namespace mp3.mvc.Configurations
{
    public static class DatabaseConfiguration
    {
        public static IServiceCollection AddDatabaseConfiguration(this IServiceCollection services, IConfiguration configuration)
        {
            string connectionString = configuration.GetConnectionString("DatabaseConnection")
                ?? throw new ArgumentException("Missing database connection string.");
            string typeOfDatabase = configuration["DatabaseSettings:DatabaseType"]
                ?? throw new ArgumentException("Missing database type.");


            services.AddDbContext<DatabaseContext>(
                options => _ = typeOfDatabase switch
                {
                    "postgres" =>
                        options.UseNpgsql(
                        connectionString,
                        x => x.MigrationsAssembly(typeof(PostgreSQLProjectAssembly).Assembly.FullName)),
                    "sqlserver" =>
                        options.UseSqlServer(
                        connectionString,
                        x => x.MigrationsAssembly(typeof(SqlServerSQLProjectAssembly).Assembly.FullName)),
                    _ =>
                        options.UseInMemoryDatabase(
                        connectionString)
                });


            return services;
        }

        public static IApplicationBuilder AddDatabaseConfiguration(this IApplicationBuilder app)
        {
            return app;
        }
    }
}
