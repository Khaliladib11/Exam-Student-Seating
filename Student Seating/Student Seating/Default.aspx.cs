using IPUMS;
using System;

namespace Student_Seating
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["username"] = null;
            Session["pid"] = null;
            Session["rolename"] = null;
            Session["faculty"] = null;
        }
        protected void login_btn_Click(object sender, EventArgs e)
        {
            string username = username_txt.Value;
            string password = password_txt.Value;
            int pid;
            string storePass;
            string storeRolename;
            string faculty;

            if (username == "" || password == "")
                return;

            DBU.callproc("select pid, password, rolename from users where username='" + username + "';");
            try
            {
                pid = Int32.Parse(DBU.ds.Tables[0].Rows[0].ItemArray[0].ToString());
                storePass = DBU.ds.Tables[0].Rows[0].ItemArray[1].ToString();
                storeRolename = DBU.ds.Tables[0].Rows[0].ItemArray[2].ToString();
            }
            catch
            {
                errorMsg.Text = "Username not found.";
                errorMsg.Visible = true;
                return;
            }

            if (storePass != password)
            {
                errorMsg.Text = "Invalid Username / Password.";
                errorMsg.Visible = true;
                return;
            }

            String currentdate = String.Format("{0:MM/dd/yyyy}", DateTime.Now);
            String currenttime = String.Format("{0:hh:mm:ss}", DateTime.Now);

            Int64 loginid = DBU.getnewid("select max(lgnid) from loginhistory;");
            DBU.callproc("insert into loginhistory(lgnid, pid, lgnDate, lgnTime) values( " + loginid + ", " + pid + ", '" + currentdate + "', '" + currenttime + "');");

            
            if (storeRolename == "Admin")
            {
                Session["username"] = username;
                Session["pid"] = pid;
                Session["rolename"] = storeRolename;
                Response.Redirect("~/MemberPages/Admin/Faculty.aspx", false);
            }

            if (storeRolename == "Instructor")
            {
                DBU.callproc("select fctid from instructor,faculty where instructor.pid=" + pid + " and faculty.pid = instructor.pid;");
                try
                {
                    faculty = DBU.ds.Tables[0].Rows[0].ItemArray[0].ToString();

                }
                catch
                {
                    return;
                }
                Session["username"] = username;
                Session["pid"] = pid;
                Session["rolename"] = storeRolename;
                Session["faculty"] = faculty;
                Response.Redirect("~/MemberPages/Instructor/Student.aspx", false);
            }
            //else
            // Response.Redirect("~/notIns.aspx", false);
            if (storeRolename == "new user")
            {
                Response.Redirect("~/notIns.aspx", false);
            }
        }
    }
}