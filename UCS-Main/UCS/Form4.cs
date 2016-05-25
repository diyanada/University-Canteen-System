using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Globalization;
using System.Configuration;

namespace UCS
{
    public partial class Form4 : Form
    {
        string id;

        public Form4()
        {
            InitializeComponent();
        }

        private void Form4_Load(object sender, EventArgs e)
        {
            SqlCommand sCommand;
            SqlDataAdapter sAdapter;
            SqlCommandBuilder sBuilder;
            DataSet sDs;
            DataTable sTable;

            string conn = ConfigurationManager.ConnectionStrings["UCS_Starter.Properties.Settings.UCSConn"].ToString();

            string sql = "SELECT * FROM Invoice_Transaction WHERE UserID = '" + id + "' and [Type] = 'ADD' ORDER BY [Date-time] DESC";
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

            SqlConnection myConnection = new SqlConnection(conn);

            myConnection.Open();
            SqlDataReader myReader = null;
            string quary = "SELECT Value FROM Proxy WHERE UserID = '" + id + "'";
            SqlCommand myCommand = new SqlCommand(quary, myConnection);
            myReader = myCommand.ExecuteReader();
            double sum =0.0;
            while (myReader.Read())
            {
                sum = Convert.ToDouble(myReader["Value"]);
            }
            myConnection.Close();

            label2.Text = "Acount Balance :- " + sum.ToString("F", CultureInfo.InvariantCulture) + " Rs.";
        }

        public void Load_pro()
        {
            try
            {
                Form_admin fa = new Form_admin();
                serialPort1.PortName = fa.Port2;
                serialPort1.BaudRate = 9600;
                serialPort1.Open();
                proximity prox = new proximity();
                prox.Show();
                try
                {
                    string idr = serialPort1.ReadLine();
                    prox.Close();


                    validate(idr);
                }
                catch (TimeoutException t)
                {
                    prox.Close();
                    MessageBox.Show(t.Message);
                }

                serialPort1.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private bool validate(string idf)
        {
            Classone cls = new Classone();
            string UID = cls.rfid2system(idf);
            //MessageBox.Show(UID + " - " + id);
            //validate using ucs
            if (UID.Substring(0, 3) == "UCS")
            {

                id = UID;
                this.Show();
                return true;
            }
            else
            {
                MessageBox.Show("Wrong user ID Sorry!");
                return false;
            }

        }

        private void button1_Click(object sender, EventArgs e)
        {
            double val = 0.0;

            try
            {
                val = Convert.ToDouble(numericTextBox1.Text);

                if (val <= 0)
                {
                    MessageBox.Show("Plese Check Value You Enterd");
                    return;
                }

                DialogResult dialogResult = MessageBox.Show("Please Confirm Cash Depot is " + val.ToString("F", CultureInfo.InvariantCulture) + "Rs. Only", "Please Confirm!", MessageBoxButtons.YesNo);
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


                            SqlCommand command = new SqlCommand();
                            command.Connection = connection;
                            command.CommandType = CommandType.StoredProcedure;
                            command.CommandText = "Cash_Deposit";

                            SqlParameter sqlParameter;

                            sqlParameter = new SqlParameter("@userid", SqlDbType.NVarChar);
                            sqlParameter.Value = id;
                            command.Parameters.Add(sqlParameter);

                            sqlParameter = new SqlParameter("@price", SqlDbType.Float);
                            sqlParameter.Value = val;
                            command.Parameters.Add(sqlParameter);

                            connection.Open();
                            command.ExecuteNonQuery();
                            connection.Close();



                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show("Error" + ex.Message.ToString());
                        }
                        this.Close();
                    }
                }
            }
            catch (Exception ex2)
            {
                MessageBox.Show("Error" + ex2.Message.ToString());
            }   
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void numericTextBox1_TextChanged(object sender, EventArgs e)
        {
            button1.Enabled = true;
        }
    }
}
