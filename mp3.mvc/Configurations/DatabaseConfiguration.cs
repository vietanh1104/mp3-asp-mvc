using App.Infrastructure;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using System;
using PostgreSQLProjectAssembly = App.PostgreSQL.MigrationAssembly;
using SqlServerSQLProjectAssembly = App.SQLServer.MigrationAssembly;

namespace mp3.mvc.Configurations
{
    public static class DatabaseConfiguration
    {
        public static IServiceCollection AddDatabaseConfiguration<T>(this IServiceCollection services, 
            IConfiguration configuration, IHostEnvironment environment)
            where T : DbContext
        {
            string connectionString = configuration.GetConnectionString("DatabaseConnection")
                ?? throw new ArgumentException("Missing database connection string.");
            string typeOfDatabase = configuration["DatabaseSettings:DatabaseType"]
                ?? throw new ArgumentException("Missing database type.");


            services.AddDbContext<T>(
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

            bool autoMigration = configuration.GetValue<bool>("DatabaseSettings:AutoMigration");

            if (autoMigration)
            {
                using(var serviceProvider = services.BuildServiceProvider())
                {
                    MigrateDatabase<T>(serviceProvider, environment);
                }
            }

            return services;
        }
        private static void MigrateDatabase<T>(IServiceProvider serviceProvider, IHostEnvironment environment)
            where T: DbContext
        {
            if (environment.IsDevelopment() || environment.IsProduction())
            {
                using (var scope = serviceProvider.CreateScope())
                {
                    var context = scope.ServiceProvider.GetRequiredService<T>();
                    context.Database.OpenConnection();
                    context.Database.Migrate();
                }
            }
        } 

        public static IApplicationBuilder UseApplicationDatabase<T>(this IApplicationBuilder app)
            where T : DbContext
        {   
            return app;
        }
    }
}
