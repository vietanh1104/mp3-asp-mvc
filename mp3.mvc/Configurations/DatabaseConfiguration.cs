using App.Infrastructure;
using Microsoft.EntityFrameworkCore;

namespace mp3.mvc.Configurations
{
    public static class DatabaseConfiguration
    {
        public static IServiceCollection AddDatabaseConfiguration(this IServiceCollection services, IConfiguration configuration)
        {
            string connectionString = configuration.GetConnectionString("DatabaseConnection");
            string typeOfDatabase = configuration["DatabaseSettings:DatabaseType"]
                ?? throw new ArgumentException("Missing database type.");


            services.AddDbContext<DatabaseContext>(
                options => _ = typeOfDatabase switch
                {
                    "postgres" =>
                        options.UseNpgsql(
                          configuration.GetConnectionString(connectionString),
                          x => x.MigrationsAssembly("typeof(PostgresProject).Namespace")),
                    "sqlserver" =>
                        options.UseSqlServer(
                                configuration.GetConnectionString(connectionString),
                                x => x.MigrationsAssembly("typeof(SqlServerProject).Namespace")),
                    _ =>
                        options.UseInMemoryDatabase(
                                configuration.GetConnectionString(connectionString))
                });


            return services;
        }

        public static IApplicationBuilder AddDatabaseConfiguration(this IApplicationBuilder app)
        {
            return app;
        }
    }
}
