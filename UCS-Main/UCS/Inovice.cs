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
using System.Drawing.Printing;
using System.Configuration;

namespace UCS
{
    public partial class Inovice : Form
    {
        DataTable invodt;
        string invo;
        bool print_default = false;

        public Inovice(string invoID , bool pri)
        {
            InitializeComponent();
            invo = invoID;
            print_default = pri;

            if (!pri)
            {

                Button button2 = new Button();
                button2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
                button2.Location = new System.Drawing.Point(545, 451);
                button2.Name = "button2";
                button2.Size = new System.Drawing.Size(100, 100);
                button2.TabIndex = 0;
                button2.Text = "Print";
                button2.UseVisualStyleBackColor = true;
                button2.Click += new System.EventHandler(this.button2_Click);
                this.Controls.Add(button2);
            }
 
            string conn = ConfigurationManager.ConnectionStrings["UCS_Starter.Properties.Settings.UCSConn"].ToString();

            SqlConnection myConnection = new SqlConnection(conn);

            myConnection.Open();
            SqlDataReader myReader = null;
            string quary = "SELECT * from Inovice_Details ('" + invoID + "')";
            SqlCommand myCommand = new SqlCommand(quary, myConnection);
            myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                label4.Text = myReader["Name"].ToString();
                label5.Text = myReader["Address"].ToString();
                label6.Text = myReader["Contact"].ToString();
                label7.Text = myReader["E-mail"].ToString();
                label8.Text = myReader["InvoiceID"].ToString();
                label10.Text = myReader["Date-Time"].ToString();
                double price = Convert.ToDouble(myReader["Price"]);
                label11.Text = price.ToString("F", CultureInfo.InvariantCulture) + " Rs.";
            }
            myConnection.Close();

            SqlCommand sCommand;
            SqlDataAdapter sAdapter;
            SqlCommandBuilder sBuilder;
            DataSet sDs;
            DataTable sTable;

            string sql = "SELECT * FROM Invoice_Details where InvoiceID = '" + invoID + "'";
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

        private void button1_Click(object sender, EventArgs e)
        {
            if (print_default) To_print(invo);
            else this.Close();
        }

        private void pd_PrintPage(object sender, PrintPageEventArgs ev)
        {
            Font fn = new Font("Times New Roman", 10, FontStyle.Regular);
            Font fn18 = new Font("Monotype Corsiva", 18, FontStyle.Italic);
            Font fn12 = new Font("Times New Roman", 12, FontStyle.Regular);
            Font fn16 = new Font("Times New Roman", 16, FontStyle.Regular);

            StringFormat stringFormat = new StringFormat();
            stringFormat.Alignment = StringAlignment.Center;
            stringFormat.LineAlignment = StringAlignment.Center;

            ev.Graphics.DrawString("UCS", fn18, Brushes.Black, 150, 15, stringFormat);
            ev.Graphics.DrawString("University Canteen System", fn12, Brushes.Black, 150, 35, stringFormat);
            ev.Graphics.DrawString("University of Vocational Technology", fn, Brushes.Gray, 150, 55, stringFormat);

            DateTime saveNow = DateTime.Now;

            ev.Graphics.DrawString("Invoice Number - " + ("UCS-INOVICE-21"), fn, Brushes.Black, 10, 70);
            ev.Graphics.DrawString("Date & Time - " + saveNow.ToString(), fn, Brushes.Black, 10, 85);

            ev.Graphics.DrawString("------------------------------------------------------------------", fn, Brushes.SlateGray, 0, 100);
            ev.Graphics.DrawString("|                   Items                  | Quantity  |      Price     |", fn, Brushes.Black, 0, 108);
            ev.Graphics.DrawString("------------------------------------------------------------------", fn, Brushes.SlateGray, 0, 115);

            int hit = 115, num = 0;

            foreach (DataRow dr in invodt.Rows)
            {
                hit += 25;
                num += 1;

                ev.Graphics.DrawString(num.ToString() + ".", fn, Brushes.Black, 5, hit - 10);
                ev.Graphics.DrawString(dr["Item_Name"].ToString(), fn, Brushes.Black, 25, hit - 10);
                ev.Graphics.DrawString(Convert.ToInt32(dr["Quantity"]).ToString(), fn, Brushes.Black, 175, hit);
                ev.Graphics.DrawString(Convert.ToDouble(dr["Price"]).ToString("F", CultureInfo.InvariantCulture), fn, Brushes.Black, 230, hit);
                ev.Graphics.DrawString("------------------------------------------------------------------", fn, Brushes.NavajoWhite, 0, hit + 5);
            }
            hit += 5;

            double sum = 0;
            foreach (DataRow dr in invodt.Rows)
            {
                sum += Convert.ToDouble(dr["Price"]);
            }

            ev.Graphics.DrawString("|   total :-   |                                  |", fn16, Brushes.Black, 0, hit += 10);
            ev.Graphics.DrawString(sum.ToString("F", CultureInfo.InvariantCulture) + " Rs.", fn16, Brushes.Black, 120, hit + 2);

            ev.Graphics.DrawString("------------------------------------------------------------------", fn, Brushes.SlateGray, 0, hit += 20);


            




            ev.Graphics.DrawString("Your Account Balance is : " + sum.ToString("F", CultureInfo.InvariantCulture) + " Rs.", fn12, Brushes.Black, 0, hit += 15);
            ev.Graphics.DrawString("***Thank You - Come Again***", fn, Brushes.Black, 50, hit += 50);
            ev.Graphics.DrawString("Another Successful Project by univotec 2014-15 Batch", new Font("Times New Roman", 6, FontStyle.Regular), Brushes.Gray, 0, hit += 30);

            //MessageBox.Show((hit + 20).ToString() + "Footer");
        }

        private void To_print(string invoice_num)
        {
            invodt = (DataTable)(dataGridView1.DataSource);

            int row = invodt.Rows.Count;
            int r = (25 * row) + 265;
            //MessageBox.Show(r.ToString() + "     ----   " + row.ToString());


            PaperSize UCS_Paper = new PaperSize("UCS-Paper", 300, r);

            try
            {
                PrintDocument pd = new PrintDocument();
                pd.DefaultPageSettings.PaperSize = UCS_Paper;
                pd.PrinterSettings.DefaultPageSettings.PaperSize = UCS_Paper;
                pd.DocumentName = invoice_num;

                // all sizes are converted from mm to inches & then multiplied by 100.

                pd.PrintPage += new PrintPageEventHandler(this.pd_PrintPage);

                Form_admin fa = new Form_admin();

                if (fa.printer == "Print Dialog")
                {

                    DialogResult dialogResult = printDialog.ShowDialog();
                    if (dialogResult == DialogResult.OK)
                    {
                        pd.Print();
                        this.Close();
                    }
                }
                else
                {
                    pd.PrinterSettings.PrinterName = fa.printer;
                    pd.Print();
                    this.Close();
                }
            }
            catch (Exception printx)
            {
                MessageBox.Show(printx.ToString());
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            To_print(invo);
        }


    }
}
