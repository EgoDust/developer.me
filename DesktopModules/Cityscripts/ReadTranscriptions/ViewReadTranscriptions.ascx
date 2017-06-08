<%@ Control Language="C#" AutoEventWireup="false" Inherits="Cityscripts.ReadTranscriptions.ViewReadTranscriptions" CodeFile="ViewReadTranscriptions.ascx.cs" %>

<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

<asp:GridView ID="GridViewReadTranscriptions" runat="server">
                <Columns>
                <asp:BoundField DataField="FileSize" HeaderText="File Name" />
                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkDownload" runat="server" Text="Download" OnClick="DownloadFile"
                            CommandArgument='<%# Eval("TranscriptionFilesID") %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

</asp:GridView>


