## Use PowerShell and SCOM to find file shares with weak permissions
===============================================

To find file shares with weak permissions and fix them before potential misuse, I authored a PowerShell script and a small management pack for System Center Operations Manager (SCOM) 2012 R2 (and higher).

We sometimes need to give application developers or supporting third parties administrative access to servers. With a few clicks, you can create a file share providing a convenient way to transfer files to and from the server. Unfortunately, keeping the default permissions can lead to some unwanted results. Ransomware that scans the network for vulnerabilities and encrypts everything accessible may even cause serious service outages.
![State view showing share objects and their states](https://4sysops.com/wp-content/uploads/2017/10/State-view-showing-share-objects-and-their-states.png)

### Resources
[Blog Post](https://4sysops.com/archives/use-powershell-and-scom-to-find-file-shares-with-weak-permissions/) 
[Management Pack Download](https://github.com/Juanito99/AdminInfo_OpsMgr/tree/master/ABC.Windows.Server.AdminInfo/ABC.Windows.Server.AdminInfo/bin/Debug)