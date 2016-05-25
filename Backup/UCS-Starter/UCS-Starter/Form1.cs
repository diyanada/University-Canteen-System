using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Configuration;
using System.IO.Ports;
using System.IO;
using System.Data.SqlClient;
using System.Security.Permissions;
using System.Security;
using System.Xml;

namespace UCS_Starter
{
    public partial class Form1 : Form
    {
        string file_url = "", sql_conn = "";
        

        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (file_url == "")
            {
                MessageBox.Show("Plese Browse Configuration File");
                return;
            }
            else if (sql_conn == "")
            {
                MessageBox.Show("Plese Connect the Database");
                return;
            }
            else if (textBox4.Text == "")
            {
                MessageBox.Show("Plese Select language file");
                return;
            }
            else if (textBox5.Text == "")
            {
                MessageBox.Show("Plese Select Data Folder");
                return;
            }

            Configuration config = ConfigurationManager.OpenExeConfiguration(Application.ExecutablePath);

            config.AppSettings.Settings.Remove("Port");
            config.AppSettings.Settings.Add("Port", comboBox1.SelectedItem.ToString());

            config.AppSettings.Settings.Remove("Port2");
            config.AppSettings.Settings.Add("Port2", comboBox2.SelectedItem.ToString());

            config.AppSettings.Settings.Remove("username");
            config.AppSettings.Settings.Add("username", textBox2.Text.ToString());

            config.AppSettings.Settings.Remove("password");
            config.AppSettings.Settings.Add("password", textBox3.Text.ToString());

            config.AppSettings.Settings.Remove("serverurl");
            config.AppSettings.Settings.Add("serverurl", textBox1.Text.ToString());

            config.AppSettings.Settings.Remove("language_file");
            config.AppSettings.Settings.Add("language_file", textBox4.Text.ToString());

            config.AppSettings.Settings.Remove("data_folder");
            config.AppSettings.Settings.Add("data_folder", textBox5.Text.ToString());

            config.AppSettings.Settings.Remove("conn");
            config.AppSettings.Settings.Add("conn", sql_conn);

            config.Save(ConfigurationSaveMode.Modified);

            updateConfigFile(sql_conn);

            string exePath = Application.ExecutablePath + ".config";

            File.Delete(file_url);

            File.Copy(exePath, file_url, true);

            this.Close();
        }

        public void updateConfigFile(string con)
        {
            //updating config file
            XmlDocument XmlDoc = new XmlDocument();
            //Loading the Config file
            XmlDoc.Load(AppDomain.CurrentDomain.SetupInformation.ConfigurationFile);
            foreach (XmlElement xElement in XmlDoc.DocumentElement)
            {
                if (xElement.Name == "UCS_Starter.Properties.Settings.UCSConn")
                {
                    //setting the coonection string
                    xElement.FirstChild.Attributes[2].Value = con;
                }
            }
            //writing the connection string in config file
            XmlDoc.Save(AppDomain.CurrentDomain.SetupInformation.ConfigurationFile);
        }

        private void button2_Click(object sender, EventArgs e)
        {

            FileDialog.Title = "Select UCS.EXE.config File";
            FileDialog.Filter = "UCS EXE config|UCS.EXE.config";
            FileDialog.FileName = null;
            
            if (FileDialog.ShowDialog() == DialogResult.OK)
            {
                //textBox1.Text = System.IO.File.ReadAllText(FileDialog.FileName);
                file_url = FileDialog.FileName;

                string exePath = Application.ExecutablePath + ".config";

                try
                {
                    File.Delete(exePath);

                    File.Copy(file_url, exePath, true);

                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.ToString());
                }

                ConfigurationManager.RefreshSection("appSettings");

                textBox2.Text = ConfigurationManager.AppSettings["username"];
                textBox3.Text = ConfigurationManager.AppSettings["password"];
                textBox1.Text = ConfigurationManager.AppSettings["serverurl"];

                
            }
            else file_url = "";
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            try
            {
                string[] ports = SerialPort.GetPortNames();
                string[] ports2 = SerialPort.GetPortNames();
                comboBox1.DataSource = ports;
                comboBox2.DataSource = ports2;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
            
        }

        private void button3_Click(object sender, EventArgs e)
        {
            string conn = "Data Source=" + textBox1.Text.ToString() + ";Initial Catalog=UCS;Persist Security Info=True;User ID=" + textBox2.Text.ToString() + ";Password=" + textBox3.Text.ToString() + "";

            SqlConnection connection = new SqlConnection(conn);
            
            try
            {
                connection.Open();
                MessageBox.Show("Successfully Connected!");
                sql_conn = conn;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
                sql_conn = "";
            }
            connection.Close();
            
        }

        private void button5_Click(object sender, EventArgs e)
        {
            DialogResult result = folderDialog.ShowDialog();
            if (result == DialogResult.OK)
            {
                textBox5.Text =  folderDialog.SelectedPath;
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            try
            {
                string[] ports = SerialPort.GetPortNames();
                string[] ports2 = SerialPort.GetPortNames();
                comboBox1.DataSource = ports;
                comboBox2.DataSource = ports2;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void button6_Click(object sender, EventArgs e)
        {
            FileDialog.Title = "Select language.xml File";
            FileDialog.Filter = "language xml|language.xml";
            FileDialog.FileName = null;

            if (FileDialog.ShowDialog() == DialogResult.OK)
            {
                //textBox1.Text = System.IO.File.ReadAllText(FileDialog.FileName);
                textBox4.Text = FileDialog.FileName;

            }
        }


    }
}
