using System.Web;
using System.Web.Mvc;

namespace Hoai_Vitaminhouse
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
