<%@ Control Language="C#" AutoEventWireup="false" Inherits="Cityscripts.Transcriptionists.ViewTranscriptionists" CodeFile="ViewTranscriptionists.ascx.cs" %>

<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

<style>
    h2.dnnFormSectionHead {
        margin: 0.5em auto 0.6em;
        padding: 0;
        letter-spacing: -0.03em;
        font-weight: bold;
        border-bottom: 1px #ccc solid;
        text-align: left;
        line-height: 1.2;
        font-size: 1.5em;
    }

    .dnnForm h2.dnnFormSectionHead a,
    .dnnForm h2.dnnFormSectionHead a:visited {
        display: block;
        text-decoration: none;
        padding: 0.4em 0.8em;
        color: #000;
        letter-spacing: -0.03em;
        font-weight: bold;
        background: url(../../images/down-icn.png) no-repeat 98% center;
        display: block;
    }

        .dnnForm h2.dnnFormSectionHead a:hover {
            background: #f1f1f1 url(../../images/down-icn.png) no-repeat 98% center;
        }

        .dnnForm h2.dnnFormSectionHead a.dnnSectionExpanded {
            background: url(../../images/up-icn.png) no-repeat 98% center;
            text-align: left;
        }

            .dnnForm h2.dnnFormSectionHead a.dnnSectionExpanded:hover {
                background: #f1f1f1 url(../../images/up-icn.png) no-repeat 98% center;
            }

    .dnnFormExpandContent {
        position: absolute;
        top: -32px;
        right: 10px;
    }

    .dnnFormExpandContent {
        text-align: right;
    }

    .dnnForm .dnnFormExpandContent a {
        font-weight: bold;
    }
</style>
<script type="text/javascript">
    jQuery(function ($) {
        var setupModule = function () {
            $('#panels-demo').dnnPanels();
            $('#panels-demo .dnnFormExpandContent a').dnnExpandAll({
                targetArea: '#panels-demo'
            });
        };
        setupModule();
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
            // note that this will fire when _any_ UpdatePanel is triggered,
            // which may or may not cause an issue
            setupModule();
        });
    });
</script>
<asp:Label ID="lblTranscriptionistMesage" runat="server" Text="Welcome to Transcription Management." Font-Size="Medium"></asp:Label>
<div class="dnnForm" id="panels-demo">
    
    <div class="dnnFormExpandContent"><a href="">Expand All</a></div>


    <h2 id="ChristopherColumbus" class="dnnFormSectionHead"><a href="#">View My Transcriptions...</a></h2>
    <fieldset class="dnnClear">
        <img src="../../../Portals/0/Images/data_transfer.png" alt="Christopher Columbus" width="32px" height="32px" class="dnnLeft" />
        <div class="dnnRight" style="width: 62%; margin-left: 2%">
           <%-- Please E-Mail us with your Transcriptions TaskID and we will e-mail you a copy or click button below for live Transcription access.<br />--%>
            <asp:Button ID="btnGetMyTranscription" runat="server" Text="View My Uploads" OnClick="btnGetMyTranscription_Click" OnClientClick="btnGetMyTranscription_Click" />
        </div>
    </fieldset>
    
   <%-- <h2 id="IsaacNewton" class="dnnFormSectionHead"><a href="#">Send Transcription File as Text...</a></h2>
    <fieldset class="dnnClear">
        <img src="../../../Portals/0/Images/transfer_document.png" alt="Isaac Newton" width="32px" height="32px" class="dnnLeft" />
        <div class="dnnRight" style="width: 62%; margin-left: 2%">
            <asp:Panel ID="PanelAddTranscription" runat="server">
                <center>
 <table width="100%" border="0">
            <tr>
                <td align="right"><asp:Label ID="lblProgrammeID" runat="server" Text="Programme ID: " Font-Size="Small" /></td>
                <td  align="left"><asp:TextBox ID="txtProgrammeID" runat="server" Width="150px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorProgrammeID" runat="server" ControlToValidate="txtProgrammeID" ErrorMessage="Programme ID is a Required Field" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right"><asp:Label ID="lblTaskID" runat="server" Text="Task ID: " Font-Size="Small" /></td>
                <td align="left"><asp:TextBox ID="txtTaskID" runat="server" Width="150px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTaskID" runat="server" ControlToValidate="txtTaskID" ErrorMessage="Task ID is a Required Field" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td colspan="2">  <asp:TextBox ID="txtUploadTranscriptions" runat="server" TextMode="MultiLine" Width="100%" Height="200px"></asp:TextBox><br />
       <center> <asp:linkbutton id="cmdSave" text="Submit Transcript Text" runat="server" cssclass="dnnPrimaryAction" OnClick="cmdSave_Click1" /></center></td>
            </tr>
        </table>	
</center>
            </asp:Panel>
        </div>
    </fieldset>--%>


    <h2 id="JohannesGutenberg" class="dnnFormSectionHead"><a href="#">Upload my Transcription File...</a></h2>
    <fieldset class="dnnClear">
        <img src="../../../Portals/0/Images/transfer.png" alt="Johannes Gutenberg" width="32px" height="32px" class="dnnLeft" />
        <div class="dnnRight" style="width: 62%; margin-left: 2%">
            <asp:Panel ID="PanelViewTranscription" runat="server">
                <center>
<table width="100%" border="0">
      <tr>
    <td valign="top" align="right"><asp:Label ID="lblFileName" runat="server" Text="FileName: " Font-Size="Small"></asp:Label></td>
     <td valign="top" align="left"><asp:TextBox ID="txtFileName" runat="server" Width="220"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidatorFileName" runat="server" ErrorMessage="Please enter your file name." ControlToValidate="txtFileName" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator></td>   
  </tr>
  <tr>
    <td valign="top" align="right"><asp:Label ID="lblProgramme" runat="server" Text="Enter your Programme ID: " Font-Size="Small"></asp:Label></td>
    <td valign="top" align="left"><asp:TextBox ID="txtUserProgID" runat="server" MaxLength="12" Width="120"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidatorViewDocProgID" runat="server" ErrorMessage="Please enter your Programme ID." ControlToValidate="txtUserProgID" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator></td>
  </tr>
  <tr>
    <td valign="top" align="right"><asp:Label ID="lblTask" runat="server" Text="Enter your Task ID: " Font-Size="Small"></asp:Label></td>
     <td valign="top" align="left"><asp:TextBox ID="txtTask" runat="server" MaxLength="12" Width="120"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidatorViewDocTask" runat="server" ErrorMessage="Please enter your Task ID." ControlToValidate="txtTask" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator></td>   
  </tr>

  <tr>
      <td valign="top" align="right"><asp:Label ID="lblBrowseUpload" runat="server" Text="Browse for File to Upload: " Font-Size="Small"></asp:Label></td>
    <td><br><asp:FileUpload ID="FileUpload1" runat="server"></asp:FileUpload><br /></td>
  </tr>
  <tr>
      <td>&nbsp;</td>
    <td><center><asp:Button ID="btnShowUserTranscripts" runat="server" Text="Upload Transcription" OnClick="btnShowUserTranscripts_Click" cssclass="dnnPrimaryAction" /></center></td>
  </tr>
</table>
</center>
            </asp:Panel>
        </div>
    </fieldset>
    
</div>

<center>
<asp:GridView ID="GridViewMyViewUploads" runat="server">
    <PagerStyle BorderStyle="Groove" />
    </asp:GridView>
</center>
