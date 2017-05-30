<%@ Control Language="C#" AutoEventWireup="false" Inherits="Cityscripts.FinalTranscription.GetFinalTranscription" CodeFile="GetFinalTranscription.ascx.cs" %>

<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

<div class="dnnForm dnnEdit dnnClear" id="dnnEdit">

    <fieldset>

        <div class="dnnFormItem">

            <asp:SqlDataSource ID="SqlDataSourceGetFinalTranscriptions" runat="server" ConnectionString="<%$ ConnectionStrings:SiteSqlServer %>" SelectCommand="SELECT id, Name, FileSize, Username, EMailAddress, DateTime FROM CSTypistsFiles ORDER BY id DESC"></asp:SqlDataSource>
            <asp:Image ID="Image3" runat="server" ImageUrl="~/images/action_help.gif" /><asp:Label ID="Label2" runat="server" Text="Select Show File Details to see details of the uploaded files." Font-Size="X-Small" /><br />
            <asp:CheckBox ID="CheckBoxShowFileDetail" runat="server" Text="Show File Details" AutoPostBack="True" OnCheckedChanged="CheckBoxShowFileDetail_CheckedChanged" />
            <asp:GridView ID="GridView1GetFinalTranscriptions" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSourceGetFinalTranscriptions" Width="100%" Visible="false">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="File ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="Name" HeaderText="File Name" SortExpression="Name" />
                    <asp:BoundField DataField="FileSize" HeaderText="File Size" SortExpression="FileSize" />
                    <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                    <asp:BoundField DataField="EMailAddress" HeaderText="E-Mail Address" SortExpression="EMailAddress" />
                    <asp:BoundField DataField="DateTime" HeaderText="Upload Date Time" SortExpression="DateTime" />
                </Columns>
            </asp:GridView>
        </div>
        <br />
        <asp:Label ID="Label1" runat="server" Text="Select a file from list and click the Add button to insert a item into final transcript compilation." Font-Size="Small" />
        <br />

        <asp:SqlDataSource ID="SqlDataSourceShowFileUploads" runat="server" ConnectionString="<%$ ConnectionStrings:SiteSqlServer %>" SelectCommand="SELECT id, Name, DateTime FROM CSTypistsFiles"></asp:SqlDataSource>
        <asp:DropDownList ID="DropDownListShowFileUploads" runat="server" DataSourceID="SqlDataSourceShowFileUploads" DataTextField="Name" DataValueField="id" Font-Bold="True" Font-Size="Large" ForeColor="#007FFF">
            <asp:ListItem>Select Transcription File</asp:ListItem>
        </asp:DropDownList>
        
        <asp:Button ID="ButtonAddFile" runat="server" Text="Add" OnClick="ButtonAddFile_Click" Font-Bold="True" Font-Size="Medium" BorderColor="#007FFF" BorderStyle="Solid" BorderWidth="3px" />
        <br />
        <br />

        <table>
            <tr>
                <td rowspan="3">
                    <asp:ListBox ID="ListBoxFilesCompilation" runat="server" Width="700px" Rows="12"></asp:ListBox><br />
                    </td>
                <td valign="top">
                    <asp:Button ID="btnUp" runat="server" Text="Up" OnClick="btnUp_Click" Font-Size="X-Small" /></td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnRemove" runat="server" Text="Remove" Font-Size="X-Small" OnClick="btnRemove_Click" /></td>
            </tr>
            <tr>
                <td valign="bottom">
                    <asp:Button ID="btnDown" runat="server" Text="Down" OnClick="btnDown_Click" Font-Size="X-Small" />
                </td>
            </tr>
        </table>
        <asp:Label ID="lblListboxTotal" runat="server" Font-Size="X-Small" Font-Bold="true" />


        <br />
        <asp:Button ID="btnGenerateFinalTranscription" runat="server" Text="Generate Final Transcription" OnClick="btnGenerateFinalTranscription_Click" />
        <br />
        <asp:GridView ID="gvTranscriptions" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="DataText" HeaderText="DataText" ItemStyle-Width="100%" />

            </Columns>
        </asp:GridView>
        <br />
        <asp:TextBox ID="txtFinalTranscription" runat="server" Width="100%" Height="120px" TextMode="MultiLine"  />
    </fieldset>

</div>


