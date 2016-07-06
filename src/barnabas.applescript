on run argv
	set contact to item 1 of argv
	set message to item 2 of argv
	
	tell application "Messages"
		send message to buddy contact of (service 1 whose service type is iMessage)
	end tell
end run