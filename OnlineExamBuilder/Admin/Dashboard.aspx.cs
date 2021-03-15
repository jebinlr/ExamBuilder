using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineExamBuilder.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AdminDataClassesDataContext ObjDash = new AdminDataClassesDataContext();
            List<Admin_Single_TypeGetAllResult> Obj = new List<Admin_Single_TypeGetAllResult>();
            Obj = ObjDash.Admin_Single_TypeGetAll().ToList<Admin_Single_TypeGetAllResult>();
            if (Obj.Count() > 0)
            {
                lblenglishid.InnerText = Obj.First().English.ToString();
                lblmathsid.InnerText = Obj.First().Maths.ToString();
                lblscienceid.InnerText = Obj.First().Science.ToString();
            }
        }
    }
}