#region Copyright

// 
// Copyright (c) 2016
// by Winston
// 

#endregion

#region Using Statements

using System;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Services.Mail;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

#endregion

namespace Winston.WorkAllocation
{

    public partial class WorkAllocation : PortalModuleBase
    {

        #region Event Handlers

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            //cmdCancel.Click += cmdCancel_Click;
        }
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!Page.IsPostBack)
            {
                var IsInRole = UserInfo.IsInRole("Cityscripts Transcriptions");
                if (IsInRole == true)
                {
                    lblJobAllocationMessage.Text = "Greetings " + this.UserInfo.Username.ToString() + ", you're able to book out work online using this form. If you would like to book yourself a task online please click 'Book Task'. <br> Below the info form there's a 'Download Work Media File' link which will begin the media download. <br> To confirm booking press the 'Confirm Task Booking' button and work will be allocated to you automatically. ";
                }
                else
                {
                    lblJobAllocationMessage.Text = "Welcome " + this.UserInfo.Username.ToString() + ", you need to be logged in and Authorized to use the book task interface.";
                    //disable for non transcripts users below
                    GridViewViewWorkTasks.Visible = false;
                }
            }
            else
            {

            }
        }

        protected void GridViewViewWorkTasks_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            string my0 = GridViewViewWorkTasks.SelectedRow.Cells[0].Text;
            string my1 = GridViewViewWorkTasks.SelectedRow.Cells[1].Text;
            string my2 = GridViewViewWorkTasks.SelectedRow.Cells[2].Text;
            string my3 = GridViewViewWorkTasks.SelectedRow.Cells[3].Text;
            string my4 = GridViewViewWorkTasks.SelectedRow.Cells[4].Text;
            string my5 = GridViewViewWorkTasks.SelectedRow.Cells[5].Text;
            string my6 = GridViewViewWorkTasks.SelectedRow.Cells[6].Text;
            string my7 = GridViewViewWorkTasks.SelectedRow.Cells[7].Text;
            string my8 = GridViewViewWorkTasks.SelectedRow.Cells[8].Text;
            string my9 = GridViewViewWorkTasks.SelectedRow.Cells[9].Text;
            string my10 = GridViewViewWorkTasks.SelectedRow.Cells[10].Text;
            string my11 = GridViewViewWorkTasks.SelectedRow.Cells[11].Text;

            TextBoxGridSelectDetails.Visible = true;
            ButtonTypistBookJob.Visible = true;
            HyperLink1.Visible = true;
            HyperLink1.NavigateUrl = my7;
            /*LabelGridSelectDetails.Text = "Job Name=" + my0 + "Job Description=" + my1 + "ProgID=" + my2 + "Job Type=" + my3 + "Transcriber Format=" + my4 + "Due Date=" + my5 + "Due Time=" + my6 + "Download URL=" + my7 + "File names=" + my8 + "Total Duration=" + my9 + "Start Position=" + my10 + "End Position=" + my11 */
            string TextBoxGridOut = "Name = " + my0 + Environment.NewLine + "Job Description = " + my1 + Environment.NewLine + "Job Type = " + my3 + Environment.NewLine + "Transcriber Format = " + my4 + Environment.NewLine + "Due Date = " + my5 + Environment.NewLine + "Due Time = " + my6 + Environment.NewLine + "File names =" + my8 + Environment.NewLine + "Total Duration = " + my9 + Environment.NewLine + "Start Position=" + my10 + Environment.NewLine + "End Position=" + my11;
            Server.HtmlEncode(TextBoxGridOut);
            TextBoxGridSelectDetails.Text = TextBoxGridOut;
        }

        private void SendMail(string ProgTaskID)
        {
            string my8 = GridViewViewWorkTasks.SelectedRow.Cells[8].Text;
            string my9 = GridViewViewWorkTasks.SelectedRow.Cells[9].Text;

            DotNetNuke.Services.Mail.Mail.SendMail("cityscriptsltd@gmail.com", this.UserInfo.Email.ToString(), string.Empty, string.Empty,
            DotNetNuke.Services.Mail.MailPriority.Normal,
            "Greetings from Transcripts247 - User Job Allocation",
            DotNetNuke.Services.Mail.MailFormat.Html,
            System.Text.Encoding.UTF8,
"You've  booked out a task for processing " + this.UserInfo.FirstName + " " + this.UserInfo.LastName + ". The URL for this task is: " + my8 + "File name is : " + my9 + "Program TaskID:  " + ProgTaskID + "<p><i> Transcripts 24/7 </i></p>" + ".", "", "", "", "", "");

        }

        private void UpdateTypistTaskAllocation(string my0, string my1, string my2, string ProgTaskID)
        {

            string dbUpdateSql = "UPDATE CSJobsDetails SET TaskID = @TaskID, TypistUserid = @TypistUserid, [Status] = @Status WHERE ProgrammeID = @ProgrammeID";
            String strConnString = ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = dbUpdateSql;
            cmd.Parameters.Add("@TaskID", SqlDbType.VarChar).Value = ProgTaskID;
            cmd.Parameters.Add("@TypistUserid", SqlDbType.VarChar).Value = this.UserInfo.Email.ToString();
            cmd.Parameters.Add("@ProgrammeID", SqlDbType.VarChar).Value = my2.ToString();
            cmd.Parameters.Add("@Status", SqlDbType.VarChar).Value = "User Assigned";
            cmd.Connection = con;
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
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
        protected void ButtonTypistBookJob_Click(object sender, EventArgs e)
        {
            string my0 = GridViewViewWorkTasks.SelectedRow.Cells[0].Text;
            string my1 = GridViewViewWorkTasks.SelectedRow.Cells[1].Text;
            string my2 = GridViewViewWorkTasks.SelectedRow.Cells[2].Text;
            string my3 = GridViewViewWorkTasks.SelectedRow.Cells[3].Text;
            string my4 = GridViewViewWorkTasks.SelectedRow.Cells[4].Text;
            string my5 = GridViewViewWorkTasks.SelectedRow.Cells[5].Text;
            string my6 = GridViewViewWorkTasks.SelectedRow.Cells[6].Text;
            string my7 = GridViewViewWorkTasks.SelectedRow.Cells[7].Text;
            string my8 = GridViewViewWorkTasks.SelectedRow.Cells[8].Text;
            string my9 = GridViewViewWorkTasks.SelectedRow.Cells[9].Text;
            string my10 = GridViewViewWorkTasks.SelectedRow.Cells[10].Text;
            string my11 = GridViewViewWorkTasks.SelectedRow.Cells[11].Text;
            //Generate TaskID
            const int ProgIDMaxLength = 12;
            string ProgTaskID = Guid.NewGuid().ToString();
            if (ProgTaskID.Length > ProgIDMaxLength)
                ProgTaskID = ProgTaskID.Substring(0, ProgIDMaxLength);
            ProgTaskID.ToString();

            UpdateTypistTaskAllocation(my0, my1, my2, ProgTaskID);
            SendMail(ProgTaskID);
            GridViewViewWorkTasks.Visible = false;
            LabelGridSelectDetails.Text = "<b> <center> You've successfully booked a job for yourself " + this.UserInfo.Username + "</b>" + Environment.NewLine + "You are now being redirected...</center>";

            if (DotNetNuke.Security.PortalSecurity.IsInRoles("Administrators"))
            {
                Response.AppendHeader("Refresh", "3;url=Work/JobAdmin.aspx");
            }
            else
            {
                Response.AppendHeader("Refresh", "5;url=../Default.aspx");
            }
        }
    }
}

#endregion
