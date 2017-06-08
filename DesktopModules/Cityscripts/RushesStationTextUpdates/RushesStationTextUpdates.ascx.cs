#region Copyright

// 
// Copyright (c) 2016
// by Cityscripts
// 

#endregion

#region Using Statements

using System;
using System.IO;
using DotNetNuke.Entities.Modules;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.Linq;
#endregion

namespace Cityscripts.RushesStationTextUpdates
{
    public partial class RushesStationTextUpdates : PortalModuleBase
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
                //Page Loads
                lblRushesStationTextUpdates.Text = "Greetings " + this.UserInfo.Username.ToString();
                string @fsPAP = Request.PhysicalApplicationPath + "Portals\\0\\datafiles\\"; ;
                lblDirectoryProcessingPath.Text = "Checking the following server directory for FTP uploaded text files:<br>" + fsPAP;

            }
        }

        protected void btReadDirectory_Click(object sender, EventArgs e)
        {
            var sortedFiles = new DirectoryInfo(@"C:\\Dev\\developer.me\\Portals\\0\\datafiles")
                .GetFiles("*.txt")
                .OrderBy(f => f.LastWriteTimeUtc).ToList();
            //
            StringBuilder sb = new StringBuilder();

            foreach (var item in sortedFiles)
            {
                ListBoxFTPFiles.Items.Add(item.Name + "|" + item.LastWriteTimeUtc);
                //sb.AppendLine(item.Name + "|" + item.LastAccessTimeUtc);
                //sb.AppendLine(";");
                MakeParentTable();
            }
        }


        private void MakeParentTable()
        {
            //https://msdn.microsoft.com/en-us/library/system.data.datatable.aspx
            string UnallocatedFilesSqlQuery = @"SELECT CSJobsDetails.OriginalFilenames, CSJobsDetails.Status, CSJobsDetails.JobDetailsID FROM CSJobsDetails WHERE (CSJobsDetails.Status IS NULL) ORDER BY CSJobsDetails.JobDetailsID DESC";
            SqlConnection mySqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString);

            DataSet dataSet = new DataSet();
            // Create a new DataTable.
            DataTable table = new DataTable("CSJobsDetails");
            // Declare variables for DataColumn and DataRow objects.
            DataColumn column;
            DataRow row;

            // Create new DataColumn, set DataType, 
            // ColumnName and add to DataTable.    
            column = new DataColumn();
            column.DataType = System.Type.GetType("System.Int32");
            column.ColumnName = "JobDetailsID";
            column.ReadOnly = true;
            column.Unique = true;
            // Add the Column to the DataColumnCollection.
            table.Columns.Add(column);

            // Create second column.
            column = new DataColumn();
            column.DataType = System.Type.GetType("System.String");
            column.ColumnName = "OriginalFilenames";
            column.AutoIncrement = false;
            column.Caption = "OriginalFilenames";
            column.ReadOnly = false;
            column.Unique = false;
            // Add the column to the table.
            table.Columns.Add(column);

            // Make the ID column the primary key column.
            DataColumn[] PrimaryKeyColumns = new DataColumn[1];
            PrimaryKeyColumns[0] = table.Columns["JobDetailsID"];
            table.PrimaryKey = PrimaryKeyColumns;

            // Instantiate the DataSet variable.
            dataSet = new DataSet();
            // Add the new DataTable to the DataSet.
            dataSet.Tables.Add(table);

            // Create three new DataRow objects and add 
            // them to the DataTable
            for (int i = 0; i <= 2; i++)
            {
                row = table.NewRow();
                row["JobDetailsID"] = i;
                row["OriginalFilenames"] = "OriginalFilenames " + i;
                table.Rows.Add(row);

            }
        }

    }
}
#endregion

//DirectoryInfo di = new DirectoryInfo(@"C:\\Dev\\developer.me\\Portals\\0\\datafiles");
////DirectoryInfo di = new DirectoryInfo(@"C:\\Inetpub\\vhosts\\transcripts247.com\\httpdocs\\Portals\\0\\datafiles");
//FileInfo[] smFiles = di.GetFiles("*.txt");
//foreach (FileInfo fi in smFiles)
//{
//    fi.Refresh(); //get latest meta data from file
//    string LastAccessTime = fi.LastAccessTime.ToString("yyyyMMddHHmmss");
//    string dateCreationUtc = fi.LastWriteTimeUtc.ToString("yyyyMMddHHmmss");
//    string FullName = fi.FullName.ToString();
//    ListBox1.Items.Add(Path.GetFileNameWithoutExtension(fi.Name));
//}
//



//@"C:\\Dev\\DNNDev\\Portals\\0\\datafiles"
//string[] array2 = Directory.GetFiles(@"C:\\Dev\\DNNDev\\Portals\\0\\datafiles", "*.txt");
//string[] array2 = Directory.GetFiles(@"C:\\Dev\\DNNDev\\Portals\\0\\datafiles");
//string[] ShowText = Directory.GetFiles(@"C:\\Dev\\DNNDev\\Portals\\0\\datafiles");

//foreach (string name in ShowText)
//{
//   // txtFileList.Text = name;
//    ListBox1.Items.Add(name);
//}
//string[] GGG = Path.GetFileNameWithoutExtension;
//string[] sourceDir = Directory.GetFiles(@"C:\\Dev\\DNNDev\\Portals\\0\\datafiles"); 

////string sourceDir = @"C:\\Dev\\DNNDev\\Portals\\0\\datafiles";
////string[] fileEntries = Directory.GetFiles(sourceDir);
////foreach (string fileName in fileEntries)
////{ ListBox1.Items.Add(Path.GetFileNameWithoutExtension(fileName)); }

