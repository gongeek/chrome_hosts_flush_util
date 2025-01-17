#!/usr/bin/osascript
--This script is to resolve the problem that Chrome can't use the correct hosts after modifying hosts file  because of  Chrome using socket pools.
--This script just simulates the click event on the button of "Flush socket pool"  on chrome://net-internals/#sockets page.
--created by Boreas320 on 2015-3-28
on run argv
set domain to item 1 of argv
tell application "Google Chrome"
	tell front window
		
		--record current active tab and its index.
		set origTab to active tab
		set origTabIndex to active tab index
		
		--open Chrome sockets page.
		set theTab to make new tab with properties {URL:"chrome://net-internals/#sockets"}
		
		--waiting for loading html document
		set isLoadDone to not loading of theTab
		repeat until isLoadDone
			set isLoadDone to not loading of theTab
		end repeat
		
		--Chrome has to spend some time to execute init javascript,otherwise the javascript statements in the below execute commond won't work.
		--How long you should delay depends on the performance of your mac.
		delay 0.3
		
		--flush Chrome sockets
		--you can find below javascript statements in Chrome's net-internal index.js on line 9860 and 9861
		execute theTab javascript "document.getElementById('sockets-view-flush-button').click()"

		set URL of theTab to "chrome://net-internals/#hsts"

		--waiting for loading html document
		set isLoadDone to not loading of theTab
		repeat until isLoadDone
			set isLoadDone to not loading of theTab
		end repeat
		
		
		--Chrome has to spend some time to execute init javascript,otherwise the javascript statements in the below execute commond won't work.
		--How long you should delay depends on the performance of your mac.
		delay 0.3
		
		--flush Chrome sockets
		--you can find below javascript statements in Chrome's net-internal index.js on line 9860 and 9861
		execute theTab javascript "document.getElementById('domain-security-policy-view-delete-input').value='"& domain &"';document.getElementById('domain-security-policy-view-delete-submit').click();"
		
		--close Chrome sockets page
		close theTab
		
		--reactive the previous tab
		set active tab index to origTabIndex
		--reload the previous tab
		-- reload origTab
		
	end tell
	end tell
end run

