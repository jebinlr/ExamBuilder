using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineExamBuilder.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static List<Admin_LoginResult> Admin_Login(string name,string password)
        {
            AdminDataClassesDataContext ObjAdmLog = new AdminDataClassesDataContext();
            return ObjAdmLog.Admin_Login(name,password).ToList();
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            Session["AdminUserID"] = hdnid.Value;
            Response.Redirect("Dashboard.aspx");
        }
    }
}