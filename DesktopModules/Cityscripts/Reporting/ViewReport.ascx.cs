#region Copyright

// 
// Copyright (c) 2016
// by Cityscripts
// 

#endregion

#region Using Statements

using System;
using DotNetNuke.Entities.Modules;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

#endregion

namespace Cityscripts.Reporting
{

    public partial class ViewReport : PortalModuleBase
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
                DropDownListReportingMenu.Text = "Greetings" + this.UserInfo.Username;
                //Page Loads Paths Here
                string FTPTextAppPath = @"C:\Dev\DNNDev\Portals\0\datafiles";
                lblFTPTextAppPath.Text = FTPTextAppPath.ToString();

                string theHostMapPath = DotNetNuke.Common.Globals.HostMapPath;
                lbltheHostMapPath.Text = theHostMapPath.ToString();

                string thePhysicalPath = Request.PhysicalPath;
                lblthePhysicalPath.Text = thePhysicalPath;

                string theAppPath = Request.PhysicalApplicationPath;
                lbltheAppPath.Text = theAppPath.ToString();

                string theInstallMapPath = DotNetNuke.Common.Globals.InstallMapPath;
                lbltheInstallMapPath.Text = DotNetNuke.Common.Globals.InstallMapPath;

                string thePathQuery = Request.Url.PathAndQuery.ToString();
                lblthePathQuery.Text = thePathQuery;
                //RushesStation
                //DirectoryInfo di = new DirectoryInfo(@"C:\\Dev\\DNNDev\\Portals\\0\\datafiles");
                ////DirectoryInfo di = new DirectoryInfo(@"C:\\Inetpub\\vhosts\\transcripts247.com\\httpdocs\\Portals\\0\\datafiles");
                //FileInfo[] smFiles = di.GetFiles("*.txt");
                //foreach (FileInfo fi in smFiles)
                //{
                //    ListBoxRushesStationTextUpdates.Items.Add(Path.GetFileNameWithoutExtension(fi.Name));
                //}

            }
        }

        protected void DropDownListReportingMenu_TextChanged(object sender, EventArgs e)
        {
            //FormViewViewJobCard.Visible = false;
            //GridViewViewCurrentJobs.Visible = false;
            ////ListBoxListofTranscriptionists.Visible = false;

            //if (DropDownListReportingMenu.SelectedValue == "View Job Card")
            //{
            //    lblReportingInfo.Text = this.UserInfo.DisplayName.ToString() + "'s selected to View the Job Card:";
            //    FormViewViewJobCard.Visible = true;
            //    FormViewViewJobCard.DataBind();
            //    //UpdateJobDetailsAssignment();

            //}
            //else if (DropDownListReportingMenu.SelectedValue == "View Current Jobs")
            //{
            //    lblReportingInfo.Text = this.UserInfo.DisplayName.ToString() + "'s selected to View Job Allocation Status:"; 
            //    GridViewViewCurrentJobs.Visible = true;
            //    GridViewViewCurrentJobs.DataBind();
            //}
            //else if (DropDownListReportingMenu.SelectedValue == "View List of Transcriptionists")
            //{
            //    lblReportingInfo.Text = this.UserInfo.DisplayName.ToString() + "'s selected to  List of Transcriptionists:";
            //    //ListBoxListofTranscriptionists.Visible = true;
            //    //ListBoxListofTranscriptionists.DataBind();
            //    //GridViewViewCurrentJobs.Visible = true;
            //    //GridViewViewCurrentJobs.DataBind();
            //}

        }

        private void UpdateJobDetailsAssignment()
        {
            //////int TheUserId = this.UserId;
            //////string dbSql = "SELECT      CSJobs.JobStartDate, CSJobs.Userid, CSJobs.FullName, CSJobs.FileSubmissionPreference, CSJobs.JobType, CSJobs.JobID, CSJobs.ProgrammeID, CSJobs.ProgrammeName, CSJobs.ContactNumber, CSJobs.JobIsActive, CSJobsDetails.JobDetailsID, CSJobsDetails.Userid AS Expr1, CSJobsDetails.JobID AS Expr2,CSJobsDetails.JobType AS Expr3, CSJobsDetails.ProgrammeID AS Expr4, CSJobsDetails.FileSubmissionPreference AS Expr5, CSJobsDetails.MediaFormat, CSJobsDetails.TranscriberFormat,                       CSJobsDetails.MediaFileFormat, CSJobsDetails.MediaFileHours, CSJobsDetails.MediaFileMinutes, CSJobsDetails.MediaFileSeconds, CSJobsDetails.TodaysDate, CSJobsDetails.TodaysDateTime,                       CSJobsDetails.DueDate, CSJobsDetails.DueDateTime, CSJobsDetails.SpecialInstructions, CSJobsDetails.TaskID, CSJobsDetails.DurationHours, CSJobsDetails.DurationMinutes,                       CSJobsDetails.DurationSeconds, CSJobsDetails.DurationTotal, CSJobsDetails.TypingProgress, CSJobsDetails.TimecodeStatus, CSJobsDetails.WordCount, CSJobsDetails.RateCostPerWord,                       CSJobsDetails.FixedCostPerMinute, CSJobsDetails.ChargingMethod, CSJobsDetails.ActualCost, CSJobsDetails.TypistUserid, CSJobsDetails.StartPositionSS, CSJobsDetails.StartPosition,                       CSJobsDetails.EndPositionSS, CSJobsDetails.EndPosition, CSJobsDetails.FileUploadURL, CSJobsDetails.OriginalFilenames, CSJobsDetails.OptionalDownloadURLs, CSJobsDetails.FTPUsername,                       CSJobsDetails.FTPPassword, CSJobsDetails.ClientNotes, CSJobsDetails.URLUploadedFileReference, CSJobsDetails.ProxyHQFileReference, CSJobsDetails.ProxyLQFileReference,                       CSJobsDetails.ProxyAudioOnlyFileReference, CSJobsDetails.ShortTitle, CSJobsDetails.LongTitle, CSJobsDetails.Status, CSJobsDetails.TypingDeadline, CSJobsDetails.TypingETA,                       CSJobsDetails.RawTranscriptFileReference, CSJobsDetails.ProofedTranscriptFileReference, CSJobsDetails.TimecodeFileReference, CSJobsDetails.ArrivalDate, CSJobsDetails.ReadyToTypeDate,                       CSJobsDetails.StartDate, CSJobsDetails.Deadline, CSJobsDetails.TypedDate, CSJobsDetails.ProofedDate, CSJobsDetails.DeliveryDate, CSJobsDetails.Thumbnail,CSJobsDetails.TranscriptKeywords, CSJobsDetails.Priority FROM CSJobs INNER JOIN CSJobsDetails ON CSJobs.JobID = CSJobsDetails.JobID";
            //////lblReportingInfo.Text = dbSql;
            //DatabindmGridView Working Below
            //String strConnString = ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
            //SqlConnection con = new SqlConnection(strConnString);
            //SqlCommand cmd = new SqlCommand();
            //cmd.CommandType = CommandType.StoredProcedure;
            //cmd.CommandText = "CSViewJobCard";
            //cmd.Connection = con;
            //try
            //{
            //    con.Open();
            //    GridView1.EmptyDataText = "No Records Found";
            //    GridView1.DataSource = cmd.ExecuteReader();
            //    GridView1.DataBind();
            //}
            //catch (Exception ex)
            //{
            //    throw ex;
            //}
            //finally
            //{
            //    con.Close();
            //    con.Dispose();
            //}


        }





        protected void DropDownListReportingMenu_SelectedIndexChanged(object sender, EventArgs e)
        {
            FormViewViewJobCard.Visible = false;
            GridViewViewCurrentJobs.Visible = false;
            DropDownListListofTranscriptionists.Visible = false;
            PanelShowPaths.Visible = false;
            GridViewSubmittedDocuments.Visible = false;
            ListBoxRushesStationTextUpdates.Visible = false;

            if (DropDownListReportingMenu.SelectedValue == "View Job Card")
            {
                lblReportingInfo.Text = this.UserInfo.DisplayName.ToString() + "'s selected to View the Job Card:";
                FormViewViewJobCard.Visible = true;
                FormViewViewJobCard.DataBind();
                //UpdateJobDetailsAssignment();

            }
            else if (DropDownListReportingMenu.SelectedValue == "View Current Jobs")
            {
                lblReportingInfo.Text = this.UserInfo.DisplayName.ToString() + "'s selected to View current Job Allocation Status:";
                GridViewViewCurrentJobs.Visible = true;
                GridViewViewCurrentJobs.DataBind();
            }
            else if (DropDownListReportingMenu.SelectedValue == "View List of Transcriptionists")
            {
                lblReportingInfo.Text = this.UserInfo.DisplayName.ToString() + "'s selected to view a List of Transcriptionists:";
                DropDownListListofTranscriptionists.Visible = true;
                //ListBoxListofTranscriptionists.Visible = true;
                //ListBoxListofTranscriptionists.DataBind();
                //GridViewViewCurrentJobs.Visible = true;
                //GridViewViewCurrentJobs.DataBind();
            }
            else if (DropDownListReportingMenu.SelectedValue == "View Application and Physical Paths")
            {
                lblReportingInfo.Text = this.UserInfo.DisplayName.ToString() + "'s selected to View Application and Physical Paths:";
                PanelShowPaths.Visible = true;
            }
            else if (DropDownListReportingMenu.SelectedValue == "View Submitted Documents")
            {
                lblReportingInfo.Text = this.UserInfo.DisplayName.ToString() + "'s selected to View Submitted Documents:";
                GridViewSubmittedDocuments.Visible = true;
            }
            else if (DropDownListReportingMenu.SelectedValue == "View RushesStation Text File Updates")
            {

                ListBoxRushesStationTextUpdates.Visible = true;
                //install module with changes hack for DirectoryInfo Object on page load compile :-)
                //DirectoryInfo di = new DirectoryInfo(@"C:\\Dev\\DNNDev\\Portals\\0\\datafiles");
                DirectoryInfo di = new DirectoryInfo(@"C:\\Inetpub\\vhosts\\transcripts247.com\\httpdocs\\Portals\\0\\datafiles");
                if (di.Exists)
                {
                    FileInfo[] smFiles = di.GetFiles("*.txt");
                    foreach (FileInfo fi in smFiles)
                    {
                        ListBoxRushesStationTextUpdates.Items.Add(Path.GetFileNameWithoutExtension(fi.Name));
                    }
                }
                else
                {
                    DirectoryInfo di1 = new DirectoryInfo(@"C:\\Dev\\DNNDev\\Portals\\0\\datafiles");
                    FileInfo[] smFiles = di1.GetFiles("*.txt");
                    foreach (FileInfo fi in smFiles)
                    {
                        ListBoxRushesStationTextUpdates.Items.Add(Path.GetFileNameWithoutExtension(fi.Name));
                    }
                }
            }

        }
    }
}
#endregion
