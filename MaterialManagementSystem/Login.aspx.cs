using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;
using System.Web.Services.Description;
using System.Configuration;



namespace MaterialManagementSystem
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=db1;Integrated Security=True;Encrypt=False");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("select * from login_table where Username='" + txtusername.Text + "' and Password ='" + txtpassword.Text + "' ", conn);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Session["id"] = txtusername.Text;
                Response.Redirect("Main2.aspx");
            }
            else
            {
                Response.Write("<script> alert('Invalid username or password')</script>");
            }



            //if (txtusername.Text == "admin" && txtpassword.Text == "admin")
            //{
            //    Response.Redirect("Mainpage.aspx");
            //}
            //else
            //{
            //    Response.Write("<script>alert('pls check password') </script>");
            //}


        }

        protected void cbshowpassword_CheckedChanged(object sender, EventArgs e)
        {
            //if (cbshowpassword.Checked)
            //{
            //    txtpassword.TextMode = TextBoxMode.SingleLine;
            //}
            //else
            //{
            //    txtpassword.TextMode = TextBoxMode.Password;
            //}

        }

        protected void btnclear_Click(object sender, EventArgs e)
        {
            txtpassword.Text = "";
            txtusername.Text = "";


        }
    }
}