#region Copyright

// 
// Copyright (c) 2016
// by Cityscripts
// 

#endregion

#region Using Statements

using System;
using DotNetNuke.Entities.Modules;

#endregion

namespace Cityscripts.Support
{

	public partial class CityscriptsSupport : PortalModuleBase
	{

		#region Event Handlers

		protected override void OnInit(EventArgs e)
		{
			base.OnInit(e);

			//cmdSave.Click += cmdSave_Click;
			//cmdCancel.Click += cmdCancel_Click;
		}

		protected override void OnLoad(EventArgs e)
		{
			base.OnLoad(e);
			
			if (!Page.IsPostBack)
			{
                // txtField.Text = (string)Settings["field"];
                DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, "The Support Chat is for pre-arranged support and may not be active right now.", DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.BlueInfo);
			}
		}
		
		protected void cmdSave_Click(object sender, EventArgs e)
		{
            //ModuleController.Instance.UpdateModuleSetting(ModuleId, "field", txtField.Text);
            
		}


		protected void cmdCancel_Click(object sender, EventArgs e)
		{
		}

		#endregion

	}
}






