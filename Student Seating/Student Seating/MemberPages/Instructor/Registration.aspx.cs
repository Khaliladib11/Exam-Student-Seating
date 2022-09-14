using IPUMS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Student_Seating.MemberPages.Instructor
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                if (!IsPostBack)
                {
                    //string fctid = Session["faculty"].ToString();
                    DBU.callproc("exec select_all_courses;");
                    courseRegGrid.DataSource = DBU.ds.Tables[0];
                    courseRegGrid.DataBind();

                    DBU.callproc("select ayrid from Academicyear;");
                    regyrs_ddl.DataSource = DBU.ds.Tables[0];
                    regyrs_ddl.DataTextField = "ayrid";
                    regyrs_ddl.DataValueField = "ayrid";
                    regyrs_ddl.DataBind();
                }

                if (Session["rolename"].ToString() != "Instructor")
                    Response.Redirect("~/Default.aspx", false);
            }
            else
                Response.Redirect("~/Default.aspx", false);
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void addReg_btn_Click(object sender, EventArgs e)
        {
            string stdid = regstd_txt.Text;
            string cid = regcrs_txt.Text;
            string ayrid = regyrs_ddl.SelectedValue;
            string smsid = regsms_ddl.SelectedValue;

            if (stdid == "" || cid == "")
            {
                reg_err.Text = "Please insert all info.";
                reg_err.Visible = true;
                reg_conf.Text = "";
                reg_err.Visible = false;
                return;
            }

            DBU.callproc("check_std @pid ="+ stdid +";");
            if (int.Parse(DBU.ds.Tables[0].Rows[0].ItemArray[0].ToString()) == 1)
            {
                DBU.callproc("exec check_std_reg @pid ='" + stdid + "', @cid ='" + cid + "', @ayrid ='" + ayrid + "', @smsid ='" + smsid + "';");
                if (int.Parse(DBU.ds.Tables[0].Rows[0].ItemArray[0].ToString()) == 0)
                {
                    DBU.callproc("exec register_new_course @pid ='" + stdid + "', @cid ='" + cid + "', @ayrid ='" + ayrid + "', @smsid ='" + smsid + "';");
                    DBU.callproc("exec view_registered_course @pid ='" + stdid + "', @ayrid ='" + ayrid + "', @smsid ='" + smsid + "';");
                    stdCrsGrid.DataSource = DBU.ds.Tables[0];
                    stdCrsGrid.DataBind();
                    reg_err.Text = "";
                    reg_err.Visible = false;
                    reg_conf.Text = "Mission Completed.";
                    reg_err.Visible = true;
                }else
                {
                    reg_err.Text = "This Student already registered in this course !";
                    reg_err.Visible = true;
                    reg_conf.Text = "";
                    reg_err.Visible = false;
                }
            }else
            {
                reg_err.Text = "Enter a valid ID !";
                reg_err.Visible = true;
                reg_conf.Text = "";
                reg_err.Visible = false;
            }
        }

        protected void removeReg_btn_Click(object sender, EventArgs e)
        {
            string stdid = regstd_txt.Text;
            string cid = regcrs_txt.Text;
            string ayrid = regyrs_ddl.SelectedValue;
            string smsid = regsms_ddl.SelectedValue;

            if (stdid == "" || cid == "")
            {
                reg_err.Text = "Please insert all info.";
                reg_err.Visible = true;
                reg_conf.Text = "";
                reg_err.Visible = false;
                return;
            }

            DBU.callproc("exec delete_registered_course @pid ='" + stdid + "', @cid ='" + cid + "', @ayrid ='" + ayrid + "', @smsid ='" + smsid + "';");
            DBU.callproc("exec view_registered_course @pid ='" + stdid + "', @ayrid ='" + ayrid + "', @smsid ='" + smsid + "';");
            stdCrsGrid.DataSource = DBU.ds.Tables[0];
            stdCrsGrid.DataBind();
            reg_err.Text = "";
            reg_err.Visible = false;
            reg_conf.Text = "Mission Completed.";
            reg_err.Visible = true;
        }

        protected void stdCourse_btn_Click(object sender, EventArgs e)
        {
            string stdid = regstd_txt.Text;
            string ayrid = regyrs_ddl.SelectedValue;
            string smsid = regsms_ddl.SelectedValue;
            if (stdid == "")
            {
                reg_err.Text = "Please insert all info.";
                reg_err.Visible = true;
                reg_conf.Text = "";
                reg_err.Visible = false;
                return;
            }
            try
            {
                DBU.callproc("exec view_registered_course @pid ='" + stdid + "', @ayrid ='" + ayrid + "', @smsid ='" + smsid + "';");
                stdCrsGrid.DataSource = DBU.ds.Tables[0];
                stdCrsGrid.DataBind();
            }
            catch
            {

            }
           
            reg_err.Text = "";
            reg_err.Visible = false;
            reg_conf.Text = "";
            reg_err.Visible = false;
        }

        protected void courseRegGrid_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (courseRegGrid.SelectedIndex != -1)
            {
                regcrs_txt.Text = courseRegGrid.SelectedRow.Cells[1].Text;
            }
        }
    }
}