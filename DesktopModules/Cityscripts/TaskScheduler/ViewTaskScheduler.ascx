<%@ Control Language="C#" AutoEventWireup="false" Inherits="Cityscripts.TaskScheduler.ViewTaskScheduler" CodeFile="ViewTaskScheduler.ascx.cs" %>

<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

<div class="dnnForm dnnEdit dnnClear" id="dnnEdit">

    <fieldset>

        <div class="dnnFormItem">
            <asp:Label ID="lblTaskScheduler" runat="server" Text=""></asp:Label><br />
            <asp:Button ID="btnScheduleTask" runat="server" Text="Schedule Task" />
        </div>

   </fieldset></div>


