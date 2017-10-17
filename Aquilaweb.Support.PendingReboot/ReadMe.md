The management checks for a pending reboot requirement in four places...  These three registry locations are checked for values that indicate a reboot is required:

HKLM\System\CurrentControlSet\Control\Session Manager\
HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\
HKLM\Software\Microsoft\Windows\CurrentVersion\Component Based Servicing

And, Microsoft.Update.SystemInfo is queried for a requirement to reboot.

After testing though, I did notice that some applications can create registry entries that would normally indicate that a system reboot is required, however a reboot isn't actually required, it's just the way the app works.  Therefore, I have also added the ability to configure whether the reg keys are checked, or if Microsoft.Update.SystemInfo is queried, or both.  This can be configured by overriding the Script Arguments property on the monitor to one of these values:

"11" -- All reg keys and SystemInfo queried (Default)

"01" -- No reg keys checked, only SystemInfo queried

"10" -- All reg keys checked, SystemInfo not queried

[![Reboot Overrides](https://i1.wp.com/aquilaweb.net/wp-content/uploads/2015/07/RebootOverrides2-300x242.png?resize=300%2C242)](https://i1.wp.com/aquilaweb.net/wp-content/uploads/2015/07/RebootOverrides2.png)