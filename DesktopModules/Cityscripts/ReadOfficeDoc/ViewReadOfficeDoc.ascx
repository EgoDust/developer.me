<%@ Control Language="C#" AutoEventWireup="false" Inherits="Cityscripts.ReadOfficeDoc.ViewReadOfficeDoc" CodeFile="ViewReadOfficeDoc.ascx.cs" %>

<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<style type="text/css">
    .hidden {
        display: none;
    }
</style>
<div class="dnnForm dnnEdit dnnClear" id="dnnEdit">
    <fieldset>
        <div class="dnnFormItem">
            <h5>Greetings&nbsp;<asp:Label ID="lblUsername" runat="server" Text=""></asp:Label>&nbsp;<br />
                <asp:Label ID="lblGreeting" runat="server" Font-Size="Small"></asp:Label></h5>

            <asp:SqlDataSource ID="SqlDataSourceViewOfficeDocId" runat="server" ConnectionString="<%$ ConnectionStrings:SiteSqlServer %>" SelectCommand="SELECT id, Name, ContentType, Data, DataText, Username, EMailAddress, DateTime, FileSize, SortOrder, TaskID, IsActive FROM CSTypistsFiles WHERE (EMailAddress = @EMailAddress) ORDER BY id DESC">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblGreeting" DbType="String" Name="EMailAddress" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="0" DataSourceID="SqlDataSourceViewOfficeDocId" Width="100%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="id" PageSize="15" EmptyDataText="No Data Returned" Font-Size="Small" HorizontalAlign="Left">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="Doc ID" InsertVisible="true" ReadOnly="False" SortExpression="id" />
                    <asp:BoundField DataField="Name" HeaderText="Document Name" SortExpression="Name" />
                    <asp:BoundField DataField="FileSize" HeaderText="File Size" SortExpression="FileSize" />
                    <asp:BoundField DataField="ContentType" HeaderText="Document Content Type" SortExpression="ContentType" />
                    <asp:BoundField DataField="DateTime" HeaderText="Date Time Submitted" SortExpression="DateTime" />
                    <asp:BoundField DataField="DataText" HeaderText="DataText" SortExpression="DataText">
                        <ItemStyle CssClass="hidden" />
                        <HeaderStyle CssClass="hidden" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Username" HeaderText="Submitted By" SortExpression="Username" />
                    <asp:BoundField DataField="EMailAddress" HeaderText="Submitted By E-Mail" SortExpression="EMailAddress" />
                    <asp:BoundField DataField="SortOrder" HeaderText="SortOrder" SortExpression="SortOrder">

                        <ItemStyle CssClass="hidden" />
                        <HeaderStyle CssClass="hidden" />
                    </asp:BoundField>
                    <asp:BoundField DataField="TaskID" HeaderText="TaskID" SortExpression="TaskID">
                        <ItemStyle CssClass="hidden" />
                        <HeaderStyle CssClass="hidden" />
                    </asp:BoundField>
                    <asp:CheckBoxField DataField="IsActive" HeaderText="IsActive" SortExpression="IsActive" />
                    <asp:CommandField ShowSelectButton="True" SelectText="View" >
                    <ItemStyle Font-Bold="True" />
                    </asp:CommandField>
                </Columns>
                <PagerSettings Mode="NextPreviousFirstLast" />
                <SelectedRowStyle BackColor="#007FFF" />
            </asp:GridView>
        </div>

        <asp:Label ID="lblmyDocID" runat="server" Text="Document ID:" Visible="false"></asp:Label><br />
        <asp:TextBox ID="txtmyDocID" runat="server" Width="100px" Font-Bold="true" Font-Size="Medium" Visible="false"></asp:TextBox><br />
        <asp:TextBox ID="txtCheckMyWord" runat="server" BorderColor="#777FFF" BorderStyle="Solid" BorderWidth="1px" Font-Size="Small" Height="300px" TextMode="MultiLine" Width="100%" Visible="false"></asp:TextBox>
        <br />
        <asp:LinkButton ID="cmdDownloadDoc" Text="Download Document" runat="server" CssClass="dnnPrimaryAction" OnClick="cmdDownloadDoc_Click" Enabled="false" Visible="false" />
    </fieldset>

</div>


