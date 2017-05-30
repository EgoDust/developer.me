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
using System.Web.UI.WebControls;
#endregion

namespace Cityscripts.UpdateStatus
{

    public partial class UpdateStatus : PortalModuleBase
    {
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            //cmdCancel.Click += cmdCancel_Click;
        }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            //if (!Page.IsPostBack)
            //{
            //}
            //else
            //{
            //    string AddTypistUrl = HttpContext.Current.Request.Url.Scheme + "://" + HttpContext.Current.Request.Url.Authority + HttpContext.Current.Request.RawUrl;
            //}
        }

        protected void UpdateJobStatus()
        {
            String strConnString = ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "CSUpdateJobDetailsStatus";
            cmd.Parameters.Add("@Status", SqlDbType.VarChar).Value = CheckBoxList1.SelectedValue; //DropDownListProgress.SelectedValue.ToString().Trim();
            //cmd.Parameters.Add("@TaskID", SqlDbType.VarChar).Value = AddTypistSubString.ToString().Trim();
            cmd.Parameters.Add("@TaskID", SqlDbType.VarChar).Value = txtJobsTaskID.Text;
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
                foreach (ListItem item in CheckBoxList1.Items)
                {
                    item.Selected = false;
                    //item.Enabled = true;
                }
                txtJobsTaskID.Text = "";
                lblUpdateStatusMessage.Text = "Record updated successfully";
         
            }

        }


        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (Page.IsValid)
            {
                if (CheckBoxList1.SelectedValue == "In Preparation")
                {
                    lblUpdateStatusMessage.Text = "You have updated your jobs status to: In Preparation";
                    UpdateJobStatus();
                }
                if (CheckBoxList1.SelectedValue == "Ready to be typed")
                {
                    lblUpdateStatusMessage.Text = "You have updated your jobs status to: Ready to be typed";
                }

                if (CheckBoxList1.SelectedValue == "Being typed")
                {
                    lblUpdateStatusMessage.Text = "You have updated your jobs status to: Being typed";
                    UpdateJobStatus();
                }

                if (CheckBoxList1.SelectedValue == "Typed 10 %")
                {
                    lblUpdateStatusMessage.Text = "You have updated your jobs status to: Typed 10 %";
                    UpdateJobStatus();
                }

                if (CheckBoxList1.SelectedValue == "Typed 20 %")
                {
                    lblUpdateStatusMessage.Text = "You have updated your jobs status to: Typed 20 %";
                    UpdateJobStatus();
                }

                if (CheckBoxList1.SelectedValue == "Typed 30 %")
                {
                    lblUpdateStatusMessage.Text = "You have updated your jobs status to: Typed 30 %";
                    UpdateJobStatus();
                }

                if (CheckBoxList1.SelectedValue == "Typed 40 %")
                {
                    lblUpdateStatusMessage.Text = "You have updated your jobs status to: Typed 40 %";
                    UpdateJobStatus();
                }

                if (CheckBoxList1.SelectedValue == "Typed 50 %")
                {
                    lblUpdateStatusMessage.Text = "You have updated your jobs status to: Typed 50 %";
                    UpdateJobStatus();
                }

                if (CheckBoxList1.SelectedValue == "Typed 60 %")
                {
                    lblUpdateStatusMessage.Text = "You have updated your jobs status to: Typed 60 %";
                    UpdateJobStatus();
                }

                if (CheckBoxList1.SelectedValue == "Typed 70 %")
                {
                    lblUpdateStatusMessage.Text = "You have updated your jobs status to: Typed 70 %";
                    UpdateJobStatus();
                }

                if (CheckBoxList1.SelectedValue == "Typed 80 %")
                {
                    lblUpdateStatusMessage.Text = "You have updated your jobs status to: Typed 80 %";
                    UpdateJobStatus();
                }

                if (CheckBoxList1.SelectedValue == "Typed 90 %")
                {
                    lblUpdateStatusMessage.Text = "You have updated your jobs status to: Typed 90 %";
                    UpdateJobStatus();
                }

                if (CheckBoxList1.SelectedValue == "Typed 100 %")
                {
                    lblUpdateStatusMessage.Text = "You have updated your jobs status to: Typed 100 %";
                    UpdateJobStatus();
                }

                if (CheckBoxList1.SelectedValue == "Being proofed")
                {
                    lblUpdateStatusMessage.Text = "You have updated your jobs status to: Being proofed";
                    UpdateJobStatus();
                }

                if (CheckBoxList1.SelectedValue == "Being formatted")
                {
                    lblUpdateStatusMessage.Text = "You have updated your jobs status to: Being formatted";
                    UpdateJobStatus();
                }
            }
            else
            {
                foreach (ListItem item in CheckBoxList1.Items)
                {
                    item.Selected = false;
                    //item.Enabled = true;
                }
            }
        }
    }
}
