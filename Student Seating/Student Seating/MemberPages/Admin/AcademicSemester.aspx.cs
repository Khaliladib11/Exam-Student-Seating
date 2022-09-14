using IPUMS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Student_Seating.MemberPages.Admin
{
    public partial class AcademicSemester : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { 
            if(Session["username"] != null)
            {
                if(!IsPostBack)
                {
                    DBU.callproc("exec acadyear_select_all;");
                    academicGrid.DataSource = DBU.ds.Tables[0];
                    academicGrid.DataBind();
                }
                if (Session["rolename"].ToString() != "Admin")
                    Response.Redirect("~/Default.aspx", false);
            }
            else
                Response.Redirect("~/Default.aspx", false);
        }

        protected void displayAcad_btn_Click(object sender, EventArgs e)
        {
            DBU.callproc("exec acadyear_select_all;");
            academicGrid.DataSource = DBU.ds.Tables[0];
            academicGrid.DataBind();
        }

        protected void addAcademic_txt_Click(object sender, EventArgs e)
        {
            string academicYear = academic_txt.Text;
            Regex regularExpression = new Regex("^[0-9]{4}/[0-9]{4}$");
            bool result = regularExpression.IsMatch(academicYear);
            if(result == true)
            {
                regularExpree_err.Text = "";
                DBU.callproc("exec insert_academicYear @ayrid = '"+ academicYear + "';");
                DBU.callproc("exec insert_FallSems @ayrid = '" + academicYear + "';");
                DBU.callproc("exec insert_SpringSems @ayrid = '" + academicYear + "';");
                DBU.callproc("exec acadyear_select_all;");
                academicGrid.DataSource = DBU.ds.Tables[0];
                academicGrid.DataBind();
            }
            else
                regularExpree_err.Text = "Enter a valid input";
                regularExpree_err.Visible = true;


        }
    }
}