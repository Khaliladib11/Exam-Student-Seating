using IPUMS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Student_Seating.MemberPages.Instructor
{
    public partial class Courses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                if (!IsPostBack)
                {
                    string fctid = Session["faculty"].ToString();
                    DBU.callproc("exec select_all_courses;");
                    courseGrid.DataSource = DBU.ds.Tables[0];
                    courseGrid.DataBind();
                }

                if (Session["rolename"].ToString() != "Instructor")
                    Response.Redirect("~/Default.aspx", false);
            }
            else
                Response.Redirect("~/Default.aspx", false);
        }

        protected void displayCourse_btn_Click(object sender, EventArgs e)
        {
            DBU.callproc("exec select_all_courses;");
            courseGrid.DataSource = DBU.ds.Tables[0];
            courseGrid.DataBind();
        }

        protected void addCourse_txt_Click(object sender, EventArgs e)
        {
            string cid = cid_txt.Text;
            string cname = cname_txt.Text;
            if(cid == "" || cname == "")
            {
                errorMsgC_txt.Text = "Please insert data.";
                errorMsgC_txt.Visible = true;
                return;
            }
            
            DBU.callproc("exec insert_new_course @cid = '"+ cid + "', @cname = '" + cname + "';");
            errorMsgC_txt.Text = "Course has been added succssefully.";
            errorMsgC_txt.Visible = true;

            DBU.callproc("exec select_all_courses;");
            courseGrid.DataSource = DBU.ds.Tables[0];
            courseGrid.DataBind();
        }

        protected void removeCourse_btn_Click(object sender, EventArgs e)
        {
            string cid = cid_txt.Text;
           
            if (cid == "")
            {
                errorMsgC_txt.Text = "Please insert data.";
                errorMsgC_txt.Visible = true;
                return;
            }
            try
            {
                DBU.callproc("delete from course where cid = '"+cid+"'");
                errorMsgC_txt.Text = "Course has been deleted succssefully.";
                errorMsgC_txt.Visible = true;
                DBU.callproc("exec select_all_courses;");
                courseGrid.DataSource = DBU.ds.Tables[0];
                courseGrid.DataBind();
            }
            catch
            {
                errorMsgC_txt.Text = "Course cannot be deleted.";
                errorMsgC_txt.Visible = true;
            }
           
        }

        protected void modifyCourse_btn_Click(object sender, EventArgs e)
        {
            string cid = cid_txt.Text;
            string cname = cname_txt.Text;
            if (cid == "" || cname == "")
            {
                errorMsgC_txt.Text = "Please insert data.";
                errorMsgC_txt.Visible = true;
                return;
            }

            DBU.callproc("exec course_update @cid = '" + cid + "', @cname = '" + cname + "';");
            errorMsgC_txt.Text = "Course has been modified successfully.";
            errorMsgC_txt.Visible = true;

            DBU.callproc("exec select_all_courses;");
            courseGrid.DataSource = DBU.ds.Tables[0];
            courseGrid.DataBind();
        }
    }
}