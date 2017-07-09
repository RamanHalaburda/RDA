using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(RepublicDatabaseAutoservice.Startup))]
namespace RepublicDatabaseAutoservice
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
