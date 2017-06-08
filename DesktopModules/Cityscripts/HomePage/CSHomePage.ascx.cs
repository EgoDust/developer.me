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

namespace Cityscripts.HomePage
{

	public partial class CSHomePage : PortalModuleBase
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
                            
			}
		}
		
		//protected void cmdSave_Click(object sender, EventArgs e)
		//{
  //         // DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, "Update Successful", DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.GreenSuccess);
		//}


		//protected void cmdCancel_Click(object sender, EventArgs e)
		//{
		//}

		#endregion

	}
}



