#region Copyright

// 
// Copyright (c) 2016
// by Cityscripts
// 

#endregion

#region Using Statements

using System;
using System.Configuration;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Services.Mail;
using System.Data;
using System.Data.SqlClient;
using DotNetNuke.Security.Roles;
using System.IO;
using System.Threading;
using System.Threading.Tasks;
using System.Diagnostics;

#endregion

namespace Cityscripts.Transcriptionists
{

    public partial class ViewTranscriptionists : PortalModuleBase
    {

        #region Event Handlers

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            btnShowUserTranscripts.Click += btnShowUserTranscripts_Click;
        }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            if (!Page.IsPostBack)
            {
                //

            }
            else
            {

            }
        }

     

        protected void btnDVViewText_Click(object sender, EventArgs e)
        {
            // http://stackoverflow.com/questions/8531709/open-word-document-saved-as-binary-from-database
            //txtDBView.Text = "Hello World";
            //String connStr  = ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
            //string strQuery = "Select * from dbo.CSTranscription WHERE TaskID=@TaskID";
            //txtDBView.Text = strQuery;
            //string fileName = Path.GetTempFileName() + ".docx";

            //using (SqlConnection conn = new SqlConnection(connStr))
            //{
            //    conn.Open();
            //    using (SqlCommand cmd = conn.CreateCommand())
            //    {
            //        // you have to distinguish here which document, I assume that there is an `id` column
            //        cmd.CommandText = "select * from CSTranscription where TranscriptionID = @TranscriptionID";
            //        cmd.Parameters.Add("@TranscriptionID", SqlDbType.Int).Value = 1;
            //        using (SqlDataReader dr = cmd.ExecuteReader())
            //        {
            //            while (dr.Read())
            //            {
            //                int size = 1024 * 1024;
            //                byte[] buffer = new byte[size];
            //                int readBytes = 0;
            //                int index = 0;

            //                using (FileStream fs = new FileStream(fileName, FileMode.Create, FileAccess.Write, FileShare.None))
            //                {
            //                    while ((readBytes = (int)dr.GetBytes(0, index, buffer, 0, size)) > 0)
            //                    {
            //                        fs.Write(buffer, 0, readBytes);
            //                        index += readBytes;
            //                    }
            //                }
            //            }
            //        }
            //    }
            //}

            //// open your file, the proper application will be executed because of proper file extension
            //Process prc = new Process();
            //prc.StartInfo.FileName = fileName;
            //prc.Start();

            ////string connectionString = ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
            ////String query = "Select * from dbo.CSTranscription WHERE (UserId=@UserId AND ProgrammeID=@ProgrammeID AND TaskID=@TaskID)";
            ////using (SqlConnection connection = new SqlConnection(connectionString))
            ////using (SqlCommand command = new SqlCommand(query, connection))
            ////{
            ////    //add job details card to CSJobs table
            ////    command.Parameters.Add("@UserId", SqlDbType.Int).Value = this.UserId;
            ////    var dbTextHandle= "";
            ////    command.Parameters.Add("@TranscriptionText", SqlDbType.VarChar).Value = dbTextHandle; 
            ////      dbTextHandle =  txtDBView.ToString();

            ////    command.Parameters.Add("@ProgrammeID", SqlDbType.VarChar).Value = txtDBViewProgID.Text;
            ////    command.Parameters.Add("@TaskID", SqlDbType.VarChar).Value = txtDBViewTaskID.Text;
            ////    connection.Open();
            ////    command.ExecuteNonQuery();
            ////    connection.Close();

            ////}
        }


        //protected void AddTranscriptionToDB(int myUserid, string myUploadTranscriptions, string myProgrammeID, string myTaskID)
        //{
        //    string connectionString = ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
        //    String query = "INSERT INTO dbo.CSTranscription (UserId, TranscriptionText, ProgrammeID, TaskID) VALUES (@UserId, @TranscriptionText, @ProgrammeID, @TaskID)";
        //    using (SqlConnection connection = new SqlConnection(connectionString))
        //    using (SqlCommand command = new SqlCommand(query, connection))
        //    {
        //        //add job details card to CSJobs table
        //        command.Parameters.Add("@UserId", SqlDbType.Int).Value = myUserid;
        //        command.Parameters.Add("@TranscriptionText", SqlDbType.VarChar).Value = myUploadTranscriptions;
        //        command.Parameters.Add("@ProgrammeID", SqlDbType.VarChar).Value = myProgrammeID;
        //        command.Parameters.Add("@TaskID", SqlDbType.VarChar).Value = myTaskID;
        //        connection.Open();
        //        command.ExecuteNonQuery();
        //        connection.Close();

        //    }
        //}

        //protected void AddTranscriptionToBackupFile(int myUserid, string myUploadTranscriptions, string myProgrammeID, string myTaskID)
        //{
        //    //string connectionString = ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
        //    //String query = "INSERT INTO dbo.CSTranscription (UserId, TranscriptionText, ProgrammeID, TaskID) VALUES (@UserId, @TranscriptionText, @ProgrammeID, @TaskID)";
        //    //using (SqlConnection connection = new SqlConnection(connectionString))
        //    //using (SqlCommand command = new SqlCommand(query, connection))
        //    //{
        //    //    //add job details card to CSJobs table
        //    //    command.Parameters.Add("@UserId", SqlDbType.Int).Value = myUserid;
        //    //    command.Parameters.Add("@TranscriptionText", SqlDbType.VarChar).Value = myUploadTranscriptions;
        //    //    command.Parameters.Add("@ProgrammeID", SqlDbType.VarChar).Value = myProgrammeID;
        //    //    command.Parameters.Add("@TaskID", SqlDbType.VarChar).Value = myTaskID;
        //    //    connection.Open();
        //    //    command.ExecuteNonQuery();
        //    //    connection.Close();

        //    //}
        //}

        //protected void cbUploadDownload_CheckedChanged(object sender, EventArgs e)
        //{
        //    if (cbUploadDownload.Checked == true)
        //    {
        //        cbViewDocs.Checked = false;
        //        PanelAddTranscription.Visible = true;
        //        PanelViewTranscription.Visible = false;
        //    }
        //    else
        //    {
        //        PanelAddTranscription.Visible = false;
        //    }
        //}
        //protected void cbViewDocs_CheckedChanged(object sender, EventArgs e)
        //{
        //    if (cbViewDocs.Checked == true)
        //    {
        //        cbUploadDownload.Checked = false;
        //        PanelViewTranscription.Visible = true;
        //        PanelAddTranscription.Visible = false;
        //    }
        //    else
        //    {
        //        PanelViewTranscription.Visible = false;
        //        PanelAddTranscription.Visible = true;
        //    }
        //}

        protected void btnShowUserTranscripts_Click(object sender, EventArgs e)
        {

            using (FileUpload1)
            {
                // Read the file and convert it to Byte Array
                string filePath = FileUpload1.PostedFile.FileName;
                string filename = Path.GetFileName(filePath);
                string ext = Path.GetExtension(filename);
                string contenttype = String.Empty;
                string fileSize = FileUpload1.PostedFile.ContentLength.ToString();
                switch (ext)
                {
                    case ".doc":
                        contenttype = "application/vnd.ms-word";
                        break;
                    case ".docx":
                        contenttype = "application/vnd.ms-word";
                        break;
                    case ".xls":
                        contenttype = "application/vnd.ms-excel";
                        break;
                    case ".xlsx":
                        contenttype = "application/vnd.ms-excel";
                        break;
                    case ".jpg":
                        contenttype = "image/jpg";
                        break;
                    case ".png":
                        contenttype = "image/png";
                        break;
                    case ".gif":
                        contenttype = "image/gif";
                        break;
                    case ".pdf":
                        contenttype = "application/pdf";
                        break;
                }
                if (contenttype != String.Empty)
                {

                    Stream fs = FileUpload1.PostedFile.InputStream;
                    BinaryReader br = new BinaryReader(fs);
                    Byte[] bytes = br.ReadBytes((Int32)fs.Length);

                    ////insert the file into database
                    string strQuery = "insert into CSTranscriptionDocs(UserId, FileName, FileSize,  ContentType, RawData, ProgrammeID, TaskID) values (@UserId, @FileName, @FileSize, @ContentType, @RawData, @ProgrammeID, @TaskID)";
                    SqlCommand cmd = new SqlCommand(strQuery);
                    //SqlCommand cmd = new SqlCommand();
                                   

                                        cmd.Parameters.Add("@UserId", SqlDbType.VarChar).Value = this.UserId.ToString();
                    cmd.Parameters.Add("@FileName", SqlDbType.VarChar).Value = txtFileName.Text.Trim().ToString();
                                        cmd.Parameters.Add("@FileSize", SqlDbType.VarChar).Value  = fileSize;
                                        cmd.Parameters.Add("@ContentType", SqlDbType.VarChar).Value = contenttype;
                                        cmd.Parameters.Add("@RawData", SqlDbType.Binary).Value = bytes;
                                        cmd.Parameters.Add("@ProgrammeID", SqlDbType.VarChar).Value = txtUserProgID.Text.ToString().Trim();
                                        cmd.Parameters.Add("@TaskID", SqlDbType.VarChar).Value = txtTask.Text.ToString().Trim();

                                            //InsertUpdateData(cmd);
                                            String strConnString = ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
                                            SqlConnection con = new SqlConnection(strConnString);
                                            cmd.CommandType = CommandType.Text;
                                            cmd.Connection = con;
                                            try
                                            {
                                                con.Open();
                                                cmd.ExecuteNonQuery();
                                            }
                                            catch (Exception ex)
                                            {
                                                Response.Write(ex.Message);
                                            }
                                            finally
                                            {
                                                con.Close();
                                                con.Dispose();
                                SendMail();
                                Response.Redirect("https://www.transcripts247.com/Go/SuccessMessage.aspx?MessageID=7");
                        
                    }
                    
                }
                else
                {
                    //lblFolderId.ForeColor = System.Drawing.Color.Red;
                    //lblFolderId.Text = "File format not recognised." + " Upload Image/Word/PDF/Excel formats";
                    lblTranscriptionistMesage.Text = "A File Upload Error has occurred!";
                }

                }
            }

        private void SendMail()  //string strFrom, string strTo, string strCC, string strBCC, string strSubject, string strBody
        {
            string strBody = "<img src='https://www.transcripts247.com/Portals/0/Images/Transcripts247Logo0.png?ver=2016-09-23-215427-827'> <br> <div style='font-size:12px;font-family:Arial,Helvetica,sans-serif'>" + "<b>Greetings</b><br>A new Job has been submitted to Transcripts247. <br>" + "</div>" + "<div style='font-size:10px;font-family:Verdana,Geneva,sans-serif'>" + "User ID: " + this.UserId + "<br> </div>" + "<div style='font-size:10px;font-family:Verdana,Geneva,sans-serif'>" + " Task ID: " + txtTask.Text.ToString() + "<br> </div>" + "<div style='font-size:10px;font-family:Verdana,Geneva,sans-serif'>" + " Programme ID: " + txtUserProgID + "<br> </div>" + "<div style='font-size:11px;font-family:Arial,Helvetica,sans-serif'>" + "<br> <br> <i>Thanking you kindly and in advance. <br>  <b>Admin at the Transcripts247 Team<b> </i> </div>";
            DotNetNuke.Services.Mail.Mail.SendMail("Tollon Adkins < info@cityscripts.co.uk >", "Transcripts247@gmail.com", String.Empty, "Greetings from Cityscripts - A New Job has been submitted", strBody, String.Empty, "html", String.Empty, String.Empty, String.Empty, String.Empty);

        }

        protected void btnGetMyTranscription_Click(object sender, EventArgs e)
        {
            GridViewMyViewUploads.Visible = true;


            String strConnString = ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "CSMyViewUploads";
            cmd.Parameters.Add("@UserId", SqlDbType.VarChar).Value = this.UserId.ToString();
            cmd.Connection = con;
            try
            {
                con.Open();
                GridViewMyViewUploads.EmptyDataText = "No Records Found";
                GridViewMyViewUploads.DataSource = cmd.ExecuteReader();
                GridViewMyViewUploads.DataBind();
            }
           catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
                con.Dispose();
            }
        }
    }
}


 #endregion

