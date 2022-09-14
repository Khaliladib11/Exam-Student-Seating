using IPUMS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;


namespace Student_Seating.MemberPages.Admin
{
    public partial class Faculty : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                if (!IsPostBack)
                { 
                    DBU.callproc("exec faculty_select_all;");
                    gvfaculties.DataSource = DBU.ds.Tables[0];
                    gvfaculties.DataBind();

                    DBU.callproc("exec select_instructors_Fullname;");
                    InstName_drl.DataSource = DBU.ds.Tables[0];
                    InstName_drl.DataTextField = "name";
                    InstName_drl.DataValueField = "pid";
                    InstName_drl.DataBind();
                }

                if (Session["rolename"].ToString() != "Admin")
                    Response.Redirect("~/Default.aspx", false);
            }
            else
                Response.Redirect("~/Default.aspx", false);
        }

        protected void Add_btn_Click1(object sender, EventArgs e)
        {
            String fctid = fctid_txt.Text;
            String fctname = fctname_txt.Text;
            String instructor = InstName_drl.SelectedValue;

            //DBU.callproc("insert into faculty(fctid, fctname, pid) values('"+ fctid  + "', '" + fctname + "'," + instructor + ");");
            DBU.callproc("exec faculty_insert @fctid='"+ fctid +"',@fctname='"+ fctname +"',@pid="+ instructor +";");
            DBU.callproc("exec faculty_select_all;");
            gvfaculties.DataSource = DBU.ds.Tables[0];
            gvfaculties.DataBind();
        }

        protected void Remove_btn_Click(object sender, EventArgs e)
        {
            String fctid = fctid_txt.Text;
            DBU.callproc("exec faculty_delete @fctid = '"+ fctid +"';");
            DBU.callproc("faculty_select_all;");
            gvfaculties.DataSource = DBU.ds.Tables[0];
            gvfaculties.DataBind();
        }

        protected void Modify_btn_Click(object sender, EventArgs e)
        {
            String fctid = fctid_txt.Text;
            String fctname = fctname_txt.Text;
            DBU.callproc("exec faculty_update @fctid = '"+ fctid +"', @fctname = '"+ fctname +"';");
            DBU.callproc("exec faculty_select_all;");
            gvfaculties.DataSource = DBU.ds.Tables[0];
            gvfaculties.DataBind();
        }

        protected void Display_btn_Click1(object sender, EventArgs e)
        {
            DBU.callproc("exec faculty_select_all;");
            gvfaculties.DataSource = DBU.ds.Tables[0];
            gvfaculties.DataBind();
        }

        protected void gvfaculties_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (gvfaculties.SelectedIndex != -1)
            {
                fctid_txt.Text = gvfaculties.SelectedRow.Cells[1].Text;
                fctname_txt.Text = gvfaculties.SelectedRow.Cells[2].Text;
                //InstName_drl.SelectedValue = gvfaculties.SelectedRow.Cells[3].Text;
            }
        }
    }
}