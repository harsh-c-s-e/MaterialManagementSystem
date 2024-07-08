using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MaterialManagementSystem
{
    public partial class IssueGatepass : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["db1ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtdate.Text =DateTime.Now.ToString("yyyy-MM-dd").ToString();
                txtrefno.Text = GenerateNewRefNo();
                SetInitialRow();
            }
        }

        protected void GridQualifaction_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblSerialNo = (Label)e.Row.FindControl("lblSerialNo");
                lblSerialNo.Text = (e.Row.RowIndex + 1).ToString(); 
            }
        }

        private string GetLastRefNo()
        {
            string lastRefNo = "0";
            string connectionString = ConfigurationManager.ConnectionStrings["db1ConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT max(GatePass_id) FROM Material_gatepass1";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();

                object result = cmd.ExecuteScalar();
                if (result != null)
                {
                    lastRefNo = result.ToString();
                }
            }

            return lastRefNo;
        }

        private string GenerateNewRefNo()
        {
            string lastRefNo = GetLastRefNo();
            int newRefNo;

            if (int.TryParse(lastRefNo, out newRefNo))
            {
                newRefNo += 1;
            }
            else
            {
                newRefNo = 1;
            }


            string currentYear = DateTime.Now.Year.ToString();
            string currentmonth = DateTime.Now.Month.ToString();
            return $"{currentYear}/{currentmonth}/{newRefNo:D3}"; 

            //return newRefNo.ToString("D5");
        }


        private void SetInitialRow()
        {
            DataTable dt = new DataTable();
            DataRow dr = null;

            dt.Columns.Add(new DataColumn("MaterialDescription", typeof(string)));
            dt.Columns.Add(new DataColumn("Quantity", typeof(string)));
            dt.Columns.Add(new DataColumn("ReturnType", typeof(string)));
            dt.Columns.Add(new DataColumn("Reason", typeof(string)));

            dr = dt.NewRow();
            dr["MaterialDescription"] = string.Empty;
            dr["Quantity"] = string.Empty;
            dr["ReturnType"] = string.Empty;
            dr["Reason"] = string.Empty;

            dt.Rows.Add(dr);
            ViewState["CurrentTable"] = dt;

            GridQualifaction.DataSource = dt;
            GridQualifaction.DataBind();
        }

        protected void btnaddnewrow_Click(object sender, EventArgs e)
        {
            AddNewRowToGrid();
        }

        private void AddNewRowToGrid()
        {
            if (ViewState["CurrentTable"] != null)
            {
                DataTable dtCurrentTable = (DataTable)ViewState["CurrentTable"];
                DataRow drCurrentRow = null;

                if (dtCurrentTable.Rows.Count > 0)
                {
                    for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
                    {
                        TextBox box1 = (TextBox)GridQualifaction.Rows[i - 1].Cells[1].FindControl("txtmaterialdescription");
                        TextBox box2 = (TextBox)GridQualifaction.Rows[i - 1].Cells[2].FindControl("txtquantity");
                        DropDownList box3 = (DropDownList)GridQualifaction.Rows[i - 1].Cells[3].FindControl("ddlreturntype");
                        TextBox box4 = (TextBox)GridQualifaction.Rows[i - 1].Cells[4].FindControl("txtreason");

                        drCurrentRow = dtCurrentTable.NewRow();

                        dtCurrentTable.Rows[i - 1]["MaterialDescription"] = box1.Text;
                        dtCurrentTable.Rows[i - 1]["Quantity"] = box2.Text;
                        dtCurrentTable.Rows[i - 1]["ReturnType"] = box3.SelectedValue;
                        dtCurrentTable.Rows[i - 1]["Reason"] = box4.Text;
                    }

                    dtCurrentTable.Rows.Add(drCurrentRow);
                    ViewState["CurrentTable"] = dtCurrentTable;

                    GridQualifaction.DataSource = dtCurrentTable;
                    GridQualifaction.DataBind();
                }
            }
            else
            {
                Response.Write("ViewState is null");
            }

            SetPreviousData();
        }
        private void SetPreviousData()
        {
            if (ViewState["CurrentTable"] != null)
            {
                DataTable dt = (DataTable)ViewState["CurrentTable"];
                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        TextBox box1 = (TextBox)GridQualifaction.Rows[i].Cells[1].FindControl("txtmaterialdescription");
                        TextBox box2 = (TextBox)GridQualifaction.Rows[i].Cells[2].FindControl("txtquantity");
                        DropDownList box3 = (DropDownList)GridQualifaction.Rows[i].Cells[3].FindControl("ddlreturntype");
                        TextBox box4 = (TextBox)GridQualifaction.Rows[i].Cells[4].FindControl("txtreason");

                        box1.Text = dt.Rows[i]["MaterialDescription"].ToString();
                        box2.Text = dt.Rows[i]["Quantity"].ToString();
                        box3.SelectedValue = dt.Rows[i]["ReturnType"].ToString();
                        box4.Text = dt.Rows[i]["Reason"].ToString();
                    }
                }
            }
        }


        protected void btnsubmit_Click(object sender, EventArgs e)
        {


            SaveGridDataToDatabase();

            //Response.Redirect("PrintGatePass.aspx");
            txtvehicle.Text = "";
            txtowner.Text = "";
            txtissuingdept.Text = "";
            txtfrom.Text = "";
            txtto.Text = "";
            txtissuedby.Text = "";
            txtapprovedby.Text = "";

            txtrefno.Text = GenerateNewRefNo();

            SetInitialRow();


        }

        private void SaveGridDataToDatabase()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["db1ConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                foreach (GridViewRow row in GridQualifaction.Rows)
                {
                    if (row.RowType == DataControlRowType.DataRow)
                    {
                        Label txtSerialno = (Label)row.FindControl("lblSerialNo");
                        TextBox txtMaterialdescription = (TextBox)row.FindControl("txtmaterialdescription");
                        TextBox txtQuantity = (TextBox)row.FindControl("txtquantity");
                        DropDownList ddlReturntype = (DropDownList)row.FindControl("ddlreturntype");
                        TextBox txtReason = (TextBox)row.FindControl("txtreason");
                        //TextBox txtRefno = (TextBox)row.FindControl("txtrefno");
                        

                        string query = "INSERT INTO Material_description1 (S_No,Material_description, Qty_of_material,Return_type, Reason_for_issue,GatePass_id) VALUES (@Serialno, @MaterialDescription, @Quantity, @MaterialType , @Reason, @Refno)";
                        using (SqlCommand cmd = new SqlCommand(query, con))
                        {
                            cmd.Parameters.AddWithValue("@Serialno", txtSerialno.Text);
                            cmd.Parameters.AddWithValue("@MaterialDescription", txtMaterialdescription.Text);
                            cmd.Parameters.AddWithValue("@Quantity", txtQuantity.Text);
                            cmd.Parameters.AddWithValue("@MaterialType", ddlReturntype.Text);
                            cmd.Parameters.AddWithValue("@Reason", txtReason.Text);
                            cmd.Parameters.AddWithValue("@Refno", ExtractLastPart(txtrefno.Text));

                            cmd.ExecuteNonQuery();
                        }

                    }
                }
                string query2 = "INSERT INTO Material_gatepass1 (Vehical_Reg_No,Owner, Issuing_Department,From_address, To_address,Issued_by, Approved_by , IssueDate,GatePass_id) " +
                    "VALUES (@Vehicle, @Owner, @Issuingdept, @From , @To, @Issuedby , @Approvedby ,@Date,@Refno)";
                using (SqlCommand cmd = new SqlCommand(query2, con))
                {
                    cmd.Parameters.AddWithValue("@Vehicle", txtvehicle.Text);
                    cmd.Parameters.AddWithValue("@Owner", txtowner.Text);
                    cmd.Parameters.AddWithValue("@Issuingdept", txtissuingdept.Text);
                    cmd.Parameters.AddWithValue("@From", txtfrom.Text);
                    cmd.Parameters.AddWithValue("@To", txtto.Text);
                    cmd.Parameters.AddWithValue("@Issuedby", txtissuedby.Text);
                    cmd.Parameters.AddWithValue("@Approvedby", txtapprovedby.Text);
                    cmd.Parameters.AddWithValue("@Date", txtdate.Text);
                    cmd.Parameters.AddWithValue("@Refno", ExtractLastPart(txtrefno.Text));

                    cmd.ExecuteNonQuery();
                }

                con.Close();
            }
            Response.Write("<script> alert('Submitted successfully')</script>");
        }

        private string ExtractLastPart(string refNo)
        {
            string[] parts = refNo.Split('/');
            return parts[parts.Length - 1];
        }

    }




}


