<%@ Control Language="C#" AutoEventWireup="false" Inherits="Cityscripts.AddNewJobConfirm.ViewAddNewJobConfirm" CodeFile="ViewAddNewJobConfirm.ascx.cs" %>

<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

 <%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

 <asp:Label ID="lblSubmitJobConfirmMessage" runat="server" Text="" />
  <asp:Label ID="lblSubmitJobConfirmMsg" runat="server" Text="" />


<asp:Panel ID="PanelOfficeDelivery" runat="server">
    Thank you for your Job submission. You chose to drop the media at our offices, if you would like to see directions to our office please click <a href="https://www.transcripts247.com/ContactUs.aspx?OfficeDirections">here</a>.
    <br />
    <asp:ImageButton ID="ibOfficeDelivery" runat="server" ImageUrl="https://www.transcripts247.com/Portals/0/Images/officeDrop.png"  OnClick="btnOfficeDelivery_Click" />
    <br />
    <asp:Button ID="btnOfficeDelivery" runat="server" Text="Finish" OnClick="btnOfficeDelivery_Click" />
</asp:Panel>

<asp:Panel ID="PanelCloudUpload" runat="server">
Click to Access our multiple Cloud Upload page and complete your job submission.<br /> You can Click on the &#39;Amazon Cloud&#39; icon in the &#39;Media Destination&#39; folder and drag one or many files to that location.
    <br />
    <asp:ImageButton ID="ibCloupUpload" runat="server" ImageUrl="https://www.transcripts247.com/portals/0/Images/Cloud-icon.png"  OnClick="btnCloudUpload_Click" />
    <br />
    <asp:Button ID="btnCloudUpload" runat="server" Text="Finish" OnClick="btnCloudUpload_Click" />
</asp:Panel>

<asp:Panel ID="PanelFTP" runat="server">
    If you would like to Upload Files to our FTP server please use the following details and when you&#39;ve completed the file(s) upload you can click the Finish button below.
    <br />We recommend using <a href="https://filezilla-project.org/download.php?type=client" target="_blank">Filezilla</a> for Windows, Linux and Mac as a FTP client. <br />You can also access the FTP server through your web browser over <a href="ftp://transcripts247.com" target="_blank">here</a>.
<table width="350px" border="0">
  <tr>
    <td align="right">FTP Host Address:&nbsp;</td>
    <td><strong>transcripts247.com</strong></td>
  </tr>
  <tr>
    <td align="right">FTP Username:&nbsp;</td>
    <td><strong>TranscriptsFTP</strong></td>
  </tr>
  <tr>
    <td align="right">FTP Password:&nbsp;</td>
    <td><strong>mr75Sz4*</strong></td>
  </tr>
</table>
    <asp:ImageButton ID="ibFTP" runat="server" ImageUrl="https://www.transcripts247.com/portals/0/Images/Folder-ftp-icon.png" OnClick="btnFTP_Click" />
    <br />
    <asp:Button ID="btnFTP" runat="server" Text="Finish" OnClick="btnFTP_Click" />
</asp:Panel>

<asp:Panel ID="PanelWeTransfer" runat="server">
Click to Access our WeTransfer Page and complete your job submission.
 <br />
<asp:ImageButton ID="ibWeTransfer" runat="server" ImageUrl="https://www.transcripts247.com/portals/0/Images/wetransfer32.png" OnClick="btnWeTransfer_Click" />
    <br />
    <asp:Button ID="btnWeTransfer" runat="server" Text="Finish" OnClick="btnWeTransfer_Click" />
    <br />
</asp:Panel>

<asp:Panel ID="PanelUnsure" runat="server">
    If you&#39;re unsure of how to send us files, or if the files aren&#39;t available right now, please click the button to complete your submission.
<br />
    <asp:ImageButton ID="ibUnsure" runat="server" ImageUrl="https://www.transcripts247.com/Portals/0/Images/delaySend-file.png" OnClick="btnUnsure_Click" />
   <br />
    <asp:Button ID="btnUnsure" runat="server" Text="Finish" OnClick="btnUnsure_Click" />
    <br />
</asp:Panel>



      


