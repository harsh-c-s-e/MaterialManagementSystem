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

            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            
        }

        private string GetLastRefNo()
        {
            string lastRefNo = "0";
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

       
        protected void btninsert_Click(object sender, EventArgs e)
        {
            
            TextBox gatepassid = txtSearch;
            TextBox sno = txtserial;
            string returnno = Label3.Text;
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

            Label3.Text = GenerateNewRefNo();
            TextBox10.Text = "";
            TextBox11.Text = "";
            TextBox12.Text = "";

            
            GridView2.DataBind();
            GridView1.DataBind();
        }

        protected void btnserial_Click(object sender, EventArgs e)
        {
            Table1.Visible = true;
            Label1.Text=txtSearch.Text;
            Label2.Text=txtserial.Text;
            Label3.Text = GenerateNewRefNo();

        }
    }
}
