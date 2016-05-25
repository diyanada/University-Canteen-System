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
    public partial class Form3 : Form
    {
        SqlCommand sCommand;
        SqlDataAdapter sAdapter;
        SqlCommandBuilder sBuilder;
        DataSet sDs;
        DataTable sTable;

        public string id;

        public Form3()
        {
            InitializeComponent();

        }

        public void Load_pro()
        {
            try
            {
                Form_admin fa = new Form_admin();
                serialPort1.PortName = fa.Port;
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

        private void Form3_Load(object sender, EventArgs e)
        {
            
            
            string conn = ConfigurationManager.ConnectionStrings["UCS_Starter.Properties.Settings.UCSConn"].ToString();

            string sql = "SELECT * FROM Invoice_Transaction WHERE UserID = '" + id + "' ORDER BY [Date-time] DESC";
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

            DataGridViewButtonColumn btn = new DataGridViewButtonColumn();
            dataGridView1.Columns.Add(btn);
            btn.HeaderText = "Details";
            btn.Text = "More";
            btn.Name = "btn";
            btn.UseColumnTextForButtonValue = true;

            double sum = 0;

            SqlConnection myConnection = new SqlConnection(conn);

            myConnection.Open();
            SqlDataReader myReader = null;
            string quary = "SELECT Value FROM Proxy WHERE UserID = '" + id + "'";
            SqlCommand myCommand = new SqlCommand(quary, myConnection);
            myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                sum = Convert.ToDouble(myReader["Value"]);
            }
            myConnection.Close();

            label2.Text = sum.ToString("F", CultureInfo.InvariantCulture) + " Rs.";

            this.Show();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == 6)
            {
                string str;
                str = dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString();
                Inovice inv = new Inovice(str, false);
                inv.Show();
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

    }
}
