local LrDialogs = import 'LrDialogs'
local LrApplication = import 'LrApplication'
local LrTasks = import 'LrTasks'

local function publishAllPublishableCollections( )
	LrTasks.sleep( 5 )
	if ( autoPublishEnabled == true )
	then
		local catalog = LrApplication:activeCatalog()
		local publishServices = catalog:getPublishServices( nil )
		for publishServiceKey,publishServiceValue in pairs( publishServices ) do
			local publishedCollections = publishServiceValue:getChildCollections( )
			for publishedCollectionKey,publishedCollectionValue in pairs( publishedCollections ) do
				publishedCollectionValue:publishNow( )
			end
		end
		LrTasks.startAsyncTask( publishAllPublishableCollections )
	end
end

if ( autoPublishEnabled == true )
then
	autoPublishEnabled = false
	LrDialogs.message( "Auto Publish", "Auto Publish Disabled!", "info" );
else
	autoPublishEnabled = true
	LrDialogs.message( "Auto Publish", "Auto Publish Enabled!", "info" );
	LrTasks.startAsyncTask( publishAllPublishableCollections )
end