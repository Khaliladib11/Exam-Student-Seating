using IPUMS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Student_Seating.MemberPages.Admin
{
    public partial class Users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {

                if (!IsPostBack)
                {
                    DBU.callproc("exec select_all_users;");
                    usersGrid.DataSource = DBU.ds.Tables[0];
                    usersGrid.DataBind();
                }


                    if (Session["rolename"].ToString() != "Admin")
                    Response.Redirect("~/Default.aspx", false);
            }
            else
                Response.Redirect("~/Default.aspx", false);
        }

        /*protected void makeInst_btn_Click(object sender, EventArgs e)
        {
            string username = usernames_txt.Text;
            DBU.callproc("exec get_id_by_username @username ='" + username + "';");
            int pid = int.Parse(DBU.ds.Tables[0].Rows[0].ItemArray[0].ToString());
            DBU.callproc("exec make_instructor @pid="+ pid +";");
            DBU.callproc("exec insert_into_instructor @pid=" + pid + ";");

            DBU.callproc("exec select_all_users;");
            usersGrid.DataSource = DBU.ds.Tables[0];
            usersGrid.DataBind();
        }

        protected void rmvInst_btn_Click(object sender, EventArgs e)
        {
            string username = usernames_txt.Text;
            DBU.callproc("exec get_id_by_username @username ='" + username + "';");
            int pid = int.Parse(DBU.ds.Tables[0].Rows[0].ItemArray[0].ToString());

            DBU.callproc("exec remove_instructor @pid=" + pid + ";");
            DBU.callproc("exec make_instructor_user @pid=" + pid + ";");

            DBU.callproc("exec select_all_users;");
            usersGrid.DataSource = DBU.ds.Tables[0];
            usersGrid.DataBind();
        }

        protected void dltUser_btn_Click(object sender, EventArgs e)
        {
            string username = usernames_txt.Text;
            DBU.callproc("exec get_id_by_username @username ='" + username + "';");
            int pid = int.Parse(DBU.ds.Tables[0].Rows[0].ItemArray[0].ToString());

            DBU.callproc("exec delete_user @pid=" + pid + ";");

            DBU.callproc("exec select_all_users;");
            usersGrid.DataSource = DBU.ds.Tables[0];
            usersGrid.DataBind();
        }
        */
        protected void usersGrid_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (usersGrid.SelectedIndex != -1)
            {
                usernames_txt.Text = usersGrid.SelectedRow.Cells[2].Text;
            }
        }

        protected void dltUser_btn_Click1(object sender, EventArgs e)
        {
            string username = usernames_txt.Text;
            DBU.callproc("exec get_id_by_username @username ='" + username + "';");
            int pid = int.Parse(DBU.ds.Tables[0].Rows[0].ItemArray[0].ToString());
            try
            {
                DBU.callproc("exec delete_user @pid=" + pid + ";");
                inst_err.Text = "";
                inst_err.Visible = false;

            }
            catch
            {
                inst_err.Text = "Cannot be removed";
                inst_err.Visible = true;
            }
            

            DBU.callproc("exec select_all_users;");
            usersGrid.DataSource = DBU.ds.Tables[0];
            usersGrid.DataBind();
        }

        protected void makeInst_btn_Click1(object sender, EventArgs e)
        {
            string username = usernames_txt.Text;
            DBU.callproc("exec get_id_by_username @username ='" + username + "';");
            int pid = int.Parse(DBU.ds.Tables[0].Rows[0].ItemArray[0].ToString());
            DBU.callproc("exec make_instructor @pid=" + pid + ";");
            DBU.callproc("exec insert_into_instructor @pid=" + pid + ";");

            DBU.callproc("exec select_all_users;");
            usersGrid.DataSource = DBU.ds.Tables[0];
            usersGrid.DataBind();
        }

        protected void rmvInst_btn_Click1(object sender, EventArgs e)
        {
            string username = usernames_txt.Text;
            DBU.callproc("exec get_id_by_username @username ='" + username + "';");
            int pid = int.Parse(DBU.ds.Tables[0].Rows[0].ItemArray[0].ToString());
            try
            {
                DBU.callproc("exec remove_instructor @pid=" + pid + ";");
                DBU.callproc("exec make_instructor_user @pid=" + pid + ";");
                inst_err.Text = "";
                inst_err.Visible = false;

            }
            catch
            {
                inst_err.Text = "Cannot be removed";
                inst_err.Visible = true;
            }
           
            DBU.callproc("exec select_all_users;");
            usersGrid.DataSource = DBU.ds.Tables[0];
            usersGrid.DataBind();
        }
    }
}