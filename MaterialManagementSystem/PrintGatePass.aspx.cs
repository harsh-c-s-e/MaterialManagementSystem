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
            if (!IsPostBack)
            {
                string gatePassId = Request.QueryString["GatePass_id"];
                if (!string.IsNullOrEmpty(gatePassId))
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
                                        md.Reason_for_issue, md.Return_type, md.S_No,
                                        mg.IssueDate , mg.Issued_by , mg.Approved_by
                                 FROM Material_gatepass1 mg
                                 JOIN Material_description1 md ON mg.GatePass_id = md.GatePass_id
                                 WHERE mg.GatePass_id = @GatePass_id";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@GatePass_id", gatePassId);

                con.Open();

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    lblissuedby.Text = dt.Rows[0]["Issued_by"].ToString();
                    lblapprovedby.Text = dt.Rows[0]["Approved_by"].ToString();


                    lblDate.Text = Convert.ToDateTime(dt.Rows[0]["IssueDate"]).ToString("dd-MM-yyyy");

                    string[] parts = lblDate.Text.Split('-');

                    if (parts.Length == 3)
                    {
                        string year = parts[2];
                        string month = parts[1];

                        lblRefNo.Text = $"{year}/{month}/{gatePassId.PadLeft(3, '0')}";
                    }
                    else
                    {
                        lblRefNo.Text = gatePassId;
                    }

                    gvMaterials.DataSource = dt;
                    gvMaterials.DataBind();
                }

                con.Close();
            }
        }
    }
}
