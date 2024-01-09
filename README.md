# Sudo Touch ID on Mac

## This needs to be run after every software update.

1. Clone the file
2. Make the file executable
  ```
  chmod +x update_sudo_pam.sh
  ```
3. Run the file
  ```
  sudo ./update_sudo_pam.sh
  ```

TODO: Add it to system start up file
```
On macOS, you can use the "Launch Agents" or "Launch Daemons" system to configure scripts to run at startup. Here's a step-by-step guide to creating a Launch Agent for a shell script:

Create a Launch Agent Property List (plist) file:
Create a plist file with a text editor. You can use the nano or vi command-line editors, or any graphical text editor like TextEdit.
bash
Copy code
nano ~/Library/LaunchAgents/com.example.yourscript.plist
Replace com.example.yourscript with a unique identifier for your script.
Edit the plist file:
Add the following content to your plist file:
xml
Copy code
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.example.yourscript</string>
    <key>ProgramArguments</key>
    <array>
        <string>/path/to/your/script.sh</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
</dict>
</plist>
Make sure to replace /path/to/your/script.sh with the actual path to your shell script.
Save and exit the text editor:
For nano, press Ctrl + X to exit, press Y to confirm saving, and press Enter to confirm the file name.
Load the Launch Agent:
After creating the plist file, load the Launch Agent to register it with the system:
bash
Copy code
launchctl load ~/Library/LaunchAgents/com.example.yourscript.plist
If you make changes to the plist file, you need to unload and reload the Launch Agent for the changes to take effect:
bash
Copy code
launchctl unload ~/Library/LaunchAgents/com.example.yourscript.plist
launchctl load ~/Library/LaunchAgents/com.example.yourscript.plist
Now, your shell script should run automatically at system startup. Remember that the script's permissions should be set correctly (executable) as discussed in the previous response.

```
