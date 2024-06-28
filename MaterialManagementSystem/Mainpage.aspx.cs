using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MaterialManagementSystem
{
    public partial class Mainpage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["id"] == null)
            //{
            //Response.Redirect("Login.aspx");
            //}
            //else
            //{
            //    Response.Write(Session["id"]);
            //}
        }


        protected void LinkIssue_Click(object sender, EventArgs e)
        {
            Response.Redirect("IssueGatepass.aspx");
        }

    }
}