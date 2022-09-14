using IPUMS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Student_Seating.MemberPages.Admin
{
    public partial class Departement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                if (!IsPostBack)
                {
                    DBU.callproc("exec select_all_faculty;");
                    dctid_ddl.DataSource = DBU.ds.Tables[0];
                    dctid_ddl.DataTextField = "Faculty name";
                    dctid_ddl.DataValueField = "ID";
                    dctid_ddl.DataBind();

                    String fctid = dctid_ddl.SelectedValue; 
                    DBU.callproc("exec select_departement_by_fctid @fctid = '"+ fctid + "';");
                    depGrid.DataSource = DBU.ds.Tables[0];
                    depGrid.DataBind();
                } 

                if (Session["rolename"].ToString() != "Admin")
                    Response.Redirect("~/Default.aspx", false);
            }
            else
                Response.Redirect("~/Default.aspx", false);
        }

        protected void displayDpt_btn_Click(object sender, EventArgs e)
        {
            String fctid = dctid_ddl.SelectedValue;
            DBU.callproc("exec select_departement_by_fctid @fctid = '" + fctid + "';");
            depGrid.DataSource = DBU.ds.Tables[0];
            depGrid.DataBind();
        }

        protected void addDpt_btn_Click(object sender, EventArgs e)
        {
            String dptid = dptid_txt.Text;
            String dptname = dptname_txt.Text;
            String fctid = dctid_ddl.SelectedValue;
            DBU.callproc("exec insert_departement @dptid='" + dptid + "',@dptname='" + dptname + "',@fctid=" + fctid + ";");
            DBU.callproc("exec select_departement_by_fctid @fctid = '" + fctid + "';");
            depGrid.DataSource = DBU.ds.Tables[0];
            depGrid.DataBind();
        }

        protected void removeDpt_btn_Click(object sender, EventArgs e)
        {
            String dptid = dptid_txt.Text;
            String fctid = dctid_ddl.SelectedValue;
            DBU.callproc("exec delete_departement @dptid='" + dptid +"';");
            DBU.callproc("exec select_departement_by_fctid @fctid = '" + fctid + "';");
            depGrid.DataSource = DBU.ds.Tables[0];
            depGrid.DataBind();
        }

        protected void modifydpt_btn_Click(object sender, EventArgs e)
        {
            String dptid = dptid_txt.Text;
            String dptname = dptname_txt.Text;
            String fctid = dctid_ddl.SelectedValue;
            DBU.callproc("exec departement_update @dptid ='"+ dptid + "', @deptname ='"+ dptname  + "';");
            DBU.callproc("exec select_departement_by_fctid @fctid = '" + fctid + "';");
            depGrid.DataSource = DBU.ds.Tables[0];
            depGrid.DataBind();
        }
        protected void foo_SelectedIndexChanged(Object sender, EventArgs e)
        {
            String fctid = dctid_ddl.SelectedValue;
            DBU.callproc("exec select_departement_by_fctid @fctid = '" + fctid + "';");
            depGrid.DataSource = DBU.ds.Tables[0];
            depGrid.DataBind();
        }
    }
}