#region Copyright

// 
// Copyright (c) 2017
// by Cityscripts
// 

#endregion

#region Using Statements

using System;
using DotNetNuke.Entities.Modules;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI.WebControls;
using System.Text;
using System.Configuration;
#endregion

namespace Cityscripts.FinalTranscription
{
    public partial class GetFinalTranscription : PortalModuleBase
    {
        #region Event Handlers
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

        }
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            if (!Page.IsPostBack)
            {
                //txtField.Text = (string)Settings["field"];
                lblListboxTotal.Text = ListBoxFilesCompilation.Items.Count.ToString() + " Files Added - Empty List";
            }
            else
            {

            }
        }

        protected void ButtonAddFile_Click(object sender, EventArgs e)
        {
            //update dropdwn to listbox reference
            string GetSelectionFile = DropDownListShowFileUploads.SelectedValue;
            ListBoxFilesCompilation.Items.Add(GetSelectionFile);
            //listbox counter
            ListFileCounter();
        }
        public void ListFileCounter()
        {
            //listbox counter 
            string LbCount = ListBoxFilesCompilation.Items.Count.ToString();
            if (LbCount == "1") { lblListboxTotal.Text = ListBoxFilesCompilation.Items.Count.ToString() + " File Added"; }
            else { lblListboxTotal.Text = ListBoxFilesCompilation.Items.Count.ToString() + " Files Added"; }
        }
        protected void btnGenerateFinalTranscription_Click(object sender, EventArgs e)
        {
            //
           // txtFinalTranscription.Visible = true;
            //sting builder
            StringBuilder sb = new StringBuilder();
            foreach (ListItem s in ListBoxFilesCompilation.Items)
            {
                //sb.Append("SELECT DataText FROM CSTypistsFiles WHERE id=" + s + ";"); //try sb.Append(x).Append(y).Append(z)
                sb.Append(s); //try sb.Append(x).Append(y).Append(z)
                //sb.AppendLine();
                FillData(s.ToString());
            }


           // txtFinalTranscription.Text =  sb.ToString();
            //strFileResult.


        }
        
        protected void FillData(string s)
        {
            // 1
            // Open connection
            using (SqlConnection c = new SqlConnection(ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString))
            {
                c.Open();
                // 2
                // Create new DataAdapter
                string dynSql = @"SELECT DataText FROM CSTypistsFiles WHERE id=" + s + ";";
                using (SqlDataAdapter a = new SqlDataAdapter(dynSql, c))
                {
                    // 3
                    // Use DataAdapter to fill DataTable
                    DataTable t = new DataTable();
                    a.Fill(t);
                    // 4
                    // Render data onto the screen
                    // dataGridView1.DataSource = t; // Mine Below
                    StringBuilder strFileResult = new StringBuilder();
                    strFileResult.Append(t);
                    txtFinalTranscription.Text = strFileResult.ToString() + "Winston" + t.ToString();
                    txtFinalTranscription.DataBind();
                    gvTranscriptions.DataSource = t;
                    gvTranscriptions.DataBind();
                  

                }
            }
        }

            protected void btnUp_Click(object sender, EventArgs e)
        {
            MoveUp();
        }
        protected void btnDown_Click(object sender, EventArgs e)
        {
            MoveDown();
        }
        public void MoveUp()
        {
            MoveItem(-1);
        }
        public void MoveDown()
        {
            MoveItem(1);
        }
        public void MoveItem(int direction)
        {
            // Checking selected item
            if (ListBoxFilesCompilation.SelectedItem == null || ListBoxFilesCompilation.SelectedIndex < 0)
                return; // No selected item - nothing to do

            // Calculate new index using move direction
            int newIndex = ListBoxFilesCompilation.SelectedIndex + direction;

            // Checking bounds of the range
            if (newIndex < 0 || newIndex >= ListBoxFilesCompilation.Items.Count)
                return; // Index out of range - nothing to do

            var selected = ListBoxFilesCompilation.SelectedItem;

            // Removing removable element
            ListBoxFilesCompilation.Items.Remove(selected);
            // Insert it in new position
            ListBoxFilesCompilation.Items.Insert(newIndex, selected);
            // Restore selection
            //ListBoxFilesCompilation.SelectedIndexChanged(newIndex, true);

            //mine
            ListFileCounter();
        }
        protected void btnRemove_Click(object sender, EventArgs e)
        {
            var selected = ListBoxFilesCompilation.SelectedItem;

            // Removing removable element
            ListBoxFilesCompilation.Items.Remove(selected);
            //mine
            ListFileCounter();
        }
        protected void CheckBoxShowFileDetail_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBoxShowFileDetail.Checked == true) { GridView1GetFinalTranscriptions.Visible = true; } else { GridView1GetFinalTranscriptions.Visible = false; }
        }
    }
}
#endregion
////mine
//string connectionString = ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
//using (SqlConnection connection = new SqlConnection(connectionString))
//{
//    connection.Open();
//    string sql1 = sb.ToString();
//    using (SqlCommand command = new SqlCommand(sql1, connection))
//    {
//        using (SqlDataReader reader = command.ExecuteReader())
//        {
//            string strResult = reader[0].ToString();
//            txtFinalTranscription.Text = strResult;

//        } // command is disposed.
//    } // the SqlConnection will be disposed
//      //end mine
//}


////****
//string query = sb.ToString();
//            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString))
//            {
//                using (SqlCommand cmd = new SqlCommand(query))
//                {
//                    using (SqlDataAdapter sda = new SqlDataAdapter())
//                    {
//                        cmd.Connection = con;
//                        sda.SelectCommand = cmd;
//                        using (DataSet ds = new DataSet())
//                        {
                            
//                            sda.Fill(ds);
//                            gvTranscriptions.DataSource = ds.Tables[0];
//                            gvTranscriptions.DataBind();

//                            gvTranscriptions.DataSource = ds.Tables[1];
//                            gvTranscriptions.DataBind();
//                        }
//                    }
//                }
//            }
