using App.Infrastructure;

namespace mp3.mvc.Configurations
{
    public static class ServiceCollectionExtensions
    {
        public static IServiceCollection AddServiceCollectionExtensions(this IServiceCollection services, 
            IConfiguration configuration, IHostEnvironment environment)
        {
            // Add localization config
            services.AddLocalizationConfiguration();

            // Add authentication config
            services.AddAuthenticationConfiguration();

            // Add notification config
            services.AddNotificationConfiguration();

            // Add database config
            services.AddDatabaseConfiguration<DatabaseContext>(configuration, environment);

            LoggerConfiguraton.AddSerilogConfiguration(configuration);
            return services;
        }

        public static IApplicationBuilder AddApplicationBuilderExtensions(this IApplicationBuilder app)
        {
            app.UseCors();
            app.UseHttpsRedirection();
            app.UseStaticFiles();
            app.UseRouting();
            app.AddAuthenticationConfiguration();
            app.AddNotificationConfiguration();
            app.UseApplicationDatabase<DatabaseContext>();

            return app;

        }
    }
}
