#region Copyright

// 
// Copyright (c) 2016
// by Cityscripts
// 

#endregion

#region Using Statements

using System;
using System.Xml;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Services.Mail;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Linq;
using System.Web;
#endregion

namespace Cityscripts.JobAdministration
{

    public partial class JobAdministration : PortalModuleBase
    {

        #region Event Handlers

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            //cmdSave.Click += cmdSave_Click;
        }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!Page.IsPostBack)
            {
                lblJobAdminMsg.Text = "Page is loading";

                if (DotNetNuke.Security.PortalSecurity.IsInRoles("Administrators"))
                {
                    GetTranscriptionGroup();
                    if (TaskIDTextBox.Text == "")
                    {
                        const int TaskIDMaxLength = 12;
                        string TaskID = Guid.NewGuid().ToString();
                        if (TaskID.Length > TaskIDMaxLength)
                            TaskID = TaskID.Substring(0, TaskIDMaxLength);
                        string uTaskID = TaskID.ToString();
                        TaskIDTextBox.Text = uTaskID;
                    }
                    IEnumerable<int> numbersHours = Enumerable.Range(0, 100);
                    foreach (int nHours in numbersHours)
                    {
                        DropDownListddlHours.Items.Add(nHours.ToString());
                    }
                    IEnumerable<int> numbersMinutes = Enumerable.Range(0, 60);
                    foreach (int nMinutes in numbersMinutes)
                    {
                        DropDownListddlMinutes.Items.Add(nMinutes.ToString());
                    }
                    IEnumerable<int> numbersSeconds = Enumerable.Range(0, 60);
                    foreach (int nSeconds in numbersSeconds)
                    {
                        DropDownListddlSeconds.Items.Add(nSeconds.ToString());
                    }

                    IEnumerable<int> TypingProgress = Enumerable.Range(0, 100);
                    foreach (int nTypingProgress in TypingProgress)
                    {
                        DropDownListTypingProgress.Items.Add(nTypingProgress.ToString());
                    }

                    TypingDeadlineTextBox.Text = DateTime.Now.ToString();
                    DurationTotalTextBox.Text = "01 Hour and 02 Minutes and 03 Seconds";
                    StartPositionSSTextBox.Text = "00:00:00";
                    EndPositionSSTextBox.Text = "00:00:00";
                    ShortTitleTextBox.Text = "<PROGID><ROLLNUMBER>";

                    string sFileUploadURLTextBox = @"https://www.transcripts247.com/Uploads/CloudUpload.aspx?folderId=97&view=gridview&pageSize=10";
                    HttpUtility.UrlEncode(sFileUploadURLTextBox);
                    FileUploadURLTextBox.Text = sFileUploadURLTextBox;

                    string sOriginalFilenamesTextBox = @"/GreatTourSeason1/1/";
                    OriginalFilenamesTextBox.Text = sOriginalFilenamesTextBox.ToString().Trim();

                    string sOptionalDownloadURLsTextBox = @"Filename1.mov, Filename2.mov, Filename3.mov";
                    OptionalDownloadURLsTextBox.Text = sOptionalDownloadURLsTextBox;

                    string sFTPUsernameTextBox = "TranscriptsFTP";
                    FTPUsernameTextBox.Text = sFTPUsernameTextBox;
                    string sFTPPasswordTextBox = "mr75Sz4*";
                    FTPPasswordTextBox.Text = sFTPPasswordTextBox;

                    lblJobAdminMsg.Text = "Greetings Administrator <br>";   //This works "Here is your physical path:" + Request.PhysicalPath.ToString();
                }
                else
                {
                    lblJobAdminMsg.Text = "";
                };

            }
        }

        //protected void cmdSave_Click(object sender, EventArgs e)
        //{
        //          //string AddJobAdmin = HttpContext.Current.Request.Url.Scheme + "://" + HttpContext.Current.Request.Url.Authority + HttpContext.Current.Request.RawUrl;
        //          DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, "Update Successful", DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.GreenSuccess);

        //}

        private void SendMail()  //string strFrom, string strTo, string strCC, string strBCC, string strSubject, string strBody
        {
            string meTextBoxProgrammeID = TaskIDTextBox.Text.ToString().Trim();
            string meTaskID = TaskIDTextBox.Text.ToString().Trim();
            string meJobIDTextBox = JobIDTextBox.Text.ToString().Trim();
            string meMediaFormatTextBox = MediaFormatTextBox.Text.ToString().Trim();
            string meTranscriberFormatTextBox = TranscriberFormatTextBox.Text.ToString().Trim();
            string meMediaFileFormatTextBox = MediaFileFormatTextBox.Text.ToString().Trim();
            //string meMediaFileHoursTextBox = MediaFileHoursTextBox.ToString().Trim(); ;
            //string meMediaFileMinutesTextBox = MediaFileMinutesTextBox.Text.ToString().Trim();
            //string meMediaFileSecondsTextBox = MediaFileSecondsTextBox.Text.ToString().Trim();
            string meDurationTotalTextBox = DurationTotalTextBox.Text.ToString().Trim();
            string meStartPositionSSTextBox = StartPositionSSTextBox.Text.ToString().Trim();
            string meEndPositionSSTextBox = EndPositionSSTextBox.Text.ToString().Trim();
            string meFileUploadURLTextBox = FileUploadURLTextBox.Text.ToString().Trim();
            string meOriginalFilenamesTextBox = OriginalFilenamesTextBox.Text.ToString().Trim();
            string meOptionalDownloadURLsTextBox = OptionalDownloadURLsTextBox.Text.ToString().Trim();
            string meFTPUsernameTextBox = FTPUsernameTextBox.Text.ToString().Trim();
            string meFTPPasswordTextBox = FTPPasswordTextBox.Text.ToString().Trim();
            string meClientNotesTextBox = ClientNotesTextBox.Text.ToString().Trim();
            string meLongTitleTextBox = LongTitleTextBox.Text.ToString().Trim();
            string meDropDownListStatus = DropDownListStatus.SelectedItem.Text;
            string meDeadlineTextBox = DeadlineTextBox.Text.ToString().Trim();
            string meDropDownListPriorityTextBox = DropDownListPriorityTextBox.SelectedItem.Text;

            string strBody = "<img src='https://www.transcripts247.com/Portals/0/Images/Transcripts247Logo0.png?ver=2016-09-23-215427-827'> <br> <div style='font-size:12px;font-family:Arial,Helvetica,sans-serif'>" + "<b>Greetings</b><br>A new task has been sent to you and waiting for your approval to complete. <br>" + "</div>" + "<br><div style='font-size:10px;font-family:Verdana,Geneva,sans-serif'>" + "<b>Programme ID: " + meTextBoxProgrammeID + "</b><br> </div>" + "<div style='font-size:10px;font-family:Verdana,Geneva,sans-serif'>" + "<b> Task ID: " + meTaskID + "</b><br> </div><br>" + "<div style='font-size:10px;font-family:Verdana,Geneva,sans-serif'>" + " Media Format: " + meMediaFormatTextBox + "<br> </div>" + "<div style='font-size:10px;font-family:Verdana,Geneva,sans-serif'>" + " Transcriber Format: " + meTranscriberFormatTextBox + "<br> </div>" + "<div style='font-size:10px;font-family:Verdana,Geneva,sans-serif'>" + " MediaFileFormat: " + meMediaFileFormatTextBox + "<br> </div>" + "<div style='font-size:10px;font-family:Verdana,Geneva,sans-serif'>" + " Duration Total: " + meDurationTotalTextBox + "<br> </div>" + "<div style='font-size:10px;font-family:Verdana,Geneva,sans-serif'>" + " StartPosition SS: " + meStartPositionSSTextBox + "<br> </div>" + "<div style='font-size:10px;font-family:Verdana,Geneva,sans-serif'>" + " End Position SS: " + meEndPositionSSTextBox + "<br> </div>" + "<div style='font-size:10px;font-family:Verdana,Geneva,sans-serif'>" + " File Upload URL: " + meFileUploadURLTextBox + "<br> </div>" + "<div style='font-size:10px;font-family:Verdana,Geneva,sans-serif'>" + " Original Filenames: " + meOriginalFilenamesTextBox + "<br> </div>" + "<div style='font-size:10px;font-family:Verdana,Geneva,sans-serif'>" + " Optional Download URLs: " + meOptionalDownloadURLsTextBox + "<br> </div>" + "<div style='font-size:10px;font-family:Verdana,Geneva,sans-serif'>" + " FTP Username: " + meFTPUsernameTextBox + "<br> </div>" + "<div style='font-size:10px;font-family:Verdana,Geneva,sans-serif'>" + " FTP Password: " + meFTPPasswordTextBox + "<br> </div>" + "<div style='font-size:10px;font-family:Verdana,Geneva,sans-serif'>" + " Client Notes: " + meClientNotesTextBox + "<br> </div>" + "<div style='font-size:10px;font-family:Verdana,Geneva,sans-serif'>" + " LongTitle: " + meLongTitleTextBox + "<br> </div>" + "<div style='font-size:10px;font-family:Verdana,Geneva,sans-serif'>" + " Deadline: " + meDeadlineTextBox + "<br> </div>" + "<div style='font-size:10px;font-family:Verdana,Geneva,sans-serif'>" + " Priority: " + meDropDownListPriorityTextBox + "<br> </div>" + "<div style='font-size:11px;font-family:Arial,Helvetica,sans-serif'><br>" + "<br> <b>Please click here to confirm you have accepted this Job: <a href='transcripts247.com/Go/UpdateStatus.aspx?TaskID=" + meTaskID + "'>Accept Job</a><b>" + "<br><br><i>Thanking you kindly and in advance. <br>  <b>Admin at the Transcripts247 Team<b> </i> </div>";
            string GetTranscriptionistEmail = DropDownListCSGetTranscriptsGroupEMail.SelectedValue.ToString();
            //HttpUtility.UrlEncode(GetTranscriptionistEmail);
            //GetTranscriptionistEmail.ToString(); // +  "," + "winstonhaybittle@gmail.com" + "," + "transcripts247@gmail.com" + "," + "winstonhaybittle@msn.com";

            lblJobAdminMsg.Text = strBody + GetTranscriptionistEmail;
            //DotNetNuke.Services.Mail.Mail.SendEmail("info@cityscripts.co.uk", GetTranscriptionistEmail, "winstonhaybittle@msn.com", "transcripts247@gmail.com", "You have a new Task from Transcripts247", strBody,"");
            //DotNetNuke.Services.Mail.Mail.SendMail("Tollon Adkins < info@cityscripts.co.uk >", "info@cityscripts.co.uk;transcripts247@gmail.com", String.Empty, "Greetings from Cityscripts - Job Alert", strBody, String.Empty, "html", String.Empty, String.Empty, String.Empty, String.Empty);
            DotNetNuke.Services.Mail.Mail.SendMail("info@cityscripts.co.uk", GetTranscriptionistEmail, String.Empty, "Greetings from Cityscripts - A New Job Added", strBody, String.Empty, "html", String.Empty, String.Empty, String.Empty, String.Empty);
            DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, "Update Successful", DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.GreenSuccess);

        }

        private void UpdateJobDetailsAssignment()  
        {
            string ATaskIDTextBox = TaskIDTextBox.Text.ToString().Trim();
            string ATypistUseridTextBox = TypistUseridTextBox.Text.ToString().Trim();
            string ADurationTotalTextBox = DurationTotalTextBox.Text.ToString().Trim();
            string AStartPositionSSTextBox = StartPositionSSTextBox.Text.ToString().Trim();
            string AEndPositionSSTextBox = EndPositionSSTextBox.Text.ToString().Trim();
            string AFileUploadURLTextBox = FileUploadURLTextBox.Text.ToString().Trim();
            string AOriginalFilenamesTextBox = OriginalFilenamesTextBox.Text.ToString().Trim();
            string AOptionalDownloadURLsTextBox = OptionalDownloadURLsTextBox.Text.ToString().Trim();
            string AFTPUsernameTextBox = FTPUsernameTextBox.Text.ToString().Trim();
            string AFTPPasswordTextBox = FTPPasswordTextBox.Text.ToString().Trim();
            string AClientNotesTextBox = ClientNotesTextBox.Text.ToString().Trim();
            string ALongTitleTextBox = LongTitleTextBox.Text.ToString().Trim();
            //string ADropDownListStatus = DropDownListStatus.SelectedItem.Text;
            string ADeadlineTextBox = DeadlineTextBox.Text.ToString().Trim();
            //string ADropDownListPriorityTextBox = DropDownListPriorityTextBox.SelectedItem.Text;
string dbSql = "UPDATE CSJobsDetails SET TaskID = @TaskID, TypistUserid = @TypistUserid, DurationTotal = @DurationTotal, StartPositionSS = @StartPositionSS, EndPositionSS = @EndPositionSS, FileUploadURL = @FileUploadURL, OriginalFilenames = @OriginalFilenames, OptionalDownloadURLs = @OptionalDownloadURLs, FTPUsername = @FTPUsername, FTPPassword = @FTPPassword, ClientNotes = @ClientNotes,LongTitle = @LongTitle, Deadline = @Deadline WHERE JobID = @JobID";
            lblJobAdminMsg.Text = dbSql;

            String strConnString = ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "CSUpdateJobsDetailsUserAllocation";
            cmd.Parameters.Add("@TaskID", SqlDbType.VarChar).Value = ATaskIDTextBox;
            cmd.Parameters.Add("@TypistUserid", SqlDbType.VarChar).Value = ATypistUseridTextBox;
            cmd.Parameters.Add("@DurationTotal", SqlDbType.VarChar).Value = ADurationTotalTextBox;
            cmd.Parameters.Add("@StartPositionSS", SqlDbType.VarChar).Value = AStartPositionSSTextBox;
            cmd.Parameters.Add("@EndPositionSS", SqlDbType.VarChar).Value = AEndPositionSSTextBox;
            cmd.Parameters.Add("@FileUploadURL", SqlDbType.VarChar).Value = AFileUploadURLTextBox;
            cmd.Parameters.Add("@OriginalFilenames", SqlDbType.VarChar).Value = AOriginalFilenamesTextBox;
            cmd.Parameters.Add("@OptionalDownloadURLs", SqlDbType.VarChar).Value = AOptionalDownloadURLsTextBox;
            cmd.Parameters.Add("@FTPUsername", SqlDbType.VarChar).Value = AFTPUsernameTextBox;
            cmd.Parameters.Add("@FTPPassword", SqlDbType.VarChar).Value = AFTPPasswordTextBox;
            cmd.Parameters.Add("@ClientNotes", SqlDbType.VarChar).Value = AClientNotesTextBox;
            cmd.Parameters.Add("@LongTitle", SqlDbType.VarChar).Value = ALongTitleTextBox;
            cmd.Parameters.Add("@Deadline", SqlDbType.VarChar).Value = ADeadlineTextBox;
            cmd.Parameters.Add("@JobID", SqlDbType.VarChar).Value = txtJobID.Text; //for query
            cmd.Connection = con;
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                //lblMessage.Text = "Record updated successfully";
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

        protected void GetTranscriptionGroup()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
            SqlConnection mySQLConnection = new SqlConnection(connectionString);
            SqlCommand mySQLCommand = new SqlCommand();
            SqlDataReader mySQLDataReader;
            mySQLCommand.CommandText = "CSGetTranscriptsGroup";
            mySQLCommand.CommandType = CommandType.StoredProcedure;
            mySQLCommand.Connection = mySQLConnection;
            mySQLConnection.Open();
            //mySQLDataReader = mySQLCommand.ExecuteReader();
            lbTranscriptionistsGroup.DataSource = mySQLCommand.ExecuteReader();
            lbTranscriptionistsGroup.DataTextField = "Username";
            lbTranscriptionistsGroup.DataValueField = "UserId";
            lbTranscriptionistsGroup.DataBind();
            mySQLConnection.Close();

        }


        protected void btnTableUpdate_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                lblJobAdminMsg.Text = "Page is Valid";
                if (DurationTotalTextBox.Text == string.Empty)
                {
                    lblJobAdminMsg.Text = "Please check you input for Duration Total.";
                    Response.Clear();//check that this stops processing
                }
                else if (TypistUseridTextBox.Text == string.Empty)
                {
                    lblJobAdminMsg.Text = "Please check you input for Typist User ID";
                }
                else if (StartPositionTextBox.Text == string.Empty)
                {
                    lblJobAdminMsg.Text = "Please check you input for Start Position Time-code ";
                }
                else if (EndPositionTextBox.Text == string.Empty)
                {
                    lblJobAdminMsg.Text = "Please check you input for End Position Time-code ";
                }
                else if (OriginalFilenamesTextBox.Text == string.Empty)
                {
                    lblJobAdminMsg.Text = "Please check you input for File Download URL of the Original File ";
                }
                else if (OptionalDownloadURLsTextBox.Text == string.Empty)
                {
                    lblJobAdminMsg.Text = "Please check you input for Optional Filename URL's of individual files. ";
                }
                else
                {
                    lblJobAdminMsg.Focus();
                    lblJobAdminMsg.Text = "Please Check that all fields are valid before submission.";
                }
                //Winston Start
                

                UpdateJobDetailsAssignment();
                SendMail();

                //Response.Redirect("https://www.transcripts247.com/Go/SuccessMessage.aspx?MessageID=1");
                Response.Redirect("https://www.transcripts247.com/Go/SuccessMessage.aspx?MessageID=1");

                //Winston End
            }
        }

        protected void btnUpdateJobCard_Click(object sender, EventArgs e)
        {

            
            lblJobID.Visible = false;
            txtJobID.Visible = false;
            btnUpdateJobCard.Visible = false;
            PanelUpdateJob.Visible = true;
            
            string connectionString = ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
            string aJobID = txtJobID.Text.ToString();
            string query = "Select * FROM CSJobsDetails WHERE JobID =" + "'" + aJobID + "'";
            //lblJobAdminMsg.Text = query;
            using (SqlConnection connection =
            new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        txtUserid.Text = reader[1].ToString();
                        JobIDTextBox.Text = reader[2].ToString();
                        TextBoxProgrammeID.Text = reader[4].ToString();
                        JobTypeTextBox.Text = reader[3].ToString();
                        FileSubmissionPreferenceTextBox.Text = reader[5].ToString();
                        MediaFormatTextBox.Text = reader[6].ToString();
                        TranscriberFormatTextBox.Text = reader[7].ToString();

                        MediaFileFormatTextBox.Text = reader[8].ToString();
                        MediaFileHoursTextBox.Text = reader[9].ToString();
                        MediaFileMinutesTextBox.Text = reader[10].ToString();
                        MediaFileSecondsTextBox.Text = reader[11].ToString();
                        TodaysDateTextBox.Text = reader[12].ToString();
                        TodaysDateTimeTextBox.Text = reader[13].ToString();
                        DueDateTextBox.Text = reader[14].ToString();
                        DueDateTimeTextBox.Text = reader[15].ToString();
                        SpecialInstructionsTextBox.Text = reader[16].ToString();

                    }
                    reader.Close();
                }
                catch (Exception ex)
                {
                    lblJobAdminMsg.Text = ex.Message;
                }

            }
        }





        protected void btnNotifyTranscriptionist_Click(object sender, EventArgs e)
        {
            TypistUseridTextBox.Text = lbTranscriptionistsGroup.Text.ToString();
        }

        protected void btnEditJobDetails_Click(object sender, EventArgs e)
        {
            PanelEditJobDetails.Visible = true;
        }
    }
}
#endregion

