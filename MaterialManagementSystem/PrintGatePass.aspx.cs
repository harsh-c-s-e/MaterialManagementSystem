using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace MaterialManagementSystem
{
    public partial class PrintGatePass : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            

            //lblDate.Text = (string)Session["Date"];
            if (!IsPostBack)
            {
                DateTime issueDate = (DateTime)Session["Date"];
                lblDate.Text = issueDate.ToString("MM/dd/yyyy");

                string gatePassId = Request.QueryString["GatePass_id"];
                //string gatePassdate = Request.QueryString["IssueDate"];
                if (!string.IsNullOrEmpty(gatePassId) )
                {
                    LoadGatePassDetails(gatePassId);
                }
            }
        }

        private void LoadGatePassDetails(string gatePassId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["db1ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"SELECT mg.GatePass_id, mg.Vehical_Reg_No, md.Material_description, md.Qty_of_material, 
                                        mg.Owner, mg.Issuing_Department, mg.From_address, mg.To_address, 
                                        md.Reason_for_issue, md.Return_type, md.S_No
                                 FROM Material_gatepass1 mg
                                 JOIN Material_description1 md ON mg.GatePass_id = md.GatePass_id
                                 WHERE mg.GatePass_id = @GatePass_id";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@GatePass_id", gatePassId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    lblRefNo.Text = gatePassId;
                    DateTime issueDate = (DateTime)Session["Date"];
                    lblDate.Text = issueDate.ToString("MM/dd/yyyy");
                    //lblDate.Text = gatePassdate;
                    //lblDate.Text = DateTime.Now.ToString("yyyy-MM-dd");

                    gvMaterials.DataSource = dt;
                    gvMaterials.DataBind();
                }
            }
        }
    }
}
