using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using System.Net.Http.Formatting;

namespace cds_essai
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // Web API configuration and services

            // Web API routes
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "Modules",
                routeTemplate: "services/modules/",
                defaults: new { controller = "Modules" } );

            config.Routes.MapHttpRoute(
                name: "Folders",
                routeTemplate: "services/folders/{module}/{*path}",
                defaults: new { controller = "Folders", module = RouteParameter.Optional, path = RouteParameter.Optional });

            //config.Routes.MapHttpRoute(
            //    name: "DefaultApi",
            //    routeTemplate: "api/{controller}/{id}",
            //    defaults: new { id = RouteParameter.Optional }
            //);

            config.Formatters.Clear();
            config.Formatters.Add(new JsonMediaTypeFormatter());
        }
    }
}
