#region Copyright

// 
// Copyright (c) 2016
// by Cityscripts
// 

#endregion

#region Using Statements

using System;
using DotNetNuke.Entities.Modules;

#endregion

namespace Cityscripts.ViewActiveJobs
{

	public partial class ViewActiveJobs : PortalModuleBase
	{

		#region Event Handlers

		protected override void OnInit(EventArgs e)
		{
			base.OnInit(e);

			//cmdSave.Click += cmdSave_Click;
			//cmdCancel.Click += cmdCancel_Click;
           
		}

		protected override void OnLoad(EventArgs e)
		{
			base.OnLoad(e);

            if (!Page.IsPostBack)
            {
                // txtField.Text = (string)Settings["field"];
                lblMessage.Text = "Welcome";


            }
            else
            {
                lblMessage.Text = "Form Submitted";
                string UploadJobID = "";
//                  UploadJobID= Request.QueryString("JobID");
                Response.Write(UploadJobID);

            }
		}
		
		protected void cmdSave_Click(object sender, EventArgs e)
		{
            //ModuleController.Instance.UpdateModuleSetting(ModuleId, "field", txtField.Text);
            DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, "Update Successful", DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.GreenSuccess);
		}


		protected void cmdCancel_Click(object sender, EventArgs e)
		{
		}

        protected void btnViewActiveJobs_Click(object sender, EventArgs e)
        {
            //lblMessage.Text = "Hello World";
            //string myRolesStatus = DotNetNuke.Security.Roles.RoleStatus.Approved.ToString();
           // lblRoleStatus.Text = myRolesStatus;
        }
        #endregion


        protected void btnAddJob_Click(object sender, EventArgs e)
        {
            //Response.Redirect("http://www.transcripts247.com/Work/CreateJob.aspx");
        }
    }
}

