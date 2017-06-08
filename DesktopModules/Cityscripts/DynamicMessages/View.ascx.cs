#region Copyright

// 
// Copyright (c) 2016
// by Cityscripts
// 

#endregion

#region Using Statements

using System;
using System.Web;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Services.Mail;
#endregion

namespace Cityscripts.DynamicMessages
{

	public partial class View : PortalModuleBase
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

            string GetMsgID = HttpContext.Current.Request.Url.Scheme + "://" + HttpContext.Current.Request.Url.Authority + HttpContext.Current.Request.RawUrl;
            string GetMsgIDSubStr = GetMsgID.Substring(GetMsgID.Length - 11);

            if (!Page.IsPostBack)
            {
                if (GetMsgIDSubStr == "x") { lblSuccessMessages.Text = "No Message ID has been received!";}

                if (GetMsgIDSubStr == "MessageID=1") {
                    DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, "Success!! <br>Confirm Job Allocation to User.", DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.GreenSuccess);
                  SendMail();
                }
                //below for job submission choi
                if (GetMsgIDSubStr == "MessageID=2")
                {
                    DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, "Thank You. You have selected to Drop Media at our Office - Please click the Contact Us page if you need directions to the office.", DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.GreenSuccess);
                }

                if (GetMsgIDSubStr == "MessageID=3")
                {
                    DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, "Thank You. You have selected to upload media online to our cloud folder. <br> Click <a href='https://www.transcripts247.com/Uploads/CloudUpload.aspx'><b>here</b></a> to access the cloud upload Utility:<br><a href='https://www.transcripts247.com/Uploads/CloudUpload.aspx'>https://www.transcripts247.com/Uploads/CloudUpload.aspx</a>", DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.GreenSuccess);
                    Response.Redirect("https://www.transcripts247.com/Uploads/CloudUpload.aspx");
                }

                if (GetMsgIDSubStr == "MessageID=4")
                {
                    DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, "Thank You. You have selected to upload the file using FTP.", DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.GreenSuccess);
                }


                if (GetMsgIDSubStr == "MessageID=5")
                {
                    DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, "Thank You. You have selected to upload the file using WeTransfer.", DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.GreenSuccess);
                    Response.Redirect("https://cityscripts.wetransfer.com");
                }


                if (GetMsgIDSubStr == "MessageID=6")
                {
                    DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, "Thank You. You have selected to upload the file using FTP.", DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.GreenSuccess);
                }

                if (GetMsgIDSubStr == "MessageID=7")
                {
                    DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, "Thank You, You have successfully submitted your file to be checked for final submission. You will now be redirected and asked to upload your completed file to your personal repository", DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.GreenSuccess);
                    Response.AppendHeader("Refresh", "5;url=Repository.aspx");
                }


            }
            else
            {
                if (GetMsgIDSubStr == "x") { lblSuccessMessages.Text = "No Message ID has been received!"; }
            }
		}
		
		protected void cmdSave_Click(object sender, EventArgs e)
		{
            //ModuleController.Instance.UpdateModuleSetting(ModuleId, "field", txtField.Text);
            
		}


private void SendMail()  //string strFrom, string strTo, string strCC, string strBCC, string strSubject, string strBody
        {
            string strBody = "You have assigned a user a Task";
            lblSuccessMessages.Text = strBody;
            DotNetNuke.Services.Mail.Mail.SendMail("Tollon Adkins < info@cityscripts.co.uk >", "winstonhaybittle@gmail.com", String.Empty, "Greetings from Cityscripts - You have sent a Task to Cityscripts", strBody, String.Empty, "html", String.Empty, String.Empty, String.Empty, String.Empty);
            DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, "Update Successful", DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.GreenSuccess);

        }
		#endregion

	}
}






