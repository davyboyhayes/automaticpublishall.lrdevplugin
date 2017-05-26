return {
	
	LrSdkVersion = 4.0,
	LrSdkMinimumVersion = 1.3, -- minimum SDK version required by this plug-in

	LrToolkitIdentifier = 'com.snapgotyou.lightroom.automaticPublishAll',

	LrPluginName = LOC "$$$/PublishFromMenu/PluginName=Automatic Publish All",
	
	-- Add the menu item to the File menu.
	
	LrExportMenuItems = {
		{
			title = "Toggle Auto Publish",
			file = "ToggleAutoPublish.lua",
		}
	},
	VERSION = { major=1, minor=0, revision=0, build=0, },

}