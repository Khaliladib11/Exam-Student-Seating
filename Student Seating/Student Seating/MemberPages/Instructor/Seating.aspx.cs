using IPUMS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Student_Seating.MemberPages.Instructor
{
    public partial class Seating : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                if (!IsPostBack)
                {
                    DBU.callproc("exec select_all_courses;");
                    course_ddl.DataSource = DBU.ds.Tables[0];
                    course_ddl.DataTextField = "Course Name";
                    course_ddl.DataValueField = "ID";
                    course_ddl.DataBind();

                    DBU.callproc("exec acadyear_select_all;");
                    academic_ddl.DataSource = DBU.ds.Tables[0];
                    academic_ddl.DataTextField = "Academic Year";
                    academic_ddl.DataValueField = "Academic Year";
                    academic_ddl.DataBind();


                }

                if (Session["rolename"].ToString() != "Instructor")
                    Response.Redirect("~/Default.aspx", false);
            }
            else
                Response.Redirect("~/Default.aspx", false);
        }

        protected void StdNb_btn_Click(object sender, EventArgs e)
        {
            string cid = course_ddl.SelectedValue;
            string exmtype = exmtype_ddl.SelectedValue;
            string academic = academic_ddl.SelectedValue;
            string semester = sms_ddl.SelectedValue;

            try
            {
                DBU.callproc("select_number_of_student_in_course @cid = '" + cid + "', @sms = '" + semester + "', @aca = '" + academic + "';");
                nbStd_txt.Text = DBU.ds.Tables[0].Rows[0].ItemArray[0].ToString();
                DBU.callproc("exec get_exam_info_by_course_info @cid = '"+ cid + "', @examType = '"+ exmtype + "';");
                exam_info.DataSource = DBU.ds.Tables[0];
                exam_info.DataBind();
            }
            catch
            {
                nbStd_txt.Text = "0";
            }
            
        }

        protected void disStd_btn_Click(object sender, EventArgs e)
        {
            string cid = course_ddl.SelectedValue;
            string exmtype = exmtype_ddl.SelectedValue;
            string academic = academic_ddl.SelectedValue;
            string semester = sms_ddl.SelectedValue;

        
            string fctid = Session["faculty"].ToString();
            if (nbStd_txt.Text == "")
            {
                return;
            }
            int number = int.Parse(nbStd_txt.Text);
            if (number == 0)
            {
                return;
            }
            DBU.callproc("exec get_exam_info_by_course_info @cid = '" + cid + "', @examType = '" + exmtype + "';");
            string date = "";
            string start = "";
            string end = "";
            try
            {
                date = DBU.ds.Tables[0].Rows[0].ItemArray[0].ToString();
                start = DBU.ds.Tables[0].Rows[0].ItemArray[1].ToString();
                end = DBU.ds.Tables[0].Rows[0].ItemArray[2].ToString();
            }
            catch
            {
                confirm_txt.Visible = false;
                confirm_txt.Text = "";
                error_txt.Visible = true;
                error_txt.Text = "I don't found any exam for this course.";
            }
            
            DBU.callproc("exec  get_examid_by_course_info @cid ='" + cid + "', @examType ='" + exmtype + "', @date ='" + date + "';");
            int examid;
            try
            {
                 examid = int.Parse(DBU.ds.Tables[0].Rows[0].ItemArray[0].ToString());
            }
            catch
            {
                examid = -1;
            }
            if (examid == -1)
            {
                return;
            }
            else
            {


                if (number < 10)
                {
                    try
                    {
                        string hid = DBU.bestHall(fctid, date, start, end, number, "");
                        System.Collections.ArrayList studentID = new System.Collections.ArrayList();
                        int counter;
                        DBU.callproc("exec select_student_register_in_course @cid = '" + cid + "', @sms = '" + semester + "', @aca = '" + academic + "';");
                        for (counter = 0; counter < number; counter++)
                        {
                            studentID.Add(DBU.ds.Tables[0].Rows[counter].ItemArray[0].ToString());
                        }
                        for (counter = 0; counter < number; counter++)
                        {
                            DBU.callproc("exec student_seating @hid = '" + hid + "', @pid = '" + studentID[counter].ToString() + "', @examid = '" + examid + "';");
                        }
                        confirm_txt.Visible = true;
                        confirm_txt.Text = "Done !";
                        error_txt.Visible = false;
                        error_txt.Text = "";
                    }
                    catch
                    {
                        confirm_txt.Visible = false;
                        confirm_txt.Text = "";
                        error_txt.Visible = true;
                        error_txt.Text = "Something wrong !";
                    }
                }



                if (number > 10)
                {
                    if (number % 2 == 0)
                    {
                        try
                        {
                            int half = number / 2;
                            string hid1 = DBU.bestHall(fctid, date, start, end, half, "");
                            System.Collections.ArrayList studentID1 = new System.Collections.ArrayList();
                            int counter;
                            DBU.callproc("exec select_student_register_in_course @cid = '" + cid + "', @sms = '" + semester + "', @aca = '" + academic + "';");
                            for (counter = 0; counter < half; counter++)
                            {
                                studentID1.Add(DBU.ds.Tables[0].Rows[counter].ItemArray[0].ToString());
                            }
                            for (counter = 0; counter < half; counter++)
                            {
                                DBU.callproc("exec student_seating @hid = '" + hid1 + "', @pid = '" + studentID1[counter].ToString() + "', @examid = '" + examid + "';");
                            }

                            string hid2 = DBU.bestHall(fctid, date, start, end, half, hid1);
                            System.Collections.ArrayList studentID2 = new System.Collections.ArrayList();
                            DBU.callproc("exec select_student_register_in_course @cid = '" + cid + "', @sms = '" + semester + "', @aca = '" + academic + "';");
                            for (counter = half; counter < number; counter++)
                            {
                                studentID2.Add(DBU.ds.Tables[0].Rows[counter].ItemArray[0].ToString());
                            }
                            for (counter = 0; counter < half; counter++)
                            {
                                DBU.callproc("exec student_seating @hid = '" + hid2 + "', @pid = '" + studentID2[counter].ToString() + "', @examid = '" + examid + "';");
                            }
                            confirm_txt.Visible = true;
                            confirm_txt.Text = "Done !";
                            error_txt.Visible = false;
                            error_txt.Text = "";
                        }
                        catch
                        {
                            confirm_txt.Visible = false;
                            confirm_txt.Text = "";
                            error_txt.Visible = true;
                            error_txt.Text = "Something wrong !";
                        }
                    }
                    else
                    {
                        try
                        {
                            int nb = number - 1;
                            int half = nb / 2;
                            int counter;
                            string hid1 = DBU.bestHall(fctid, date, start, end, half, "");
                            string hid2 = DBU.bestHall(fctid, date, start, end, half + 1, hid1);
                            System.Collections.ArrayList studentID1 = new System.Collections.ArrayList();
                            DBU.callproc("exec select_student_register_in_course @cid = '" + cid + "', @sms = '" + semester + "', @aca = '" + academic + "';");
                            for (counter = 0; counter < half; counter++)
                            {
                                studentID1.Add(DBU.ds.Tables[0].Rows[counter].ItemArray[0].ToString());
                            }
                            for (counter = 0; counter < half; counter++)
                            {
                                DBU.callproc("exec student_seating @hid = '" + hid1 + "', @pid = '" + studentID1[counter].ToString() + "', @examid = '" + examid + "';");
                            }


                            System.Collections.ArrayList studentID2 = new System.Collections.ArrayList();
                            DBU.callproc("exec select_student_register_in_course @cid = '" + cid + "', @sms = '" + semester + "', @aca = '" + academic + "';");
                            for (counter = half; counter < number; counter++)
                            {
                                studentID2.Add(DBU.ds.Tables[0].Rows[counter].ItemArray[0].ToString());
                            }
                            for (counter = 0; counter < half + 1; counter++)
                            {
                                DBU.callproc("exec student_seating @hid = '" + hid2 + "', @pid = '" + studentID2[counter].ToString() + "', @examid = '" + examid + "';");
                            }

                            confirm_txt.Visible = true;
                            confirm_txt.Text = "Done !";
                            error_txt.Visible = false;
                            error_txt.Text = "";
                        }
                        catch
                        {
                            confirm_txt.Visible = false;
                            confirm_txt.Text = "";
                            error_txt.Visible = true;
                            error_txt.Text = "Something wrong !";
                        }
                    }

                 }
                }
            }

        protected void showExam_btn_Click(object sender, EventArgs e)
        {
            if (stdIdSea_txt.Text == "")
            {
                return;
            }
            int id = int.Parse(stdIdSea_txt.Text);
            string exmtype = exmtype_ddl.SelectedValue;
            string academic = academic_ddl.SelectedValue;
            string semester = sms_ddl.SelectedValue;

            DBU.callproc("exec select_hall_student_exam @pid ="+ id +", @sms = '"+ semester + "', @aca = '" + academic + "', @examType = '" + exmtype + "';");
            GridView1.DataSource = DBU.ds.Tables[0];
            GridView1.DataBind();
        }

        protected void showHallCourse_btn_Click(object sender, EventArgs e)
        {
            string cid = course_ddl.SelectedValue;
            string exmtype = exmtype_ddl.SelectedValue;
            string academic = academic_ddl.SelectedValue;
            string semester = sms_ddl.SelectedValue;
            try
            {
                DBU.callproc("select_halls_course_exam @cid = '"+ cid +"', @sms = '"+ semester +"', @aca = '"+ academic +"', @examType = '"+ exmtype +"';");
                GridView1.DataSource = DBU.ds.Tables[0];
                GridView1.DataBind();
            }
            catch
            {

            }
            
        }

        
   }
}
