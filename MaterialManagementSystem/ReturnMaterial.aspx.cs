using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Web.UI;

namespace MaterialManagementSystem
{
    public partial class ReturnMaterial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //GridView2.DataSource = SqlDataSource3;
                //GridView2.DataBind();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //GridView1.DataBind();

            
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.DataBind();

            
        }



        private string GetLastRefNo()
        {
            string lastRefNo = "0";
            //string gatePassId = e.Keys["GatePass_id"].ToString();
            //int sNo = Convert.ToInt32(e.Keys["S_No"]);
            string gatePassId = txtSearch.Text;
            string sNo = txtserial.Text;

            string connectionString = ConfigurationManager.ConnectionStrings["db1ConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT max(Return_No) FROM ReturnHistory WHERE GatePass_id = @gatePassId AND S_No =@sNo ";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@GatePassId", gatePassId);
                    cmd.Parameters.AddWithValue("@SNo", sNo);

                        conn.Open();
                        object result = cmd.ExecuteScalar();
                        if (result != null && result != DBNull.Value)
                        {
                            lastRefNo = result.ToString();
                        }
                    
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


            return newRefNo.ToString();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            TextBox txtReturnDate = (TextBox)row.FindControl("TextBox2");
            TextBox txtReceivedBy = (TextBox)row.FindControl("TextBox3");

            SqlDataSource2.UpdateParameters["ReturnDate"].DefaultValue = txtReturnDate.Text;
            SqlDataSource2.UpdateParameters["ReceivedBy"].DefaultValue = txtReceivedBy.Text;
        }



        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            if (e.AffectedRows > 0)
            {
                string gatePassId = e.Keys["GatePass_id"].ToString();
                int sNo = Convert.ToInt32(e.Keys["S_No"]);
                int qtyOfReturn = Convert.ToInt32(e.NewValues["Qty_of_return"]);
                //DateTime returnDate = Convert.ToDateTime(e.NewValues["ReturnDate"]);

                //string receivedBy = e.NewValues["Recieved_by"].ToString();
                //int qtyAlreadyReturned = Convert.ToInt32(e.NewValues["QtyAlreadyReturned"]);
                string returnno = GenerateNewRefNo();



                SqlDataSource2.InsertParameters["GatePass_id"].DefaultValue = gatePassId;
                SqlDataSource2.InsertParameters["S_No"].DefaultValue = sNo.ToString();
                SqlDataSource2.InsertParameters["Return_No"].DefaultValue = returnno.ToString();
                SqlDataSource2.InsertParameters["Qty_of_return"].DefaultValue = qtyOfReturn.ToString();
                //SqlDataSource2.InsertParameters["ReturnDate"].DefaultValue = returnDate.ToString("yyyy-MM-dd");
                //SqlDataSource2.InsertParameters["Recieved_by"].DefaultValue = receivedBy;
                SqlDataSource2.Insert();

                //string cs = ConfigurationManager.ConnectionStrings["db1ConnectionString"].ConnectionString;

                //using (SqlConnection conn = new SqlConnection(cs))
                //{

                //    string computeQuery = "SELECT ISNULL(SUM(R.Qty_of_return), 0) AS QtyAlreadyReturned FROM ReturnHistory R WHERE GatePass_id = @GatePassId AND S_No = @SNo";

                //    using (SqlCommand computeCmd = new SqlCommand(computeQuery, conn))
                //    {
                //        computeCmd.Parameters.AddWithValue("@GatePassId", gatePassId);
                //        computeCmd.Parameters.AddWithValue("@SNo", sNo);

                //        conn.Open();
                //        object result = computeCmd.ExecuteScalar();
                //        conn.Close();

                //        int qtyalreadyReturned = result != DBNull.Value ? Convert.ToInt32(result) : 0;

                //        //string insertQuery = "INSERT INTO Material_description1(Qty_of_return) VALUES (@Qty_of_return) WHERE GatePass_id = gatePassId AND S_No = @SNo  ";

                //        string updateQuery = @"UPDATE Material_description1
                //                                SET Qty_of_return = @Qty_of_return
                //                                WHERE GatePass_id = @GatePassId AND S_No = @SNo ";

                //        using (SqlCommand updateCmd = new SqlCommand(updateQuery, conn))
                //        {
                //            updateCmd.Parameters.AddWithValue("@Qty_of_return", qtyalreadyReturned);
                //            updateCmd.Parameters.AddWithValue("@GatePassId", gatePassId);
                //            updateCmd.Parameters.AddWithValue("@SNo", sNo);

                //            conn.Open();
                //            updateCmd.ExecuteNonQuery();
                //            conn.Close();
                //        }
                //    }
                //}





                //SqlDataSource1.UpdateParameters["Qty_of_return"].DefaultValue = qtyAlreadyReturned.ToString();
                //SqlDataSource1.UpdateParameters["ReturnDate"].DefaultValue = DateTime.Now.ToString("yyyy-MM-dd");
                //SqlDataSource1.UpdateParameters["Recieved_by"].DefaultValue = e.NewValues["Recieved_by"].ToString();
                //SqlDataSource1.Update();

            }
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btninsert_Click(object sender, EventArgs e)
        {
            //TextBox gatepassid=GridView2.FooterRow.FindControl("TextBox1") as TextBox;
            //TextBox sno = GridView2.FooterRow.FindControl("TextBox2") as TextBox;
            //TextBox returnno = GridView2.FooterRow.FindControl("TextBox3") as TextBox;
            //TextBox qtyofreturn = GridView2.FooterRow.FindControl("TextBox4") as TextBox;
            //TextBox returndate = GridView2.FooterRow.FindControl("TextBox5") as TextBox;
            //TextBox recievedby = GridView2.FooterRow.FindControl("TextBox6") as TextBox;

            TextBox gatepassid = txtSearch;
            TextBox sno = txtserial;
            string returnno = Label3.Text;
            //TextBox returnno = TextBox9;
            TextBox qtyofreturn = TextBox10;
            TextBox returndate = TextBox11;
            TextBox recievedby = TextBox12;

            string query = "INSERT INTO ReturnHistory (GatePass_id, S_No, Return_No, Qty_of_return, ReturnDate, Recieved_by) " +
               "VALUES (@GatePass_id, @S_No, @Return_No, @Qty_of_return, @ReturnDate, @Recieved_by)";
            string cs = ConfigurationManager.ConnectionStrings["db1ConnectionString3"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@GatePass_id", gatepassid.Text);
                    cmd.Parameters.AddWithValue("@S_No", sno.Text);
                    cmd.Parameters.AddWithValue("@Return_No", returnno);
                    cmd.Parameters.AddWithValue("@Qty_of_return", qtyofreturn.Text);
                    cmd.Parameters.AddWithValue("@ReturnDate", returndate.Text);
                    cmd.Parameters.AddWithValue("@Recieved_by", recievedby.Text);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }

            //TextBox7.Text = "";
            //TextBox8.Text = "";
            //TextBox9.Text = "";
            Label3.Text = GenerateNewRefNo();
            TextBox10.Text = "";
            TextBox11.Text = "";
            TextBox12.Text = "";

            //SqlDataSource3.DataBind();
            //GridView2.DataSource = SqlDataSource3;
            
            GridView2.DataBind();
            GridView1.DataBind();
        }

        protected void btnserial_Click(object sender, EventArgs e)
        {
            Table1.Visible = true;
            Label1.Text=txtSearch.Text;
            Label2.Text=txtserial.Text;
            Label3.Text = GenerateNewRefNo();

            //GridView2.DataSource = SqlDataSource3;
            //GridView2.DataBind();
        }
    }
}
