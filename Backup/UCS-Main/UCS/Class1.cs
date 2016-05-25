using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Xml;
using System.Configuration;

namespace UCS
{
    class Classone
    {
        public static string echo_darshi(string key)
        {
            string attr = "";
            Form_admin fa = new Form_admin();

            XmlDocument doc = new XmlDocument();
            doc.Load(fa.language_file);
            //add lang case
           
                if (fa.language == "Sinhala"){
                    
                    try
                    {
                        XmlNode node1 = doc.DocumentElement.SelectSingleNode("/language/SINHALA/add");
                        attr = node1.Attributes[key].InnerText;
                        return attr;
                    }
                    catch (NullReferenceException)
                    {
                        XmlNode node2 = doc.DocumentElement.SelectSingleNode("/language/ENGLISH/add");
                        attr = node2.Attributes[key].InnerText;

                        return attr;
                    }
                    
                }
                if (fa.language == "Tamil")
                {
                    XmlNode node3 = doc.DocumentElement.SelectSingleNode("/language/TAMIL/add");
                    try
                    {
                        attr = node3.Attributes[key].InnerText;
                        return attr;
                    }
                    catch (NullReferenceException)
                    {
                        XmlNode node4 = doc.DocumentElement.SelectSingleNode("/language/ENGLISH/add");
                        attr = node4.Attributes[key].InnerText;

                        return attr;
                    }

                }
                else
                {
                    XmlNode node5 = doc.DocumentElement.SelectSingleNode("/language/ENGLISH/add");
                    try
                    {
                        attr = node5.Attributes[key].InnerText;
                        return attr;
                    }
                    catch (NullReferenceException)
                    {
                        return "This Key (" + key + ") Not update Plese update to Language.xml file";
                    }

                }
            
        }

        public string rfid2system(string id)
        {
            String UID = "Invalid";
            try
            {
                
                string conn = ConfigurationManager.ConnectionStrings["UCS_Starter.Properties.Settings.UCSConn"].ToString();

                SqlConnection myConnection = new SqlConnection(conn);

                myConnection.Open();
                SqlDataReader myReader = null;
                string quary = "SELECT UserID FROM Proxy WHERE ProxyID = '" + id + "'";
                SqlCommand myCommand = new SqlCommand(quary, myConnection);
                myReader = myCommand.ExecuteReader();
                while (myReader.Read())
                {
                    UID = myReader["UserID"].ToString();
                }
                myConnection.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            return UID;

        }

        public double check_bal(string id)
        {
            double val = 0;
            try
            {
                string conn = ConfigurationManager.ConnectionStrings["UCS_Starter.Properties.Settings.UCSConn"].ToString();

                SqlConnection myConnection = new SqlConnection(conn);

                myConnection.Open();
                SqlDataReader myReader = null;
                string quary = "SELECT Value FROM Proxy WHERE ProxyID = '" + id + "'";
                SqlCommand myCommand = new SqlCommand(quary, myConnection);
                myReader = myCommand.ExecuteReader();
                while (myReader.Read())
                {
                    val = Convert.ToDouble(myReader["Value"]);
                }
                myConnection.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            //MessageBox.Show(val.ToString());
            return val;

        }
    }
}
