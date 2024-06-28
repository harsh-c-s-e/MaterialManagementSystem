using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MaterialManagementSystem
{
    public partial class SearchPage : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["db1ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Optionally, you can load initial data here if needed
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchValue = txtSearch.Text.Trim();
            if (!string.IsNullOrEmpty(searchValue))
            {
                SearchDatabase(searchValue);
            }
        }

        private void SearchDatabase(string searchValue)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT S_No, Material_description, Qty_of_material, Return_type, Reason_for_issue, GatePass_id " +
                               "FROM Material_description1 " +
                               "WHERE S_No LIKE @SearchValue OR " +
                               "Material_description LIKE @SearchValue OR " +
                               "Qty_of_material LIKE @SearchValue OR " +
                               "Return_type LIKE @SearchValue OR " +
                               "Reason_for_issue LIKE @SearchValue OR " +
                               "GatePass_id LIKE @SearchValue";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@SearchValue", "%" + searchValue + "%");

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    GridViewResults.DataSource = dt;
                    GridViewResults.DataBind();
                }
            }
        }
    }
}
