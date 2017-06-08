#region Copyright

// 
// Copyright (c) 2016
// by Cityscripts
// 

#endregion

#region Using Statements

using System;
using DotNetNuke.Entities.Modules;
using System.Configuration;
using System.Data;
using System.IO;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI.WebControls;
#endregion

namespace Cityscripts.ReadTranscriptions
{

	public partial class ViewReadTranscriptions : PortalModuleBase
	{

		#region Event Handlers

		protected override void OnInit(EventArgs e)
		{
			base.OnInit(e);

			
		}

        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select TranscriptionFilesID,FileName, UserId, ContentType, FileSize, ProgrammeID, TaskID from CSTranscriptionDocs";
                    cmd.Connection = con;
                    con.Open();
                    GridViewReadTranscriptions.DataSource = cmd.ExecuteReader();
                    GridViewReadTranscriptions.EmptyDataText = "There are no records to display.";
                    GridViewReadTranscriptions.DataBind();
                    con.Close();
                }
            }
        }



        protected void DownloadFile(object sender, EventArgs e)
        {
            int id = int.Parse((sender as LinkButton).CommandArgument);
            byte[] bytes;
            string fileName, contentType;
            string constr = ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select TranscriptionFilesID,FileName, FileSize, RawData, ContentType from CSTranscriptionDocs where TranscriptionFilesID = @TranscriptionFilesID";
                    cmd.Parameters.AddWithValue("@TranscriptionFilesID", id);
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        sdr.Read();
                        bytes = (byte[])sdr["RawData"];
                        contentType = sdr["ContentType"].ToString();
                        fileName = sdr["FileName"].ToString();
                    }
                    con.Close();
                }
            }
            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = contentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
            Response.BinaryWrite(bytes);
            Response.Flush();
            Response.End();
        }



        protected override void OnLoad(EventArgs e)
		{
			base.OnLoad(e);
			
			if (!Page.IsPostBack)
			{
                BindGrid();
			}
		}
		



		#endregion

	}
}

