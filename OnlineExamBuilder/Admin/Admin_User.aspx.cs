using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineExamBuilder
{
    public partial class Admin_User : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static List<Admin_UserGetAllResult> Admin_UserGetAll()
        {
            AdminDataClassesDataContext ObjAdmLog = new AdminDataClassesDataContext();
            return ObjAdmLog.Admin_UserGetAll().ToList();
        }
        [WebMethod]
        public static List<Admin_UserGetbyIDResult> Admin_UserGetbyID(int id)
        {
            AdminDataClassesDataContext ObjAdmLog = new AdminDataClassesDataContext();
            return ObjAdmLog.Admin_UserGetbyID(id).ToList();
        }
        [WebMethod]
        public  static int? AdminUserInsUpdate(int id,string name,string password,Boolean level)
        {
            int? result = 0;
            AdminDataClassesDataContext ObjIns = new AdminDataClassesDataContext();
            ObjIns.Admin_UserInsertUpdate(id,name,password,level,ref result);
            return result;
        }
        [WebMethod]
        public static int? AdminUserDelete(int id)
        {
            AdminDataClassesDataContext ObjDel = new AdminDataClassesDataContext();
            return ObjDel.Admin_UserDelete(id);
        }
    }
}