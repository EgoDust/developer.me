#region Copyright

// 
// Copyright (c) 2017
// by Cityscripts
// 

#endregion

#region Using Statements

using System;
using DotNetNuke.Entities.Modules;

#endregion

namespace Cityscripts.TaskScheduler
{

	public partial class ViewTaskScheduler : PortalModuleBase
	{

		#region Event Handlers

		protected override void OnInit(EventArgs e)
		{
			base.OnInit(e);

			//cmdSave.Click += cmdSave_Click;
			
		}

		protected override void OnLoad(EventArgs e)
		{
			base.OnLoad(e);
			
			if (!Page.IsPostBack)
			{
                             //txtField.Text = (string)Settings["field"];
			}
		}
		
		#endregion

	}
}

