using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Configuration;

namespace UCS
{
    public partial class Discard : Form
    {
        public int rem_sum, item_sum;

        public Discard(string item_code)
        {
            InitializeComponent();

            label5.Text = item_code;

            Form_admin fa = new Form_admin();
            string conn = ConfigurationManager.ConnectionStrings["UCS_Starter.Properties.Settings.UCSConn"].ToString();

            SqlConnection myConnection = new SqlConnection(conn);

            SqlCommand sCommand;
            SqlDataAdapter sAdapter;
            SqlCommandBuilder sBuilder;
            DataSet sDs;
            DataTable sTable;

            string sql = "SELECT * FROM Drop_Item_View('" + item_code + "')";
            SqlConnection connection = new SqlConnection(conn);
            connection.Open();
            sCommand = new SqlCommand(sql, connection);
            sAdapter = new SqlDataAdapter(sCommand);
            sBuilder = new SqlCommandBuilder(sAdapter);
            sDs = new DataSet();
            sAdapter.Fill(sDs, "mytable");
            sTable = sDs.Tables["mytable"];
            connection.Close();
            dataGridView1.DataSource = sDs.Tables["mytable"];

            int sum = 0;
            foreach (DataRow dr in sDs.Tables["mytable"].Rows)
            {
                sum += Convert.ToInt32(dr["Quantity"]);
            }

            rem_sum = sum;

            label2.Text = "Total Quantity\n" + sum.ToString();
             
            string sql2 = "SELECT Quantity_Code, Item_Code, Quantity FROM Quantity WHERE Item_Code = ('" + item_code + "')";
            connection.Open();
            sCommand = new SqlCommand(sql2, connection);
            sAdapter = new SqlDataAdapter(sCommand);
            sBuilder = new SqlCommandBuilder(sAdapter);
            sDs = new DataSet();
            sAdapter.Fill(sDs, "mytable");
            sTable = sDs.Tables["mytable"];
            connection.Close();
            dataGridView2.DataSource = sDs.Tables["mytable"];


            int sum2 = 0;
            foreach (DataRow dr in sDs.Tables["mytable"].Rows)
            {
                sum2 += Convert.ToInt32(dr["Quantity"]);
            }

            item_sum = sum2;

            label1.Text = "Total Quantity\n" + sum2.ToString();

            numericUpDown1.Maximum = (sum2 - sum);
            numericUpDown1.Minimum = 1;
            button1.Enabled = false;

            label4.Text = "Updated Remaining  Quantity\n" + (sum2 - sum).ToString();

            //----------------------------------------------------------------------------------------------------
            
            
            try
            {
                SqlDataReader myReader = null;
                string sql3 = "SELECT * FROM Items WHERE [Item_Code] = '" + item_code + "'";

                //MessageBox.Show(sql3);
                SqlCommand myCommand = new SqlCommand(sql3, connection);
                connection.Open();
                myReader = myCommand.ExecuteReader();
                while (myReader.Read())
                {

                    string D_name = (myReader["Item_Name"].ToString());
                    string im11 = fa.data_folder + "\\Item_150x150_tumb\\";
                    string Url = im11 + (myReader["Item_img_ID"].ToString()); ;

                    label6.Text = D_name;
                    pictureBox1.Load(Url);

                }
                connection.Close();
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message.ToString());
            }
            //----------------------------------------------------------------------------------------------------

        }

        private void numericUpDown1_ValueChanged(object sender, EventArgs e)
        {
            button1.Enabled = true;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            DialogResult dialogResult = MessageBox.Show("Please Confirm Your Remaining  Quantity is : " + (item_sum -(rem_sum + numericUpDown1.Value)).ToString(), "Please Confirm!", MessageBoxButtons.YesNo);
            if (dialogResult == DialogResult.Yes)
            {
                label4.Text = "Updated Remaining  Quantity\n" + (item_sum - (rem_sum + numericUpDown1.Value)).ToString();
                button2.Enabled = true;
            }
            else if (dialogResult == DialogResult.No)
            {
                //do something else
            }
            
        }

        private void button3_Click(object sender, EventArgs e)
        {
            DialogResult dialogResult = MessageBox.Show("Please Confirm Your Remaining  Quantity is : " + "0", "Please Confirm!", MessageBoxButtons.YesNo);
            if (dialogResult == DialogResult.Yes)
            {
                Login login = new Login();
                DialogResult Result = login.ShowDialog();

                if (Result == DialogResult.OK)
                {
                    try
                    {
                        
                        string conn = ConfigurationManager.ConnectionStrings["UCS_Starter.Properties.Settings.UCSConn"].ToString();



                        SqlConnection connection = new SqlConnection(conn);


                        SqlCommand command5 = new SqlCommand();
                        command5.Connection = connection;
                        command5.CommandType = CommandType.StoredProcedure;
                        command5.CommandText = "Delete_Quantity";
                        SqlParameter sqlParameter5;

                        sqlParameter5 = new SqlParameter("@itemcode", SqlDbType.NVarChar);
                        sqlParameter5.Value = label5.Text.ToString();
                        command5.Parameters.Add(sqlParameter5);


                        connection.Open();
                        command5.ExecuteNonQuery();
                        connection.Close();


                        this.Close();
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message.ToString());
                    }
                }
            }
            else if (dialogResult == DialogResult.No)
            {
                //do something else
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Login login = new Login();
            DialogResult Result = login.ShowDialog();

            if (Result == DialogResult.OK)
            {

                try
                {
                    string conn = ConfigurationManager.ConnectionStrings["UCS_Starter.Properties.Settings.UCSConn"].ToString();


                    SqlConnection connection = new SqlConnection(conn);


                    SqlCommand command5 = new SqlCommand();
                    command5.Connection = connection;
                    command5.CommandType = CommandType.StoredProcedure;
                    command5.CommandText = "DPDiss_Item";
                    SqlParameter sqlParameter5;

                    sqlParameter5 = new SqlParameter("@id", SqlDbType.NVarChar);
                    sqlParameter5.Value = label5.Text.ToString();
                    command5.Parameters.Add(sqlParameter5);

                    sqlParameter5 = new SqlParameter("@qun", SqlDbType.Int);
                    sqlParameter5.Value = Convert.ToInt32(numericUpDown1.Value);
                    command5.Parameters.Add(sqlParameter5);

                    connection.Open();
                    command5.ExecuteNonQuery();
                    connection.Close();


                    this.Close();
                }
                catch (Exception ex2)
                {
                    MessageBox.Show(ex2.Message.ToString());
                }
            }
        }
    }
}
