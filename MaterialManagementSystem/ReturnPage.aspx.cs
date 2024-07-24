using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MaterialManagementSystem 
{
    public partial class ReturnPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Optionally, you can initialize the page here if needed
            }
        }

        protected void btnLoadMaterials_Click(object sender, EventArgs e)
        {
            BindMaterials();
        }

        private void BindMaterials()
        {
            string gatePassId = txtGatePassId.Text.Trim();
            if (string.IsNullOrEmpty(gatePassId))
            {
                // Optionally, display a message indicating that the GatePass ID is required
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["db1ConnectionString3"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"
                    SELECT 
                        [G].[GatePass_id], 
                        [D].[S_No], 
                        [D].[Material_description], 
                        [D].[Qty_of_material], 
                        [D].[Return_type], 
                        [D].[Reason_for_issue], 
                        [D].[isReturn], 
                        [D].[Qty_of_return], 
                        [D].[ReturnDate], 
                        [D].[Recieved_by], 
                        [D].[EmployeeID], 
                        ISNULL(SUM(RH.[Qty_of_return]), 0) AS QtyAlreadyReturned,
                        ([D].[Qty_of_material] - ISNULL([D].[Qty_of_return], 0)) AS RemainingQty 
                    FROM 
                        [Material_description1] [D] 
                    JOIN 
                        [Material_gatepass1] [G] 
                    ON 
                        [D].[GatePass_id] = [G].[GatePass_id]
                    LEFT JOIN
                        [ReturnHistory] RH
                    ON
                        [D].[GatePass_id] = RH.[GatePass_id] AND [D].[S_No] = RH.[S_No]
                    WHERE 
                        [D].[GatePass_id] = @GatePass_id 
                    AND 
                        [D].[Return_type] = 'Returnable'
                    GROUP BY
                        [G].[GatePass_id], [D].[S_No], [D].[Material_description], [D].[Qty_of_material], [D].[Return_type], [D].[Reason_for_issue], [D].[isReturn], [D].[Qty_of_return], [D].[ReturnDate], [D].[Recieved_by], [D].[EmployeeID]
                    ORDER BY 
                        [G].[GatePass_id]";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@GatePass_id", gatePassId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptMaterials.DataSource = dt;
                rptMaterials.DataBind();
            }
        }

        protected void btnUpdateAll_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["db1ConnectionString3"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                foreach (RepeaterItem item in rptMaterials.Items)
                {
                    HiddenField hfGatePassId = (HiddenField)item.FindControl("hfGatePassId");
                    HiddenField hfSNo = (HiddenField)item.FindControl("hfSNo");
                    TextBox txtQtyOfReturn = (TextBox)item.FindControl("txtQtyOfReturn");
                    TextBox txtReturnDate = (TextBox)item.FindControl("txtReturnDate");
                    TextBox txtReceivedBy = (TextBox)item.FindControl("txtReceivedBy");

                    int qtyOfReturn = string.IsNullOrEmpty(txtQtyOfReturn.Text) ? 0 : int.Parse(txtQtyOfReturn.Text);
                    DateTime returnDate = string.IsNullOrEmpty(txtReturnDate.Text) ? DateTime.Now : DateTime.Parse(txtReturnDate.Text);
                    string receivedBy = txtReceivedBy.Text;

                    SqlCommand cmd = new SqlCommand("SELECT * FROM [Material_description1] WHERE [GatePass_id] = @GatePass_id AND [S_No] = @S_No", conn);
                    cmd.Parameters.AddWithValue("@GatePass_id", hfGatePassId.Value);
                    cmd.Parameters.AddWithValue("@S_No", hfSNo.Value);

                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        int qtyOfMaterial = Convert.ToInt32(reader["Qty_of_material"]);
                        string materialDescription = reader["Material_description"].ToString();

                        reader.Close();

                        SqlCommand insertCmd = new SqlCommand("INSERT INTO [ReturnHistory] ([GatePass_id], [S_No], [Material_description], [Qty_of_material], [Qty_of_return], [ReturnDate], [Recieved_by]) VALUES (@GatePass_id, @S_No, @Material_description, @Qty_of_material, @Qty_of_return, @ReturnDate, @Recieved_by)", conn);
                        insertCmd.Parameters.AddWithValue("@GatePass_id", hfGatePassId.Value);
                        insertCmd.Parameters.AddWithValue("@S_No", hfSNo.Value);
                        insertCmd.Parameters.AddWithValue("@Material_description", materialDescription);
                        insertCmd.Parameters.AddWithValue("@Qty_of_material", qtyOfMaterial);
                        insertCmd.Parameters.AddWithValue("@Qty_of_return", qtyOfReturn);
                        insertCmd.Parameters.AddWithValue("@ReturnDate", returnDate);
                        insertCmd.Parameters.AddWithValue("@Recieved_by", receivedBy);

                        insertCmd.ExecuteNonQuery();
                    }
                }
            }

            // Rebind the materials to refresh the data
            BindMaterials();
        }
    }
}
