#region Copyright

// 
// Copyright (c) 2016
// by Cityscripts
// 

#endregion

#region Using Statements

using System;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Common.Utilities;
using System.Web;
using System.Web.Http;
//using DotNetNuke.UI.Utilities;
using DotNetNuke.Common;
using System.Collections.Generic;
using DotNetNuke.Services.Mail;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

#endregion

namespace Cityscripts.AddNewJobConfirm
{

    public partial class ViewAddNewJobConfirm : PortalModuleBase
    {

        #region Event Handlers

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

        }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);


            string AddJobUrl = HttpContext.Current.Request.Url.Scheme + "://" + HttpContext.Current.Request.Url.Authority + HttpContext.Current.Request.RawUrl;
            string JobIDSubString = AddJobUrl.Substring(AddJobUrl.Length - 12);

            string strFileSubmissionPreference = Request.PhysicalApplicationPath;
            if (!Page.IsPostBack)
            {
                DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, "Success, You've created a new job on our system!<br> Please click the finish button to complete Adding a Job to our system.<br> <i>Your Reference</i> is JobID= " + JobIDSubString, DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.GreenSuccess);
                //DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, "Success, You've created a new job on our system!<br> Please click the finish button to complete Adding a Job to our system.<br> <i>Your Reference</i> is JobID= " + JobIDSubString, DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.BlueInfo);
                PanelOfficeDelivery.Visible = false;
                PanelCloudUpload.Visible = false;
                PanelFTP.Visible = false;
                PanelWeTransfer.Visible = false;
                PanelUnsure.Visible = false;

                string aRawUrl = HttpContext.Current.Request.RawUrl;
                if (aRawUrl.Contains("FSP=WeTransfer"))
                {
                    lblSubmitJobConfirmMsg.Text =  "You have selected the We Transfer Method, please click the Finish button below to complete adding your Job to our system.";
                    PanelWeTransfer.Visible = true;
                    PanelUnsure.Visible = false;
                }
                if (aRawUrl.Contains("FSP=Drop"))
                {
                    lblSubmitJobConfirmMsg.Text = "You have selected to drop media at our offices, please click the Finish button below to complete adding your Job to our system.";
                    PanelOfficeDelivery.Visible = true;
                    PanelUnsure.Visible = false;
                }
                if (aRawUrl.Contains("FSP=Cloud"))
                {
                    lblSubmitJobConfirmMsg.Text = "You have selected the Cloud Upload Method, please click the  Finish button below to complete adding your Job to our system.";
                    PanelCloudUpload.Visible = true;
                    PanelUnsure.Visible = false;
                }
                if (aRawUrl.Contains("FSP=FTP"))
                {
                    lblSubmitJobConfirmMsg.Text = "You have selected the File Transfer Protocol or FTP Method, please read instructions below and click the Finish button below to complete adding your Job to our system.";
                    PanelFTP.Visible = true;
                    PanelUnsure.Visible = false;
                }
                if (aRawUrl.Contains("FSP=unknown"))
                {
                    lblSubmitJobConfirmMsg.Text = "You have not selected a Media Transfer Method, please click the Finish button below to complete adding your Job to our system at a later stage.";
                    PanelUnsure.Visible = true;

                }
                if (aRawUrl.Contains("FSP=Unsure"))
                {
                    lblSubmitJobConfirmMsg.Text = "You're unsure of a Media Transfer Method, please click the image below to complete adding your Job to our system at a later stage.";
                    PanelUnsure.Visible = true;
                }
            }
            else
            {  }
        }
        protected void SendMailAdmin(string strBody)  //string strFrom, string strTo, string strCC, string strBCC, string strSubject, string strBody
        {
            DotNetNuke.Services.Mail.Mail.SendMail("NoReply@Transcripts247.com", "webmaster@cityscripts.co.uk", String.Empty, "Greetings from Cityscripts - A New Job Added", strBody, String.Empty, "html", String.Empty, String.Empty, String.Empty, String.Empty);
            //DotNetNuke.Services.Mail.Mail.SendEmail("NoReply@transcripts247.com", "info@cityscripts.co.uk", "Greetings from Trascripts247 Job Creation Confirmation", "Client has JobID: <br>");
            //DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, "Update Successful", DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.GreenSuccess);
            /*** Get the host settings information***/
            //System.Collections.Generic.Dictionary < string, string= "" > hostSettings = DotNetNuke.Entities.Controllers.HostController.Instance.GetSettingsDictionary();
            ///*** Set the SMTP server details ***/
            //string strSMTP = hostSettings["SMTPServer"];
            ///*** This is the actual built in function from DNN Framework. ***/
            //DotNetNuke.Services.Mail.Mail.SendMail(strFrom, strTo, strCC, strBCC, DotNetNuke.Services.Mail.MailPriority.Normal, strSubject, DotNetNuke.Services.Mail.MailFormat.Html, System.Text.Encoding.UTF8, strBody, "",
            //strSMTP, hostSettings["SMTPAuthentication"], hostSettings["SMTPUsername"], hostSettings["SMTPPassword"]);
        }
        protected void SendMail(string strBody)  //string strFrom, string strTo, string strCC, string strBCC, string strSubject, string strBody
        {
            DotNetNuke.Services.Mail.Mail.SendMail("NoReply@Transcripts247.com", "transcripts247@gmail.com", String.Empty, "Greetings from Cityscripts - A New Job Added", strBody, String.Empty, "html", String.Empty, String.Empty, String.Empty, String.Empty);
            //DotNetNuke.Services.Mail.Mail.SendEmail("info@cityscripts.co.uk", "winstonhaybittle@gmail.com", "Greetings from Trascripts247 Job Creation Confirmation", "Client has JobID: <br>");
            //DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, "Update Successful", DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.GreenSuccess);
            /*** Get the host settings information***/
            //System.Collections.Generic.Dictionary < string, string= "" > hostSettings = DotNetNuke.Entities.Controllers.HostController.Instance.GetSettingsDictionary();
            ///*** Set the SMTP server details ***/
            //string strSMTP = hostSettings["SMTPServer"];
            ///*** This is the actual built in function from DNN Framework. ***/
            //DotNetNuke.Services.Mail.Mail.SendMail(strFrom, strTo, strCC, strBCC, DotNetNuke.Services.Mail.MailPriority.Normal, strSubject, DotNetNuke.Services.Mail.MailFormat.Html, System.Text.Encoding.UTF8, strBody, "",
            //strSMTP, hostSettings["SMTPAuthentication"], hostSettings["SMTPUsername"], hostSettings["SMTPPassword"]);
        }



        protected void btnOfficeDelivery_Click(object sender, EventArgs e)
        {

            string AddJobUrl = HttpContext.Current.Request.Url.Scheme + "://" + HttpContext.Current.Request.Url.Authority + HttpContext.Current.Request.RawUrl;
            string JobIDSubString = AddJobUrl.Substring(AddJobUrl.Length - 12);
            string strBody = "A New Job has been added to the system with JobID= " + JobIDSubString.ToString() + "<br> The File delivery chosen is office delivery.";
            //HttpUtility.UrlEncode(strBody);
            SendMail(strBody);
            SendMailAdmin(strBody);
            Response.Redirect("https://www.transcripts247.com/Go/SuccessMessage.aspx?MessageID=2");
        }

        protected void btnCloudUpload_Click(object sender, EventArgs e)
        {

            string AddJobUrl = HttpContext.Current.Request.Url.Scheme + "://" + HttpContext.Current.Request.Url.Authority + HttpContext.Current.Request.RawUrl;
            string JobIDSubString = AddJobUrl.Substring(AddJobUrl.Length - 12);
            string strBody = "A New Job has been added to the system with JobID= " + JobIDSubString.ToString() +  "<br> The File delivery method is up to the Cloud! Please check your Amazon Cloud bucket.";
            SendMail(strBody);
            SendMailAdmin(strBody);
            Response.Redirect("https://www.transcripts247.com/Go/SuccessMessage.aspx?MessageID=3"); //take to cloud upload
        }
        protected void btnFTP_Click(object sender, EventArgs e)
        {

            string AddJobUrl = HttpContext.Current.Request.Url.Scheme + "://" + HttpContext.Current.Request.Url.Authority + HttpContext.Current.Request.RawUrl;
            string JobIDSubString = AddJobUrl.Substring(AddJobUrl.Length - 12);
            string strBody = "A New Job has been added to the system with JobID= " + JobIDSubString.ToString() + "<br> The File delivery method is FTP, please check your local FTP bucket.";
            SendMail(strBody);
            SendMailAdmin(strBody);
            Response.Redirect("https://www.transcripts247.com/Go/SuccessMessage.aspx?MessageID=4");
        }
        protected void btnWeTransfer_Click(object sender, EventArgs e)
        {

            string AddJobUrl = HttpContext.Current.Request.Url.Scheme + "://" + HttpContext.Current.Request.Url.Authority + HttpContext.Current.Request.RawUrl;
            string JobIDSubString = AddJobUrl.Substring(AddJobUrl.Length - 12);
            string strBody = "A New Job has been added to the system with JobID= " + JobIDSubString.ToString() + "<br> The File delivery method is WeTransfer, please check your WeTransfer bucket here:<br> https://www.transcripts247.com/Uploads/WeTransfer.aspx.";
            SendMail(strBody);
            SendMailAdmin(strBody);
            Response.Redirect("https://www.transcripts247.com/Go/SuccessMessage.aspx?MessageID=5");
        }
       protected void btnUnsure_Click(object sender, EventArgs e)
        {

            string AddJobUrl = HttpContext.Current.Request.Url.Scheme + "://" + HttpContext.Current.Request.Url.Authority + HttpContext.Current.Request.RawUrl;
            string JobIDSubString = AddJobUrl.Substring(AddJobUrl.Length - 12);
            string strBody = "A New Job has been added to the system with JobID= " + JobIDSubString.ToString() + "<br> The File is not available yet or the User is unsure of a File delivery method.";
            SendMail(strBody);
            SendMailAdmin(strBody);
            Response.Redirect("https://www.transcripts247.com/Go/SuccessMessage.aspx?MessageID=6");
        }
    }
}
#endregion





