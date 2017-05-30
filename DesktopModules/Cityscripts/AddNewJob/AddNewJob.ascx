<%@ Control Language="C#" AutoEventWireup="false" Inherits="Cityscripts.AddNewJob.AddNewJob" CodeFile="AddNewJob.ascx.cs" %>

<div class="dnnForm dnnEdit dnnClear" id="dnnEdit">
    <fieldset>
        <table aria-autocomplete="inline">
            <tr>
                <td style="text-align: right; font-size: small;">Job Type:</td>
                <td>
                    <asp:DropDownList ID="ddlJobType" runat="server" Width="250px" Font-Bold="True" Font-Size="Small">
                        <asp:ListItem>Transcriptions</asp:ListItem>
                        <asp:ListItem>Video Logging</asp:ListItem>
                        <asp:ListItem>Post Production Scripts</asp:ListItem>
                        <asp:ListItem>Translations</asp:ListItem>
                        <asp:ListItem>Subtitling</asp:ListItem>
                    </asp:DropDownList></td>
                <td style="text-align: left; font-size: small;">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/action_help.gif" />Please select a Job Type for website processing.</td>
            </tr>

            <tr>
                <td style="text-align: right; font-size: small;">Media Submission Preference:</td>
                <td>
                    <asp:DropDownList ID="ddlFileSubmissionPreference" runat="server" Width="250px" Font-Bold="False" Font-Size="Small">
                        <asp:ListItem Value="Unsure">Submit Link / URL</asp:ListItem>
                        <asp:ListItem Value="Drop at Office">Drop at Office</asp:ListItem>
                        <asp:ListItem Value="Cloud Upload Utility">Cloud Upload Utility</asp:ListItem>
                        <asp:ListItem Value="FTP Access">FTP Access</asp:ListItem>
                        <asp:ListItem Value="WeTransfer Web Service">WeTransfer Web Service</asp:ListItem>
                        <asp:ListItem Value="Unsure">Unsure</asp:ListItem>
                    </asp:DropDownList></td>
                <td style="text-align: left; font-size: small;">
                    <asp:Image ID="Image3" runat="server" ImageUrl="~/images/action_help.gif" />
                    Select your jobs file(s) submission choice.</td>
            </tr>

            <tr>
                <td style="text-align: right; font-size: small;">Job Name / Programme Name:</td>
                <td>
                    <asp:TextBox ID="txtJobIDName" runat="server" Width="350px" /></td>
                <td style="text-align: left; font-size: small;">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorJobName" runat="server" ErrorMessage="Required Field!" ControlToValidate="txtJobIDName" Font-Bold="True" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <span style="color: red; font-weight: 600">*</span><asp:Image ID="Image4" runat="server" ImageUrl="~/images/action_help.gif" />
                    Please enter unique name.</td>
            </tr>


            <tr valign="top">
                <td style="text-align: right; font-size: small;">Job Description / Programme Description:</td>
                <td>
                    <asp:TextBox ID="txtJobDescription" runat="server" TextMode="MultiLine" Width="350px" /></td>
                <td style="text-align: left; font-size: small;">
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidatorJobDescription" runat="server" ErrorMessage="Required Field!" ControlToValidate="txtJobDescription" Display="Dynamic" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                    <%--<span style="color:red;font-weight:600">*</span>--%><asp:Image ID="Image5" runat="server" ImageUrl="~/images/action_help.gif" />
                    Please enter programme description.</td>
            </tr>
            <tr valign="top">
                <td style="text-align: right; font-size: small;">Download Link / Notes</td>
                <td>


                    <asp:TextBox ID="dnnteSpecialInstructions" runat="server" TextMode="MultiLine" Width="350px"></asp:TextBox>

                </td>
                <td style="text-align: left; font-size: small;">
                    <asp:Image ID="Image6" runat="server" ImageUrl="~/images/action_help.gif" />Specify download link URL and and notes.</td>
            </tr>
            <tr>
                <td style="text-align: right; font-size: small;">Media File Format:</td>
                <td>
                    <asp:DropDownList ID="ddlMediaFormat" runat="server" Width="250px">
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
                </td>
                <td style="text-align: left; font-size: small;">
                    <asp:Image ID="Image7" runat="server" ImageUrl="~/images/action_help.gif" />Select your media file format.</td>
            </tr>

            <tr>
                <td style="text-align: right; font-size: small;">Transcribe Format:</td>
                <td>
                    <asp:DropDownList ID="ddlTranscriberFormat" runat="server" Width="250px">
                        <asp:ListItem>Interviewer Non-Verbatim</asp:ListItem>
                        <asp:ListItem>Verbatim</asp:ListItem>
                        <asp:ListItem>Non-Verbatim</asp:ListItem>
                        <asp:ListItem>Custom</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td style="text-align: left; font-size: small;">
                    <asp:Image ID="Image8" runat="server" ImageUrl="~/images/action_help.gif" />Select your transcriber settings.</td>
            </tr>

            <tr>
                <td style="text-align: right; font-size: small;">Media Delivery Format:</td>
                <td>
                    <asp:DropDownList ID="ddllMediaFileFormat" runat="server" Width="250px">
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
                </td>
                <td style="text-align: left; font-size: small;">
                    <asp:Image ID="Image9" runat="server" ImageUrl="~/images/action_help.gif" />Select transcribe delivery format.</td>
            </tr>

            <tr>
                <td style="text-align: right; font-size: small;">Job Length Time:</td>
                <td>Hours:<asp:DropDownList ID="ddlHours" runat="server" Width="90px"></asp:DropDownList>
                    &nbsp;&nbsp; Minutes:
                    <asp:DropDownList ID="ddlMinutes" runat="server" Width="90px"></asp:DropDownList>

                </td>
                <td style="text-align: left; font-size: small;">
                    <asp:Image ID="Image10" runat="server" ImageUrl="~/images/action_help.gif" />Length of media file(s).</td>
            </tr>



            <tr valign="top">
                <td style="text-align: right; font-size: small;">Due Date & Time:</td>
                <td>
                    <asp:Calendar ID="calDueDate" runat="server" CellPadding="0">
                        <DayHeaderStyle Font-Size="Small" />
                        <DayStyle Font-Size="Small" />
                    </asp:Calendar>

                    <asp:TextBox ID="txtDueDateTime" runat="server" Width="150px" />

                </td>
                <td style="text-align: left; font-size: small;">
                    <asp:Image ID="Image11" runat="server" ImageUrl="~/images/action_help.gif" />Due date for processed files - default is two days.</td>
            </tr>



            <tr>
                <td>&nbsp;</td>
                <td>&nbsp; 
                            <asp:Button ID="btnCreateJobbie" runat="server" Text="Create Job" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" OnClick="btnCreateJobbie_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">
                    <center> <asp:Label ID="lblAddNewJobMsg" runat="server" Text="Please submit form and wait for system to respond." Font-Bold="True" Font-Size="Small" ForeColor="#00CC00"></asp:Label>
                   </center>
                </td>
            </tr>
        </table>
    </fieldset>
</div>


