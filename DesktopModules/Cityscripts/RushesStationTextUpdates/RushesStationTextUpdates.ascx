<%@ Control Language="C#" AutoEventWireup="false" Inherits="Cityscripts.RushesStationTextUpdates.RushesStationTextUpdates" CodeFile="RushesStationTextUpdates.ascx.cs" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

<asp:Label ID="lblRushesStationTextUpdates" runat="server" Text=""></asp:Label>
<br />

<asp:Label ID="lblDirectoryProcessingPath" runat="server" Font-Bold="False" Font-Italic="True" Font-Size="X-Small"></asp:Label>
<br />

<br />
<%--<asp:TextBox ID="TextBoxMyReport" runat="server" Width="100%" Height="100px"></asp:TextBox>--%>
<table>
    <tr>
        <td style="text-align: right;">
            <asp:Button ID="btReadFiles" runat="server" Text="Read Text Files" OnClick="btReadDirectory_Click" /></td>
    </tr>
    <tr>
        <td>
            <asp:ListBox ID="ListBoxFTPFiles" runat="server" ToolTip="List of text (*.txt) files from RushesStation FTP Logging" Width="600px" Height="600px"></asp:ListBox></td>
    </tr>
</table>
<asp:GridView ID="GridView1" runat="server"></asp:GridView>

