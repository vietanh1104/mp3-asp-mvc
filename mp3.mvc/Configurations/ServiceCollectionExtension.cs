namespace mp3.mvc.Configurations
{
    public static class ServiceCollectionExtensions
    {
        public static IServiceCollection AddServiceCollectionExtensions(this IServiceCollection services, IConfiguration configuration)
        {
            // Add localization config
            services.AddLocalizationConfiguration();


            // Add authentication config
            services.AddAuthenticationConfiguration();

            // Add notification config
            services.AddNotificationConfiguration();

            return services;
        }

        public static IApplicationBuilder AddApplicationBuilderExtensions(this IApplicationBuilder app)
        {
            app.UseCors();
            app.AddLocalizationConfiguration();
            app.UseHttpsRedirection();
            app.UseStaticFiles();
            app.UseRouting();
            app.AddAuthenticationConfiguration();
            app.AddNotificationConfiguration();

            return app;

        }
    }
}
