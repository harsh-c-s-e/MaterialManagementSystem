using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MaterialManagementSystem
{
    public partial class Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Button1.BackColor = System.Drawing.Color.White;
            Button2.BackColor = System.Drawing.Color.White;
        }

        protected void Button2_Click(object sender, EventArgs e)
        { // Pending material
            Button1.BackColor = System.Drawing.Color.White;
            Button2.BackColor = System.Drawing.Color.Yellow;
            GridView1.Visible = true;
            GridView2.Visible = false;
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        { // complete report
            Button1.BackColor = System.Drawing.Color.Yellow;
            Button2.BackColor = System.Drawing.Color.White;
            GridView2.Visible = true;
            GridView1.Visible = false;
            GridView1.DataBind();
        }
    }
}