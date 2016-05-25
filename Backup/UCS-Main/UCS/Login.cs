using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Security.Cryptography;
using System.Data.SqlClient;
using System.Configuration;

namespace UCS
{
    public partial class Login : Form
    {
        public Login()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string user_name = textBox1.Text.ToString();
            string password = GetMD5(textBox2.Text.ToString());
            //textBox1.Text = GetMD5(textBox2.Text.ToString());

            try
            {
                string conn = ConfigurationManager.ConnectionStrings["UCS_Starter.Properties.Settings.UCSConn"].ToString();

                using (SqlConnection connection = new SqlConnection(conn))
                using (SqlCommand cmd = new SqlCommand("SELECT [dbo].[Password]('" + user_name + "')", connection))
                {
                    connection.Open();
                    var result = cmd.ExecuteScalar();
                    connection.Close();
                    if (result.ToString() == password)
                    {
                        this.DialogResult = DialogResult.OK;
                        this.Close(); 
                    }
                    else
                    {
                        label7.Text = "Invalid Password or Username";
                    }

                }


            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button3_MouseDown(object sender, MouseEventArgs e)
        {
            textBox2.PasswordChar = '\0';
        }

        private void button3_MouseUp(object sender, MouseEventArgs e)
        {
            textBox2.PasswordChar = '*';
        }

        public string GetMD5(string text)
        {
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
            md5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(text));
            byte[] result = md5.Hash;
            StringBuilder str = new StringBuilder();
            for (int i = 0; i < result.Length; i++)
            {
                str.Append(result[i].ToString("x2"));
            }
            return str.ToString();
        }
    }
}
