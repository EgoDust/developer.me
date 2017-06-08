<%@ Control Language="C#" AutoEventWireup="false" Inherits="Winston.WorkAllocation.WorkAllocation" CodeFile="WorkAllocation.ascx.cs" %>

<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<style type="text/css">
    .hidden {
        display: none;
    }
</style>

<asp:Label ID="lblJobAllocationMessage" runat="server"  Font-Size="Small"></asp:Label>

<asp:SqlDataSource ID="SqlDataSourceViewWorkTasks" runat="server" ConnectionString="<%$ ConnectionStrings:SiteSqlServer %>" SelectCommand="SELECT CSJobs.ProgrammeName, CSJobs.ProgrammeDescription, CSJobsDetails.ProgrammeID, CSJobsDetails.JobType, CSJobsDetails.TranscriberFormat, CSJobsDetails.DueDate, CSJobsDetails.DueDateTime, CSJobsDetails.OriginalFilenames, CSJobsDetails.OptionalDownloadURLs, CSJobsDetails.DurationTotal, CSJobsDetails.StartPositionSS, CSJobsDetails.EndPositionSS, CSJobsDetails.ClientNotes FROM CSJobs INNER JOIN CSJobsDetails ON CSJobs.JobID = CSJobsDetails.JobID WHERE (CSJobsDetails.Status IS NULL) ORDER BY CSJobs.JobStartDate DESC"></asp:SqlDataSource>

<asp:GridView ID="GridViewViewWorkTasks" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ProgrammeID" DataSourceID="SqlDataSourceViewWorkTasks" Width="100%" OnSelectedIndexChanged="GridViewViewWorkTasks_SelectedIndexChanged" PageSize="5" AllowSorting="True" CellPadding="3" CellSpacing="1" Font-Size="Small">
    <AlternatingRowStyle BackColor="#CCCCCC" Font-Overline="False" />
    <Columns>
        <asp:BoundField DataField="ProgrammeName" HeaderText="Name" SortExpression="ProgrammeName" />
        <asp:BoundField DataField="ProgrammeDescription" HeaderText="ProgrammeDescription" SortExpression="ProgrammeDescription">
            <ItemStyle CssClass="hidden" />
            <HeaderStyle CssClass="hidden" />
        </asp:BoundField>
        <asp:BoundField DataField="ProgrammeID" HeaderText="ProgrammeID" ReadOnly="True" SortExpression="ProgrammeID">
            <ItemStyle CssClass="hidden" />
            <HeaderStyle CssClass="hidden" />
        </asp:BoundField>
        <asp:BoundField DataField="JobType" HeaderText="Job Type" SortExpression="JobType" />
        <asp:BoundField DataField="TranscriberFormat" HeaderText="Transcription Format" SortExpression="TranscriberFormat" />
        <asp:BoundField DataField="DueDate" HeaderText="Due Date" SortExpression="DueDate" DataFormatString="{0:MM-dd-yyyy}" />
        <asp:BoundField DataField="DueDateTime" HeaderText="Due Time" SortExpression="DueDateTime" DataFormatString="{0:hh:mm tt}" />
        <asp:BoundField DataField="OptionalDownloadURLs" HeaderText="Download URL" SortExpression="OptionalDownloadURLs">
            <ItemStyle CssClass="hidden" />
            <HeaderStyle CssClass="hidden" />
        </asp:BoundField>
        <asp:BoundField DataField="OriginalFilenames" HeaderText="OriginalFilenames" SortExpression="OriginalFilenames">
            <ItemStyle CssClass="hidden" />
            <HeaderStyle CssClass="hidden" />
        </asp:BoundField>
        <asp:BoundField DataField="DurationTotal" HeaderText="DurationTotal" SortExpression="DurationTotal">
            <ItemStyle CssClass="hidden" />
            <HeaderStyle CssClass="hidden" />
        </asp:BoundField>
        <asp:BoundField DataField="StartPositionSS" HeaderText="StartPositionSS" SortExpression="StartPositionSS">
            <ItemStyle CssClass="hidden" />
            <HeaderStyle CssClass="hidden" />
        </asp:BoundField>
        <asp:BoundField DataField="EndPositionSS" HeaderText="EndPositionSS" SortExpression="EndPositionSS">
            <ItemStyle CssClass="hidden" />
            <HeaderStyle CssClass="hidden" />
        </asp:BoundField>
        <asp:BoundField DataField="ClientNotes" HeaderText="ClientNotes" SortExpression="ClientNotes">
            <ItemStyle CssClass="hidden" />
            <HeaderStyle CssClass="hidden" />
        </asp:BoundField>
        <asp:CommandField ShowSelectButton="True" SelectText="Book Task" >
        <ItemStyle Font-Bold="True" Font-Size="Small" />
        </asp:CommandField>
    </Columns>
    <HeaderStyle HorizontalAlign="Left" Font-Size="Medium" />
    <PagerStyle Font-Size="Larger" />
</asp:GridView>
<asp:Label ID="LabelGridSelectDetails" runat="server" Text="" Width="100%" />
<center><asp:TextBox ID="TextBoxGridSelectDetails" runat="server" TextMode="MultiLine" Width="75%"  Visible="false" Rows="10" Font-Size="Small"></asp:TextBox><br />
<asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" Target="_blank" Visible="False" ForeColor="#0B0080">Download Work Media File</asp:HyperLink>
    <br /><br />
    <asp:Button ID="ButtonTypistBookJob" runat="server" Text="Confirm Task Booking" CssClass="dnnPrimaryAction" Visible="false" OnClick="ButtonTypistBookJob_Click" /></center>

