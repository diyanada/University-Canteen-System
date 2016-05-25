using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.IO.Ports;
using System.Data.SqlClient;
using System.Globalization;
using System.Timers;
using System.Configuration;

namespace UCS
{
    public partial class Form2 : Form
    {

        double price = 0.00;


        public Form2()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (price == 0.00)
            {
                MessageBox.Show("Please Select Items You Want to by");
                return; // return because we don't want to run normal code of buton click
            }
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
                    string id = serialPort1.ReadLine();
                    prox.Close();


                    validate(id);
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

        private void Form2_Load(object sender, EventArgs e)
        {
            if (serialPort1.IsOpen) serialPort1.Close();

            lord_data();
        }

        private bool validate(string id)
        {
            Classone cls = new Classone();
            string UID = cls.rfid2system(id);
            //MessageBox.Show(UID + " - " + id);
            //validate using ucs
            if (UID.Substring(0, 3) == "UCS")
            {

                if (validate_blance(id))
                {
                    pay(UID);
                }
                return true;
            }
            else
            {
                MessageBox.Show("Wrong user ID Sorry!");
                return false;
            }

        }

        private bool validate_blance(string id)
        {
            Classone cls = new Classone();
            double val = cls.check_bal(id);

            if (val > price)
            {
                return true;
            }
            else
            {
                MessageBox.Show("Please Recharge Your Account");
                return false;
            }

        }

        private void lord_data()
        {

            Button newb2 = new Button();
            newb2.Name = "All";
            newb2.Text = "All";
            newb2.Width = 190;
            newb2.Height = 190;
            newb2.UseVisualStyleBackColor = true;
            newb2.Click += buttonClicked;
            flowLayoutPanel1.Controls.Add(newb2);

            
            string conn = ConfigurationManager.ConnectionStrings["UCS_Starter.Properties.Settings.UCSConn"].ToString();
            SqlConnection connection = new SqlConnection(conn);
            try
            {
                SqlDataReader myReader = null;
                SqlCommand myCommand = new SqlCommand("select * from [Item_Type]", connection);
                connection.Open();
                myReader = myCommand.ExecuteReader();
                while (myReader.Read())
                {
                    string Name = (myReader["Item_Type_Name"].ToString());
                    string NameID = (myReader["Item_Type_Code"].ToString());


                    Button newb = new Button();
                    newb.Name = NameID;
                    newb.Text = Name;
                    newb.Width = 190;
                    newb.Height = 190;
                    newb.UseVisualStyleBackColor = true;
                    newb.Click += buttonClicked;
                    flowLayoutPanel1.Controls.Add(newb);

                }
                connection.Close();
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message.ToString());
            }

        }

        private void buttonClicked(object sender, EventArgs e)
        {
            string type = ((Button)sender).Name.ToString();

            Shop_Items shop = new Shop_Items(type);
            this.Hide();
            shop.Show();
        }

        public void FillDataGridView(DataTable rs)
        {
            dataGridView1.DataSource = rs;
            dataGridView1.Update();
            dataGridView1.Refresh();


            double sum = 0;
            foreach (DataRow dr in rs.Rows)
            {
                sum += Convert.ToDouble(dr["Price"]);
            }

            label3.Text = sum.ToString("F", CultureInfo.InvariantCulture) + " Rs.";

            price = sum;

            this.Show();

        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void pay(string id)
        {
            DataTable tbl = dataGridView1.DataSource as DataTable;

            Transaction tr = new Transaction();
            tr.ExecuteSqlTransaction(id, price, tbl);
            this.Close();

        }
    }
}
