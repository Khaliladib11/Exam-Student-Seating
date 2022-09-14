using IPUMS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Student_Seating.MemberPages.Instructor
{
    public partial class Student : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                if (!IsPostBack)
                {
                    string fctid = Session["faculty"].ToString();
                    DBU.callproc("exec select_depratement_by_fctid @fctid = '"+ fctid +"'; ");
                    deprtStd_ddl.DataSource = DBU.ds.Tables[0];
                    deprtStd_ddl.DataTextField = "Name";
                    deprtStd_ddl.DataValueField = "ID";
                    deprtStd_ddl.DataBind();

                    DBU.callproc("exec select_student_in_faculty @fctid = '" + fctid+"';");
                    stdGrid.DataSource = DBU.ds.Tables[0];
                    stdGrid.DataBind();
                }

                if (Session["rolename"].ToString() != "Instructor")
                    Response.Redirect("~/Default.aspx", false);
            }
            else
                Response.Redirect("~/Default.aspx", false);
        }

        protected void addstd_txt_Click(object sender, EventArgs e)
        {
            string fname = stdFname_txt.Text;
            string lname = stdLname_txt.Text;
            string email = stdEmail_txt.Text;
            string mobile = stdMobile_txt.Text;
            string dptid = deprtStd_ddl.SelectedValue;
            string fctid = Session["faculty"].ToString();
            if (fname == "" || lname == "")
            {
                stdAdd_err.Text = "Please insert all the required fields";
                stdAdd_err.Visible = true;
                return;
            }

            stdAdd_err.Visible = false;
            DBU.callproc("select max(pid) from person");
            int pid = Int32.Parse(DBU.ds.Tables[0].Rows[0].ItemArray[0].ToString());
            pid++;
            try
            {
                DBU.callproc("exec insert_new_person @pid=" + pid + ", @pfname='" + fname + "', @plname='" + lname + "', @email='" + email + "', @mobile='" + mobile + "';");
                DBU.callproc("exec insert_new_std @pid=" + pid + ", @dptid='" + dptid + "';");
                stdSucc.Text = "The student has been added successfully";
                stdSucc.Visible = true;
                stdAdd_err.Text = "";
                stdAdd_err.Visible = false;
            }
            catch
            {
                stdAdd_err.Text = "The account cannot be created";
                stdAdd_err.Visible = true;
                return;
            }
            DBU.callproc("exec select_student_in_faculty @fctid = '" + fctid + "';");
            stdGrid.DataSource = DBU.ds.Tables[0];
            stdGrid.DataBind();
        }

        protected void displayStd_btn_Click(object sender, EventArgs e)
        {
            string fctid = Session["faculty"].ToString();
            DBU.callproc("exec select_student_in_faculty @fctid = '" + fctid + "';");
            stdGrid.DataSource = DBU.ds.Tables[0];
            stdGrid.DataBind();
        }

        protected void removeStd_txt_Click(object sender, EventArgs e)
        {
            string id = stdID_txt.Text;
            if (id == "")
            {
                stdAdd_err.Text = "Please insert ID";
                stdAdd_err.Visible = true;
                stdSucc.Text = "";
                stdSucc.Visible = false;
                return;
            }
            DBU.callproc("delete from person where person.pid = "+ id +";");
            stdSucc.Text = "The student has been deleted successfully";
            stdSucc.Visible = true;
            stdAdd_err.Text = "";
            stdAdd_err.Visible = false;

            string fctid = Session["faculty"].ToString();
            DBU.callproc("exec select_student_in_faculty @fctid = '" + fctid + "';");
            stdGrid.DataSource = DBU.ds.Tables[0];
            stdGrid.DataBind();
        }

        protected void clear_btn_Click(object sender, EventArgs e)
        {
            stdID_txt.Text = "";
            stdFname_txt.Text = "";
            stdLname_txt.Text = "";
            stdEmail_txt.Text = "";
            stdMobile_txt.Text = "";
            stdSucc.Text = "";
            stdAdd_err.Text = "";
            stdAdd_err.Visible = false;
            stdSucc.Visible = false;
        }

        protected void ModifyStd_txt_Click(object sender, EventArgs e)
        {
            string id = stdID_txt.Text;
            string fname = stdFname_txt.Text;
            string lname = stdLname_txt.Text;
            if (id == "" || fname == ""  || lname == "" )
            {
                stdAdd_err.Text = "Please insert ID";
                stdAdd_err.Visible = true;
                stdSucc.Text = "";
                stdSucc.Visible = false;
                return;
            }

            DBU.callproc("exec std_update @pid = "+ id + ", @pfname = '" + fname + "', @plname = '" + lname + "';");

            string fctid = Session["faculty"].ToString();
            DBU.callproc("exec select_student_in_faculty @fctid = '" + fctid + "';");
            stdGrid.DataSource = DBU.ds.Tables[0];
            stdGrid.DataBind();
        }
    }
}