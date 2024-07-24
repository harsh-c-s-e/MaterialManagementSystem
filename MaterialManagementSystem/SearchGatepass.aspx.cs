using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MaterialManagementSystem
{
    public partial class SearchGatePass : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadSearchResults(txtSearch.Text.Trim());
        }

        private void LoadSearchResults(string gatePassId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["db1ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"SELECT mg.GatePass_id, mg.Vehical_Reg_No, md.Material_description, md.Qty_of_material, 
                                        mg.Owner, mg.Issuing_Department, mg.From_address, mg.To_address, 
                                        md.Reason_for_issue, md.Return_type, md.S_No
                                 FROM Material_gatepass1 mg
                                 JOIN Material_description1 md ON mg.GatePass_id = md.GatePass_id
                                 WHERE mg.GatePass_id LIKE '%' + @GatePass_id + '%'";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@GatePass_id", gatePassId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvSearchResults.DataSource = dt;
                gvSearchResults.DataBind();
            }
        }

        protected void btnDirectPrint_Click(object sender, EventArgs e)
        {
            string gatePassId = txtSearch.Text.Trim();
            if (!string.IsNullOrEmpty(gatePassId))
            {
                string issueDate = DateTime.Now.ToString("yyyy-MM-dd"); // or fetch the issue date from your data
                Response.Redirect("PrintGatePass.aspx?GatePass_id=" + gatePassId + "&IssueDate=" + issueDate);
            }
        }
    }
}
