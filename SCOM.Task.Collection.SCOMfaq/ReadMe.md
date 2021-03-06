### SCOM Task Collection MP

A few weeks ago I started with a Task Collection MP?[found on this post](https://stefanroth.net/2013/01/02/scom-2012-scom-task-collection-mp-v-1-0/). As I am getting new ideas I will add more tasks to make life easier. In the latest version SCOM Task Collection MP version 1.2.0.0 I added 3 more tasks...

[![image](https://scomfaq.files.wordpress.com/2013/03/image_thumb1.png?w=299&h=314 "image")](https://scomfaq.files.wordpress.com/2013/03/image1.png)

First here brief overview of the current tasks which were found in version 1.0.0.0:

**01) Turn Firewall On\
**This task will turn on the windows firewall .

**02) Turn Firewall Off**\
Well, it explains itself. The task will turn off the windows firewall for all profiles.

**03) Get Logged On User\
**If you need to know who is currently logged on console and RDP sessions then you will run this task. It shows you also if the session is active or disconnected.

**04) Get Computer Uptime**\
This task shows you the last boot time and the uptime of the computer.

**05) Get Local Admins**\
This tasks shows you the users which are in the local administrators group on the respective computer.

**06) Get Free Disk Space**\
Sometimes you need to know quickly the free disk space of the logical disks and also its disk sizes.

**07) Get Pending Reboot**\
This task will check if there is a pending reboot for the computer.

**08) Set Dirty Bit\
**This is an old "thing", but I had a couple of times the need for running check disk at boot time. This task will set the dirty bit on drive C:, so that the server will run check disk the next time it starts.

**09) Get DNS Settings**\
This task shows you the configured DNS server settings and the server's IP address.

**10) Fix Support Tool Path**\
If you try to execute Active Directory related tasks from the Active Directory management pack like DCDiag, Repadmin etc. they will not work because the path to these tools has changed on Windows 2008 (R2) domain controllers. I have written a?[blog post](http://blog.scomfaq.ch/2011/12/04/support-tools-task-in-active-directory-management-pack-fails/)?about it. This task will create the necessary symbolic link as written?[here](http://blog.scomfaq.ch/2011/12/04/support-tools-task-in-active-directory-management-pack-fails/)?to get it working.

*New are task 11, 12 and 13:*

**11) Remove Management Group from Agent\
**If you have multi-homed agents which report to two management groups your agent will have two management group settings. This scenario is very likely in a SCOM side-by-side migration where you have the SCOM 2012 agent reporting to SCOM 2007 R2 AND SCOM 2012. If you need to remove one of the management group settings from the agent you can execute this task. You just need to provide the management group name (click the Override button and type the management group name) which you want to remove from the agent in the format:

***"MANAGEMENTGROUP"***

[![image](https://scomfaq.files.wordpress.com/2013/03/image_thumb2.png?w=299&h=336 "image")](https://scomfaq.files.wordpress.com/2013/03/image2.png)

**12) Add Management Group to Agent\
**If you need to add another management group setting to an agent you can execute this task. Just select a managed Windows computer in SCOM, run this task and click the Override button. You need to provide 3 parameters:

-   Management group name
-   SCOM management server
-   Port (usually port 5723)

The values need to be in the format:

***"MANAGEMENTGROUP" "MANGEMENT SERVER" 5723**\
*\
[![image](https://scomfaq.files.wordpress.com/2013/03/image_thumb3.png?w=299&h=335 "image")](https://scomfaq.files.wordpress.com/2013/03/image3.png)

**13) Mark Windows Server in Registry\
**This task is able to write 2 registry values into two predefined registry keys. First, this tasks creates a key in?***HKLM\SOFTWARE\SpecialKeys***?. Within this key two additional keys are generated one is called?***Category***?and one is called?***Team.***?Now you can add values to Category and Team if you run this task click Override and provide the values in the following format:

***"PRODUCTION" "SQL"***

This would write?***PRODUCTION***?into the Category key and?***SQL***?into the Team key, the task looks like this...

[![image](https://scomfaq.files.wordpress.com/2013/03/image_thumb6.png?w=299&h=335 "image")](https://scomfaq.files.wordpress.com/2013/03/image6.png)

...and the result like this...

[![image](https://scomfaq.files.wordpress.com/2013/03/image_thumb5.png?w=299&h=217 "image")](https://scomfaq.files.wordpress.com/2013/03/image5.png)

Well, you think now cool and so what? My intension is to have a quick way to set registry values to which will be discovered by attributes in SCOM. These attributes which discover the Category and Team key could be used to build dynamic groups based on the respective value in SCOM.

Now what do you think, huh?![Smiley](https://scomfaq.files.wordpress.com/2013/03/wlemoticon-smile.png?w=19)?

If you want to delete the registry values (not the keys!) just execute the task as it is without modifying anything.
