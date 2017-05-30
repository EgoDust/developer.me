<%@ Control Language="C#" AutoEventWireup="false" Inherits="Cityscripts.UpdateStatus.UpdateStatus" CodeFile="UpdateStatus.ascx.cs" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

<div class="dnnForm" id="dnnEdit11">
    <fieldset>
        <div>

            <asp:Label ID="lblTaskID" runat="server" Font-Size="Small" Text="Please enter a TaskID"></asp:Label><br />

            <asp:TextBox ID="txtJobsTaskID" runat="server" Width="100" MaxLength="12"></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorJobsTaskID" runat="server" ErrorMessage="TaskID is Required Field!" SetFocusOnError="True" Display="Dynamic" ControlToValidate="txtJobsTaskID" Font-Size="Small" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:CheckBoxList ID="CheckBoxList1" runat="server" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged" AutoPostBack="True" CausesValidation="true">

                <asp:ListItem>In Preparation</asp:ListItem>
                <asp:ListItem>Ready to be typed</asp:ListItem>
                <asp:ListItem>Being typed</asp:ListItem>
                <asp:ListItem>Typed 10 %</asp:ListItem>
                <asp:ListItem>Typed 20 %</asp:ListItem>
                <asp:ListItem>Typed 30 %</asp:ListItem>
                <asp:ListItem>Typed 40 %</asp:ListItem>
                <asp:ListItem>Typed 50 %</asp:ListItem>
                <asp:ListItem>Typed 60 %</asp:ListItem>
                <asp:ListItem>Typed 70 %</asp:ListItem>
                <asp:ListItem>Typed 80 %</asp:ListItem>
                <asp:ListItem>Typed 90 %</asp:ListItem>
                <asp:ListItem>Typed 100 %</asp:ListItem>
                <asp:ListItem>Being proofed</asp:ListItem>
                <asp:ListItem>Being formatted</asp:ListItem>
            </asp:CheckBoxList>
           
            <asp:Label ID="lblUpdateStatusMessage" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="#009933"></asp:Label>
        </div>
    </fieldset>

</div>
