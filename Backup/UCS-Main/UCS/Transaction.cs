using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;
using System.Configuration;

namespace UCS
{
    class Transaction
    {
        public void ExecuteSqlTransaction(string id, double price, DataTable rs)
        {
            
            string connectionString = ConfigurationManager.ConnectionStrings["UCS_Starter.Properties.Settings.UCSConn"].ToString();
            
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();


                SqlTransaction transaction;

                // Start a local transaction.
                transaction = connection.BeginTransaction(); 

                // Must assign both transaction object and connection 
                // to Command object for a pending local transaction





                try
                {
                    //------------------------------------------------------------------------------------------------
                    SqlCommand command = new SqlCommand();

                    command.Connection = connection;
                    command.Transaction = transaction;
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "Make_InviceID";

                    SqlParameter sqlParameter;

                    sqlParameter = new SqlParameter("@userid", SqlDbType.NVarChar);
                    sqlParameter.Value = id;
                    command.Parameters.Add(sqlParameter);

                    sqlParameter = new SqlParameter("@price", SqlDbType.Float);
                    sqlParameter.Value = price;
                    command.Parameters.Add(sqlParameter);

                    SqlParameter retval = command.Parameters.Add("@cot", SqlDbType.VarChar, 3);
                    retval.Direction = ParameterDirection.Output;

                    command.ExecuteNonQuery();

                    string invoiceid = "UCS-INVOICE-" + (string)command.Parameters["@cot"].Value;
                    //MessageBox.Show(invoiceid);
                    //------------------------------------------------------------------------------------------------

                    foreach (DataRow dr in rs.Rows)
                    {
                        SqlCommand command2 = new SqlCommand();

                        command2.Connection = connection;
                        command2.Transaction = transaction;

                         command2.CommandType = CommandType.StoredProcedure;
                         command2.CommandText = "Add_Invoice_Details";

                         SqlParameter sqlParameter2;

                         sqlParameter2 = new SqlParameter("@invoiceid", SqlDbType.NVarChar);
                         sqlParameter2.Value = invoiceid;
                         command2.Parameters.Add(sqlParameter2);

                         sqlParameter2 = new SqlParameter("@item_code", SqlDbType.NVarChar);
                         sqlParameter2.Value = dr["Item ID"].ToString();
                         command2.Parameters.Add(sqlParameter2);

                         sqlParameter2 = new SqlParameter("@item_name", SqlDbType.NVarChar);
                         sqlParameter2.Value = dr["Item Name"].ToString();
                         command2.Parameters.Add(sqlParameter2);

                         sqlParameter2 = new SqlParameter("@quantity", SqlDbType.Int);
                         sqlParameter2.Value = Convert.ToInt32(dr["Quantity"]);
                         command2.Parameters.Add(sqlParameter2);

                         sqlParameter2 = new SqlParameter("@price", SqlDbType.Float);
                         sqlParameter2.Value = Convert.ToDouble(dr["Price"]);
                         command2.Parameters.Add(sqlParameter2);

                         command2.ExecuteNonQuery();

                         //------------------------------------------------------------------------------------------------

                         SqlCommand command5 = new SqlCommand();

                         command5.Connection = connection;
                         command5.Transaction = transaction;

                         command5.CommandType = CommandType.StoredProcedure;
                         command5.CommandText = "DPSell_Item";

                         SqlParameter sqlParameter5;

                         sqlParameter5 = new SqlParameter("@id", SqlDbType.NVarChar);
                         sqlParameter5.Value = dr["Item ID"].ToString();
                         command5.Parameters.Add(sqlParameter5);

                         sqlParameter5 = new SqlParameter("@qun", SqlDbType.Int);
                         sqlParameter5.Value = Convert.ToInt32(dr["Quantity"]);
                         command5.Parameters.Add(sqlParameter5);

                         command5.ExecuteNonQuery();
                        //------------------------------------------------------------------------------------------------

                    }
                    //------------------------------------------------------------------------------------------------

                    SqlCommand command3 = new SqlCommand();

                    command3.Connection = connection;
                    command3.Transaction = transaction;

                    command3.CommandType = CommandType.StoredProcedure;
                    command3.CommandText = "Get_transaction";

                    SqlParameter sqlParameter3;

                    sqlParameter3 = new SqlParameter("@invoiceid", SqlDbType.NVarChar);
                    sqlParameter3.Value = invoiceid;
                    command3.Parameters.Add(sqlParameter3);

                    sqlParameter3 = new SqlParameter("@userid", SqlDbType.NVarChar);
                    sqlParameter3.Value = id;
                    command3.Parameters.Add(sqlParameter3);

                    sqlParameter3 = new SqlParameter("@price", SqlDbType.Float);
                    sqlParameter3.Value = price;
                    command3.Parameters.Add(sqlParameter3);

                    command3.ExecuteNonQuery();
                    //------------------------------------------------------------------------------------------------

                    //------------------------------------------------------------------------------------------------

                    SqlCommand command4 = new SqlCommand();

                    command4.Connection = connection;
                    command4.Transaction = transaction;

                    command4.CommandType = CommandType.StoredProcedure;
                    command4.CommandText = "Update_Value";

                    SqlParameter sqlParameter4;

                    sqlParameter4 = new SqlParameter("@userid", SqlDbType.NVarChar);
                    sqlParameter4.Value = id;
                    command4.Parameters.Add(sqlParameter4);

                    sqlParameter4 = new SqlParameter("@price", SqlDbType.Float);
                    sqlParameter4.Value = price;
                    command4.Parameters.Add(sqlParameter4);

                    command4.ExecuteNonQuery();
                    //------------------------------------------------------------------------------------------------

                    
                    // Attempt to commit the transaction.
                    transaction.Commit();
                    Inovice inv = new Inovice(invoiceid, true);
                    inv.Show();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);

                    // Attempt to roll back the transaction. 
                    try
                    {
                        transaction.Rollback();
                    }
                    catch (Exception ex2)
                    {
                        // This catch block will handle any errors that may have occurred 
                        // on the server that would cause the rollback to fail, such as 
                        // a closed connection.
                        MessageBox.Show(ex2.Message);
                    }
                }
                connection.Close();
            }
        }
    }
}
