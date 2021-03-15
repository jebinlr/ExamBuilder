using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineExamBuilder.Admin
{
    public partial class Subject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static List<Admin_Single_TypeGetAllResult> Admin_QuestionGetall()
        {
            AdminDataClassesDataContext ObjAdmLog = new AdminDataClassesDataContext();
            return ObjAdmLog.Admin_Single_TypeGetAll().ToList();
        }
        [WebMethod]
        public static List<Admin_SubjectDrpdwnResult> Admin_Subjectdrpdwn()
        {
            AdminDataClassesDataContext ObjAdmLog = new AdminDataClassesDataContext();
            return ObjAdmLog.Admin_SubjectDrpdwn().ToList();
        }
        [WebMethod]
        public static List<Admin_TypeDrpdwnResult> Admin_Typedrpdwn()
        {
            AdminDataClassesDataContext ObjAdmLog = new AdminDataClassesDataContext();
            return ObjAdmLog.Admin_TypeDrpdwn().ToList();
        }
        [WebMethod]
        public static int? Admin_questioninsert(int subid,int typeid,int questionid)
        {
            AdminDataClassesDataContext Objins = new AdminDataClassesDataContext();
            return Objins.Admin_QuestionInsert(subid,typeid,questionid);
        }
        [WebMethod]
        public static int? Admin_Singleinsert(int id,int subid, string question,string answer)
        {
            int? result = 0;
            AdminDataClassesDataContext Objins = new AdminDataClassesDataContext();
            Objins.Admin_SingleInsert(id,subid, question,answer,ref result);
            return result;
        }
        [WebMethod]
        public static int? Admin_Multipleinsert(int id,int subid,int noofchoice, string question,string choice1,string choice2,string choice3,string choice4, string answer)
        {
            int? result = 0;
            AdminDataClassesDataContext Objins = new AdminDataClassesDataContext();
            Objins.Admin_MultipleInsert(id,subid, noofchoice, question,choice1,choice2,choice3,choice4, answer,ref result);
            return result;
        }
        [WebMethod]
        public static int? Admin_Fillinsert(int id,int subid, string question, string answer)
        {
            int? result = 0;
            AdminDataClassesDataContext Objins = new AdminDataClassesDataContext();
            Objins.Admin_FillInsert(id,subid, question, answer,ref result);
            return result;
        }
        [WebMethod]
        public static List<Admin_Single_TypeGetByIDResult> Admin_singletype(int id)
        {
            AdminDataClassesDataContext ObjAdmLog = new AdminDataClassesDataContext();
            return ObjAdmLog.Admin_Single_TypeGetByID(id).ToList();
        }
        [WebMethod]
        public static List<Admin_Multi_TypeGetByIDResult> Admin_multitype(int id)
        {
            AdminDataClassesDataContext ObjAdmLog = new AdminDataClassesDataContext();
            return ObjAdmLog.Admin_Multi_TypeGetByID(id).ToList();
        }
        [WebMethod]
        public static List<Admin_Fill_TypeGetByIDResult> Admin_filltype(int id)
        {
            AdminDataClassesDataContext ObjAdmLog = new AdminDataClassesDataContext();
            return ObjAdmLog.Admin_Fill_TypeGetByID(id).ToList();
        }
        [WebMethod]
        public static int? Admin_SingleDelete(int id)
        {
            int? result = 0;
            AdminDataClassesDataContext Objins = new AdminDataClassesDataContext();
            Objins.Single_type_Delete(id);
            return result;
        }
        [WebMethod]
        public static int? Admin_MultipleDelete(int id)
        {
            int? result = 0;
            AdminDataClassesDataContext Objins = new AdminDataClassesDataContext();
            Objins.Multiple_type_Delete(id);
            return result;
        }
        [WebMethod]
        public static int? Admin_FillDelete(int id)
        {
            int? result = 0;
            AdminDataClassesDataContext Objins = new AdminDataClassesDataContext();
            Objins.Fill_TypeDelete(id);
            return result;
        }
    }
}