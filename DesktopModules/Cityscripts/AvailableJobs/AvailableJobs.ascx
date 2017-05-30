<%@ Control Language="C#" AutoEventWireup="false" Inherits="Cityscripts.AvailableJobs.AvailableJobs" CodeFile="AvailableJobs.ascx.cs" %>

<%--<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>--%>
<asp:Panel ID="PanelCSAdminConsole" runat="server" BackColor="#6699FF" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Height="100%" HorizontalAlign="Center" ScrollBars="Auto" Width="100%">
    <asp:CheckBox ID="CheckBoxCreateNewJob" runat="server" AutoPostBack="true" Text="Create New Job" OnCheckedChanged="CheckBoxCreateNewJob_CheckedChanged" Font-Size="Large" />&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:CheckBox ID="CheckBoxEditTypistMediaInfo" runat="server" OnCheckedChanged="CheckBoxEditTypistMediaInfo_CheckedChanged" AutoPostBack="True" Text="Edit Incoming Job Details" Font-Size="Large" />&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:CheckBox ID="CheckBoxAssignJobToUser" runat="server" Text="Assign Task To User" AutoPostBack="True" OnCheckedChanged="CheckBoxAssignJobToUser_CheckedChanged" Font-Size="Large" />
</asp:Panel>
<br />
<asp:Panel ID="PanelEditIncomingJob" runat="server" Visible="false" ScrollBars="Auto">
    <asp:SqlDataSource ID="SqlDataSourceEditIncomingJob" runat="server" ConnectionString="<%$ ConnectionStrings:SiteSqlServer %>" SelectCommand="SELECT CSJobs.ProgrammeName, CSJobs.ProgrammeDescription, CSJobsDetails.JobDetailsID, CSJobsDetails.Userid, CSJobsDetails.JobID, CSJobsDetails.JobType, CSJobsDetails.ProgrammeID, CSJobsDetails.FileSubmissionPreference, CSJobsDetails.MediaFormat, CSJobsDetails.TranscriberFormat, CSJobsDetails.MediaFileFormat, CSJobsDetails.MediaFileHours, CSJobsDetails.MediaFileMinutes, CSJobsDetails.MediaFileSeconds, CSJobsDetails.TodaysDate, CSJobsDetails.TodaysDateTime, CSJobsDetails.DueDate, CSJobsDetails.DueDateTime, CSJobsDetails.SpecialInstructions, CSJobsDetails.TaskID, CSJobsDetails.DurationHours, CSJobsDetails.DurationMinutes, CSJobsDetails.DurationSeconds, CSJobsDetails.DurationTotal, CSJobsDetails.TypingProgress, CSJobsDetails.TimecodeStatus, CSJobsDetails.WordCount, CSJobsDetails.RateCostPerWord, CSJobsDetails.FixedCostPerMinute, CSJobsDetails.ChargingMethod, CSJobsDetails.ActualCost, CSJobsDetails.TypistUserid, CSJobsDetails.StartPositionSS, CSJobsDetails.StartPosition, CSJobsDetails.EndPositionSS, CSJobsDetails.EndPosition, CSJobsDetails.FileUploadURL, CSJobsDetails.OriginalFilenames, CSJobsDetails.OptionalDownloadURLs, CSJobsDetails.FTPUsername, CSJobsDetails.FTPPassword, CSJobsDetails.ClientNotes, CSJobsDetails.URLUploadedFileReference, CSJobsDetails.ProxyHQFileReference, CSJobsDetails.ProxyLQFileReference, CSJobsDetails.ProxyAudioOnlyFileReference, CSJobsDetails.ShortTitle, CSJobsDetails.LongTitle, CSJobsDetails.Status, CSJobsDetails.TypingDeadline, CSJobsDetails.TypingETA, CSJobsDetails.RawTranscriptFileReference, CSJobsDetails.ProofedTranscriptFileReference, CSJobsDetails.TimecodeFileReference, CSJobsDetails.ArrivalDate, CSJobsDetails.ReadyToTypeDate, CSJobsDetails.StartDate, CSJobsDetails.Deadline, CSJobsDetails.TypedDate, CSJobsDetails.ProofedDate, CSJobsDetails.DeliveryDate, CSJobsDetails.Thumbnail, CSJobsDetails.TranscriptKeywords, CSJobsDetails.Priority FROM CSJobsDetails INNER JOIN CSJobs ON CSJobsDetails.JobID = CSJobs.JobID ORDER BY CSJobsDetails.JobDetailsID DESC" UpdateCommand="UPDATE CSJobsDetails SET JobType = @JobType, ProgrammeID = @ProgrammeID, FileSubmissionPreference = @FileSubmissionPreference, MediaFormat = @MediaFormat, TranscriberFormat = @TranscriberFormat, MediaFileFormat = @MediaFileFormat, MediaFileHours = @MediaFileHours, MediaFileMinutes = @MediaFileMinutes, MediaFileSeconds = @MediaFileSeconds, TodaysDate = @TodaysDate, TodaysDateTime = @TodaysDateTime, DueDate = @DueDate, DueDateTime = @DueDateTime, SpecialInstructions = @SpecialInstructions, TaskID = @TaskID, DurationHours = @DurationHours, DurationMinutes = @DurationMinutes, DurationSeconds = @DurationSeconds, DurationTotal = @DurationTotal, TypingProgress = @TypingProgress, TimecodeStatus = @TimecodeStatus, WordCount = @WordCount, RateCostPerWord = @RateCostPerWord, FixedCostPerMinute = @FixedCostPerMinute, ChargingMethod = @ChargingMethod, ActualCost = @ActualCost, TypistUserid = @TypistUserid, StartPositionSS = @StartPositionSS, StartPosition = @StartPosition, EndPositionSS = @EndPositionSS, EndPosition = @EndPosition, FileUploadURL = FileUploadURL, OriginalFilenames = @OriginalFilenames, OptionalDownloadURLs = @OptionalDownloadURLs, FTPUsername = @FTPUsername, FTPPassword = @FTPPassword, ClientNotes = @ClientNotes, URLUploadedFileReference = @URLUploadedFileReference, ProxyHQFileReference = @ProxyHQFileReference, ProxyLQFileReference = @ProxyLQFileReference, ProxyAudioOnlyFileReference = @ProxyAudioOnlyFileReference, ShortTitle = @ShortTitle, LongTitle = @LongTitle, Status = @Status, TypingDeadline = @TypingDeadline, TypingETA = @TypingETA, RawTranscriptFileReference = @RawTranscriptFileReference, ProofedTranscriptFileReference = @ProofedTranscriptFileReference, TimecodeFileReference = @TimecodeFileReference, ArrivalDate = @ArrivalDate, ReadyToTypeDate = @ReadyToTypeDate, StartDate = @StartDate, Deadline = @Deadline, TypedDate = @TypedDate, ProofedDate = @ProofedDate, DeliveryDate = @DeliveryDate, Thumbnail = @Thumbnail, TranscriptKeywords = @TranscriptKeywords, Priority = @Priority WHERE (ProgrammeID = @ProgrammeID)">
        <UpdateParameters>
            <asp:Parameter Name="JobType" />
            <asp:Parameter Name="ProgrammeID" />
            <asp:Parameter Name="FileSubmissionPreference" />
            <asp:Parameter Name="MediaFormat" />
            <asp:Parameter Name="TranscriberFormat" />
            <asp:Parameter Name="MediaFileFormat" />
            <asp:Parameter Name="MediaFileHours" />
            <asp:Parameter Name="MediaFileMinutes" />
            <asp:Parameter Name="MediaFileSeconds" />
            <asp:Parameter Name="TodaysDate" />
            <asp:Parameter Name="TodaysDateTime" />
            <asp:Parameter Name="DueDate" />
            <asp:Parameter Name="DueDateTime" />
            <asp:Parameter Name="SpecialInstructions" />
            <asp:Parameter Name="TaskID" />
            <asp:Parameter Name="DurationHours" />
            <asp:Parameter Name="DurationMinutes" />
            <asp:Parameter Name="DurationSeconds" />
            <asp:Parameter Name="DurationTotal" />
            <asp:Parameter Name="TypingProgress" />
            <asp:Parameter Name="TimecodeStatus" />
            <asp:Parameter Name="WordCount" />
            <asp:Parameter Name="RateCostPerWord" />
            <asp:Parameter Name="FixedCostPerMinute" />
            <asp:Parameter Name="ChargingMethod" />
            <asp:Parameter Name="ActualCost" />
            <asp:Parameter Name="TypistUserid" />
            <asp:Parameter Name="StartPositionSS" />
            <asp:Parameter Name="StartPosition" />
            <asp:Parameter Name="EndPositionSS" />
            <asp:Parameter Name="EndPosition" />
            <asp:Parameter Name="OriginalFilenames" />
            <asp:Parameter Name="OptionalDownloadURLs" />
            <asp:Parameter Name="FTPUsername" />
            <asp:Parameter Name="FTPPassword" />
            <asp:Parameter Name="ClientNotes" />
            <asp:Parameter Name="URLUploadedFileReference" />
            <asp:Parameter Name="ProxyHQFileReference" />
            <asp:Parameter Name="ProxyLQFileReference" />
            <asp:Parameter Name="ProxyAudioOnlyFileReference" />
            <asp:Parameter Name="ShortTitle" />
            <asp:Parameter Name="LongTitle" />
            <asp:Parameter Name="Status" />
            <asp:Parameter Name="TypingDeadline" />
            <asp:Parameter Name="TypingETA" />
            <asp:Parameter Name="RawTranscriptFileReference" />
            <asp:Parameter Name="ProofedTranscriptFileReference" />
            <asp:Parameter Name="TimecodeFileReference" />
            <asp:Parameter Name="ArrivalDate" />
            <asp:Parameter Name="ReadyToTypeDate" />
            <asp:Parameter Name="StartDate" />
            <asp:Parameter Name="Deadline" />
            <asp:Parameter Name="TypedDate" />
            <asp:Parameter Name="ProofedDate" />
            <asp:Parameter Name="DeliveryDate" />
            <asp:Parameter Name="Thumbnail" />
            <asp:Parameter Name="TranscriptKeywords" />
            <asp:Parameter Name="Priority" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormViewEditIncomingJob" runat="server" AllowPaging="True" DataKeyNames="ProgrammeID" DataSourceID="SqlDataSourceEditIncomingJob" Width="100%" PagerSettings-Position="TopAndBottom" OnItemUpdated="FormViewEditIncomingJob_ItemUpdated">
        <EditItemTemplate>
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" ForeColor="#6699FF" Font-Bold="True" />
            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" ForeColor="#6699FF" Font-Bold="True" /><br />
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">Programme Name:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="ProgrammeNameTextBox" runat="server" Text='<%# Bind("ProgrammeName") %>' ReadOnly="True" /><span style="font-weight: 600; color: silver">*ReadOnly</span></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">Programme Description:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" Height="100px" TextMode="MultiLine" ID="ProgrammeDescriptionTextBox" runat="server" Text='<%# Bind("ProgrammeDescription") %>' ReadOnly="True" /><span style="font-weight: 600; color: silver">*ReadOnly</span></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">Job Details ID:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="JobDetailsIDLabel1" runat="server" Text='<%# Eval("JobDetailsID") %>' ReadOnly="True" /><span style="font-weight: 600; color: silver">*ReadOnly</span></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">Userid:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="UseridTextBox" runat="server" Text='<%# Bind("Userid") %>' ReadOnly="True" /><span style="font-weight: 600; color: silver">*ReadOnly</span></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">JobID:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="JobIDTextBox" runat="server" Text='<%# Bind("JobID") %>' ReadOnly="True" /><span style="font-weight: 600; color: silver">*ReadOnly</span></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">JobType:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:DropDownList ID="JobTypeDDL" runat="server" SelectedValue='<%# Bind("JobType") %>'>
                    <asp:ListItem>Video Logging</asp:ListItem>
                    <asp:ListItem>Post Production Scripts</asp:ListItem>
                    <asp:ListItem>Transcriptions</asp:ListItem>
                    <asp:ListItem>Translations</asp:ListItem>
                    <asp:ListItem>Subtitling</asp:ListItem>
                </asp:DropDownList><%--<asp:TextBox width="350px"  ID="JobTypeTextBox" runat="server" Text='<%# Bind("JobType") %>' />--%>
                <br />
            </span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">ProgrammeID:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox ID="ProgrammeIDLabel1" runat="server" Text='<%# Eval("ProgrammeID") %>' /></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">FileSubmissionPreference:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top"><%--<asp:TextBox width="350px"  ID="FileSubmissionPreferenceTextBox" runat="server" Text='<%# Bind("FileSubmissionPreference") %>' />--%>
                <asp:DropDownList ID="FileSubmissionPreferenceDDList" runat="server" SelectedValue='<%# Bind("FileSubmissionPreference") %>'>
                    <asp:ListItem Value="Drop at Office">Drop at Office</asp:ListItem>
                    <asp:ListItem Value="Cloud Upload Utility">Cloud Upload Utility</asp:ListItem>
                    <asp:ListItem Value="FTP Access">FTP Access</asp:ListItem>
                    <asp:ListItem Value="WeTransfer Web Service">WeTransfer Web Service</asp:ListItem>
                    <asp:ListItem Value="Unsure">Unsure</asp:ListItem>
                </asp:DropDownList>
            </span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">MediaFormat:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top"><%--<asp:TextBox width="350px"  ID="MediaFormatTextBox" runat="server" Text='<%# Bind("MediaFormat") %>' />--%>
                <asp:DropDownList ID="DropDownListMediaFormat" runat="server" SelectedValue='<%# Bind("MediaFormat") %>'>
                    <asp:ListItem>QuickTime &mdash; .mov or .qt</asp:ListItem>
                    <asp:ListItem>Ogg Video &mdash; .ogg or .ogv</asp:ListItem>
                    <asp:ListItem>Audio Video Interleave &mdash; .avi</asp:ListItem>
                    <asp:ListItem>Advanced Video Coding High Definition &mdash; .avchd</asp:ListItem>
                    <asp:ListItem>Windows Media &mdash; .wma or .wmv</asp:ListItem>
                    <asp:ListItem>Flash Video &mdash; .flv</asp:ListItem>
                    <asp:ListItem>Moving Picture Experts Group &mdash; .mpeg</asp:ListItem>
                    <asp:ListItem>Multiple Formats</asp:ListItem>
                    <asp:ListItem>Other &mdash; Unlisted Format</asp:ListItem>
                </asp:DropDownList>
            </span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">TranscriberFormat:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top"><%--<asp:TextBox width="350px"  ID="TranscriberFormatTextBox" runat="server" Text='<%# Bind("TranscriberFormat") %>' />--%>
                <asp:DropDownList ID="DropDownListTranscriberFormat" runat="server" SelectedValue='<%# Bind("TranscriberFormat") %>'>
                    <asp:ListItem>Interviewer Non-Verbatim</asp:ListItem>
                    <asp:ListItem>Verbatim</asp:ListItem>
                    <asp:ListItem>Non-Verbatim</asp:ListItem>
                    <asp:ListItem>Custom</asp:ListItem>
                </asp:DropDownList>
            </span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">MediaFileFormat:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top"><%--<asp:TextBox width="350px"  ID="MediaFileFormatTextBox" runat="server" Text='<%# Bind("MediaFileFormat") %>' />--%>
                <asp:DropDownList ID="DropDownListMediaFileFormat" runat="server" SelectedValue='<%# Bind("MediaFileFormat") %>'>
                    <asp:ListItem>Microsoft Word &mdash; .docx</asp:ListItem>
                    <asp:ListItem>Microsoft Word &mdash; .doc</asp:ListItem>
                    <asp:ListItem>Text Document</asp:ListItem>
                    <asp:ListItem>Apache Software Foundation &mdash; Open Office</asp:ListItem>
                    <asp:ListItem>Final Cut Pro &mdash; .srt</asp:ListItem>
                    <asp:ListItem>Scenarist Closed Caption File &mdash; .scc</asp:ListItem>
                    <asp:ListItem>MacCaption VANC File &mdash; .mcc</asp:ListItem>
                    <asp:ListItem>SMPTE Timed Text &mdash; .xml</asp:ListItem>
                    <asp:ListItem>EBU N19 Subtitle &mdash; .stl</asp:ListItem>
                    <asp:ListItem>Multiple Formats</asp:ListItem>
                    <asp:ListItem>Other &mdash; Unlisted Format</asp:ListItem>
                </asp:DropDownList>
            </span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">MediaFileHours:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="MediaFileHoursTextBox" runat="server" Text='<%# Bind("MediaFileHours") %>' /></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">MediaFileMinutes:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="MediaFileMinutesTextBox" runat="server" Text='<%# Bind("MediaFileMinutes") %>' /></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">MediaFileSeconds:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="MediaFileSecondsTextBox" runat="server" Text='<%# Bind("MediaFileSeconds") %>' /></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">TodaysDate:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="TodaysDateTextBox" runat="server" Text='<%# Bind("TodaysDate") %>' />

            </span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">TodaysDateTime:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="TodaysDateTimeTextBox" runat="server" Text='<%# Bind("TodaysDateTime") %>' /></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">DueDate:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="DueDateTextBox" runat="server" Text='<%# Bind("DueDate") %>' /></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">DueDateTime:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="DueDateTimeTextBox" runat="server" Text='<%# Bind("DueDateTime") %>' /></span></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">SpecialInstructions:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" Height="100px" TextMode="MultiLine" ID="SpecialInstructionsTextBox" runat="server" Text='<%# Bind("SpecialInstructions") %>' /></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">TaskID:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="TaskIDTextBox" runat="server" Text='<%# Bind("TaskID") %>' /></span>
            <br />
            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">DurationTotal:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="DurationTotalTextBox" runat="server" Text='<%# Bind("DurationTotal") %>' MaxLength="50" /><span style="font-weight: 600; color: silver">*Required</span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorDurationTotalTextBox" runat="server" ErrorMessage="* Required Field - Enter files length in time!" ControlToValidate="DurationTotalTextBox" SetFocusOnError="True" Font-Bold="True" Font-Italic="True" Display="Dynamic" ForeColor="#CC0000" Font-Size="X-Small"></asp:RequiredFieldValidator></span>
            <br />
            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">StartPositionSS:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="StartPositionSSTextBox" runat="server" Text='<%# Bind("StartPositionSS") %>' /><span style="font-weight: 600; color: silver">*Required</span><asp:RequiredFieldValidator ID="RequiredFieldValidatorStartPositionSS" runat="server" ErrorMessage="* Required Field - Enter files start position timecode!" ControlToValidate="StartPositionSSTextBox" SetFocusOnError="True" Font-Bold="True" Font-Italic="True" Display="Dynamic" ForeColor="#CC0000" Font-Size="X-Small"></asp:RequiredFieldValidator></span>
            <br />
            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">EndPositionSS:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="EndPositionSSTextBox" runat="server" Text='<%# Bind("EndPositionSS") %>' /><span style="font-weight: 600; color: silver">*Required</span><asp:RequiredFieldValidator ID="RequiredFieldValidatorEndPositionSS" runat="server" ErrorMessage="* Required Field - Enter files end position timecode!" ControlToValidate="EndPositionSSTextBox" SetFocusOnError="True" Font-Bold="True" Font-Italic="True" Display="Dynamic" ForeColor="#CC0000" Font-Size="X-Small"></asp:RequiredFieldValidator></span>
            <br />
            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">Filenames:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="OriginalFilenamesTextBox" runat="server" Text='<%# Bind("OriginalFilenames") %>' /><span style="font-weight: 600; color: silver">*Required</span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorOriginalFilenames" runat="server" ErrorMessage="* Required Field - Enter a filename for the URL" ControlToValidate="OriginalFilenamesTextBox" SetFocusOnError="True" Font-Bold="True" Font-Italic="True" Display="Dynamic" ForeColor="#CC0000" Font-Size="X-Small"></asp:RequiredFieldValidator>
            </span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">Download URL:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="OptionalDownloadURLsTextBox" runat="server" Text='<%# Bind("OptionalDownloadURLs") %>' /><span style="font-weight: 600; color: silver">*Required</span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorOptionalDownloadURLs" runat="server" ErrorMessage="* Required Field - Please Enter the URL for the Download" ControlToValidate="OptionalDownloadURLsTextBox" SetFocusOnError="True" Font-Bold="True" Font-Italic="True" Display="Dynamic" ForeColor="#CC0000" Font-Size="X-Small"></asp:RequiredFieldValidator>

            </span>
            <br />
            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">ClientNotes:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" Height="100px" TextMode="MultiLine" ID="ClientNotesTextBox" runat="server" Text='<%# Bind("ClientNotes") %>' /><span style="font-weight: 600; color: silver">*Required</span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Required Field - Enter Client Notes!" ControlToValidate="ClientNotesTextBox" SetFocusOnError="True" Font-Bold="True" Font-Italic="True" Display="Dynamic" ForeColor="#CC0000" Font-Size="X-Small"></asp:RequiredFieldValidator>
            </span>
            <br />


            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">DurationHours:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="DurationHoursTextBox" runat="server" Text='<%# Bind("DurationHours") %>' /></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">DurationMinutes:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="DurationMinutesTextBox" runat="server" Text='<%# Bind("DurationMinutes") %>' /></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">DurationSeconds:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="DurationSecondsTextBox" runat="server" Text='<%# Bind("DurationSeconds") %>' /></span>
            <br />


            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">TypingProgress:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="TypingProgressTextBox" runat="server" Text='<%# Bind("TypingProgress") %>' /></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">TimecodeStatus:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="TimecodeStatusTextBox" runat="server" Text='<%# Bind("TimecodeStatus") %>' /></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">WordCount:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="WordCountTextBox" runat="server" Text='<%# Bind("WordCount") %>' /></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">RateCostPerWord:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="RateCostPerWordTextBox" runat="server" Text='<%# Bind("RateCostPerWord") %>' /></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">FixedCostPerMinute:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="FixedCostPerMinuteTextBox" runat="server" Text='<%# Bind("FixedCostPerMinute") %>' /></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">ChargingMethod:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="ChargingMethodTextBox" runat="server" Text='<%# Bind("ChargingMethod") %>' /></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">ActualCost:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="ActualCostTextBox" runat="server" Text='<%# Bind("ActualCost") %>' /></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">TypistUserid:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="TypistUseridTextBox" runat="server" Text='<%# Bind("TypistUserid") %>' /></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">StartPosition:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="StartPositionTextBox" runat="server" Text='<%# Bind("StartPosition") %>' ToolTip="00:00:10:00" /></span>
            <br />



            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">EndPosition:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="EndPositionTextBox" runat="server" Text='<%# Bind("EndPosition") %>' ToolTip="00:00:50:00" /></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">FileUploadURL:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="FileUploadURLTextBox" runat="server" Text='<%# Bind("FileUploadURL") %>' /></span>
            <br />



            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">FTPUsername:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="FTPUsernameTextBox" runat="server" Text='<%# Bind("FTPUsername") %>' /></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">FTPPassword:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="FTPPasswordTextBox" runat="server" Text='<%# Bind("FTPPassword") %>' /></span>
            <br />



            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">URLUploadedFileReference:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="URLUploadedFileReferenceTextBox" runat="server" Text='<%# Bind("URLUploadedFileReference") %>' /></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">ProxyHQFileReference:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="ProxyHQFileReferenceTextBox" runat="server" Text='<%# Bind("ProxyHQFileReference") %>' /></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">ProxyLQFileReference:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="ProxyLQFileReferenceTextBox" runat="server" Text='<%# Bind("ProxyLQFileReference") %>' /></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">ProxyAudioOnlyFileReference:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="ProxyAudioOnlyFileReferenceTextBox" runat="server" Text='<%# Bind("ProxyAudioOnlyFileReference") %>' /></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">ShortTitle:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="ShortTitleTextBox" runat="server" Text='<%# Bind("ShortTitle") %>' /></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">LongTitle:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="LongTitleTextBox" runat="server" Text='<%# Bind("LongTitle") %>' /></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">Status:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="StatusTextBox" runat="server" Text='<%# Bind("Status") %>' />

            </span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">TypingDeadline:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="TypingDeadlineTextBox" runat="server" Text='<%# Bind("TypingDeadline") %>' /></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">TypingETA:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="TypingETATextBox" runat="server" Text='<%# Bind("TypingETA") %>' /></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">RawTranscriptFileReference:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="RawTranscriptFileReferenceTextBox" runat="server" Text='<%# Bind("RawTranscriptFileReference") %>' /></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">ProofedTranscriptFileReference:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="ProofedTranscriptFileReferenceTextBox" runat="server" Text='<%# Bind("ProofedTranscriptFileReference") %>' /></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">TimecodeFileReference:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="TimecodeFileReferenceTextBox" runat="server" Text='<%# Bind("TimecodeFileReference") %>' /></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">ArrivalDate:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="ArrivalDateTextBox" runat="server" Text='<%# Bind("ArrivalDate") %>' /></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">ReadyToTypeDate:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="ReadyToTypeDateTextBox" runat="server" Text='<%# Bind("ReadyToTypeDate") %>' /></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">StartDate:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="StartDateTextBox" runat="server" Text='<%# Bind("StartDate") %>' /></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">Deadline:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="DeadlineTextBox" runat="server" Text='<%# Bind("Deadline") %>' /></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">TypedDate:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="TypedDateTextBox" runat="server" Text='<%# Bind("TypedDate") %>' /></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">ProofedDate:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="ProofedDateTextBox" runat="server" Text='<%# Bind("ProofedDate") %>' /></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">DeliveryDate:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="DeliveryDateTextBox" runat="server" Text='<%# Bind("DeliveryDate") %>' /></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">Thumbnail:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="ThumbnailTextBox" runat="server" Text='<%# Bind("Thumbnail") %>' /></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">TranscriptKeywords:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" Height="100px" TextMode="MultiLine" ID="TranscriptKeywordsTextBox" runat="server" Text='<%# Bind("TranscriptKeywords") %>' /></span>
            <br />

            <span style="display: inline-block; width: 200px; border: 1px solid black; text-decoration: solid; vertical-align: text-top; text-align: right; color: #6699FF; font-size: small; font-weight: 600">Priority:</span>
            <span style="display: inline-block; width: 600px; text-decoration: solid; vertical-align: text-top">
                <asp:TextBox Width="350px" ID="PriorityTextBox" runat="server" Text='<%# Bind("Priority") %>' /></span>
            <br />

        </EditItemTemplate>
        <EmptyDataTemplate>
            No Data Returned.
        </EmptyDataTemplate>
        <InsertItemTemplate>
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" Font-Size="Large" Font-Bold="True" ForeColor="#6699FF" /><br />

            <span style="display: inline-block; width: 150px; text-align: right; vertical-align: top; border: 1px solid black; font-size: x-small; color: #6699FF">Programme Name:</span><span style="width: 800px"><asp:Label ID="ProgrammeNameLabel" runat="server" Text='<%# Bind("ProgrammeName") %>' /></span><br />
            <span style="display: inline-block; width: 150px; text-align: right; vertical-align: top; border: 1px solid black; font-size: x-small; color: #6699FF">Programme Description:</span><span style="width: 800px">
                <asp:Label ID="ProgrammeDescriptionLabel" runat="server" Text='<%# Bind("ProgrammeDescription") %>' Width="800px" /></span><br />
            <span style="display: inline-block; width: 150px; text-align: right; vertical-align: top; border: 1px solid black; font-size: x-small; color: #6699FF">Job Type:</span><span style="width: 800px">
                <asp:Label ID="JobTypeLabel" runat="server" Text='<%# Bind("JobType") %>' /></span><br />
            <span style="display: inline-block; width: 150px; text-align: right; vertical-align: top; border: 1px solid black; font-size: x-small; color: #6699FF">Submission Preference:</span><span style="width: 800px">
                <asp:Label ID="FileSubmissionPreferenceLabel" runat="server" Text='<%# Bind("FileSubmissionPreference") %>' /></span><br />
            <span style="display: inline-block; width: 150px; text-align: right; vertical-align: top; border: 1px solid black; font-size: x-small; color: #6699FF">Media Format:</span><span style="width: 800px">
                <asp:Label ID="MediaFormatLabel" runat="server" Text='<%# Bind("MediaFormat") %>' /></span>
            <br />
            <span style="display: inline-block; width: 150px; text-align: right; vertical-align: top; border: 1px solid black; font-size: x-small; color: #6699FF">Transcribe Format:</span><span style="width: 800px">
                <asp:Label ID="TranscriberFormatLabel" runat="server" Text='<%# Bind("TranscriberFormat") %>' /></span><br />
            <span style="display: inline-block; width: 150px; text-align: right; vertical-align: top; border: 1px solid black; font-size: x-small; color: #6699FF">File Format:</span><span style="width: 800px">
                <asp:Label ID="MediaFileFormatLabel" runat="server" Text='<%# Bind("MediaFileFormat") %>' /></span><br />
            <span style="display: inline-block; width: 150px; text-align: right; vertical-align: top; border: 1px solid black; font-size: x-small; color: #6699FF">Media File Hours:</span><span style="width: 800px">
                <asp:Label ID="MediaFileHoursLabel" runat="server" Text='<%# Bind("MediaFileHours") %>' /></span><br />
            <span style="display: inline-block; width: 150px; text-align: right; vertical-align: top; border: 1px solid black; font-size: x-small; color: #6699FF">Media File Minutes:</span><span style="width: 800px">
                <asp:Label ID="MediaFileMinutesLabel" runat="server" Text='<%# Bind("MediaFileMinutes") %>' /></span><br />
            <%--<span style="display:inline-block;width:150px; text-align:right; border:1px solid black">MediaFileSeconds:</span><span style="width:800px"> <asp:Label ID="MediaFileSecondsLabel" runat="server" Text='<%# Bind("MediaFileSeconds") %>' /></span><br /> --%>
            <span style="display: inline-block; width: 150px; text-align: right; vertical-align: top; border: 1px solid black; font-size: x-small; color: #6699FF">Created Date:</span><span style="width: 800px">
                <asp:Label ID="TodaysDateLabel" runat="server" Text='<%# Bind("TodaysDate") %>' /></span>
            <br />
            <span style="display: inline-block; width: 150px; text-align: right; vertical-align: top; border: 1px solid black; font-size: x-small; color: #6699FF">Created Time:</span><span style="width: 800px">
                <asp:Label ID="TodaysDateTimeLabel" runat="server" Text='<%# Bind("TodaysDateTime") %>' /></span><br />
            <span style="display: inline-block; width: 150px; text-align: right; vertical-align: top; border: 1px solid black; font-size: x-small; color: #6699FF">Due Date:</span><span style="width: 800px"><asp:Label ID="DueDateLabel" runat="server" Text='<%# Bind("DueDate") %>' /></span>
            <br />
            <span style="display: inline-block; width: 150px; text-align: right; vertical-align: top; border: 1px solid black; font-size: x-small; color: #6699FF">Due Time:</span><span style="width: 800px"><asp:Label ID="DueDateTimeLabel" runat="server" Text='<%# Bind("DueDateTime") %>' /></span><br />
            <span style="display: inline-block; width: 150px; text-align: right; vertical-align: top; border: 1px solid black; font-size: x-small; color: #6699FF">Special Instructions:</span><span style="width: 800px"><asp:Label ID="SpecialInstructionsLabel" runat="server" Text='<%# Bind("SpecialInstructions") %>' Width="800px" /></span><br />

        </ItemTemplate>
        <PagerStyle BorderStyle="Solid" BorderWidth="1px" Font-Size="Large" ForeColor="#6699FF" Font-Bold="True" />
    </asp:FormView>
</asp:Panel>

<asp:Panel ID="PanelAssignJobToUser" runat="server" Visible="false">
    <asp:SqlDataSource ID="SqlDataSourceCSGetTranscriptsGroupEMail" runat="server" ConnectionString="<%$ ConnectionStrings:SiteSqlServer %>" SelectCommand="CSGetTranscriptsGroupEMail" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    
    <asp:Label ID="lblTypistSelect" runat="server" Text="Choose a user to allocate a task to: " Font-Size="Large"  ForeColor="#6699FF" Font-Bold="true"></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSourceCSGetTranscriptsGroupEMail" DataTextField="Username" DataValueField="Email" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True" AppendDataBoundItems="True" Font-Bold="true">
        <asp:ListItem>Select Typist</asp:ListItem>
    </asp:DropDownList>
   <br />
    <asp:SqlDataSource ID="SqlDataSource1ViewCustJobDetails" runat="server" ConnectionString="<%$ ConnectionStrings:SiteSqlServer %>" SelectCommand="SELECT CSJobs.JobID, CSJobsDetails.JobID AS JobID1, CSJobsDetails.ProgrammeID, CSJobs.ProgrammeName, CSJobs.ProgrammeDescription, CSJobs.JobIsActive AS IsActive, CSJobsDetails.MediaFormat, CSJobsDetails.TranscriberFormat, CSJobsDetails.SpecialInstructions, CSJobsDetails.DurationTotal, CSJobsDetails.StartPositionSS, CSJobsDetails.EndPositionSS, CSJobsDetails.OptionalDownloadURLs, CSJobsDetails.OriginalFilenames, CSJobsDetails.ClientNotes FROM CSJobsDetails INNER JOIN CSJobs ON CSJobsDetails.JobID = CSJobs.JobID ORDER BY CSJobsDetails.JobDetailsID DESC"></asp:SqlDataSource>
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1ViewCustJobDetails" Width="100%" Font-Bold="False" DataKeyNames="JobID,ProgrammeID" Font-Size="Small" PageSize="5" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowSorting="True">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="JobID" HeaderText="JobID" ReadOnly="True" SortExpression="JobID" Visible="false" />
            <asp:BoundField DataField="JobID1" HeaderText="JobID1" SortExpression="JobID1" Visible="false" />
            <asp:BoundField DataField="ProgrammeID" HeaderText="ProgID" SortExpression="ProgrammeID"  />
            <asp:BoundField DataField="ProgrammeName" HeaderText="Name" SortExpression="ProgrammeName"/>
            <asp:BoundField DataField="ProgrammeDescription" HeaderText="Description" SortExpression="ProgrammeDescription"  />
            <asp:CheckBoxField DataField="IsActive" HeaderText="IsActive" SortExpression="IsActive" Visible="false" />
            <asp:BoundField DataField="MediaFormat" HeaderText="Media Format" SortExpression="MediaFormat" />
            <asp:BoundField DataField="TranscriberFormat" HeaderText="Transcribe Format" SortExpression="TranscriberFormat" />
            <asp:BoundField DataField="SpecialInstructions" HeaderText="Instructions" SortExpression="SpecialInstructions" ItemStyle-Width="250px" >
            <ItemStyle Width="250px" />
            </asp:BoundField>
            <asp:BoundField DataField="DurationTotal" HeaderText="Duration" SortExpression="DurationTotal" />
            <asp:BoundField DataField="StartPositionSS" HeaderText="Start Position"  SortExpression="StartPositionSS" />
            <asp:BoundField DataField="EndPositionSS" HeaderText="End Position" SortExpression="EndPositionSS" />
            <asp:BoundField DataField="OptionalDownloadURLs" HeaderText="URL" SortExpression="OptionalDownloadURLs" />
            <asp:BoundField DataField="OriginalFilenames" HeaderText="Filenames" ItemStyle-Font-Bold="true" SortExpression="OriginalFilenames" >
            <ItemStyle Font-Bold="True" />
            </asp:BoundField>
            <asp:BoundField DataField="ClientNotes" HeaderText="Notes" SortExpression="ClientNotes" />
            <asp:CommandField ShowSelectButton="True" ItemStyle-Font-Bold="true" >
            <ItemStyle Font-Bold="True" />
            </asp:CommandField>
        </Columns>
        <EmptyDataTemplate>
            No Data Received.
        </EmptyDataTemplate>
       
        <SelectedRowStyle BackColor="#CCCCCC" />
       
    </asp:GridView>
    <br />
    <div id="dnnEdit">
        <fieldset>
            
            <asp:TextBox ID="txtTaskID" runat="server" Text="" MaxLength="12" Width="250px"></asp:TextBox><asp:Label ID="lblTaskID" runat="server" Text="Task ID" ForeColor="#6699FF" Font-Bold="true"></asp:Label><br />
            <asp:TextBox ID="txtProgrammeID" runat="server" MaxLength="12" Width="250px" ></asp:TextBox><asp:Label ID="lblProgrammeID" runat="server" Text="ProgrammeID" ForeColor="#6699FF" Font-Bold="true"></asp:Label><br />
           
             <asp:TextBox ID="txtTypistEmailAddress" runat="server"  Font-Bold="true" Width="250px"></asp:TextBox><asp:Label ID="lblTypistEmailAddress" runat="server" Text="Typist Email Address" ForeColor="#6699FF" Font-Bold="true"></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtTypistEmailAddress" runat="server" ControlToValidate="txtTypistEmailAddress" ErrorMessage="Required Field!" Display="Dynamic" SetFocusOnError="True" Font-Size="Small" Font-Bold="True" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidatortxtTypistEmailAddress" runat="server" ErrorMessage="Must Be Valid E-Mail Address!" Display="Dynamic" ControlToValidate="txtTypistEmailAddress" SetFocusOnError="True" Font-Size="Small" ValidationExpression="^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$" Font-Bold="True" Font-Italic="True" ForeColor="Red"></asp:RegularExpressionValidator><br />
            
            <asp:TextBox ID="txtDurationTotal" runat="server" MaxLength="50" Width="250px"></asp:TextBox><asp:Label ID="lblDurationTotal" runat="server" Text="Duration or Total" ForeColor="#6699FF" Font-Bold="true"></asp:Label><br />
            <asp:TextBox ID="txtStartPositionSS" runat="server" MaxLength="50" Width="250px"></asp:TextBox><asp:Label ID="lblStartPositionSS" runat="server" Text="Starting Timecode Position" ForeColor="#6699FF" Font-Bold="true"></asp:Label><br />
            <asp:TextBox ID="txtEndPositionSS" runat="server" MaxLength="50" Width="250px"></asp:TextBox><asp:Label ID="lblEndPositionSS" runat="server" Text="Ending Timecode Position" ForeColor="#6699FF" Font-Bold="true"></asp:Label><br />
            <asp:TextBox ID="txtOriginalFilenames" runat="server" MaxLength="50" Width="250px"></asp:TextBox><asp:Label ID="lblOriginalFilenames" runat="server" Text="Original Filenames" ForeColor="#6699FF" Font-Bold="true"></asp:Label><br />
            <asp:TextBox ID="txtOptionalDownloadURLs" runat="server" MaxLength="500" Width="250px"></asp:TextBox><asp:Label ID="lblOptionalDownloadURLs" runat="server" Text="Download URL" ForeColor="#6699FF" Font-Bold="true"></asp:Label><br />
            <asp:TextBox ID="txtClientNotes" runat="server" MaxLength="50" Width="250px" Height="250px" TextMode="MultiLine"></asp:TextBox><asp:Label ID="lblClientNotes" runat="server" Text="Client Notes" ForeColor="#6699FF" Font-Bold="true"></asp:Label><br />
            <br />
            <asp:Button ID="btnAllocateWork" runat="server" Text="Allocate Work" CssClass="dnnPrimaryAction" OnClick="btnAllocateWork_Click" />
            <br />
            <asp:Label ID="lblAssignmentMessage" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Large" ForeColor="Green"></asp:Label>

        </fieldset>
    </div>
</asp:Panel>
