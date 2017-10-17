**What's included in the management pack?**

*Views*:

There are five views included in this management pack. The first one "Drives defragmented by Operations Manager" is an event view which shows any events logged from the recovery task. The second "Logical Disk Health" is an Operations Manager 2007 R2 style dashboard which includes the other three views (Windows Server 2003 Logical Disks, Windows Server 2008 Logical Disk and Windows Server 2012 Logical Disks).\
[![image](http://blogs.catapultsystems.com/wp-content/uploads/attachments/cfuller/media/windowslivewriter/d5e228a95431_c284/image_thumb_1.png "image")](http://blogs.catapultsystems.com/wp-content/uploads/attachments/cfuller/media/windowslivewriter/d5e228a95431_c284/image_4.png)

*Rules*:

There are two rules included in this management pack. "Reset Disk Fragmentation Health" which runs an embedded PowerShell script weekly to reset the health state of the fragmented drives. And "Collect autodefragmentation event information" which gathers the events logged to the event log on the system when a drive is autodefragmeted by this management pack.

[![image](http://blogs.catapultsystems.com/wp-content/uploads/attachments/cfuller/media/windowslivewriter/d5e228a95431_c284/image_thumb_9.png "image")](http://blogs.catapultsystems.com/wp-content/uploads/attachments/cfuller/media/windowslivewriter/d5e228a95431_c284/image_22.png)

*Groups*:

There are two groups included in this management pack: "Drives to AutoDefragment" and "Drives to disable fragmentation monitoring". The two group approach provides a way that the OpsMgr administrator can approach any of the common disk defragmentation requirements that I have run into:

1)??I don't want to know if this drive is fragmented: Add the drive to the "Drives to disable fragmentation monitoring" group.

2)??I want to know the drive is fragmented but don't want to autodefragment the drive.??Add the drive to the exclusions section of the "Drives to AutoDefragment" group.

[![image](http://blogs.catapultsystems.com/wp-content/uploads/attachments/cfuller/media/windowslivewriter/d5e228a95431_c284/image_thumb_2.png "image")](http://blogs.catapultsystems.com/wp-content/uploads/attachments/cfuller/media/windowslivewriter/d5e228a95431_c284/image_6.png)

*Overrides*:

There are six overrides included in this management pack. There is one for each of the operating system management packs (2003, 2008, 2012), so these are actually two sets of three overrides. The first three overrides disable monitoring of fragmentation for any members of the "Drives to disable fragmentation monitoring" group. The second three overrides enable the built-in recovery in Operations Manager to defragment a drive.\
??[![image](http://blogs.catapultsystems.com/wp-content/uploads/attachments/cfuller/media/windowslivewriter/d5e228a95431_c284/image_thumb_4.png "image")](http://blogs.catapultsystems.com/wp-content/uploads/attachments/cfuller/media/windowslivewriter/d5e228a95431_c284/image_10.png)
