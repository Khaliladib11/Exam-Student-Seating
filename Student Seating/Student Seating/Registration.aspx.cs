using IPUMS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Student_Seating
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                confirmedMsg.Text = "";
            }
        }

        protected void create_Click(object sender, EventArgs e)
        {
            string fname = fisrtName_txt.Text;
            string lname = lastName_txt.Text;
            string username = userReg_txt.Text;
            string password = passReg_txt.Text;
            string confirmPass = confirmPass_txt.Text;
            string mobile = mobile_txt.Text;
            string email = email_txt.Text;

            if(fname == "")
            {
                fname_err.Visible = true;
                return;
            }else
                fname_err.Visible = false;

            if (lname == "")
            {
                lname_err.Visible = true;
                return;
            }else
                lname_err.Visible = false;
            if (username == "")
            {
                username_err.Text = "Enter Username";
                username_err.Visible = true;
                return;
            }else
                username_err.Visible = false;
            if (password == "")
            {
                password_err.Text = "Enter Password";
                password_err.Visible = true;
                return;
            }else
                password_err.Visible = false;
            if (confirmPass == "")
            {
                confirmPass_err.Text = "Enter Password";
                confirmPass_err.Visible = true;
                return;
            }else
                confirmPass_err.Visible = false;

            DBU.callproc("exec check_username @username = '" + username + "';");
            int check_username = Int32.Parse(DBU.ds.Tables[0].Rows[0].ItemArray[0].ToString());

            if (check_username != 0)
            {
                username_err.Text = "Enter a different username";
                username_err.Visible = true;
            }
            else
                username_err.Visible = false;

            if (password != confirmPass)
            {
                confirmPass_err.Text = "Enter the same password";
                confirmPass_err.Visible = true;
                return;
            }else
                confirmPass_err.Visible = false;

            DBU.callproc("select max(pid) from person");
            int pid = Int32.Parse(DBU.ds.Tables[0].Rows[0].ItemArray[0].ToString());
            pid++;
            try
            {
                DBU.callproc("exec insert_new_person @pid=" + pid + ", @pfname='" + fname + "', @plname='" + lname + "', @email='" + email + "', @mobile='" + mobile + "';");
                DBU.callproc("exec insert_new_user @pid=" + pid + ", @username='" + username + "', @password='" + password + "';");
            }catch
            {
                confirmedMsg.Text = "The account cannot be created";
                return;
            }
            fisrtName_txt.Text = "";
            lastName_txt.Text = "";
            userReg_txt.Text = "";
            passReg_txt.Text = "";
            confirmPass_txt.Text = "";
            mobile_txt.Text = "";
            email_txt.Text = "";
            confirmedMsg.Text = "The account created successfully"; 

        }
    }
}