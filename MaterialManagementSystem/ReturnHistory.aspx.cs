﻿using System;
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
            string connStr = ConfigurationManager.ConnectionStrings["db1ConnectionString3"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = $@"
                    SELECT 
                        GatePass_id, 
                        S_No, 
                        Material_description, 
                        Qty_of_material, 
                        Qty_of_return, 
                        ReturnDate, 
                        Recieved_by 
                    FROM 
                        ReturnHistory 
                    ORDER BY 
                        {sortExpression} {sortDirection}";

                SqlDataAdapter da = new SqlDataAdapter(query, conn);
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