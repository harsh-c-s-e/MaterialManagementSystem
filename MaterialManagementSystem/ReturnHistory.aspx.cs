using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MaterialManagementSystem
{
    public partial class ReturnHistory : System.Web.UI.Page
    {
        private string sortDirection = "DESC";
        private string sortExpression = "ReturnDate";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindReturnHistory();
            }
        }

        private void BindReturnHistory()
        {
            // Get GatePass_id and S_No from query parameters
            string gatePassId = Request.QueryString["GatePass_id"];
            string sNo = Request.QueryString["S_No"];

            string connStr = ConfigurationManager.ConnectionStrings["db1ConnectionString3"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                // Modify query to filter by GatePass_id and S_No
                string query = $@"
                    SELECT 
                        GatePass_id, 
                        S_No,
                        Return_No,
                        Qty_of_return, 
                        ReturnDate, 
                        Recieved_by 
                    FROM 
                        ReturnHistory 
                    WHERE 
                        GatePass_id = @GatePass_id AND S_No = @S_No
                    ORDER BY 
                        {sortExpression} {sortDirection}";

                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                da.SelectCommand.Parameters.AddWithValue("@GatePass_id", gatePassId);
                da.SelectCommand.Parameters.AddWithValue("@S_No", sNo);

                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {
            if (sortExpression == e.SortExpression)
            {
                sortDirection = (sortDirection == "ASC") ? "DESC" : "ASC";
            }
            else
            {
                sortExpression = e.SortExpression;
                sortDirection = "ASC";
            }

            BindReturnHistory();
        }
    }
}
