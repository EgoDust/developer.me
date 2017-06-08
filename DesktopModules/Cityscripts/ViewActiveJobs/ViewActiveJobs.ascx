<%@ Control Language="C#" AutoEventWireup="false" Inherits="Cityscripts.ViewActiveJobs.ViewActiveJobs" CodeFile="ViewActiveJobs.ascx.cs" %>

<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
                  
<div class="dnnFormMessage dnnFormInfo">Please click &#39;<strong>View Jobs</strong>&#39; to view active jobs or click &#39;<strong>Add Jobs</strong>&#39; to add a new job to the system.</div>

<div class="dnnForm">
    <fieldset>
        <div class="dnnFormItem">
            <asp:Label ID="lblMessage" runat="server" Text="" /><br />
           <%-- <asp:Button ID="btnViewActiveJobs" runat="server" Text="View Jobs" /> &nbsp; &nbsp;  <asp:Button ID="btnAddJob" runat="server" Text="Add Jobs" OnClick="btnAddJob_Click" /><br />
            <asp:Label ID="lblRoleStatus" runat="server" Text="" />--%>
        </div>
    </fieldset>



</div>



