using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Configuration;
using System.IO;
using System.Data.SqlClient;
using System.Drawing.Imaging;
using System.Globalization;
using System.Text.RegularExpressions;
using System.Drawing.Printing;
using System.Xml;



namespace UCS
{
    public partial class Form_admin : Form
    {
        public string Port = ConfigurationManager.AppSettings["Port"];
        public string Port2 = ConfigurationManager.AppSettings["Port2"];
        public string username = ConfigurationManager.AppSettings["username"];
        public string password = ConfigurationManager.AppSettings["password"];
        public string serverurl = ConfigurationManager.AppSettings["serverurl"];
        public string database = ConfigurationManager.AppSettings["database"];
        public string timeout = ConfigurationManager.AppSettings["timeout"];
        public string language = ConfigurationManager.AppSettings["language"];
        public string language_file = ConfigurationManager.AppSettings["language_file"];
        public string data_folder = ConfigurationManager.AppSettings["data_folder"];
        public string printer = ConfigurationManager.AppSettings["printer"];



        public Form_admin()
        {
            InitializeComponent();

            textBox1.Text = Port;
            textBox18.Text = Port2;
            textBox2.Text = username;
            textBox3.Text = password;
            textBox4.Text = serverurl;
            textBox5.Text = database;
            textBox6.Text = timeout;
            textBox7.Text = language;
            textBox8.Text = language_file;
            textBox11.Text = data_folder;

            
            PrintCombo.Items.Add("Print Dialog");

            string printers;

            for (int i = 0; i < PrinterSettings.InstalledPrinters.Count; i++)
            {
                printers = PrinterSettings.InstalledPrinters[i];
                PrintCombo.Items.Add(printers);
            }
            PrintCombo.SelectedIndex = PrintCombo.Items.IndexOf(printer);


        }

        public void get_image(string filePath, string newFileName)
        {

            string oldPath = filePath;
            Form_admin fa = new Form_admin();
            string newpath = fa.data_folder + @"\Item_img\";
            FileInfo f1 = new FileInfo(oldPath);
            if (f1.Exists)
            {
                if (!Directory.Exists(newpath))
                {
                    Directory.CreateDirectory(newpath);
                }
                f1.CopyTo(string.Format("{0}{1}{2}", newpath, newFileName, f1.Extension));
            }
            string im33 = fa.data_folder + "\\Item_300x300_tumb\\" + newFileName + ".jpg";
            string im11 = fa.data_folder + "\\Item_150x150_tumb\\" + newFileName + ".jpg";



            Image image = Image.FromFile(filePath);
            Image thumb = image.GetThumbnailImage(300, 300, () => false, IntPtr.Zero);
            thumb.Save(im33, ImageFormat.Jpeg);


            Image thumb2 = image.GetThumbnailImage(150, 150, () => false, IntPtr.Zero);
            thumb2.Save(im11, ImageFormat.Jpeg);
        }

        private static ImageCodecInfo GetEncoderInfo(String mimeType)
        {
            int j;
            ImageCodecInfo[] encoders;
            encoders = ImageCodecInfo.GetImageEncoders();
            for (j = 0; j < encoders.Length; ++j)
            {
                if (encoders[j].MimeType == mimeType)
                    return encoders[j];
            }
            return null;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try{
                string conn = ConfigurationManager.ConnectionStrings["UCS_Starter.Properties.Settings.UCSConn"].ToString();
                            SqlConnection myConnection = new SqlConnection(conn);


                myConnection.Open();
                MessageBox.Show(myConnection.State.ToString());
                myConnection.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
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

            DialogResult dr = MessageBox.Show(Classone.echo_darshi("er_1001"),
                      "Please Confirm", MessageBoxButtons.YesNo);
            string conn_t0 = "Data Source=" + textBox4.Text.ToString() + ";Initial Catalog=" + textBox5.Text.ToString() + ";Persist Security Info=True;User ID=" + textBox2.Text.ToString() + ";Password=" + textBox3.Text.ToString() + "";

            switch (dr)
            {
                case DialogResult.Yes:

                    Configuration config = ConfigurationManager.OpenExeConfiguration(Application.ExecutablePath);

                    config.AppSettings.Settings.Remove("Port");
                    config.AppSettings.Settings.Add("Port", textBox1.Text.ToString());

                    config.AppSettings.Settings.Remove("Port2");
                    config.AppSettings.Settings.Add("Port2", textBox18.Text.ToString());

                    config.AppSettings.Settings.Remove("username");
                    config.AppSettings.Settings.Add("username", textBox2.Text.ToString());

                    config.AppSettings.Settings.Remove("password");
                    config.AppSettings.Settings.Add("password", textBox3.Text.ToString());

                    config.AppSettings.Settings.Remove("serverurl");
                    config.AppSettings.Settings.Add("serverurl", textBox4.Text.ToString());

                    config.AppSettings.Settings.Remove("database");
                    config.AppSettings.Settings.Add("database", textBox5.Text.ToString());

                    config.AppSettings.Settings.Remove("timeout");
                    config.AppSettings.Settings.Add("timeout", textBox6.Text.ToString());

                    config.AppSettings.Settings.Remove("language");
                    config.AppSettings.Settings.Add("language", textBox7.Text.ToString());

                    config.AppSettings.Settings.Remove("language_file");
                    config.AppSettings.Settings.Add("language_file", textBox8.Text.ToString());

                    config.AppSettings.Settings.Remove("data_folder");
                    config.AppSettings.Settings.Add("data_folder", textBox11.Text.ToString());

                    config.AppSettings.Settings.Remove("printer");
                    config.AppSettings.Settings.Add("printer", PrintCombo.Text.ToString());

                    config.AppSettings.Settings.Remove("conn");
                    config.AppSettings.Settings.Add("conn", conn_t0);

                    config.Save(ConfigurationSaveMode.Modified);

                    updateConfigFile(conn_t0);

                break;
                case DialogResult.No:   
                break;
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            OpenFileDialog fdlg = new OpenFileDialog();
            fdlg.Title = "Select language.xml file";
            fdlg.InitialDirectory = @"c:\";
            fdlg.Filter = "xml files (*.xml)|*.xml";
            fdlg.FilterIndex = 2;
            fdlg.RestoreDirectory = true;
            if (fdlg.ShowDialog() == DialogResult.OK)
            {
                textBox8.Text = fdlg.FileName;
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            //Application.Restart();
            this.Close();
            Form_admin admin = new Form_admin();
            admin.Show();
        }

        private void button5_Click(object sender, EventArgs e)
        {

            tabControl1.SelectedIndex = 1;
        }

        private void button6_Click(object sender, EventArgs e)
        {
            tabControl1.SelectedIndex = 2;
        }

        private void button8_Click(object sender, EventArgs e)
        {
            
            FolderBrowserDialog folderBrowserDialog1 = new FolderBrowserDialog();
            if (folderBrowserDialog1.ShowDialog() == DialogResult.OK)
            {
                textBox11.Text = folderBrowserDialog1.SelectedPath;
            }
        }

        private void button9_Click(object sender, EventArgs e)
        {
            

            OpenFD.Title = "Select Files";
            OpenFD.Filter = "Jpg|*.jpg|Jpge|*.jpge";
            OpenFD.FileName = null;
            string fileName;
            if (OpenFD.ShowDialog() != DialogResult.Cancel)
            {
               
                fileName = OpenFD.FileName;
                Object refmissing = System.Reflection.Missing.Value;
                try
                {
                    // show it to picturebox
                    
                    // Here get_image is a function and Big is the byte[] type
                    
                    string conn = ConfigurationManager.ConnectionStrings["UCS_Starter.Properties.Settings.UCSConn"].ToString();

                

                    SqlConnection connection = new SqlConnection(conn);
                    

                    SqlCommand command = new SqlCommand();
                    command.Connection = connection;
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "Add_img";

                    

                    SqlParameter retval = command.Parameters.Add("@cot", SqlDbType.VarChar, 15);
                    retval.Direction = ParameterDirection.Output;

                    connection.Open();
                    command.ExecuteNonQuery();
                    textBox12.Text = "UCS-IT-IMG-" + (string)command.Parameters["@cot"].Value + ".jpg";
                    connection.Close();

                    get_image(fileName, "UCS-IT-IMG-" + (string)command.Parameters["@cot"].Value);

                    string path = data_folder + @"\Item_300x300_tumb\" + "UCS-IT-IMG-" + (string)command.Parameters["@cot"].Value + ".jpg";
                    pictureBox1.Load(path);


                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error" + ex.Message.ToString());
                }
            }
        }

        private void Form_admin_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'uCSDataSet.Discard_view' table. You can move, or remove it, as needed.
            this.discard_viewTableAdapter.Fill(this.uCSDataSet.Discard_view);
            // TODO: This line of code loads data into the 'uCSDataSet.SHOP_NON_PARA' table. You can move, or remove it, as needed.
            this.sHOP_NON_PARATableAdapter.Fill(this.uCSDataSet.SHOP_NON_PARA);
            // TODO: This line of code loads data into the 'uCSDataSet.View_User' table. You can move, or remove it, as needed.
            this.view_UserTableAdapter.Fill(this.uCSDataSet.View_User);

            // TODO: This line of code loads data into the 'uCSDataSet.New_Quantity' table. You can move, or remove it, as needed.
            this.new_QuantityTableAdapter.Fill(this.uCSDataSet.New_Quantity);
            // TODO: This line of code loads data into the 'uCSDataSet.New_Items' table. You can move, or remove it, as needed.
            this.new_ItemsTableAdapter.Fill(this.uCSDataSet.New_Items);


            string conn = ConfigurationManager.ConnectionStrings["UCS_Starter.Properties.Settings.UCSConn"].ToString();



            SqlConnection connection = new SqlConnection(conn);
            connection.Open();
            SqlCommand sc = new SqlCommand("select Item_Type_Code, Item_Type_Name from Item_Type", connection);
            SqlDataReader reader;

            reader = sc.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Columns.Add("Item_Type_Code", typeof(string));
            dt.Columns.Add("Item_Type_Name", typeof(string));
            dt.Load(reader);

            comboBox1.ValueMember = "Item_Type_Code";
            comboBox1.DisplayMember = "Item_Type_Name";
            comboBox1.DataSource = dt;

            SqlCommand sc2 = new SqlCommand("select Item_Code, ('('+Item_Code +') '+Item_Name) as Item from Items", connection);
            SqlDataReader reader2;

            reader2 = sc2.ExecuteReader();
            DataTable dt2 = new DataTable();
            dt2.Columns.Add("Item_Code", typeof(string));
            dt2.Columns.Add("Item", typeof(string));
            dt2.Load(reader2);

            comboBox2.ValueMember = "Item_Code";
            comboBox2.DisplayMember = "Item";
            comboBox2.DataSource = dt2;

            connection.Close();
            
            DataGridViewButtonColumn btn3 = new DataGridViewButtonColumn();
            dataGridView4.Columns.Add(btn3);
            btn3.HeaderText = "";
            btn3.Text = "Expand";
            btn3.Name = "Expand";
            btn3.UseColumnTextForButtonValue = true;


       
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            
            if (e.ColumnIndex == 5)
            {
                string str;
                str = dataGridView1.Rows[e.RowIndex].Cells[0].Value.ToString();
                Discard diss = new Discard(str);
                diss.Show();

            }
        }

        private void button11_Click(object sender, EventArgs e)
        {
            if (textBox9.Text.Trim() == string.Empty)
            {
                MessageBox.Show("Please enter ITEM Name");
                return; // return because we don't want to run normal code of buton click
            }
            else if (Convert.ToDouble(textBox10.Text) <= 0.0)
            {
                MessageBox.Show("Please enter Possible value for Item Price");
                return; // return because we don't want to run normal code of buton click
            } 

            try
            {

                string conn = ConfigurationManager.ConnectionStrings["UCS_Starter.Properties.Settings.UCSConn"].ToString();

                SqlParameter sqlParameter;

                SqlConnection connection = new SqlConnection(conn);


                SqlCommand command = new SqlCommand();
                command.Connection = connection;
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "Item";

                sqlParameter = new SqlParameter("@name", SqlDbType.NVarChar);
                sqlParameter.Value = textBox9.Text.ToString();
                command.Parameters.Add(sqlParameter);

                sqlParameter = new SqlParameter("@type_code", SqlDbType.NVarChar);
                sqlParameter.Value = comboBox1.SelectedValue.ToString();
                command.Parameters.Add(sqlParameter);

                sqlParameter = new SqlParameter("@price", SqlDbType.Float);
                sqlParameter.Value = textBox10.Text.ToString();
                command.Parameters.Add(sqlParameter);

                sqlParameter = new SqlParameter("@img_id", SqlDbType.NVarChar);
                sqlParameter.Value = textBox12.Text.ToString();
                command.Parameters.Add(sqlParameter);

                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
                label14.Text = "Item Successfully Inserted";
                button11.Enabled = false;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error" + ex.Message.ToString());
            }
            
        }

        private void button7_Click(object sender, EventArgs e)
        {
            tabControl1.SelectedIndex = 3;
        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            textBox13.Text = comboBox2.SelectedValue.ToString();
            try{

                string conn2 = ConfigurationManager.ConnectionStrings["UCS_Starter.Properties.Settings.UCSConn"].ToString();




                using (SqlConnection conn = new SqlConnection(conn2))
                using (SqlCommand cmd = new SqlCommand("SELECT dbo.Img_select('" + comboBox2.SelectedValue.ToString() + "')", conn))
                {
                    conn.Open();
                    var result = cmd.ExecuteScalar();

                    string path = data_folder + @"\Item_300x300_tumb\" + result.ToString();
                    pictureBox2.Image = Image.FromFile(path);
                    conn.Close();
                }

                
                 
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error" + ex.Message.ToString());
                }


        }

        private void button14_Click(object sender, EventArgs e)
        {
            if (numericTextBox1.Text.Trim() == string.Empty)
            {
                MessageBox.Show("Please add Quantity if Item");
                return; // return because we don't want to run normal code of buton click
            }
            else if (dateTimePicker1.Value > dateTimePicker2.Value)
            {
                MessageBox.Show("Please Check Expiry Date");
                return; // return because we don't want to run normal code of buton click
            }

            try
            {

                System.DateTime myDate1 = default(System.DateTime);
                myDate1 = dateTimePicker1.Value;

                System.DateTime myDate2 = default(System.DateTime);
                myDate2 = dateTimePicker2.Value;

                string conn = ConfigurationManager.ConnectionStrings["UCS_Starter.Properties.Settings.UCSConn"].ToString();
                SqlParameter sqlParameter;

                SqlConnection connection = new SqlConnection(conn);


                SqlCommand command = new SqlCommand();
                command.Connection = connection;
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "Quantitys";

                sqlParameter = new SqlParameter("@item_code", SqlDbType.NVarChar);
                sqlParameter.Value = textBox13.Text.ToString();
                command.Parameters.Add(sqlParameter);

                sqlParameter = new SqlParameter("@quantity", SqlDbType.Int);
                sqlParameter.Value = Convert.ToInt32(numericTextBox1.Text.ToString());
                command.Parameters.Add(sqlParameter);

                sqlParameter = new SqlParameter("@a_date", SqlDbType.DateTime);
                sqlParameter.Value = myDate1;
                command.Parameters.Add(sqlParameter);

                sqlParameter = new SqlParameter("@e_date", SqlDbType.DateTime);
                sqlParameter.Value = myDate2;
                command.Parameters.Add(sqlParameter);

                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
                label15.Text = "Item Successfully Inserted";

                button14.Enabled = false;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error" + ex.Message.ToString());
            }

        }

        private void button12_Click(object sender, EventArgs e)
        {

            this.new_ItemsTableAdapter.Fill(this.uCSDataSet.New_Items);

            dataGridView1.Update();
            dataGridView1.Refresh();
        }

        private void button15_Click(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'uCSDataSet.New_Quantity' table. You can move, or remove it, as needed.
            this.sHOP_NON_PARATableAdapter.Fill(this.uCSDataSet.SHOP_NON_PARA);

            dataGridView2.Update();
            dataGridView2.Refresh();
        }

        private void textBox10_TextChanged(object sender, EventArgs e)
        {
            try
            {
                double val = Convert.ToDouble(numericTextBox2.Text);
                textBox10.Text = val.ToString("F", CultureInfo.InvariantCulture);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error" + ex.Message.ToString());
            }
            
        }

        private void button17_Click(object sender, EventArgs e)
        {
            tabControl1.SelectedIndex = 4;
        }

        private void button21_Click(object sender, EventArgs e)
        {
            try
            {
                serialPort1.PortName = Port;
                serialPort1.BaudRate = 9600;
                serialPort1.Open();
                proximity prox = new proximity();
                prox.Show(); 
                try
                {
                    string id = serialPort1.ReadLine();
                    prox.Close();


                    if (validate(id))
                    {
                        textBox14.Text = id;
                    }
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

        private bool validate(string id)
        {
            Classone cls = new Classone();
            string UID = cls.rfid2system(id);
            //MessageBox.Show(UID + " - " + id);
            //validate using ucs
            if (UID.Substring(0, 3) == "UCS")
            {
                MessageBox.Show("This Proximity Card is Already in The System");
                return false; 
            }
            else
            {
                return true;
            }

        }

        bool IsValidEmail(string email)
        {
            Regex regex = new Regex(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$");
            Match match = regex.Match(email);
            if (match.Success)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        private void button20_Click(object sender, EventArgs e)
        {
            string name = textBox15.Text;
            //MessageBox.Show(comboBox3.SelectedItem.ToString());

            string com_val;
            try { com_val = comboBox3.SelectedItem.ToString(); }
            catch (Exception) { com_val = ""; }

            if (textBox14.Text.Trim() == string.Empty)
            {
                MessageBox.Show("Please Proximity Card For User");
                return; // return because we don't want to run normal code of buton click
            }
            else if (textBox15.Text.Trim() == string.Empty)
            {
                MessageBox.Show("Please Enter User's Name");
                return; // return because we don't want to run normal code of buton click
            }
            else if (!Regex.IsMatch(name, @"^[a-z A-Z]+$"))
            {
                MessageBox.Show("Please Check User's Name");
                return; // return because we don't want to run normal code of buton click
            }
            else if (textBox16.Text.Trim() == string.Empty)
            {
                MessageBox.Show("Please Enter User's Adress");
                return; // return because we don't want to run normal code of buton click
            }
            else if (!IsValidEmail(textBox17.Text) && textBox17.Text.Trim() != string.Empty)
            {
                MessageBox.Show("Plese Chek The E-mail");
                return; // return because we don't want to run normal code of buton click
            }
            else if (numericTextBox3.TextLength != 10)
            {
                MessageBox.Show("Moblie Number Must Include 10 digits");
                return; // return because we don't want to run normal code of buton click
            }



            {

                string connectionString = ConfigurationManager.ConnectionStrings["UCS_Starter.Properties.Settings.UCSConn"].ToString();

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    SqlTransaction transaction;
                    transaction = connection.BeginTransaction();
                    try
                    {
                        //------------------------------------------------------------------------------------------------
                        SqlCommand command = new SqlCommand();

                        command.Connection = connection;
                        command.Transaction = transaction;
                        command.CommandType = CommandType.StoredProcedure;
                        command.CommandText = "Add_user";

                        SqlParameter sqlParameter;

                        sqlParameter = new SqlParameter("@proxid", SqlDbType.NVarChar);
                        sqlParameter.Value = textBox14.Text.ToString();
                        command.Parameters.Add(sqlParameter);

                        sqlParameter = new SqlParameter("@name", SqlDbType.NVarChar);
                        sqlParameter.Value = textBox15.Text.ToString();
                        command.Parameters.Add(sqlParameter);

                        sqlParameter = new SqlParameter("@address", SqlDbType.NVarChar);
                        sqlParameter.Value = textBox16.Text.ToString();
                        command.Parameters.Add(sqlParameter);

                        sqlParameter = new SqlParameter("@rel", SqlDbType.NChar);
                        sqlParameter.Value = com_val;
                        command.Parameters.Add(sqlParameter);

                        sqlParameter = new SqlParameter("@contact", SqlDbType.NChar);
                        sqlParameter.Value = numericTextBox3.Text.ToString();
                        command.Parameters.Add(sqlParameter);

                        sqlParameter = new SqlParameter("@email", SqlDbType.NVarChar);
                        sqlParameter.Value = textBox17.Text.ToString();
                        command.Parameters.Add(sqlParameter);

                        command.ExecuteNonQuery();

                        // Attempt to commit the transaction.
                        transaction.Commit();
                        label25.Text = "User Added Successfully";
                        button20.Enabled = false;
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

        private void button22_Click(object sender, EventArgs e)
        {
            Form4 f4 = new Form4();
            f4.Load_pro();
        }

        private void button18_Click(object sender, EventArgs e)
        {
            this.view_UserTableAdapter.Fill(this.uCSDataSet.View_User);
        }

        private void button16_Click(object sender, EventArgs e)
        {
            tabControl1.SelectedIndex = 5;
        }
    }
}
