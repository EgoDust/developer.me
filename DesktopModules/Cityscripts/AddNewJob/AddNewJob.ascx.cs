#region Copyright

// 
// Copyright (c) 2016
// by Cityscripts
// 

#endregion

#region Using Statements

using System;
using System.Configuration; //for accessing webconfig db connection
using System.Linq;
using System.Collections.Generic;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Security.Roles;
using DotNetNuke.Security.Membership;
using DotNetNuke.Security.Permissions;
using DotNetNuke.Services.UserProfile;
using DotNetNuke.Entities;
using DotNetNuke.Entities.Users;
using DotNetNuke.Services;
using DotNetNuke.UI;
using DotNetNuke.Framework;
using DotNetNuke.Web;
using DotNetNuke.Services.Mail;
using System.Data;
using System.Data.SqlClient;

#endregion

namespace Cityscripts.AddNewJob
{

    public partial class AddNewJob : PortalModuleBase
    {

        //#region Event Handlers

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            //cmdSave.Click += cmdSave_Click;
           // cmdCancel.Click += cmdCancel_Click;
        }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            if (!Page.IsPostBack)
            {
                PopulateStuff();

            }

        }


        //    else
        //    {

            //        string sJobType = ddlJobType.SelectedValue.Trim().ToString();
            //        switch (sJobType)
            //        {
            //            case "Transcriptions":
            //                //PanelTranscriptions.Visible = true;
            //                lblAddJobMessage.Visible = false;
            //                break; //or continue flag
            //            case "Translations":
            //                //PanelTranscriptions.Visible = true;
            //                lblAddJobMessage.Visible = false;
            //                break;
            //            case "Subtitling":
            //                //PanelTranscriptions.Visible = true;
            //                lblAddJobMessage.Visible = false;
            //                break;
            //            case "Post Production Scripts":
            //                //PanelTranscriptions.Visible = true;
            //                lblAddJobMessage.Visible = false;
            //                break;
            //            case "Video Logging":
            //                //PanelTranscriptions.Visible = true;
            //                lblAddJobMessage.Visible = false;
            //                break;
            //            case "(Choose Job Type)":
            //                //PanelTranscriptions.Visible = true;
            //                lblAddJobMessage.Visible = false;
            //                break;
            //        }

            //    }
            //   //calendar todays date
            //    CalTodaysDate.SelectedDate = DateTime.Today;
            //    DateTime dtDueDateAddDayss = DateTime.Today.AddDays(2);
            //    calDueDate.SelectedDate = dtDueDateAddDayss;
            //    //time
            //    string Todaysdt = DateTime.Now.ToString("t");
            //    txtTodaysdt.Text = Todaysdt.ToString();
            //    txtDueDateTime.Text = Todaysdt.ToString();

            //    string UserProfileUsername = ModuleContext.PortalSettings.UserInfo.Username.ToString();
            //    lblAddJobMessage.Text = "Greetings <i><font size='+1'>" + UserProfileUsername.ToString() + Environment.NewLine + "</font></i> and welcome.<br> Here you can <b>Add a new Job</b> for video Logging, Post Productions Scripts, Subtitles, Transcriptions &amp; Translations for processing here.<br> Please select a <b>Job Type</b> and wait for the page to respond.";

            //    string UserProfileContactNumber = ModuleContext.PortalSettings.UserInfo.Profile.Cell.ToString();
            //    if (UserProfileContactNumber.Length < 0)
            //    {
            //        UserProfileContactNumber = "000-000-000-0000";
            //    } //check for blank
            //    txtContactNumber.Text = UserProfileContactNumber.ToString();


            //}

            //protected void cmdSave_Click(object sender, EventArgs e)
            //{


        //if (Page.IsValid)
        //{
        //DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, "Update Successful", DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.GreenSuccess);
        //var userIP = System.Web.HttpContext.Current.Request.UserHostAddress;
        //string uIPAddr =  userIP.ToString();

        //int UserProfileId = this.UserId;
        //string uUserID = UserProfileId.ToString();

        //string uFullName = ModuleContext.PortalSettings.UserInfo.Profile.Cell.ToString();

        //string uddlJobType = ddlJobType.SelectedValue.ToString();

        //string uddlFileSubmissionPreference = ddlFileSubmissionPreference.SelectedValue.ToString().Trim();

        ////Create jobID guid 12 chars in length
        //const int JobMaxLength = 12;
        //String guid = Guid.NewGuid().ToString();
        //var Jobname = guid;
        //if (Jobname.Length > JobMaxLength)
        //    Jobname = Jobname.Substring(0, JobMaxLength);
        //string uJobID = Jobname.ToString();

        //string uJobIDName = txtJobIDName.Text.ToString().Trim();

        //const int ProgrammeIDMaxLength = 12;
        //string ProgrammeID = Guid.NewGuid().ToString();
        //if (ProgrammeID.Length > ProgrammeIDMaxLength)
        //    ProgrammeID = ProgrammeID.Substring(0, ProgrammeIDMaxLength);
        //string uProgrammeID = ProgrammeID.ToString();



        //string uProgrammeName = txtJobIDName.Text.ToString().Trim();
        //string uJobDescription = txtJobDescription.Text.ToString().Trim();
        //bool uJobIsActive = true;
        ////string uJobLengthTime = txtJobLengthTime.Text;
        //string uCalTodaysDate = CalTodaysDate.SelectedDate.ToShortDateString();
        //var uTodaysdt = txtTodaysdt.Text;
        //uTodaysdt.ToString().Trim();
        //string ucalDueDate = calDueDate.SelectedDate.ToShortDateString();
        //string uDueDateTime = txtDueDateTime.Text.ToString().Trim();
        //string uMediaFormat = ddlMediaFormat.SelectedValue.ToString().Trim();
        //string uTranscriberFormat = ddlTranscriberFormat.SelectedValue.ToString().Trim();
        //string ulMediaFileFormat = ddllMediaFileFormat.SelectedValue.ToString().Trim();
        //string uddlHours = ddlHours.SelectedValue.ToString().Trim();
        //string uddlMinutes = ddlMinutes.SelectedValue.ToString().Trim();
        //string uddlSeconds = ddlSeconds.SelectedValue.ToString().Trim();
        //string udnnteSpecialInstructions = dnnteSpecialInstructions.Text.Trim();
        //string uContactNumber = txtContactNumber.Text.Trim();

        //lblAddJobMessage.Text = uIPAddr.ToString() + uUserID.ToString() + uFullName.ToString() + uddlJobType.ToString() + uJobID.ToString() + uJobIDName.ToString() + uJobDescription.ToString() + uCalTodaysDate.ToString() + uTodaysdt + ucalDueDate + uDueDateTime + uMediaFormat + uTranscriberFormat + ulMediaFileFormat + uddlHours + uddlMinutes + uddlSeconds + udnnteSpecialInstructions + uContactNumber;
        //string SubmitJobDetailsMsg = lblAddJobMessage.Text;
        //DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, SubmitJobDetailsMsg, DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.GreenSuccess);
        //AddToDB(uIPAddr, uUserID, uFullName, uddlJobType, uddlFileSubmissionPreference, uJobID, uContactNumber, uJobIDName, uProgrammeID, uProgrammeName, uJobDescription, uCalTodaysDate, uTodaysdt, ucalDueDate, uDueDateTime, uMediaFormat, uTranscriberFormat, ulMediaFileFormat, uddlHours, uddlMinutes, uddlSeconds, udnnteSpecialInstructions, uJobIsActive);
        //SendMail();
        //SendMailAdmin();
        ////Response.Redirect("https://www.transcripts247.com/Work/CreateJobConfirm.aspx?FSP=" + uddlFileSubmissionPreference + "&JobID=" + uJobID);  //change for live site
        //Response.Redirect("http://dnndev.me/Work/CreateJobConfirm.aspx?FSP=" + uddlFileSubmissionPreference + "&JobID=" + uJobID);  //change for live site
        //}
        //else
        //{
        //lblAddJobMessage.Text = "Page is not valid, please check your form above for missing required fields which are marked in red in the right hand side of missing control.";
        // }
   // }

        protected void PopulateStuff()
        {
            IEnumerable<int> numbersHours = Enumerable.Range(0, 100);
            foreach (int nHours in numbersHours)
            {
                ddlHours.Items.Add(nHours.ToString());
            }
            IEnumerable<int> numbersMinutes = Enumerable.Range(0, 60);
            foreach (int nMinutes in numbersMinutes)
            {
                ddlMinutes.Items.Add(nMinutes.ToString());
            }
            DateTime dtDueDateAddDayss = DateTime.Today.AddDays(2);
            calDueDate.SelectedDate = dtDueDateAddDayss;
            string Todaysdt = DateTime.Now.ToString("t");
            txtDueDateTime.Text = Todaysdt.ToString();

        }

        //private void SendMail()  //string strFrom, string strTo, string strCC, string strBCC, string strSubject, string strBody
        //{
        //    string strBody = "Hello There, <br>A new Job has been added to the Transcripts247 website and awaiting customer File Upload Method.";
        //    DotNetNuke.Services.Mail.Mail.SendEmail("info@cityscripts.co.uk", "transcripts247@gmail.com", "Job Created on Transcripts247", strBody);
        //    DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, "Update Successful", DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.GreenSuccess);
        //    /*** Get the host settings information***/
        //    //System.Collections.Generic.Dictionary < string, string= "" > hostSettings = DotNetNuke.Entities.Controllers.HostController.Instance.GetSettingsDictionary();
        //    ///*** Set the SMTP server details ***/
        //    //string strSMTP = hostSettings["SMTPServer"];
        //    ///*** This is the actual built in function from DNN Framework. ***/
        //    //DotNetNuke.Services.Mail.Mail.SendMail(strFrom, strTo, strCC, strBCC, DotNetNuke.Services.Mail.MailPriority.Normal, strSubject, DotNetNuke.Services.Mail.MailFormat.Html, System.Text.Encoding.UTF8, strBody, "",
        //    //strSMTP, hostSettings["SMTPAuthentication"], hostSettings["SMTPUsername"], hostSettings["SMTPPassword"]);
        //}
        //private void SendMailAdmin()  //string strFrom, string strTo, string strCC, string strBCC, string strSubject, string strBody
        //{
        //    string strBody = "Hello There, <br>A new Job has been added to the Transcripts247 website and awaiting customer File Upload Method.";
        //    DotNetNuke.Services.Mail.Mail.SendEmail("info@cityscripts.co.uk", "info@cityscripts.co.uk", "Job Created on Transcripts247", strBody);
        //    DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, "Update Successful", DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.GreenSuccess);
        //    /*** Get the host settings information***/
        //    //System.Collections.Generic.Dictionary < string, string= "" > hostSettings = DotNetNuke.Entities.Controllers.HostController.Instance.GetSettingsDictionary();
        //    ///*** Set the SMTP server details ***/
        //    //string strSMTP = hostSettings["SMTPServer"];
        //    ///*** This is the actual built in function from DNN Framework. ***/
        //    //DotNetNuke.Services.Mail.Mail.SendMail(strFrom, strTo, strCC, strBCC, DotNetNuke.Services.Mail.MailPriority.Normal, strSubject, DotNetNuke.Services.Mail.MailFormat.Html, System.Text.Encoding.UTF8, strBody, "",
        //    //strSMTP, hostSettings["SMTPAuthentication"], hostSettings["SMTPUsername"], hostSettings["SMTPPassword"]);
        //}

        //protected void AddToDB(string uIPAddr, string uUserID, string uFullName, string uddlJobType, string uddlFileSubmissionPreference, string uJobID, string uContactNumber, string uJobIDName, string uProgrammeID, string uProgrammeName, string uJobDescription, string uCalTodaysDate, string uTodaysdt, string ucalDueDate, string uDueDateTime, string uMediaFormat, string uTranscriberFormat, string ulMediaFileFormat, string uddlHours, string uddlMinutes, string uddlSeconds, string udnnteSpecialInstructions, bool uJobIsActive)
        //{
        //    string connectionString = ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
        //    String query = "INSERT INTO dbo.CSJobs (IPAddress, JobType,FileSubmissionPreference, FullName , Userid  ,ProgrammeID, ProgrammeName,ProgrammeDescription, JobID , ContactNumber, JobIsActive) VALUES (@uIPAddr, @uddlJobType, @uddlFileSubmissionPreference, @uFullName, @uUserID, @uProgrammeID,  @uProgrammeName, @uJobDescription, @uJobID ,@uContactNumber, @uJobIsActive)";
        //    using (SqlConnection connection = new SqlConnection(connectionString))
        //    using (SqlCommand command = new SqlCommand(query, connection))
        //    {
        //        //add job details card to CSJobs table
        //        command.Parameters.Add("@uIPAddr", SqlDbType.VarChar).Value = uIPAddr;
        //        command.Parameters.Add("@uddlJobType", SqlDbType.VarChar).Value = uddlJobType;
        //        command.Parameters.Add("@uddlFileSubmissionPreference", SqlDbType.VarChar).Value = uddlFileSubmissionPreference;
        //        command.Parameters.Add("@uFullName", SqlDbType.VarChar).Value = uFullName;
        //        command.Parameters.Add("@uUserID", SqlDbType.VarChar).Value = uUserID;
        //        command.Parameters.Add("@uProgrammeID", SqlDbType.VarChar).Value = uProgrammeID;
        //        command.Parameters.Add("@uProgrammeName", SqlDbType.VarChar).Value = uProgrammeName;
        //        command.Parameters.Add("@uJobDescription", SqlDbType.VarChar).Value = uJobDescription;
        //        command.Parameters.Add("@uJobID", SqlDbType.VarChar).Value = uJobID;
        //        command.Parameters.Add("@uContactNumber", SqlDbType.VarChar).Value = uContactNumber;
        //        command.Parameters.Add("@uJobIsActive", SqlDbType.Bit).Value = uJobIsActive;
        //        //add any supplied job details to CSJobsDetails table
        //        string query2 = "INSERT INTO dbo.CSJobsDetails (Userid,JobID,JobType,ProgrammeID,FileSubmissionPreference,MediaFormat,TranscriberFormat,MediaFileFormat,MediaFileHours,MediaFileMinutes,MediaFileSeconds,TodaysDate,TodaysDateTime,DueDate,DueDateTime,SpecialInstructions) values (@uUserID, @uJobID, @uddlJobType, @uProgrammeID, @uddlFileSubmissionPreference, @uMediaFormat, @uTranscriberFormat, @uMediaFileFormat, @uddlHours, @uddlMinutes, @uddlSeconds, @uCalTodaysDate, @uTodaysdt, @ucalDueDate, @uDueDateTime, @udnnteSpecialInstructions)";
        //        SqlCommand command2 = new SqlCommand(query2, connection);
        //        command2.Parameters.Add("@uUserID", SqlDbType.VarChar).Value = uUserID;
        //        command2.Parameters.Add("@uJobID", SqlDbType.VarChar).Value = uJobID;
        //        command2.Parameters.Add("@uddlJobType", SqlDbType.VarChar).Value = uddlJobType;
        //        command2.Parameters.Add("@uProgrammeID", SqlDbType.VarChar).Value = uProgrammeID;
        //        command2.Parameters.Add("@uddlFileSubmissionPreference", SqlDbType.VarChar).Value = uddlFileSubmissionPreference;
        //        command2.Parameters.Add("@uMediaFormat", SqlDbType.VarChar).Value = uMediaFormat.ToString().Trim();
        //        command2.Parameters.Add("@uTranscriberFormat", SqlDbType.VarChar).Value = uTranscriberFormat;
        //        command2.Parameters.Add("@uMediaFileFormat", SqlDbType.VarChar).Value = ulMediaFileFormat;
        //        command2.Parameters.Add("@uddlHours", SqlDbType.VarChar).Value = uddlHours.Trim();
        //        command2.Parameters.Add("@uddlMinutes", SqlDbType.VarChar).Value = uddlMinutes.Trim();
        //        command2.Parameters.Add("@uddlSeconds", SqlDbType.VarChar).Value = uddlSeconds.Trim();
        //        command2.Parameters.Add("@uCalTodaysDate", SqlDbType.VarChar).Value = uCalTodaysDate.ToString().Trim();
        //        command2.Parameters.Add("@uTodaysdt", SqlDbType.VarChar).Value = uTodaysdt.ToString().Trim();
        //        command2.Parameters.Add("@ucalDueDate", SqlDbType.VarChar).Value = ucalDueDate.ToString().Trim();
        //        command2.Parameters.Add("@uDueDateTime", SqlDbType.VarChar).Value = uDueDateTime.ToString().Trim();
        //        command2.Parameters.Add("@udnnteSpecialInstructions", SqlDbType.VarChar).Value = udnnteSpecialInstructions.ToString().Trim();


        //        connection.Open();
        //        command.ExecuteNonQuery();
        //        command2.ExecuteNonQuery();
        //        connection.Close();
        //    }
        //}

        //#endregion






        protected void btnCreateJobbie_Click(object sender, EventArgs e)
        {
            btnCreateJobbie.Enabled = false;

            var userIP = System.Web.HttpContext.Current.Request.UserHostAddress;
            string uIPAddr = userIP.ToString();
            int UserProfileId = this.UserId;
            string uUserID = UserProfileId.ToString();
            string UserProfileContactNumber = ModuleContext.PortalSettings.UserInfo.Profile.Cell.ToString();
            if (UserProfileContactNumber.Length < 0)
            {
                UserProfileContactNumber = "000-000-000-0000";
            } //check for blank
            string uContactNumber = UserProfileContactNumber.ToString();
            string uFullName = ModuleContext.PortalSettings.UserInfo.Profile.Cell.ToString();
            string sJobType = ddlJobType.SelectedValue.Trim().ToString();
            string uddlJobType = ddlJobType.SelectedValue.ToString();
            string uddlFileSubmissionPreference = ddlFileSubmissionPreference.SelectedValue.ToString().Trim();
            //Create jobID guid 12 chars in length
            const int JobMaxLength = 12;
            String guid = Guid.NewGuid().ToString();
            var Jobname = guid;
            if (Jobname.Length > JobMaxLength)
                Jobname = Jobname.Substring(0, JobMaxLength);
            string uJobID = Jobname.ToString();
            string uJobIDName = txtJobIDName.Text.ToString().Trim();
            const int ProgrammeIDMaxLength = 12;
            string ProgrammeID = Guid.NewGuid().ToString();
            if (ProgrammeID.Length > ProgrammeIDMaxLength)
                ProgrammeID = ProgrammeID.Substring(0, ProgrammeIDMaxLength);
            string uProgrammeID = ProgrammeID.ToString();
            string uProgrammeName = txtJobIDName.Text.ToString().Trim();
            string uJobDescription = txtJobDescription.Text.ToString().Trim();
            string uCalTodaysDate = DateTime.Now.ToString();
            string uTodaysdt = DateTime.Now.ToString();
            string ucalDueDate = calDueDate.SelectedDate.ToShortDateString();
            string uDueDateTime = txtDueDateTime.Text.ToString().Trim();
            string uMediaFormat = ddlMediaFormat.SelectedValue.ToString().Trim();
            string uTranscriberFormat = ddlTranscriberFormat.SelectedValue.ToString().Trim();
            string ulMediaFileFormat = ddllMediaFileFormat.SelectedValue.ToString().Trim();
            string uddlHours = ddlHours.SelectedValue.ToString().Trim();
            string uddlMinutes = ddlMinutes.SelectedValue.ToString().Trim();
            string uddlSeconds = DateTime.Now.Second.ToString();
            string udnnteSpecialInstructions = dnnteSpecialInstructions.Text.Trim();
            bool uJobIsActive = true;

            AddToDB(uIPAddr, uUserID, uFullName, uddlJobType, uddlFileSubmissionPreference, uJobID, uContactNumber, uJobIDName, uProgrammeID, uProgrammeName, uJobDescription, uCalTodaysDate, uTodaysdt, ucalDueDate, uDueDateTime, uMediaFormat, uTranscriberFormat, ulMediaFileFormat, uddlHours, uddlMinutes, uddlSeconds, udnnteSpecialInstructions, uJobIsActive);
            SendMail();
            lblAddNewJobMsg.Text = "Success, you've added a new task to the system for processing. You're being redirected...";
            var IsInRole = UserInfo.IsInRole("Administrators");
            if (IsInRole == true)
            {
                Response.AppendHeader("Refresh", "3;url=JobAdmin.aspx");
            }
            else
            {
                Response.AppendHeader("Refresh", "3;url=../Default.aspx");
            }
        }

        protected void AddToDB(string uIPAddr, string uUserID, string uFullName, string uddlJobType, string uddlFileSubmissionPreference, string uJobID, string uContactNumber, string uJobIDName, string uProgrammeID, string uProgrammeName, string uJobDescription, string uCalTodaysDate, string uTodaysdt, string ucalDueDate, string uDueDateTime, string uMediaFormat, string uTranscriberFormat, string ulMediaFileFormat, string uddlHours, string uddlMinutes, string uddlSeconds, string udnnteSpecialInstructions, bool uJobIsActive)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
            String query = "INSERT INTO dbo.CSJobs (IPAddress, JobType,FileSubmissionPreference, FullName , Userid  ,ProgrammeID, ProgrammeName,ProgrammeDescription, JobID , ContactNumber, JobIsActive) VALUES (@uIPAddr, @uddlJobType, @uddlFileSubmissionPreference, @uFullName, @uUserID, @uProgrammeID,  @uProgrammeName, @uJobDescription, @uJobID ,@uContactNumber, @uJobIsActive)";
            using (SqlConnection connection = new SqlConnection(connectionString))
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                //add job details card to CSJobs table
                command.Parameters.Add("@uIPAddr", SqlDbType.VarChar).Value = uIPAddr;
                command.Parameters.Add("@uddlJobType", SqlDbType.VarChar).Value = uddlJobType;
                command.Parameters.Add("@uddlFileSubmissionPreference", SqlDbType.VarChar).Value = uddlFileSubmissionPreference;
                command.Parameters.Add("@uFullName", SqlDbType.VarChar).Value = uFullName;
                command.Parameters.Add("@uUserID", SqlDbType.VarChar).Value = uUserID;
                command.Parameters.Add("@uProgrammeID", SqlDbType.VarChar).Value = uProgrammeID;
                command.Parameters.Add("@uProgrammeName", SqlDbType.VarChar).Value = uProgrammeName;
                command.Parameters.Add("@uJobDescription", SqlDbType.VarChar).Value = uJobDescription;
                command.Parameters.Add("@uJobID", SqlDbType.VarChar).Value = uJobID;
                command.Parameters.Add("@uContactNumber", SqlDbType.VarChar).Value = uContactNumber;
                command.Parameters.Add("@uJobIsActive", SqlDbType.Bit).Value = uJobIsActive;
                //add any supplied job details to CSJobsDetails table
                string query2 = "INSERT INTO dbo.CSJobsDetails (Userid,JobID,JobType,ProgrammeID,FileSubmissionPreference,MediaFormat,TranscriberFormat,MediaFileFormat,MediaFileHours,MediaFileMinutes,MediaFileSeconds,TodaysDate,TodaysDateTime,DueDate,DueDateTime,SpecialInstructions) values (@uUserID, @uJobID, @uddlJobType, @uProgrammeID, @uddlFileSubmissionPreference, @uMediaFormat, @uTranscriberFormat, @uMediaFileFormat, @uddlHours, @uddlMinutes, @uddlSeconds, @uCalTodaysDate, @uTodaysdt, @ucalDueDate, @uDueDateTime, @udnnteSpecialInstructions)";
                SqlCommand command2 = new SqlCommand(query2, connection);
                command2.Parameters.Add("@uUserID", SqlDbType.VarChar).Value = uUserID;
                command2.Parameters.Add("@uJobID", SqlDbType.VarChar).Value = uJobID;
                command2.Parameters.Add("@uddlJobType", SqlDbType.VarChar).Value = uddlJobType;
                command2.Parameters.Add("@uProgrammeID", SqlDbType.VarChar).Value = uProgrammeID;
                command2.Parameters.Add("@uddlFileSubmissionPreference", SqlDbType.VarChar).Value = uddlFileSubmissionPreference;
                command2.Parameters.Add("@uMediaFormat", SqlDbType.VarChar).Value = uMediaFormat.ToString().Trim();
                command2.Parameters.Add("@uTranscriberFormat", SqlDbType.VarChar).Value = uTranscriberFormat;
                command2.Parameters.Add("@uMediaFileFormat", SqlDbType.VarChar).Value = ulMediaFileFormat;
                command2.Parameters.Add("@uddlHours", SqlDbType.VarChar).Value = uddlHours.Trim();
                command2.Parameters.Add("@uddlMinutes", SqlDbType.VarChar).Value = uddlMinutes.Trim();
                command2.Parameters.Add("@uddlSeconds", SqlDbType.VarChar).Value = uddlSeconds.Trim();
                command2.Parameters.Add("@uCalTodaysDate", SqlDbType.VarChar).Value = uCalTodaysDate.ToString().Trim();
                command2.Parameters.Add("@uTodaysdt", SqlDbType.VarChar).Value = uTodaysdt.ToString().Trim();
                command2.Parameters.Add("@ucalDueDate", SqlDbType.VarChar).Value = ucalDueDate.ToString().Trim();
                command2.Parameters.Add("@uDueDateTime", SqlDbType.VarChar).Value = uDueDateTime.ToString().Trim();
                command2.Parameters.Add("@udnnteSpecialInstructions", SqlDbType.VarChar).Value = udnnteSpecialInstructions.ToString().Trim();
                connection.Open();
                command.ExecuteNonQuery();
                command2.ExecuteNonQuery();
                connection.Close();
            }
        }

        private void SendMail()
        {
            DotNetNuke.Services.Mail.Mail.SendMail("cityscriptsltd@gmail.com", "cityscriptsltd@gmail.com", string.Empty, string.Empty,
            DotNetNuke.Services.Mail.MailPriority.Normal,
            "Greetings from Transcripts247 - Job Alert",
            DotNetNuke.Services.Mail.MailFormat.Html,
            System.Text.Encoding.UTF8,
            "A new job has been added to the system"+ ".", "", "", "", "", "");
        }

    }
}

