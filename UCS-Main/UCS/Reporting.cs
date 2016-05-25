using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.IO;
using System.Drawing.Printing;
namespace UCS
{
    public partial class Reporting : Form
    {
        public Reporting()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (comboBox1.SelectedValue.ToString() != "")
            {
                set_data(comboBox1.SelectedValue.ToString());
            }
 
        }

        private void set_data(string sql)
        {
            try
            {
                Form_admin fa = new Form_admin();
                string conn = "user id=" + fa.username + ";" +
                                  "password=" + fa.password + ";" +
                                  "server=" + fa.serverurl + ";" +
                                  "Trusted_Connection=yes;" +
                                  "database=" + fa.database + "; " +
                                  "connection timeout=" + fa.timeout;

                SqlCommand sCommand;
                SqlDataAdapter sAdapter;
                SqlCommandBuilder sBuilder;
                DataSet sDs;
                DataTable sTable;


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
            }
            catch (Exception e)
            {
                MessageBox.Show(e.ToString());
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (dataGridView1.Rows.Count == 0)
            {
                MessageBox.Show("Plese Select a Report");
                return;
            }

            SaveFileDialog sfd = new SaveFileDialog();
            sfd.Filter = "Excel Documents (*.xls)|*.xls";
            sfd.FileName = "UCS_Report.xls";
            if (sfd.ShowDialog() == DialogResult.OK)
            {
                ToCsV(dataGridView1, sfd.FileName); // Here dataGridview1 is your grid view name 
            }  
        }

        private void ToCsV(DataGridView dGV, string filename)
        {
            string stOutput = "";
            // Export titles:
            string sHeaders = "";

            for (int j = 0; j < dGV.Columns.Count; j++)
                sHeaders = sHeaders.ToString() + Convert.ToString(dGV.Columns[j].HeaderText) + "\t";
            stOutput += sHeaders + "\r\n";
            // Export data.
            for (int i = 0; i < dGV.RowCount - 1; i++)
            {
                string stLine = "";
                for (int j = 0; j < dGV.Rows[i].Cells.Count; j++)
                    stLine = stLine.ToString() + Convert.ToString(dGV.Rows[i].Cells[j].Value) + "\t";
                stOutput += stLine + "\r\n";
            }
            Encoding utf16 = Encoding.GetEncoding(1254);
            byte[] output = utf16.GetBytes(stOutput);
            FileStream fs = new FileStream(filename, FileMode.Create);
            BinaryWriter bw = new BinaryWriter(fs);
            bw.Write(output, 0, output.Length); //write the encoded file
            bw.Flush();
            bw.Close();
            fs.Close();
        }

        private void Reporting_Load(object sender, EventArgs e)
        {

            var items = new[] { 
                new { Text = "Invoice", Value = "SELECT * FROM Invoice" }, 
                new { Text = "Item", Value = "SELECT * FROM Items" }, 
                new { Text = "Transaction", Value = "SELECT * FROM [Transaction]" },
                new { Text = "Quantity", Value = "SELECT * FROM Quantity" },
                new { Text = "Users List", Value = "SELECT * FROM User_Details" }
                };

            comboBox1.DataSource = items;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            this.Close();
        }

    }
}
