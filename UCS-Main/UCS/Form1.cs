using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace UCS
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form2 f2 = new Form2();
            f2.Show();

        }

        private void button2_Click(object sender, EventArgs e)
        {

            Login login = new Login();
            DialogResult Result = login.ShowDialog();

            if (Result == DialogResult.OK)
            {
                Form_admin admin = new Form_admin();
                admin.Show();
            }

        }

        private void button3_Click(object sender, EventArgs e)
        {
            Form3 f3 = new Form3();
            f3.Load_pro();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Login login = new Login();
            DialogResult Result = login.ShowDialog();

            if (Result == DialogResult.OK)
            {
                Reporting report = new Reporting();
                report.Show();
            }            
        }
    }
}
