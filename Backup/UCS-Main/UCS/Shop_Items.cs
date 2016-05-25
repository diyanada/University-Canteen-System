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
    public partial class Shop_Items : Form
    {
        string item_code;

        public Shop_Items(string item_id)
        {
            InitializeComponent();

            item_code = item_id;

            Form_admin fa = new Form_admin();
            string conn = ConfigurationManager.ConnectionStrings["UCS_Starter.Properties.Settings.UCSConn"].ToString();
            
            SqlConnection connection = new SqlConnection(conn);
            try
            {
                SqlDataReader myReader = null;
                string sql = "SELECT * FROM NEW_SHOP('') WHERE [Type ID] = '" + item_id + "'";
                if (item_id == null) sql = "SELECT * FROM NEW_SHOP('')";
                if (item_code == "All") sql = "SELECT * FROM NEW_SHOP('')";

                SqlCommand myCommand = new SqlCommand(sql, connection);
                connection.Open();
                myReader = myCommand.ExecuteReader();
                while (myReader.Read())
                {
                    string Name = (myReader["Item Code"].ToString());
                    string D_name = (myReader["Item Name"].ToString());
                    string im11 = fa.data_folder + "\\Item_150x150_tumb\\";
                    string Url = im11 + (myReader["Image"].ToString()); ;
                    int max = (int)(myReader["Quantity"]);

                    if (max > 0)
                    {


                        Button newb = new Button();
                        newb.Name = "BT" + Name;
                        newb.Text = D_name;
                        newb.Width = 150;
                        newb.Height = 150;
                        newb.Font = new Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
                        newb.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
                        newb.BackgroundImage = Image.FromFile(Url);
                        newb.Click += (s, ec) =>
                        {
                            try
                            {
                                NumericUpDown btn1 = flowLayoutPanel1.Controls.Find("UD" + Name, true).FirstOrDefault() as NumericUpDown;
                                btn1.Value += 1;
                            }
                            catch (Exception ex3)
                            {
                                // Get reference to the dialog type.
                                var dialogTypeName = "System.Windows.Forms.PropertyGridInternal.GridErrorDlg";
                                var dialogType = typeof(Form).Assembly.GetType(dialogTypeName);

                                // Create dialog instance.
                                var dialog = (Form)Activator.CreateInstance(dialogType, new PropertyGrid());

                                // Populate relevant properties on the dialog instance.
                                dialog.Text = "No Stock";
                                dialogType.GetProperty("Details").SetValue(dialog, ex3.ToString(), null);
                                dialogType.GetProperty("Message").SetValue(dialog, "Sorry! No Stock Available", null);

                                // Display dialog.
                                var result = dialog.ShowDialog();

                            }


                        };
                        flowLayoutPanel1.Controls.Add(newb);

                        NumericUpDown newud = new NumericUpDown();
                        newud.Name = "UD" + Name;
                        newud.Width = 150;
                        newud.Minimum = 0;
                        newud.Maximum = max;
                        flowLayoutPanel1.Controls.Add(newud);


                    }

                }
                connection.Close();
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message.ToString());
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {

           

            DataTable rs = new DataTable();
            rs.Columns.Add("Item ID");
            rs.Columns.Add("Item Name");
            rs.Columns.Add("Quantity");
            rs.Columns.Add("Price");
            // = ;


            string conn = ConfigurationManager.ConnectionStrings["UCS_Starter.Properties.Settings.UCSConn"].ToString();
            SqlConnection connection = new SqlConnection(conn);
            try
            {
                SqlDataReader myReader = null;
                string sql = "SELECT * FROM NEW_SHOP('') WHERE [Type ID] = '" + item_code + "'";
                if (item_code == null) sql = "SELECT * FROM NEW_SHOP('')";
                if (item_code == "All") sql = "SELECT * FROM NEW_SHOP('')";


                SqlCommand myCommand = new SqlCommand(sql, connection);
                connection.Open();
                myReader = myCommand.ExecuteReader();
                while (myReader.Read())
                {                    
                    if ((int)myReader["Quantity"] > 0)
                    {                        
                        NumericUpDown btn1 = flowLayoutPanel1.Controls.Find("UD" + myReader["Item Code"].ToString(), true).FirstOrDefault() as NumericUpDown;
                        if (btn1.Value > 0)
                        {                            
                            double val = Convert.ToDouble(btn1.Value) * Convert.ToDouble(myReader["Price"]);

                            rs.Rows.Add((myReader["Item Code"].ToString()),
                                (myReader["Item Name"].ToString()),
                                btn1.Value,
                                val.ToString("F", CultureInfo.InvariantCulture)
                                );

                        }
                    }

                }
                connection.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }

            Form2 frm = new Form2();
            

            //frm.dataGridView1.DataSource = Bill;
            frm.FillDataGridView(rs);

           // frm.Show();


            this.Close();
        }


    }
}
