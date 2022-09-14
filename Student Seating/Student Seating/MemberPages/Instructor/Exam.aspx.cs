using IPUMS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Student_Seating.MemberPages.Instructor
{
    public partial class Exam : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                if (!IsPostBack)
                {
                    string fctid = Session["faculty"].ToString();
                     DBU.callproc("exec select_all_courses;");
                     courseExm_ddl.DataSource = DBU.ds.Tables[0];
                     courseExm_ddl.DataTextField = "Course Name";
                     courseExm_ddl.DataValueField = "ID";
                     courseExm_ddl.DataBind();
                }

                if (Session["rolename"].ToString() != "Instructor")
                    Response.Redirect("~/Default.aspx", false);
            }
            else
                Response.Redirect("~/Default.aspx", false);
        }
        protected void addExam_btn_Click(object sender, EventArgs e)
        {
            string startTime = strtTime_txt.Text; ;
            string endTime = endTime_txt.Text;
            Regex regularExpression = new Regex("^[0-24]{2}:[0-24]{2}$");
            bool result1 = regularExpression.IsMatch(startTime);
            bool result2 = regularExpression.IsMatch(endTime);
            string cid = courseExm_ddl.SelectedValue;
            string examType = exmType_ddl.SelectedValue;
            if (result1 == false || result2 == false)
            {
                //return;
            }
            if (date_clndr.SelectedDate == null)
            {
                //return;
            }
            DateTime date = date_clndr.SelectedDate.Date;
            //string d = date_clndr.value.toString("dd/MM/yyyy");
            string dd = date_clndr.SelectedDate.ToString("dd/MM/yyyy");
            TimeSpan duration1 = DateTime.Parse(endTime).Subtract(DateTime.Parse(startTime));
            string duration = duration1.ToString();
            double seconds = TimeSpan.Parse(duration).TotalMinutes;
            DBU.callproc("exec select_max_exmID;");
            int exmId;
            /*if (DBU.ds.Tables[0].Rows[0].ItemArray[0] == null)
            {
                exmId = 0;
            } else
                exmId = Int32.Parse(DBU.ds.Tables[0].Rows[0].ItemArray[0].ToString());*/
            try
            {
                exmId = Int32.Parse(DBU.ds.Tables[0].Rows[0].ItemArray[0].ToString()); 
            }
            catch
            {
                exmId = 0;
            }

            exmId++;
            DBU.callproc("check_from_exam @cid = '" + cid + "', @examDate = '" + dd + "', @examType = '" + examType + "';");
            if (int.Parse(DBU.ds.Tables[0].Rows[0].ItemArray[0].ToString()) == 0)
            {
                DBU.callproc("exec insert_new_exm @exmId =" + exmId + ", @examDate ='" + dd + "', @startTime ='" + startTime + "', @endtime ='" + endTime + "', @duration ='" + seconds + "', @examType ='" + examType + "', @cid ='" + cid + "';");
                exm_conf.Text = "Exam Added successuflly";
                exm_conf.Visible = true;
                exm_err.Text = "";
                exm_err.Visible = false;
            }
            else
            {
                DBU.callproc("exec exam_update @cid = '" + cid + "', @examDate = '" + dd + "', @examType = '" + examType + "', @start = '"+ startTime +"', @end ='"+ endTime +"';");
            }
            DBU.callproc("exec select_all_exm;");
            exmGrid.DataSource = DBU.ds.Tables[0];
            exmGrid.DataBind();
        }

        protected void displayExm_btn_Click(object sender, EventArgs e)
        {
            DBU.callproc("exec select_all_exm;");
            exmGrid.DataSource = DBU.ds.Tables[0];
            exmGrid.DataBind();
        }
    }
}