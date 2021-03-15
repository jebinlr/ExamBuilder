using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineExamBuilder.Admin
{
    public partial class DataEntry_User : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static List<Admin_UserGetbyIDResult> Admin_UserGetbyID()
        {
            AdminDataClassesDataContext ObjAdmLog = new AdminDataClassesDataContext();
            return ObjAdmLog.Admin_UserGetbyID(Convert.ToInt32(HttpContext.Current.Session["AdminUserID"])).ToList();
        }
        [WebMethod]
        public static int? AdminUserInsUpdate(string name, string password, Boolean level)
        {
            int? result = 0;
            AdminDataClassesDataContext ObjIns = new AdminDataClassesDataContext();
            ObjIns.Admin_UserInsertUpdate(Convert.ToInt32(HttpContext.Current.Session["AdminUserID"]), name, password, level, ref result);
            return result;
        }
    }
}