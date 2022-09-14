using IPUMS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Student_Seating.MemberPages.Instructor
{
    public partial class Hall : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                if (!IsPostBack)
                {
                    string fctid = Session["faculty"].ToString();
                    DBU.callproc("exec select_hall_by_fctid @fctid = '" + fctid + "'; ");
                    hallGrid.DataSource = DBU.ds.Tables[0];
                    hallGrid.DataBind();
                }

                if (Session["rolename"].ToString() != "Instructor")
                    Response.Redirect("~/Default.aspx", false);
            }
            else
                Response.Redirect("~/Default.aspx", false);
        }

        protected void addHall_btn_Click(object sender, EventArgs e)
        {
            string hid = hid_txt.Text;
            string number = nbSeats_txt.Text;
            string fctid = Session["faculty"].ToString();
            if (hid == "" || number == "")
            {
                errorHall_txt.Text = "insert all info";
                errorHall_txt.Visible = true;
                hall_conf.Text = "";
                hall_conf.Visible = false;
                return;
            }
            errorHall_txt.Text = "";
            errorHall_txt.Visible = false;
            try
            {
                DBU.callproc("exec insert_new_hall @hid ='" + hid + "', @number ='" + number + "', @fctid ='" + fctid + "';");
                hall_conf.Text = "hall has been added.";
                hall_conf.Visible = true;
            }
            catch 
            {
                errorHall_txt.Text = "please insert a number.";
                errorHall_txt.Visible = true;
                hall_conf.Text = "";
                hall_conf.Visible = false;
            }
            DBU.callproc("exec select_hall_by_fctid @fctid = '" + fctid + "'; ");
            hallGrid.DataSource = DBU.ds.Tables[0];
            hallGrid.DataBind();
        }

        protected void displayHall_btn_Click(object sender, EventArgs e)
        {
            string fctid = Session["faculty"].ToString();
            DBU.callproc("exec select_hall_by_fctid @fctid = '" + fctid + "'; ");
            hallGrid.DataSource = DBU.ds.Tables[0];
            hallGrid.DataBind();
        }

        protected void removeHall_btn_Click(object sender, EventArgs e)
        {
            string hid = hid_txt.Text;
            string number = nbSeats_txt.Text;
            string fctid = Session["faculty"].ToString();
            if (hid == "" || number == "")
            {
                errorHall_txt.Text = "insert all info";
                errorHall_txt.Visible = true;
                hall_conf.Text = "";
                hall_conf.Visible = false;
                return;
            }
            errorHall_txt.Text = "";
            errorHall_txt.Visible = false;
            DBU.callproc("exec delete_hall @hid ='" + hid + "';");
            hall_conf.Text = "hall has been removed.";
            hall_conf.Visible = true;
            DBU.callproc("exec select_hall_by_fctid @fctid = '" + fctid + "'; ");
            hallGrid.DataSource = DBU.ds.Tables[0];
            hallGrid.DataBind();
        }

        protected void modifyHall_btn_Click(object sender, EventArgs e)
        {

            string hid = hid_txt.Text;
            string number = nbSeats_txt.Text;
            string fctid = Session["faculty"].ToString();
            if (hid == "" || number == "")
            {
                errorHall_txt.Text = "insert all info";
                errorHall_txt.Visible = true;
                hall_conf.Text = "";
                hall_conf.Visible = false;
                return;
            }
            errorHall_txt.Text = "";
            errorHall_txt.Visible = false;
            try
            {
                DBU.callproc("exec hall_update @hid ='" + hid + "', @number ='" + number + "';");
                hall_conf.Text = "hall has been modified.";
                hall_conf.Visible = true;
            }
            catch
            {
                errorHall_txt.Text = "please insert a number.";
                errorHall_txt.Visible = true;
                hall_conf.Text = "";
                hall_conf.Visible = false;
            }
            DBU.callproc("exec select_hall_by_fctid @fctid = '" + fctid + "'; ");
            hallGrid.DataSource = DBU.ds.Tables[0];
            hallGrid.DataBind();
        }
    }
}