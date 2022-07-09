using System.Web.Mvc;

namespace Hoai_Vitaminhouse.Areas.Admin
{
    public class AdminAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "Admin";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
               "Admin_default",
               "Admin/{controller}/{action}/{id}",
               new { action = "Login", controller = "Access", id = UrlParameter.Optional }
           );
            
        }
    }
}