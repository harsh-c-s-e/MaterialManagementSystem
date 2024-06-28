using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace MaterialManagementSystem
{
    public partial class addnewrow : System.Web.UI.Page
    {

        string cs = ConfigurationManager.ConnectionStrings["db1ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetInitialRow();
            }
        }

        private void SetInitialRow()

        {

            DataTable dt = new DataTable();

            DataRow dr = null;

            dt.Columns.Add(new DataColumn("Column1", typeof(string)));
            dt.Columns.Add(new DataColumn("Column2", typeof(string)));
            dt.Columns.Add(new DataColumn("Column3", typeof(string)));
            dt.Columns.Add(new DataColumn("Column4", typeof(string)));
            //dt.Columns.Add(new DataColumn("Column5", typeof(string)));


            dr = dt.NewRow();



            dr["Column1"] = string.Empty;
            dr["Column2"] = string.Empty;
            dr["Column3"] = string.Empty;
            dr["Column4"] = string.Empty;
            //dr["Column5"] = string.Empty;

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

            int rowIndex = 0;



            if (ViewState["CurrentTable"] != null)

            {

                DataTable dtCurrentTable = (DataTable)ViewState["CurrentTable"];

                DataRow drCurrentRow = null;

                if (dtCurrentTable.Rows.Count > 0)

                {

                    for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)

                    {

                        //extract the TextBox values

                        TextBox box1 = (TextBox)GridQualifaction.Rows[rowIndex].Cells[1].FindControl("txtinstituteName");
                        TextBox box2 = (TextBox)GridQualifaction.Rows[rowIndex].Cells[1].FindControl("txtdegree");
                        TextBox box3 = (TextBox)GridQualifaction.Rows[rowIndex].Cells[1].FindControl("txtgrade");
                        //TextBox box4 = (TextBox)GridQualifaction.Rows[rowIndex].Cells[1].FindControl("txtyear");
                        TextBox box5 = (TextBox)GridQualifaction.Rows[rowIndex].Cells[1].FindControl("txtmaterialdescription");




                        drCurrentRow = dtCurrentTable.NewRow();




                        dtCurrentTable.Rows[i - 1]["Column1"] = box1.Text;
                        dtCurrentTable.Rows[i - 1]["Column2"] = box2.Text;
                        dtCurrentTable.Rows[i - 1]["Column3"] = box3.Text;
                        //dtCurrentTable.Rows[i - 1]["Column4"] = box4.Text;
                        dtCurrentTable.Rows[i - 1]["Column5"] = box5.Text;



                        rowIndex++;

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



            //Set Previous Data on Postbacks

            SetPreviousData();

        }
        private void SetPreviousData()

        {

            int rowIndex = 0;

            if (ViewState["CurrentTable"] != null)

            {

                DataTable dt = (DataTable)ViewState["CurrentTable"];

                if (dt.Rows.Count > 0)

                {

                    for (int i = 0; i < dt.Rows.Count; i++)

                    {

                        TextBox box1 = (TextBox)GridQualifaction.Rows[rowIndex].Cells[1].FindControl("txtinstituteName");
                        TextBox box2 = (TextBox)GridQualifaction.Rows[rowIndex].Cells[1].FindControl("txtdegree");
                        TextBox box3 = (TextBox)GridQualifaction.Rows[rowIndex].Cells[1].FindControl("txtgrade");
                        //TextBox box4 = (TextBox)GridQualifaction.Rows[rowIndex].Cells[1].FindControl("txtyear");
                        TextBox box5 = (TextBox)GridQualifaction.Rows[rowIndex].Cells[1].FindControl("txtmaterialdescription");



                        box1.Text = dt.Rows[i]["Column1"].ToString();
                        box2.Text = dt.Rows[i]["Column2"].ToString();
                        box3.Text = dt.Rows[i]["Column3"].ToString();
                        //box4.Text = dt.Rows[i]["Column4"].ToString();
                        box5.Text = dt.Rows[i]["Column5"].ToString();


                        rowIndex++;

                    }

                }

            }

        }


        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            SaveGridDataToDatabase();
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
                        TextBox txtInstituteName = (TextBox)row.FindControl("txtinstituteName");
                        TextBox txtDegree = (TextBox)row.FindControl("txtdegree");
                        TextBox txtGrade = (TextBox)row.FindControl("txtgrade");
                        //TextBox txtYear = (TextBox)row.FindControl("txtyear");
                        TextBox txtMaterialDescription = (TextBox)row.FindControl("txtmaterialdescription");

                        string query = "INSERT INTO customer_tbl (institute_name, degree, grade) VALUES (@InstituteName, @Degree, @Grade)";
                        using (SqlCommand cmd = new SqlCommand(query, con))
                        {
                            cmd.Parameters.AddWithValue("@InstituteName", txtInstituteName.Text);
                            cmd.Parameters.AddWithValue("@Degree", txtDegree.Text);
                            cmd.Parameters.AddWithValue("@Grade", txtGrade.Text);
                            //cmd.Parameters.AddWithValue("@Year", txtYear.Text);

                            cmd.ExecuteNonQuery();
                        }
                        string query2 = "INSERT INTO test_tbl (material_description) VALUES (@MaterialDescription)";
                        using (SqlCommand cmd = new SqlCommand(query2, con))
                        {
                            cmd.Parameters.AddWithValue("@MaterialDescription", txtMaterialDescription.Text);

                            cmd.ExecuteNonQuery();
                        }

                    }
                }

                con.Close();
            }
            Response.Write("<script> alert('Submitted successfully')</script>");
        }

    }




}
