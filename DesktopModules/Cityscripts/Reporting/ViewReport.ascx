<%@ Control Language="C#" AutoEventWireup="false" Inherits="Cityscripts.Reporting.ViewReport" CodeFile="ViewReport.ascx.cs" %>

<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<style type="text/css">
    .hidden {
        display: none;
    }
</style>
<div class="dnnForm dnnEdit dnnClear" id="dnnEdit">

    <fieldset>

        <div class="dnnFormItem">
            <asp:DropDownList ID="DropDownListReportingMenu" runat="server" OnTextChanged="DropDownListReportingMenu_SelectedIndexChanged" AutoPostBack="True" OnSelectedIndexChanged="DropDownListReportingMenu_SelectedIndexChanged" Font-Bold="True" Font-Size="Medium" ForeColor="#007FFF">
                <asp:ListItem>Select Report</asp:ListItem>
                <asp:ListItem>View Job Card</asp:ListItem>
                <asp:ListItem>View Current Jobs</asp:ListItem>
                <asp:ListItem>View List of Transcriptionists</asp:ListItem>
                <asp:ListItem>View Application and Physical Paths</asp:ListItem>
                <asp:ListItem>View Submitted Documents</asp:ListItem>
                <asp:ListItem>View RushesStation Text File Updates</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Label ID="lblReportingInfo" runat="server" Text=""></asp:Label>
            <br />
            <asp:SqlDataSource ID="SqlDataSourceViewJobCard" runat="server" ConnectionString="<%$ ConnectionStrings:SiteSqlServer %>" SelectCommand="SELECT CSJobs.*, CSJobsDetails.* FROM CSJobs INNER JOIN CSJobsDetails ON CSJobs.JobID = CSJobsDetails.JobID"></asp:SqlDataSource>
            <asp:FormView ID="FormViewViewJobCard" runat="server" AllowPaging="True" CellPadding="1" DataKeyNames="JobID,ProgrammeID1" DataSourceID="SqlDataSourceViewJobCard" EmptyDataText="Empty Data" Font-Size="Small" Width="100%" Visible="false" CellSpacing="1" HorizontalAlign="Center">
               
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
              
                <ItemTemplate>
                    <strong>JobNumber:</strong>
                    <asp:Label ID="JobNumberLabel" runat="server" Text='<%# Eval("JobNumber") %>' />
                    <br />
                    <strong>IPAddress:</strong>
                    <asp:Label ID="IPAddressLabel" runat="server" Text='<%# Bind("IPAddress") %>' />
                    <br />
                    <strong>JobStartDate:</strong>
                    <asp:Label ID="JobStartDateLabel" runat="server" Text='<%# Bind("JobStartDate") %>' />
                    <br />
                    <strong>Userid:</strong>
                    <asp:Label ID="UseridLabel" runat="server" Text='<%# Bind("Userid") %>' />
                    <br />
                    <strong>FullName:</strong>
                    <asp:Label ID="FullNameLabel" runat="server" Text='<%# Bind("FullName") %>' />
                    <br />
                    <strong>FileSubmissionPreference:</strong>
                    <asp:Label ID="FileSubmissionPreferenceLabel" runat="server" Text='<%# Bind("FileSubmissionPreference") %>' />
                    <br />
                    <strong>JobType:</strong>
                    <asp:Label ID="JobTypeLabel" runat="server" Text='<%# Bind("JobType") %>' />
                    <br />
                    <strong>JobID:</strong>
                    <asp:Label ID="JobIDLabel" runat="server" Text='<%# Eval("JobID") %>' />
                    <br />
                    <strong>ProgrammeID:</strong>
                    <asp:Label ID="ProgrammeIDLabel" runat="server" Text='<%# Bind("ProgrammeID") %>' />
                    <br />
                    <strong>ProgrammeName:</strong>
                    <asp:Label ID="ProgrammeNameLabel" runat="server" Text='<%# Bind("ProgrammeName") %>' />
                    <br />
                    <strong>ProgrammeDescription:</strong>
                    <asp:Label ID="ProgrammeDescriptionLabel" runat="server" Text='<%# Bind("ProgrammeDescription") %>' />
                    <br />
                    <strong>ContactNumber:</strong>
                    <asp:Label ID="ContactNumberLabel" runat="server" Text='<%# Bind("ContactNumber") %>' />
                    <br />
                    <strong>JobIsActive:</strong>
                    <asp:CheckBox ID="JobIsActiveCheckBox" runat="server" Checked='<%# Bind("JobIsActive") %>' Enabled="false" />
                    <br />
                    <strong>JobDetailsID:</strong>
                    <asp:Label ID="JobDetailsIDLabel" runat="server" Text='<%# Eval("JobDetailsID") %>' />
                    <br />
                    <strong>Userid1:</strong>
                    <asp:Label ID="Userid1Label" runat="server" Text='<%# Bind("Userid1") %>' />
                    <br />
                    <strong>JobID1:</strong>
                    <asp:Label ID="JobID1Label" runat="server" Text='<%# Bind("JobID1") %>' />
                    <br />
                    <strong>JobType1:</strong>
                    <asp:Label ID="JobType1Label" runat="server" Text='<%# Bind("JobType1") %>' />
                    <br />
                    <strong>ProgrammeID1:</strong>
                    <asp:Label ID="ProgrammeID1Label" runat="server" Text='<%# Eval("ProgrammeID1") %>' />
                    <br />
                    <strong>FileSubmissionPreference1:</strong>
                    <asp:Label ID="FileSubmissionPreference1Label" runat="server" Text='<%# Bind("FileSubmissionPreference1") %>' />
                    <br />
                    <strong>MediaFormat:</strong>
                    <asp:Label ID="MediaFormatLabel" runat="server" Text='<%# Bind("MediaFormat") %>' />
                    <br />
                    <strong>TranscriberFormat:</strong>
                    <asp:Label ID="TranscriberFormatLabel" runat="server" Text='<%# Bind("TranscriberFormat") %>' />
                    <br />
                    <strong>MediaFileFormat:</strong>
                    <asp:Label ID="MediaFileFormatLabel" runat="server" Text='<%# Bind("MediaFileFormat") %>' />
                    <br />
                    <strong>MediaFileHours:</strong>
                    <asp:Label ID="MediaFileHoursLabel" runat="server" Text='<%# Bind("MediaFileHours") %>' />
                    <br />
                    <strong>MediaFileMinutes:</strong>
                    <asp:Label ID="MediaFileMinutesLabel" runat="server" Text='<%# Bind("MediaFileMinutes") %>' />
                    <br />
                    <strong>MediaFileSeconds:</strong>
                    <asp:Label ID="MediaFileSecondsLabel" runat="server" Text='<%# Bind("MediaFileSeconds") %>' />
                    <br />
                    <strong>TodaysDate:</strong>
                    <asp:Label ID="TodaysDateLabel" runat="server" Text='<%# Bind("TodaysDate") %>' />
                    <br />
                    <strong>TodaysDateTime:</strong>
                    <asp:Label ID="TodaysDateTimeLabel" runat="server" Text='<%# Bind("TodaysDateTime") %>' />
                    <br />
                    <strong>DueDate:</strong>
                    <asp:Label ID="DueDateLabel" runat="server" Text='<%# Bind("DueDate") %>' />
                    <br />
                    <strong>DueDateTime:</strong>
                    <asp:Label ID="DueDateTimeLabel" runat="server" Text='<%# Bind("DueDateTime") %>' />
                    <br />
                    <strong>SpecialInstructions:</strong>
                    <asp:Label ID="SpecialInstructionsLabel" runat="server" Text='<%# Bind("SpecialInstructions") %>' />
                    <br />
                    <strong>TaskID:</strong>
                    <asp:Label ID="TaskIDLabel" runat="server" Text='<%# Bind("TaskID") %>' />
                    <br />
                    <strong>DurationHours:</strong>
                    <asp:Label ID="DurationHoursLabel" runat="server" Text='<%# Bind("DurationHours") %>' />
                    <br />
                    <strong>DurationMinutes:</strong>
                    <asp:Label ID="DurationMinutesLabel" runat="server" Text='<%# Bind("DurationMinutes") %>' />
                    <br />
                    <strong>DurationSeconds:</strong>
                    <asp:Label ID="DurationSecondsLabel" runat="server" Text='<%# Bind("DurationSeconds") %>' />
                    <br />
                    <strong>DurationTotal:</strong>
                    <asp:Label ID="DurationTotalLabel" runat="server" Text='<%# Bind("DurationTotal") %>' />
                    <br />
                    <strong>TypingProgress:</strong>
                    <asp:Label ID="TypingProgressLabel" runat="server" Text='<%# Bind("TypingProgress") %>' />
                    <br />
                    <strong>TimecodeStatus:</strong>
                    <asp:Label ID="TimecodeStatusLabel" runat="server" Text='<%# Bind("TimecodeStatus") %>' />
                    <br />
                    <strong>WordCount:</strong>
                    <asp:Label ID="WordCountLabel" runat="server" Text='<%# Bind("WordCount") %>' />
                    <br />
                    <strong>RateCostPerWord:</strong>
                    <asp:Label ID="RateCostPerWordLabel" runat="server" Text='<%# Bind("RateCostPerWord") %>' />
                    <br />
                    <strong>FixedCostPerMinute:</strong>
                    <asp:Label ID="FixedCostPerMinuteLabel" runat="server" Text='<%# Bind("FixedCostPerMinute") %>' />
                    <br />
                    <strong>ChargingMethod:</strong>
                    <asp:Label ID="ChargingMethodLabel" runat="server" Text='<%# Bind("ChargingMethod") %>' />
                    <br />
                    <strong>ActualCost:</strong>
                    <asp:Label ID="ActualCostLabel" runat="server" Text='<%# Bind("ActualCost") %>' />
                    <br />
                    <strong>TypistUserid:</strong>
                    <asp:Label ID="TypistUseridLabel" runat="server" Text='<%# Bind("TypistUserid") %>' />
                    <br />
                    <strong>StartPositionSS:</strong>
                    <asp:Label ID="StartPositionSSLabel" runat="server" Text='<%# Bind("StartPositionSS") %>' />
                    <br />
                    <strong>StartPosition:</strong>
                    <asp:Label ID="StartPositionLabel" runat="server" Text='<%# Bind("StartPosition") %>' />
                    <br />
                    <strong>EndPositionSS:</strong>
                    <asp:Label ID="EndPositionSSLabel" runat="server" Text='<%# Bind("EndPositionSS") %>' />
                    <br />
                    <strong>EndPosition:</strong>
                    <asp:Label ID="EndPositionLabel" runat="server" Text='<%# Bind("EndPosition") %>' />
                    <br />
                    <strong>FileUploadURL:</strong>
                    <asp:Label ID="FileUploadURLLabel" runat="server" Text='<%# Bind("FileUploadURL") %>' />
                    <br />
                    <strong>OriginalFilenames:</strong>
                    <asp:Label ID="OriginalFilenamesLabel" runat="server" Text='<%# Bind("OriginalFilenames") %>' />
                    <br />
                    <strong>OptionalDownloadURLs:</strong>
                    <asp:Label ID="OptionalDownloadURLsLabel" runat="server" Text='<%# Bind("OptionalDownloadURLs") %>' />
                    <br />
                    <strong>FTPUsername:</strong>
                    <asp:Label ID="FTPUsernameLabel" runat="server" Text='<%# Bind("FTPUsername") %>' />
                    <br />
                    <strong>FTPPassword:</strong>
                    <asp:Label ID="FTPPasswordLabel" runat="server" Text='<%# Bind("FTPPassword") %>' />
                    <br />
                    <strong>ClientNotes:</strong>
                    <asp:Label ID="ClientNotesLabel" runat="server" Text='<%# Bind("ClientNotes") %>' />
                    <br />
                    <strong>URLUploadedFileReference:</strong>
                    <asp:Label ID="URLUploadedFileReferenceLabel" runat="server" Text='<%# Bind("URLUploadedFileReference") %>' />
                    <br />
                    <strong>ProxyHQFileReference:</strong>
                    <asp:Label ID="ProxyHQFileReferenceLabel" runat="server" Text='<%# Bind("ProxyHQFileReference") %>' />
                    <br />
                    <strong>ProxyLQFileReference:</strong>
                    <asp:Label ID="ProxyLQFileReferenceLabel" runat="server" Text='<%# Bind("ProxyLQFileReference") %>' />
                    <br />
                    <strong>ProxyAudioOnlyFileReference:</strong>
                    <asp:Label ID="ProxyAudioOnlyFileReferenceLabel" runat="server" Text='<%# Bind("ProxyAudioOnlyFileReference") %>' />
                    <br />
                    <strong>ShortTitle:</strong>
                    <asp:Label ID="ShortTitleLabel" runat="server" Text='<%# Bind("ShortTitle") %>' />
                    <br />
                    <strong>LongTitle:</strong>
                    <asp:Label ID="LongTitleLabel" runat="server" Text='<%# Bind("LongTitle") %>' />
                    <br />
                    <strong>Status:</strong>
                    <asp:Label ID="StatusLabel" runat="server" Text='<%# Bind("Status") %>' />
                    <br />
                    <strong>TypingDeadline:</strong>
                    <asp:Label ID="TypingDeadlineLabel" runat="server" Text='<%# Bind("TypingDeadline") %>' />
                    <br />
                    <strong>TypingETA:</strong>
                    <asp:Label ID="TypingETALabel" runat="server" Text='<%# Bind("TypingETA") %>' />
                    <br />
                    <strong>RawTranscriptFileReference:</strong>
                    <asp:Label ID="RawTranscriptFileReferenceLabel" runat="server" Text='<%# Bind("RawTranscriptFileReference") %>' />
                    <br />
                    <strong>ProofedTranscriptFileReference:</strong>
                    <asp:Label ID="ProofedTranscriptFileReferenceLabel" runat="server" Text='<%# Bind("ProofedTranscriptFileReference") %>' />
                    <br />
                    <strong>TimecodeFileReference:</strong>
                    <asp:Label ID="TimecodeFileReferenceLabel" runat="server" Text='<%# Bind("TimecodeFileReference") %>' />
                    <br />
                    <strong>ArrivalDate:</strong>
                    <asp:Label ID="ArrivalDateLabel" runat="server" Text='<%# Bind("ArrivalDate") %>' />
                    <br />
                    <strong>ReadyToTypeDate:</strong>
                    <asp:Label ID="ReadyToTypeDateLabel" runat="server" Text='<%# Bind("ReadyToTypeDate") %>' />
                    <br />
                    <strong>StartDate:</strong>
                    <asp:Label ID="StartDateLabel" runat="server" Text='<%# Bind("StartDate") %>' />
                    <br />
                    <strong>Deadline:</strong>
                    <asp:Label ID="DeadlineLabel" runat="server" Text='<%# Bind("Deadline") %>' />
                    <br />
                    <strong>TypedDate:</strong>
                    <asp:Label ID="TypedDateLabel" runat="server" Text='<%# Bind("TypedDate") %>' />
                    <br />
                    <strong>ProofedDate:</strong>
                    <asp:Label ID="ProofedDateLabel" runat="server" Text='<%# Bind("ProofedDate") %>' />
                    <br />
                    <strong>DeliveryDate:</strong>
                    <asp:Label ID="DeliveryDateLabel" runat="server" Text='<%# Bind("DeliveryDate") %>' />
                    <br />
                    <strong>Thumbnail:</strong>
                    <asp:Label ID="ThumbnailLabel" runat="server" Text='<%# Bind("Thumbnail") %>' />
                    <br />
                    <strong>TranscriptKeywords:</strong>
                    <asp:Label ID="TranscriptKeywordsLabel" runat="server" Text='<%# Bind("TranscriptKeywords") %>' />
                    <br />
                    <strong>Priority:</strong>
                    <asp:Label ID="PriorityLabel" runat="server" Text='<%# Bind("Priority") %>' />
                    <br />

                </ItemTemplate>
                <PagerStyle BackColor="#007FFF" ForeColor="White" HorizontalAlign="NotSet" BorderStyle="Groove" Font-Bold="True" Font-Size="Large" VerticalAlign="Middle" />
                <RowStyle BackColor="#F7F6F3" Font-Bold="False" />
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSourceViewCurrentJobs" runat="server" ConnectionString="<%$ ConnectionStrings:SiteSqlServer %>" SelectCommand="SELECT CSJobsDetails.JobDetailsID, CSJobs.ProgrammeID, CSJobsDetails.ProgrammeID AS ProgrammeID_JD, CSJobs.ProgrammeName, CSJobsDetails.DueDate, CSJobsDetails.OriginalFilenames, CSJobsDetails.TypistUserid, CSJobsDetails.Status, CSJobsDetails.ProofedTranscriptFileReference AS ProofedBy FROM CSJobs INNER JOIN CSJobsDetails ON CSJobs.ProgrammeID = CSJobsDetails.ProgrammeID ORDER BY CSJobsDetails.JobDetailsID DESC"></asp:SqlDataSource>
            <asp:GridView ID="GridViewViewCurrentJobs" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ProgrammeID_JD" DataSourceID="SqlDataSourceViewCurrentJobs" Width="100%" Visible="False">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:BoundField DataField="JobDetailsID" HeaderText="JobDetailsID" InsertVisible="False" ReadOnly="True" SortExpression="JobDetailsID" />
                    <asp:BoundField DataField="ProgrammeID" HeaderText="ProgrammeID" SortExpression="ProgrammeID" />
                    <asp:BoundField DataField="ProgrammeID_JD" HeaderText="ProgrammeID_JD" ReadOnly="True" SortExpression="ProgrammeID_JD" />
                    <asp:BoundField DataField="ProgrammeName" HeaderText="ProgrammeName" SortExpression="ProgrammeName" />
                    <asp:BoundField DataField="DueDate" HeaderText="DueDate" SortExpression="DueDate" />
                    <asp:BoundField DataField="OriginalFilenames" HeaderText="OriginalFilenames" SortExpression="OriginalFilenames" />
                    <asp:BoundField DataField="TypistUserid" HeaderText="TypistUserid" SortExpression="TypistUserid" />
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                    <asp:BoundField DataField="ProofedBy" HeaderText="ProofedBy" SortExpression="ProofedBy" />

                </Columns>
                <EmptyDataTemplate>
                    No Data - Empty Query
                </EmptyDataTemplate>
                <HeaderStyle BackColor="#007FFF" Font-Bold="True" Font-Size="Medium" ForeColor="White" BorderColor="Black" BorderWidth="1" BorderStyle="Solid" Font-Strikeout="False" Font-Underline="False" />
            </asp:GridView>
           
            <asp:SqlDataSource ID="SqlDataSourceListofTranscriptionists" runat="server" ConnectionString="<%$ ConnectionStrings:SiteSqlServer %>" SelectCommand="Select DISTINCT U.UserID, U.Username, UR.RoleID from Users as U,Roles as R, UserRoles as UR WHERE U.UserID = UR.UserID and U.UserID = UR.UserID AND UR.RoleID = 5"></asp:SqlDataSource>
            <asp:DropDownList ID="DropDownListListofTranscriptionists" runat="server" DataSourceID="SqlDataSourceListofTranscriptionists" DataTextField="Username" DataValueField="Username" Visible="false"></asp:DropDownList>

           
            <asp:Panel ID="PanelShowPaths" runat="server" Visible="false">
                <h6>Transcripts 24/7 Web Application Physical Folders</h6>
                FTP Text Update Physical Path:
                <asp:Label ID="lblFTPTextAppPath" runat="server" Text=""></asp:Label><br />

                Hosts Map Path:
                <asp:Label ID="lbltheHostMapPath" runat="server" Text=""></asp:Label><br />

                Hosts Physical Path:
                <asp:Label ID="lblthePhysicalPath" runat="server" Text=""></asp:Label><br />

                Application Path:
                <asp:Label ID="lbltheAppPath" runat="server" Text=""></asp:Label><br />

                Hosts Install Map Path: 
                <asp:Label ID="lbltheInstallMapPath" runat="server" Text=""></asp:Label><br />

                Request Path and Query:
                <asp:Label ID="lblthePathQuery" runat="server" Text=""></asp:Label><br />


            </asp:Panel>
            
            <asp:SqlDataSource ID="SqlDataSourceSubmittedDocuments" runat="server" ConnectionString="<%$ ConnectionStrings:SiteSqlServer %>" SelectCommand="SELECT id, Name, ContentType, Data, DataText, Username, EMailAddress, DateTime, FileSize, SortOrder, TaskID, IsActive FROM CSTypistsFiles ORDER BY id DESC"></asp:SqlDataSource>
            <asp:GridView ID="GridViewSubmittedDocuments" runat="server" Width="100%" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSourceSubmittedDocuments" Visible="False" CellPadding="1" CellSpacing="1" Font-Size="Small" PageSize="30">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="Doc Number" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="DateTime" HeaderText="Submit Date Time" SortExpression="DateTime" />
                    <asp:BoundField DataField="Name" HeaderText="Doc Name" SortExpression="Name" />
                    <asp:BoundField DataField="FileSize" HeaderText="File Size" SortExpression="FileSize" />
                    <asp:BoundField DataField="ContentType" HeaderText="Application Content Type" SortExpression="ContentType" />
                    <asp:BoundField DataField="DataText" HeaderText="Data Text" SortExpression="DataText">
                        <ItemStyle CssClass="hidden" />
                        <HeaderStyle CssClass="hidden" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Username" HeaderText="Submitted By" SortExpression="Username" />
                    <asp:BoundField DataField="EMailAddress" HeaderText="Submitted By E-Mail Address" SortExpression="EMailAddress" />
                    <asp:BoundField DataField="SortOrder" HeaderText="SortOrder" SortExpression="SortOrder">
                        <ItemStyle CssClass="hidden" />
                        <HeaderStyle CssClass="hidden" />
                    </asp:BoundField>
                    <asp:BoundField DataField="TaskID" HeaderText="TaskID" SortExpression="TaskID">
                        <ItemStyle CssClass="hidden" />
                        <HeaderStyle CssClass="hidden" />
                    </asp:BoundField>
                    <asp:CheckBoxField DataField="IsActive" HeaderText="IsActive" SortExpression="IsActive" />
                </Columns>
                <HeaderStyle Font-Bold="True" Font-Size="Small" />
                <PagerSettings Mode="NextPreviousFirstLast" />
            </asp:GridView>
            
            <asp:ListBox ID="ListBoxRushesStationTextUpdates" runat="server" Visible="false"></asp:ListBox>
            <br />
        </div>

    </fieldset>



</div>


