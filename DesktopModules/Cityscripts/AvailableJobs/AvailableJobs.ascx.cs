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
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using DotNetNuke.Services.Mail;
using System.Web.UI.WebControls;
#endregion

namespace Cityscripts.AvailableJobs
{

    public partial class AvailableJobs : PortalModuleBase
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

                //Generate TaskID
                const int TaskIDMaxLength = 12;
                string TaskID = Guid.NewGuid().ToString();
                if (TaskID.Length > TaskIDMaxLength)
                    TaskID = TaskID.Substring(0, TaskIDMaxLength);
                string myTaskID = TaskID.ToString();
                txtTaskID.Text = myTaskID;
                //Get ProgrammeID for Jb allocation
                //SqlDataSource1ViewCustJobDetails
            }
            else
            {
                //if (FormViewEditIncomingJob.ChangeMode = FormViewEditIncomingJob.EditItemTemplate)
                //    {

                //    }
            }
        }

        void FormViewEditIncomingJob_OnLoad(Object sender, SqlDataSourceStatusEventArgs e)
        {
            FormViewEditIncomingJob.ChangeMode(FormViewMode.Edit);


        }




        //private void AssignJobDetails()
        //{
        //    Response.Redirect("www.google.co.za");
        //}




        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //lblTypistSelect.Text = "You've selected " + DropDownList1.SelectedItem.ToString().Trim() + " and " + DropDownList1.SelectedValue.ToString().Trim();
            txtTypistEmailAddress.Text = DropDownList1.SelectedValue.ToString();
        }

        protected void btnAllocateWork_Click(object sender, EventArgs e)
        {
           
            UpdateTaskAllocation(txtTaskID.Text,txtTypistEmailAddress.Text, txtProgrammeID.Text);
            SendMail();
            //DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, "Update Successful " + this.UserInfo.Username + " You've assigned a new task to " + txtTypistEmailAddress.Text.ToString() + " for processing", DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.GreenSuccess);
            //GridView1.DataBind();
            //Stay on Page and clear form after job allocation
            //DropDownList1.Text = "Select Typist";
            lblAssignmentMessage.Text = "You have allocated a job to  " + txtTypistEmailAddress.Text;
           
            txtTaskID.Text = "";
            txtProgrammeID.Text = "";
            txtTypistEmailAddress.Text = "";
            txtDurationTotal.Text = "";
            txtStartPositionSS.Text = "";
            txtEndPositionSS.Text = "";
            txtOriginalFilenames.Text = "";
            txtClientNotes.Text = "";
            Response.AppendHeader("Refresh", "1;url=JobAdmin.aspx");
        }
        private void SendMail()
        {
            DotNetNuke.Services.Mail.Mail.SendMail("cityscriptsltd@gmail.com", txtTypistEmailAddress.Text.ToString(), string.Empty, string.Empty,
            DotNetNuke.Services.Mail.MailPriority.Normal,
            "Greetings from Transcripts247",
            DotNetNuke.Services.Mail.MailFormat.Html,
            System.Text.Encoding.UTF8,
"Transcripts247 has allocated you a work task " + this.UserInfo.Username + "<br> TaskID =" + txtTaskID.Text.ToString() + "<br> Total Length = " + txtDurationTotal.Text.ToString() + "<br> Starting Timecode = " + txtStartPositionSS.Text.ToString() + "<br> Ending Timecode = " + txtEndPositionSS.Text.ToString() + "<br> Download URL = " + txtOriginalFilenames.Text.ToString() + "<br> Client Notes = " + txtClientNotes.Text.ToString() + "<br> <i>Thanking you kindly Transcripts247 </i>" + ".", "", "", "", "", "");
           
        }

        protected void CheckBoxEditTypistMediaInfo_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBoxEditTypistMediaInfo.Checked == true)
            {
                PanelEditIncomingJob.Visible = true;
                FormViewEditIncomingJob.Visible = true;
                //FormViewEditIncomingJob.DataBind();
            }
            else
            {
                PanelEditIncomingJob.Visible = false;
                FormViewEditIncomingJob.Visible = false;
            }
        }

        protected void CheckBoxAssignJobToUser_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBoxAssignJobToUser.Checked == true)
            {
                PanelAssignJobToUser.Visible = true;
                CheckBoxAssignJobToUser.Checked = true;
                //GridView1.DataBind();
            }
            else
            {
                PanelAssignJobToUser.Visible = false;
                CheckBoxAssignJobToUser.Checked = false;
            }
        }



        //protected void FormViewEditIncomingJobUpdateDetails()
        //{
        //    if (FormViewEditIncomingJob.CurrentMode == FormViewMode.ReadOnly)
        //    {
        //        // here you can safely access the FormView's ItemTemplate and it's controls via FindControl
        //    }
        //    else if (FormViewEditIncomingJob.CurrentMode == FormViewMode.Edit)
        //    {
        //        // here  you can safely access the FormView's EditItemTemplate and it's controls via FindControl
        //        TextBox tbTaskIDTextBox = FormViewEditIncomingJob.Row.FindControl("TaskIDTextBox") as TextBox;
        //        //tbTaskIDTextBox.Text = "Hello World";        
        //    }
        //    else if (FormViewEditIncomingJob.CurrentMode == FormViewMode.Insert)
        //    {
        //        // here you can safely access the FormView's InsertItemTemplate and it's controls via FindControl
        //    }
        //}


        //protected void UpdateButton_Click(object sender, EventArgs e)
        //{
        //    //Response.Redirect("http://www.google.co.za/");
        //}

        //protected void SqlDataSourceEditIncomingJob_Load(object sender, EventArgs e)
        //{
        //    FormView FormViewEditIncomingJob;
        //    TextBox tbTaskIDTextBox //= FormViewEditIncomingJob.FindControl("TaskIDTextBox");
        //    tbTaskIDTextBox.Text = FormViewEditIncomingJob.FindControl("TaskIDTextBox",0);
        //}

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cell0 = GridView1.SelectedRow.Cells[0].Text;
            string cell1 = GridView1.SelectedRow.Cells[1].Text;
            string cell2 = GridView1.SelectedRow.Cells[2].Text;
            string cell3 = GridView1.SelectedRow.Cells[3].Text;
            string cell4 = GridView1.SelectedRow.Cells[4].Text;
            string cell5 = GridView1.SelectedRow.Cells[5].Text;
            string cell6 = GridView1.SelectedRow.Cells[6].Text;
            string cell7 = GridView1.SelectedRow.Cells[7].Text;
            string cell8 = GridView1.SelectedRow.Cells[8].Text;
            string cell9 = GridView1.SelectedRow.Cells[9].Text;
            string cell10 = GridView1.SelectedRow.Cells[10].Text;
            string cell11 = GridView1.SelectedRow.Cells[11].Text;
            string cell12 = GridView1.SelectedRow.Cells[12].Text;
            string cell13 = GridView1.SelectedRow.Cells[13].Text;
            string cell14 = GridView1.SelectedRow.Cells[14].Text;
            //string cell15 = GridView1.SelectedRow.Cells[15].Text;

            string pProgrammeID = GridView1.SelectedRow.Cells[2].Text;
            string pDurationTotal = GridView1.SelectedRow.Cells[9].Text;
            string pStartPosition = GridView1.SelectedRow.Cells[10].Text;
            string pEndPosition = GridView1.SelectedRow.Cells[11].Text;
            string pOptionalDownloadURLs = GridView1.SelectedRow.Cells[12].Text;
            string pOriginalFilenames = GridView1.SelectedRow.Cells[13].Text;
            string pClientNotes = GridView1.SelectedRow.Cells[14].Text + "<br> Name:" + GridView1.SelectedRow.Cells[3].Text + "<br> Description:" + GridView1.SelectedRow.Cells[4].Text + "<br> Media Format:" + GridView1.SelectedRow.Cells[6].Text + "<br> Transcriber Format:" + GridView1.SelectedRow.Cells[7].Text;

            txtProgrammeID.Text = pProgrammeID.ToString();
            txtStartPositionSS.Text = pStartPosition;
            txtEndPositionSS.Text = pEndPosition;
            txtOptionalDownloadURLs.Text = pOptionalDownloadURLs;
            txtOriginalFilenames.Text = pOriginalFilenames;
            txtClientNotes.Text = pClientNotes;
            txtDurationTotal.Text = pDurationTotal;

            DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, "You've selected " + ":<br>" + "cell0=" + cell0 + "cell1=" + cell1 + "cell2=" + cell2 + "cell3=" + cell3 + "cell4=" + cell4 + "cell5=" + cell5 + "cell6=" + cell6 + "cell7=" + cell7 + "cell8=" + cell8 + "cell9=" + cell9 + "cell0=" + cell10 + "cell11=" + cell11 + "cell12=" + cell12 + "cell13=" + cell13 + "cell14=" + cell14 , DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.BlueInfo);
            GridView1.Visible = false;
        }

        private void UpdateTaskAllocation(string txtTaskID, string txtTypistEmailAddress, string txtProgrammeID)
        {
            

            //    //string ADropDownListPriorityTextBox = DropDownListPriorityTextBox.SelectedItem.Text;
            string dbUpdateSql = "UPDATE CSJobsDetails SET TaskID = @TaskID, TypistUserid = @TypistUserid, [Status] = @Status WHERE ProgrammeID = @ProgrammeID";
            String strConnString = ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = dbUpdateSql;
            cmd.Parameters.Add("@TaskID", SqlDbType.VarChar).Value = txtTaskID.ToString();
            cmd.Parameters.Add("@TypistUserid", SqlDbType.VarChar).Value = txtTypistEmailAddress.ToString();
            cmd.Parameters.Add("@ProgrammeID", SqlDbType.VarChar).Value = txtProgrammeID.ToString();
            cmd.Parameters.Add("@Status", SqlDbType.VarChar).Value = "Assigned";
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



        protected void CheckBoxCreateNewJob_CheckedChanged(object sender, EventArgs e)
        {
            Response.Redirect("https://www.transcripts247.com/Work/CreateJob.aspx");
        }

        protected void FormViewEditIncomingJob_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            //guarantee grid update and refresh after update and assign task checked
            Response.Redirect("JobAdmin.aspx");
        }
    }
}



#endregion