using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Student_Seating.MemberPages.Admin
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void logout_btn_Click(object sender, EventArgs e)
        {
            Session["username"] = null;
            Session["pid"] = null;
            Session["rolename"] = null;
            Session["faculty"] = null;
            Response.Redirect("../../Default.aspx");
        }
    }
}