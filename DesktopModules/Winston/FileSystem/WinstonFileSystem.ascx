<%@ Control Language="C#" AutoEventWireup="false" Inherits="Winston.FileSystem.WinstonFileSystem" CodeFile="WinstonFileSystem.ascx.cs" %>

<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

<div class="dnnForm" id="dnnEdit">
  
    <fieldset>
            <asp:Label ID="lblLoadUsername" runat="server" Font-Size="Small" Font-Bold="True" Text="" /><br />
            <asp:Label ID="lblLoadEMail" runat="server" Font-Size="Small" Font-Bold="True">
            </asp:Label>
            <br />
            <asp:Label ID="lblDatenTime" runat="server" Font-Size="Small" Font-Bold="True" Text="" />
       <br />
        <asp:Label ID="Label2" runat="server" Text="Please Paste your file from Word in text box below:" Font-Italic="True" Font-Names="Arial Black" Font-Size="Small" ForeColor="#007FFF"></asp:Label><br />
        <asp:TextBox ID="TextBoxTypistsWork" runat="server" Width="600px" Height="200px" TextMode="MultiLine" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" OnTextChanged="TextBoxTypistsWork_OnDataBinding"></asp:TextBox><br />

        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please paste the contents of the typed document in to the textbox." ControlToValidate="TextBoxTypistsWork" Display="Dynamic" SetFocusOnError="True" Font-Size="small" Font-Bold="True" Font-Italic="True" ForeColor="Red" ValidateRequestMode="Inherit"></asp:RequiredFieldValidator>
<br />
        <asp:Label ID="LabelTaskID" runat="server"  Font-Italic="True" Font-Names="Arial Black" Font-Size="Small" ForeColor="#007FFF" Text="Enter TaskID"></asp:Label>
        <br />
        <asp:TextBox ID="TextBoxTaskID" runat="server" Width="80" MaxLength="12" Font-Size="Small" BorderColor="Black" BorderWidth="1px"></asp:TextBox>
        <br />
        <asp:Label ID="Label1" runat="server" Text="Please choose your file and click Upload:" Font-Italic="True" Font-Names="Arial Black" Font-Size="Small" ForeColor="#007FFF"></asp:Label><br />
        <asp:FileUpload ID="FileUpload1" runat="server" Font-Size="X-Small" /><br />
        <br />
        <br />

        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please click Choose File to browse and select a file that you would like to upload." ControlToValidate="FileUpload1" Display="Dynamic" SetFocusOnError="True" Font-Size="Small" Font-Bold="True" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
         <br />
        <span style="margin-left: 150px; border-top: 8px;">
            <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="Upload" Font-Bold="True" Font-Size="Large" CssClass="dnnPrimaryAction" />
        </span>
       
    </fieldset>
</div>


