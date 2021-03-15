using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineExamBuilder.Admin
{
    public partial class Home : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AdminDataClassesDataContext ObjAdmLog = new AdminDataClassesDataContext();
            List<Admin_UserGetbyIDResult> Obj = new List<Admin_UserGetbyIDResult>();
            Obj=ObjAdmLog.Admin_UserGetbyID(Convert.ToInt32(HttpContext.Current.Session["AdminUserID"])).ToList<Admin_UserGetbyIDResult>();
            if (Obj.Count()>0)
            {
                lbladmname.InnerText = Obj.First().Name.ToString();
                if (Obj.First().Admin==true)
                {
                    ADataEntry.Visible = false;
                    sidebaraadminuser.Visible = true;                    
                }
                else
                {
                    ADataEntry.Visible = true;
                    sidebaraadminuser.Visible = false;
                }
            }
        }

        protected void btnsignout_Click(object sender, EventArgs e)
        {
            Session.Remove("AdminUserID");
            Response.Redirect("Login.aspx");
        }
    }
}