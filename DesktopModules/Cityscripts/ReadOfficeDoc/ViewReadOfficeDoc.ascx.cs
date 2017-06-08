#region Copyright

// 
// Copyright (c) 2017
// by Cityscripts
// 

#endregion

#region Using Statements

using System;
using DotNetNuke.Entities.Modules;
using System.Data;
using System.Data.SqlClient;
using System.Web;

#endregion

namespace Cityscripts.ReadOfficeDoc
{

    public partial class ViewReadOfficeDoc : PortalModuleBase
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
                lblGreeting.Text = this.UserInfo.Email.ToString();
                lblUsername.Text = this.UserInfo.Username.ToString();

            }
        }



        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblmyDocID.Visible = true;
            txtmyDocID.Visible = true;
            txtCheckMyWord.Visible = true;
            cmdDownloadDoc.Visible = true;
            cmdDownloadDoc.Enabled = true;
            var DBDataText = GridView1.SelectedRow.Cells[5].Text;
            //mine
            var encodedTextBoxTypistsWork = DBDataText;
            //byte[] utf8Bytes = System.Text.Encoding.UTF8.GetBytes(encodedTextBoxTypistsWork);
            //string makesStr = Convert.ToBase64String(utf8Bytes);
            ////System.Text.Encoding makesStr1 = System.Text.Encoding.UTF32;
            ////makesStr1.GetEncoder(makesStr).ToString();
            // Encode the string.
            string myEncodedString;
            myEncodedString = HttpUtility.HtmlEncode(encodedTextBoxTypistsWork); //changes string having & or \ in it?

            txtCheckMyWord.Text = myEncodedString.ToString();
            var myDocid = GridView1.SelectedDataKey[0];
            txtmyDocID.Text = Convert.ToInt32(myDocid).ToString();
            //DNNConnect.CKEditorProvider.

        }

        protected void cmdDownloadDoc_Click(object sender, EventArgs e)
        {
            //ModuleController.Instance.UpdateModuleSetting(ModuleId, "field", txtField.Text);
            //DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, "Update Successful", DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.GreenSuccess);
            //below 
            string strQuery = "select id, Name, ContentType, Data from CSTypistsFiles where id=@id ORDER BY id DESC";
            SqlCommand cmd = new SqlCommand(strQuery);
            string myDocid = txtmyDocID.Text;
            int DocParam = Convert.ToInt32(myDocid);
            cmd.Parameters.Add("@id", SqlDbType.Int).Value = DocParam; //;
            DataTable dt = GetData(cmd);
            if (dt != null)
            {
                download(dt);
            }
        }


        private DataTable GetData(SqlCommand cmd)
        {
            DataTable dt = new DataTable();
            String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
            SqlConnection con = new SqlConnection(strConnString);
            SqlDataAdapter sda = new SqlDataAdapter();
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            try
            {
                con.Open();
                sda.SelectCommand = cmd;
                sda.Fill(dt);
                return dt;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
                sda.Dispose();
                con.Dispose();
            }
        }
        private void download(DataTable dt)
        {
            //check this out http://stackoverflow.com/questions/13321167/how-can-i-open-word-document-without-having-to-save-it-first-on-the-server
            Byte[] bytes = (Byte[])dt.Rows[0]["Data"];
            Response.Buffer = true;
            Response.Charset = "";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = dt.Rows[0]["ContentType"].ToString();
            Response.AddHeader("content-disposition", "attachment;filename="
            + dt.Rows[0]["Name"].ToString());
            Response.BinaryWrite(bytes);
            Response.Flush();
            Response.End();

            //// open your file, the proper application will be executed because of proper file extension
            //System.Diagnostics.Process prc = new Process();
            //prc.StartInfo.FileName = fileName;
            //prc.Start();
        }


    }
}

#endregion
