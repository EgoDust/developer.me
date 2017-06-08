<%@ Control Language="C#" AutoEventWireup="false" Inherits="Cityscripts.JobAdministration.JobAdministration" CodeFile="JobAdministration.ascx.cs" %>

<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>


<div class="dnnFormItem">
    <asp:Label ID="lblJobAdminMsg" runat="server" Text=""></asp:Label><br />
      <hr width="100%" border="1" />
    <%--<asp:Label ID="lblArb" runat="server" Text="To allocate a New Job to a user please insert the Job ID and click View Job Details" />--%>
    <br />
    <asp:Label ID="lblJobID" runat="server" Text="Job ID: "></asp:Label><asp:TextBox ID="txtJobID" runat="server" MaxLength="12" Width="130px"></asp:TextBox>&nbsp;
      <asp:Button ID="btnUpdateJobCard" runat="server" Text="Allocate Work" OnClick="btnUpdateJobCard_Click" />
    <br />
    <hr width="100%" border="1" />
    <asp:Button ID="btnEditJobDetails" runat="server" Text="Edit Job Details" OnClick="btnEditJobDetails_Click" />
  <hr width="100%" border="1" />

</div>
<asp:Panel ID="PanelEditJobDetails" runat="server" Visible="false">
    <asp:SqlDataSource ID="SqlDataSourceEditJobDetails" runat="server" ConnectionString="<%$ ConnectionStrings:SiteSqlServer %>" InsertCommand="INSERT INTO CSJobsDetails(Userid, JobID, JobType, ProgrammeID, FileSubmissionPreference, MediaFormat, TranscriberFormat, MediaFileFormat, MediaFileHours, MediaFileMinutes, MediaFileSeconds, TodaysDate, TodaysDateTime, DueDate, DueDateTime, SpecialInstructions, TaskID, DurationHours, DurationMinutes, DurationSeconds, DurationTotal, TypingProgress, TimecodeStatus, WordCount, RateCostPerWord, FixedCostPerMinute, ChargingMethod, ActualCost, TypistUserid, StartPositionSS, StartPosition, EndPositionSS, EndPosition, FileUploadURL, OriginalFilenames, OptionalDownloadURLs, FTPUsername, FTPPassword, ClientNotes, URLUploadedFileReference, ProxyHQFileReference, ProxyLQFileReference, ProxyAudioOnlyFileReference, ShortTitle, LongTitle, Status, TypingDeadline, TypingETA, RawTranscriptFileReference, ProofedTranscriptFileReference, TimecodeFileReference, ArrivalDate, ReadyToTypeDate, StartDate, Deadline, TypedDate, ProofedDate, DeliveryDate, Thumbnail, TranscriptKeywords, Priority) VALUES (@Userid, @JobID, @JobType, @ProgrammeID, @FileSubmissionPreference, @MediaFormat, @TranscriberFormat, @MediaFileFormat, @MediaFileHours, @MediaFileMinutes, @MediaFileSeconds, @TodaysDate, @TodaysDateTime, @DueDate, @DueDateTime, @SpecialInstructions, @TaskID, @DurationHours, @DurationMinutes, @DurationSeconds, @DurationTotal, @TypingProgress, @TimecodeStatus, @WordCount, @RateCostPerWord, @FixedCostPerMinute, @ChargingMethod, @ActualCost, @TypistUserid, @StartPositionSS, @StartPosition, @EndPositionSS, @EndPosition, @FileUploadURL, @OriginalFilenames, @OptionalDownloadURLs, @FTPUsername, @FTPPassword, @ClientNotes, @URLUploadedFileReference, @ProxyHQFileReference, @ProxyLQFileReference, @ProxyAudioOnlyFileReference, @ShortTitle, @LongTitle, @Status, @TypingDeadline, @TypingETA, @RawTranscriptFileReference, @ProofedTranscriptFileReference, @TimecodeFileReference, @ArrivalDate, @ReadyToTypeDate, @StartDate, @Deadline, @TypedDate, @ProofedDate, @DeliveryDate, @Thumbnail, @TranscriptKeywords, @Priority)" SelectCommand="SELECT JobDetailsID, Userid, JobID, JobType, ProgrammeID, FileSubmissionPreference, MediaFormat, TranscriberFormat, MediaFileFormat, MediaFileHours, MediaFileMinutes, MediaFileSeconds, TodaysDate, TodaysDateTime, DueDate, DueDateTime, SpecialInstructions, TaskID, DurationHours, DurationMinutes, DurationSeconds, DurationTotal, TypingProgress, TimecodeStatus, WordCount, RateCostPerWord, FixedCostPerMinute, ChargingMethod, ActualCost, TypistUserid, StartPositionSS, StartPosition, EndPositionSS, EndPosition, FileUploadURL, OriginalFilenames, OptionalDownloadURLs, FTPUsername, FTPPassword, ClientNotes, URLUploadedFileReference, ProxyHQFileReference, ProxyLQFileReference, ProxyAudioOnlyFileReference, ShortTitle, LongTitle, Status, TypingDeadline, TypingETA, RawTranscriptFileReference, ProofedTranscriptFileReference, TimecodeFileReference, ArrivalDate, ReadyToTypeDate, StartDate, Deadline, TypedDate, ProofedDate, DeliveryDate, Thumbnail, TranscriptKeywords, Priority FROM CSJobsDetails ORDER BY JobDetailsID DESC" UpdateCommand="UPDATE CSJobsDetails SET JobType = @JobType, ProgrammeID = @ProgrammeID, FileSubmissionPreference = @FileSubmissionPreference, MediaFormat = @MediaFormat, TranscriberFormat = @TranscriberFormat, MediaFileFormat = @MediaFileFormat, MediaFileHours = @MediaFileHours, MediaFileMinutes = @MediaFileMinutes, MediaFileSeconds = @MediaFileSeconds, TodaysDate = @TodaysDate, TodaysDateTime = @TodaysDateTime, DueDate = @DueDate, DueDateTime = @DueDateTime, SpecialInstructions = @SpecialInstructions, TaskID = @TaskID, DurationHours = @DurationHours, DurationMinutes = @DurationMinutes, DurationSeconds = @DurationSeconds, DurationTotal = @DurationTotal, TypingProgress = @TypingProgress, TimecodeStatus = @TimecodeStatus, WordCount = @WordCount, RateCostPerWord = @RateCostPerWord, FixedCostPerMinute = @FixedCostPerMinute, ChargingMethod = @ChargingMethod, ActualCost = @ActualCost, TypistUserid = @TypistUserid, StartPositionSS = @StartPositionSS, StartPosition = @StartPosition, EndPositionSS = @EndPositionSS, EndPosition = @EndPosition, FileUploadURL = FileUploadURL, OriginalFilenames = @OriginalFilenames, OptionalDownloadURLs = @OptionalDownloadURLs, FTPUsername = @FTPUsername, FTPPassword = @FTPPassword, ClientNotes = @ClientNotes, URLUploadedFileReference = @URLUploadedFileReference, ProxyHQFileReference = @ProxyHQFileReference, ProxyLQFileReference = @ProxyLQFileReference, ProxyAudioOnlyFileReference = @ProxyAudioOnlyFileReference, ShortTitle = @ShortTitle, LongTitle = @LongTitle, Status = @Status, TypingDeadline = @TypingDeadline, TypingETA = @TypingETA, RawTranscriptFileReference = @RawTranscriptFileReference, ProofedTranscriptFileReference = @ProofedTranscriptFileReference, TimecodeFileReference = @TimecodeFileReference, ArrivalDate = @ArrivalDate, ReadyToTypeDate = @ReadyToTypeDate, StartDate = @StartDate, Deadline = @Deadline, TypedDate = @TypedDate, ProofedDate = @ProofedDate, DeliveryDate = @DeliveryDate, Thumbnail = @Thumbnail, TranscriptKeywords = @TranscriptKeywords, Priority = @Priority WHERE (ProgrammeID = @ProgrammeID)">
        <InsertParameters>
            <asp:Parameter Name="Userid" />
            <asp:Parameter Name="JobID" />
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
            <asp:Parameter Name="FileUploadURL" />
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
        </InsertParameters>
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
    <asp:GridView ID="GridViewEditJobDetails" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ProgrammeID" DataSourceID="SqlDataSourceEditJobDetails">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="JobDetailsID" HeaderText="JobDetailsID" InsertVisible="False" ReadOnly="True" SortExpression="JobDetailsID" />
            <asp:BoundField DataField="Userid" HeaderText="Userid" SortExpression="Userid" />
            <asp:BoundField DataField="JobID" HeaderText="JobID" SortExpression="JobID" />
            <asp:BoundField DataField="JobType" HeaderText="JobType" SortExpression="JobType" />
            <asp:BoundField DataField="ProgrammeID" HeaderText="ProgrammeID" ReadOnly="True" SortExpression="ProgrammeID" />
            <asp:BoundField DataField="FileSubmissionPreference" HeaderText="FileSubmissionPreference" SortExpression="FileSubmissionPreference" />
            <asp:BoundField DataField="MediaFormat" HeaderText="MediaFormat" SortExpression="MediaFormat" />
            <asp:BoundField DataField="TranscriberFormat" HeaderText="TranscriberFormat" SortExpression="TranscriberFormat" />
            <asp:BoundField DataField="MediaFileFormat" HeaderText="MediaFileFormat" SortExpression="MediaFileFormat" />
            <asp:BoundField DataField="MediaFileHours" HeaderText="MediaFileHours" SortExpression="MediaFileHours" />
            <asp:BoundField DataField="MediaFileMinutes" HeaderText="MediaFileMinutes" SortExpression="MediaFileMinutes" />
            <asp:BoundField DataField="MediaFileSeconds" HeaderText="MediaFileSeconds" SortExpression="MediaFileSeconds" />
            <asp:BoundField DataField="TodaysDate" HeaderText="TodaysDate" SortExpression="TodaysDate" />
            <asp:BoundField DataField="TodaysDateTime" HeaderText="TodaysDateTime" SortExpression="TodaysDateTime" />
            <asp:BoundField DataField="DueDate" HeaderText="DueDate" SortExpression="DueDate" />
            <asp:BoundField DataField="DueDateTime" HeaderText="DueDateTime" SortExpression="DueDateTime" />
            <asp:BoundField DataField="SpecialInstructions" HeaderText="SpecialInstructions" SortExpression="SpecialInstructions" />
            <asp:BoundField DataField="TaskID" HeaderText="TaskID" SortExpression="TaskID" />
            <asp:BoundField DataField="DurationHours" HeaderText="DurationHours" SortExpression="DurationHours" />
            <asp:BoundField DataField="DurationMinutes" HeaderText="DurationMinutes" SortExpression="DurationMinutes" />
            <asp:BoundField DataField="DurationSeconds" HeaderText="DurationSeconds" SortExpression="DurationSeconds" />
            <asp:BoundField DataField="DurationTotal" HeaderText="DurationTotal" SortExpression="DurationTotal" />
            <asp:BoundField DataField="TypingProgress" HeaderText="TypingProgress" SortExpression="TypingProgress" />
            <asp:BoundField DataField="TimecodeStatus" HeaderText="TimecodeStatus" SortExpression="TimecodeStatus" />
            <asp:BoundField DataField="WordCount" HeaderText="WordCount" SortExpression="WordCount" />
            <asp:BoundField DataField="RateCostPerWord" HeaderText="RateCostPerWord" SortExpression="RateCostPerWord" />
            <asp:BoundField DataField="FixedCostPerMinute" HeaderText="FixedCostPerMinute" SortExpression="FixedCostPerMinute" />
            <asp:BoundField DataField="ChargingMethod" HeaderText="ChargingMethod" SortExpression="ChargingMethod" />
            <asp:BoundField DataField="ActualCost" HeaderText="ActualCost" SortExpression="ActualCost" />
            <asp:BoundField DataField="TypistUserid" HeaderText="TypistUserid" SortExpression="TypistUserid" />
            <asp:BoundField DataField="StartPositionSS" HeaderText="StartPositionSS" SortExpression="StartPositionSS" />
            <asp:BoundField DataField="StartPosition" HeaderText="StartPosition" SortExpression="StartPosition" />
            <asp:BoundField DataField="EndPositionSS" HeaderText="EndPositionSS" SortExpression="EndPositionSS" />
            <asp:BoundField DataField="EndPosition" HeaderText="EndPosition" SortExpression="EndPosition" />
            <asp:BoundField DataField="FileUploadURL" HeaderText="FileUploadURL" SortExpression="FileUploadURL" />
            <asp:BoundField DataField="OriginalFilenames" HeaderText="OriginalFilenames" SortExpression="OriginalFilenames" />
            <asp:BoundField DataField="OptionalDownloadURLs" HeaderText="OptionalDownloadURLs" SortExpression="OptionalDownloadURLs" />
            <asp:BoundField DataField="FTPUsername" HeaderText="FTPUsername" SortExpression="FTPUsername" />
            <asp:BoundField DataField="FTPPassword" HeaderText="FTPPassword" SortExpression="FTPPassword" />
            <asp:BoundField DataField="ClientNotes" HeaderText="ClientNotes" SortExpression="ClientNotes" />
            <asp:BoundField DataField="URLUploadedFileReference" HeaderText="URLUploadedFileReference" SortExpression="URLUploadedFileReference" />
            <asp:BoundField DataField="ProxyHQFileReference" HeaderText="ProxyHQFileReference" SortExpression="ProxyHQFileReference" />
            <asp:BoundField DataField="ProxyLQFileReference" HeaderText="ProxyLQFileReference" SortExpression="ProxyLQFileReference" />
            <asp:BoundField DataField="ProxyAudioOnlyFileReference" HeaderText="ProxyAudioOnlyFileReference" SortExpression="ProxyAudioOnlyFileReference" />
            <asp:BoundField DataField="ShortTitle" HeaderText="ShortTitle" SortExpression="ShortTitle" />
            <asp:BoundField DataField="LongTitle" HeaderText="LongTitle" SortExpression="LongTitle" />
            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
            <asp:BoundField DataField="TypingDeadline" HeaderText="TypingDeadline" SortExpression="TypingDeadline" />
            <asp:BoundField DataField="TypingETA" HeaderText="TypingETA" SortExpression="TypingETA" />
            <asp:BoundField DataField="RawTranscriptFileReference" HeaderText="RawTranscriptFileReference" SortExpression="RawTranscriptFileReference" />
            <asp:BoundField DataField="ProofedTranscriptFileReference" HeaderText="ProofedTranscriptFileReference" SortExpression="ProofedTranscriptFileReference" />
            <asp:BoundField DataField="TimecodeFileReference" HeaderText="TimecodeFileReference" SortExpression="TimecodeFileReference" />
            <asp:BoundField DataField="ArrivalDate" HeaderText="ArrivalDate" SortExpression="ArrivalDate" />
            <asp:BoundField DataField="ReadyToTypeDate" HeaderText="ReadyToTypeDate" SortExpression="ReadyToTypeDate" />
            <asp:BoundField DataField="StartDate" HeaderText="StartDate" SortExpression="StartDate" />
            <asp:BoundField DataField="Deadline" HeaderText="Deadline" SortExpression="Deadline" />
            <asp:BoundField DataField="TypedDate" HeaderText="TypedDate" SortExpression="TypedDate" />
            <asp:BoundField DataField="ProofedDate" HeaderText="ProofedDate" SortExpression="ProofedDate" />
            <asp:BoundField DataField="DeliveryDate" HeaderText="DeliveryDate" SortExpression="DeliveryDate" />
            <asp:BoundField DataField="Thumbnail" HeaderText="Thumbnail" SortExpression="Thumbnail" />
            <asp:BoundField DataField="TranscriptKeywords" HeaderText="TranscriptKeywords" SortExpression="TranscriptKeywords" />
            <asp:BoundField DataField="Priority" HeaderText="Priority" SortExpression="Priority" />
        </Columns>
    </asp:GridView>
</asp:Panel>

<div class="dnnForm dnnEdit dnnClear" id="dnnEdit">
    <fieldset>
        <asp:Panel ID="PanelUpdateJob" runat="server" Visible="false">

            <table width="100%" align="center">

                <tr>
                    <td align="right" valign="top" width="100px">User ID:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="txtUserid" runat="server" MaxLength="5"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidatortxtUserid" runat="server" ControlToValidate="txtUserid" ErrorMessage="UserId is a Required Field."></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="top">Job ID:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="JobIDTextBox" runat="server" MaxLength="12" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Programme ID:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="TextBoxProgrammeID" runat="server" Width="100%"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Job Type:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="JobTypeTextBox" runat="server" Width="100%" /><asp:RequiredFieldValidator ID="RequiredFieldValidatorJobTypeTextBox" runat="server" ErrorMessage="Job Type is a Required Field." ControlToValidate="JobTypeTextBox"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td align="right" valign="top">File Submission Preference:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="FileSubmissionPreferenceTextBox" runat="server" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Media Format:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="MediaFormatTextBox" runat="server" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Transcriber Format:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="TranscriberFormatTextBox" runat="server" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Media File Format:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="MediaFileFormatTextBox" runat="server" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Media File Hour(s):</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="MediaFileHoursTextBox" runat="server" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Media File Minute(s):</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="MediaFileMinutesTextBox" runat="server" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Media File Second(s):</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="MediaFileSecondsTextBox" runat="server" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Job Created Date:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="TodaysDateTextBox" runat="server" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Job Created Time:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="TodaysDateTimeTextBox" runat="server" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Tasks Due Date:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="DueDateTextBox" runat="server" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Task's Due Time:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="DueDateTimeTextBox" runat="server" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Special Instructions:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="SpecialInstructionsTextBox" runat="server" TextMode="MultiLine" Height="100px" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Task ID:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="TaskIDTextBox" runat="server" MaxLength="12" Width="100%" /><asp:RequiredFieldValidator ID="RequiredFieldValidatorTaskIDTextBox" runat="server" ErrorMessage="Task ID is a Required Field." ControlToValidate="TaskIDTextBox" ForeColor="#CC0000" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Duration Hour(s):</td>
                    <td align="left" valign="top">
                        <asp:DropDownList ID="DropDownListddlHours" runat="server"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Duration Minute(s):</td>
                    <td align="left" valign="top">
                        <asp:DropDownList ID="DropDownListddlMinutes" runat="server"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Duration Second(s):</td>
                    <td align="left" valign="top">
                        <asp:DropDownList ID="DropDownListddlSeconds" runat="server"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Duration Total:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="DurationTotalTextBox" runat="server" Text="" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Typing Progress (%):</td>
                    <td align="left" valign="top">
                        <%--<asp:TextBox ID="TypingProgressTextBox" runat="server"  />--%><asp:DropDownList ID="DropDownListTypingProgress" runat="server"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Timecode Status:</td>
                    <td align="left" valign="top">
                        <asp:DropDownList ID="DropDownListTimecodeStatus" runat="server">
                            <asp:ListItem>0 - Not Started</asp:ListItem>
                            <asp:ListItem>0,5 - In Progress</asp:ListItem>
                            <asp:ListItem Value="1 - Finished">1 - Finished</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Word Count:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="WordCountTextBox" runat="server" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Rate Cost Per Word:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="RateCostPerWordTextBox" runat="server" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Fixed Cost Per Minute:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="FixedCostPerMinuteTextBox" runat="server" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Charging Method:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="ChargingMethodTextBox" runat="server" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Actual Cost:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="ActualCostTextBox" runat="server" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Typist User ID:</td>
                    <td align="left" valign="top">

                        <table width="100%" border="1">
                            <tr align="left" valign="top">
                                <td>
                                    <table width="100%" border="0">
                                          </tr>
                                           <tr>
                                            <td align="left" valign="top"><asp:Label ID="lblGetDynamicEmail" runat="server" Text="* Please Match Typist User ID to Dropdown ID after choosing and Clicking 'Select Transcriptionist'" Font-Size="x-Small" Font-Italic="True" Font-Underline="false"></asp:Label></td>
                                            <td align="left" valign="top"><asp:Label ID="LabelStep1" runat="server" Text="Step 1."></asp:Label>
                                               </td>
                                                <td align="left" valign="top"><asp:Label ID="LabelStep2" runat="server" Text="Step 2."></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td align="left" valign="top" width="50%">
                                                <asp:TextBox ID="TypistUseridTextBox" runat="server" />
                                            </td>
                                            <td align="left" valign="top" width="25%">
                                                <asp:ListBox ID="lbTranscriptionistsGroup" runat="server" Rows="2" Width="100%"></asp:ListBox>
                                            </td>
                                            <td align="left" valign="top" width="25">
                                                <asp:DropDownList ID="DropDownListCSGetTranscriptsGroupEMail" runat="server" DataSourceID="SqlDataSourceCSGetTranscriptsGroupEMail" DataTextField="UserId" DataValueField="Email">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" valign="top">&nbsp;</td>
                                            <td align="left" valign="top">
                                                <asp:Button ID="btnNotifyTranscriptionist" runat="server" Font-Bold="True" Font-Size="X-Small" OnClick="btnNotifyTranscriptionist_Click" Text="Select Transcriptionist" />
                                            </td>
                                            <td align="left" valign="top">
                                                <asp:SqlDataSource ID="SqlDataSourceCSGetTranscriptsGroupEMail" runat="server" ConnectionString="<%$ ConnectionStrings:SiteSqlServer %>" SelectCommand="CSGetTranscriptsGroupEMail" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                            </td>
                                    </table>
                                </td>
                            </tr>
                        </table>

                    </td>
                </tr>
                <tr>
                    <td align="right" valign="top">Start Position SS:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="StartPositionSSTextBox" runat="server" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Start Position:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="StartPositionTextBox" runat="server" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">End Position SS:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="EndPositionSSTextBox" runat="server" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">End Position:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="EndPositionTextBox" runat="server" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">File Upload URL:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="FileUploadURLTextBox" runat="server" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Original Filenames:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="OriginalFilenamesTextBox" runat="server" Width="100%" TextMode="MultiLine" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Optional Download URLs:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="OptionalDownloadURLsTextBox" runat="server" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">FTP Username:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="FTPUsernameTextBox" runat="server" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">FTP Password:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="FTPPasswordTextBox" runat="server" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Client Notes:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="ClientNotesTextBox" runat="server" Width="100%" TextMode="MultiLine" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">URL Uploaded File Reference:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="URLUploadedFileReferenceTextBox" runat="server" Width="100%" TextMode="MultiLine" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Proxy HQ File Reference:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="ProxyHQFileReferenceTextBox" runat="server" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Proxy LQ File Reference:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="ProxyLQFileReferenceTextBox" runat="server" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Proxy Audio Only File Reference:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="ProxyAudioOnlyFileReferenceTextBox" runat="server" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Short Title:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="ShortTitleTextBox" runat="server" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Long Title:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="LongTitleTextBox" runat="server" Width="100%" TextMode="MultiLine" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Status:</td>
                    <td align="left" valign="top">
                        <asp:DropDownList ID="DropDownListStatus" runat="server">
                            <asp:ListItem>In Preperation</asp:ListItem>
                            <asp:ListItem>Ready to be typed</asp:ListItem>
                            <asp:ListItem>Being typed</asp:ListItem>
                            <asp:ListItem>Being proofed</asp:ListItem>
                            <asp:ListItem>Being formatted</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Typing Deadline:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="TypingDeadlineTextBox" runat="server" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Typing ETA:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="TypingETATextBox" runat="server" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Raw Transcript File Reference:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="RawTranscriptFileReferenceTextBox" runat="server" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Proofed Transcript File Reference:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="ProofedTranscriptFileReferenceTextBox" runat="server" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Timecode File Reference:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="TimecodeFileReferenceTextBox" runat="server" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Arrival Date:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="ArrivalDateTextBox" runat="server" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Ready To Type Date:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="ReadyToTypeDateTextBox" runat="server" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Start Date:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="StartDateTextBox" runat="server" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Deadline:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="DeadlineTextBox" runat="server" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Typed Date:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="TypedDateTextBox" runat="server" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Proofed Date:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="ProofedDateTextBox" runat="server" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Delivery Date:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="DeliveryDateTextBox" runat="server" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Thumbnail:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="ThumbnailTextBox" runat="server" Width="100%" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Transcript Keywords:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="TranscriptKeywordsTextBox" runat="server" Width="100%" TextMode="MultiLine" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">Priority:</td>
                    <td align="left" valign="top">
                        <asp:DropDownList ID="DropDownListPriorityTextBox" runat="server">
                            <asp:ListItem>1 (Normal)</asp:ListItem>
                            <asp:ListItem>2 (Do when you&#39;ve got nothing else to do.)</asp:ListItem>
                            <asp:ListItem>3 (Put file on hold don&#39;t delete from system.)</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td align="right" valign="top">
                        <%--<asp:SqlDataSource ID="SqlDataSourceUpdateJobCard" runat="server"></asp:SqlDataSource>--%><asp:SqlDataSource ID="SqlDataSourceUpdateNewAssignedUserData" runat="server"></asp:SqlDataSource>
                    </td>
                    <td align="left" valign="top">
                        <br />
                        <asp:Button ID="btnTableUpdate" runat="server" Text="Allocate Job" OnClick="btnTableUpdate_Click" /></td>
                </tr>
            </table>
        </asp:Panel>
    </fieldset>
</div>


