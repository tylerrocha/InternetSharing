# InternetSharing
AppleScript to activate Internet Sharing for Mac. Times out after 30 minutes to avoid overheating. Still a work in progress.

### Motivation
My dorm at NUS doesn't have wifi, so I would like to use my Mac as a hotspot for my phone. Also, when internet sharing is on and I'm using AC power, my Mac never sleeps. As a result, when I forget to turn off internet sharing my Mac eventually starts overheating.

### Getting Started

Allow terminal to control your computer under "Security and Privacy" in System Preferences. 
Then, run the following command to share your internet. 
```
osascript share_internet.applescript
```
Script assumes you want to share your Ethernet connection to devices using wifi. Script also assumes you have already set a local hostname and added any desired security to your hotspot.

### Next Steps
* Create a subroutine so sharing can be renewed indefinitely
* Allow user to customize timeout from the command line
* Add ability to end sharing before timeout

