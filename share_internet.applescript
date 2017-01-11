#TODO
#make subroutines
--UI elements and properties of UI elements for debugging, or try entire contents
tell application "System Preferences"
	activate
	reveal (pane id "com.apple.preferences.sharing")
end tell
tell application "System Events"
	tell process "System Preferences"
		delay 0.5 #avoids "Loading Sharing" window
		try
			
			tell group 1 of window "Sharing"
				# check whether Internet Sharing is already active
				set sharingStatus to value of checkbox 1 of row 7 of table 1 of scroll area 1 as boolean
				if sharingStatus is true then
					display dialog "Internet sharing is on"
					return true
				end if
				
				# Share connection from Ethernet
				tell pop up button 1
					click
					click menu item "AX88179 USB 3.0 to Gigabit Ethernet" of menu 1
				end tell
				
				# Share to Wifi
				set wifiStatus to value of checkbox 1 of row 3 of table 1 of scroll area 2 as boolean
				if wifiStatus is false then
					click checkbox 1 of row 3 of table 1 of scroll area 2
				end if
				
				#Turn on Internet Sharing
				click checkbox 1 of row 7 of table 1 of scroll area 1
				delay 0.3
				if button "Turn Wi-Fi On" of window "Sharing" of application process "System Preferences" of application "System Events" exists then
					click button "Turn Wi-Fi On" of window "Sharing" of application process "System Preferences" of application "System Events"
				end if
				delay 0.1
			end tell
			tell window "Sharing"
				click button "Start"
			end tell
			delay 3
			tell application "System Preferences"
				activate
				reveal (pane id "com.apple.preferences.sharing")
			end tell
			tell group 1 of window "Sharing"
				click checkbox 1 of row 7 of table 1 of scroll area 1
				display dialog "Renew internet sharing?" buttons {"No", "Yes"} default button 2
				if result = {button returned:"Yes"} then
				# should do a reveal here.
					click checkbox 1 of row 7 of table 1 of scroll area 1
				end if
			end tell
			
		on error
			
			activate
			display dialog "Error"
			#tell application "System Preferences" to quit
			return false
		end try
		
	end tell
	
end tell