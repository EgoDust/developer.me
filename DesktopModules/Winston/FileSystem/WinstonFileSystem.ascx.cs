#region Copyright

// 
// Copyright (c) 2016
// by Winston
// 

#endregion

#region Using Statements

using System;
using DotNetNuke.Entities.Modules;

using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

#endregion

namespace Winston.FileSystem
{

    public partial class WinstonFileSystem : PortalModuleBase
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
                // txtField.Text = (string)Settings["field"];
                lblLoadEMail.Text = this.UserInfo.Email.ToString();
                lblLoadUsername.Text = this.UserInfo.Username.ToString();
                lblDatenTime.Text = DateTime.Now.ToLongDateString().ToString() + " " + DateTime.Now.ToLongTimeString().ToString();
            }
        }

        protected void Upload(object sender, EventArgs e)
        {
            btnUpload.Enabled = false;
            //check valid filetypes
            string[] validFileTypes = { "doc", "docx", "xls", "xlsx", "pdf" };
            string ext = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName);
            bool isValidFile = false;
            for (int i = 0; i < validFileTypes.Length; i++)
            {
                if (ext == "." + validFileTypes[i])
                {
                    isValidFile = true;
                    break;
                }
            }
            if (!isValidFile)
            {
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "Incorrect File Extension - Please upload a File with extension " + string.Join(",", validFileTypes);
            }
            else
            {
                Label1.ForeColor = System.Drawing.Color.Green;
                Label1.Text = "File validated successfully.";
                //insert to database
                // Read the file and convert it to Byte Array
                string filePath = FileUpload1.PostedFile.FileName;
                string filename = Path.GetFileName(filePath);
                string extt = Path.GetExtension(filename);
                string contenttype = String.Empty;
                //Set the contenttype based on File Extension for fileupload validations
                switch (extt)
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
                    case ".pdf":
                        contenttype = "application/pdf";
                        break;
                }
                if (contenttype != String.Empty)
                {
                    Stream fs = FileUpload1.PostedFile.InputStream;
                    BinaryReader br = new BinaryReader(fs);
                    Byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    //insert the file into database
                    string strQuery = "insert into CSTypistsFiles(Name, ContentType, Data, DataText, Username, EMailAddress, DateTime, FileSize, SortOrder, TaskID, IsActive)" +
                       " values (@Name, @ContentType, @Data, @DataText, @Username, @EMailAddress, @DateTime, @FileSize, @SortOrder, @TaskID,  @IsActive)";
                    SqlCommand cmd = new SqlCommand(strQuery);
                    cmd.Parameters.Add("@Name", SqlDbType.VarChar).Value = filename;
                    cmd.Parameters.Add("@ContentType", SqlDbType.VarChar).Value = contenttype;
                    cmd.Parameters.Add("@Data", SqlDbType.Binary).Value = bytes;
                    cmd.Parameters.Add("@DataText", SqlDbType.NVarChar).Value = TextBoxTypistsWork.Text.ToString();
                    cmd.Parameters.Add("@Username", SqlDbType.NVarChar).Value = this.UserInfo.Username.ToString();
                    cmd.Parameters.Add("@EMailAddress", SqlDbType.NVarChar).Value = lblLoadEMail.Text;
                    cmd.Parameters.Add("@DateTime", SqlDbType.DateTime).Value = DateTime.Now;
                    cmd.Parameters.Add("@FileSize", SqlDbType.NVarChar).Value = FileUpload1.PostedFile.ContentLength.ToString();   // Get the size in bytes of the file to upload.
                    cmd.Parameters.Add("@SortOrder", SqlDbType.NVarChar).Value = "0";
                    cmd.Parameters.Add("@TaskID", SqlDbType.VarChar).Value = TextBoxTaskID.Text.ToString();
                    cmd.Parameters.Add("@IsActive", SqlDbType.Bit).Value = true;

                    InsertUpdateData(cmd);
                    //cleanup
                    Label1.ForeColor = System.Drawing.Color.Green;
                    Label1.Font.Bold = true;
                    Label1.Text = "File Uploaded Successfully";
                    TextBoxTypistsWork.ForeColor = System.Drawing.Color.Green;
                    TextBoxTypistsWork.Font.Bold = true;
                    TextBoxTypistsWork.Text = "Document Submitted - Thank You!";
                    TextBoxTaskID.Text = "";
                    //Label1
                    Label1.Text = "File Submitted.";
                    //Response.AppendHeader("Refresh", "5;ViewTranscribbles.aspx");
                    SendMail(filename);
                    if (DotNetNuke.Security.PortalSecurity.IsInRoles("Cityscripts"))
                    {
                        Response.AppendHeader("Refresh", "5;TranscriptionSubmitted.aspx");
                    }

                    else

                    {
                        Label1.ForeColor = System.Drawing.Color.Red;
                        Label1.Text = "File format not recognised. Upload Word, Excel or Excel PDF formats";
                    }
                }
            }
        }

        private Boolean InsertUpdateData(SqlCommand cmd)

        {
            String strConnString = ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
            SqlConnection con = new SqlConnection(strConnString);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
                return false;
            }
            finally
            {
                con.Close();
                con.Dispose();
            }
        }

        protected void TextBoxTypistsWork_OnDataBinding(object sender, EventArgs e)
        {
            string encodedTextBoxTypistsWork = TextBoxTypistsWork.Text;
            byte[] utf8Bytes = System.Text.Encoding.UTF8.GetBytes(encodedTextBoxTypistsWork);
        }

        private void SendMail(string filename)
        {
            DotNetNuke.Services.Mail.Mail.SendMail("cityscriptsltd@gmail.com", this.UserInfo.Email.ToString(), string.Empty, string.Empty,
            DotNetNuke.Services.Mail.MailPriority.Normal,
            "Greetings from Transcripts247 - New Job Upload Notification",
            DotNetNuke.Services.Mail.MailFormat.Html,
            System.Text.Encoding.UTF8,
            "A new task has been uploaded!" + "<br>FileName = " + filename + " from " + this.UserInfo.Email.ToString() + " <i> Transcripts247 </i>" + ".", "", "", "", "", "");
        }

    }
}
#endregion

