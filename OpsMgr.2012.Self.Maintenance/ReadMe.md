### Introduction

I can't believe it has been 1 year and 3 month since the OpsMgr Self Maintenance MP was lastly updated. This is partially because over the last year or so, I have been spending a lot of time developing the OpsMgr PowerShell / SMA module OpsMgrExtended and am stilling working on the??[Automating OpsMgr blog series](http://blog.tyang.org/tag/automating-opsmgr/).?? But I think one of the main reasons is that I did not get too many new ideas for the next release. I have decided to start working on version 2.5 of the Self Maintenance MP few weeks ago, when I realised I have collected enough resources for a new release. So, after few weeks of development and testing, I'm pleased to announce the version 2.5 is ready for the general public.

### What's new in version 2.5?

-   Bug Fix: corrected "Collect All Management Server SDK Connection Count Rule" where incorrect value may be collected when there are gateway servers in the management group.
-   Additional Performance Rules for Data Warehouse DB Staging Tables row count.
-   Additional 2-State performance monitors for Data Warehouse DB Staging Tables row count.
-   Additional Monitor: Check if all management servers are on the same patch level
-   Additional discovery to replace the built-in "Discovers the list of patches installed on Agents" discovery for health service. This additional discovery also discovers the patch list for OpsMgr management servers, gateway servers and SCSM servers.
-   Additional Agent Task: Display patch list (patches for management servers, gateway servers, agents and web console servers).
-   Additional Agent Task: Configure Group Health Rollup
-   Updated "OpsMgr 2012 Self Maintenance Detect Manually Closed Monitor Alerts Rule" to include an option to reset any manually closed monitor upon detection.
-   Additional Rule: "OpsMgr 2012 Self Maintenance Audit Agent Tasks Result Event Collection Rule"
-   Additional Management Pack: "OpsMgr Self Maintenance OMS Add-On Management Pack"

**To summarise, in my opinion, the 2 biggest features shipped in this release are the workflows built around managing OpsMgr Update Rollup patch level, and the extension to Microsoft Operations Management Suite (OMS) for the management groups that have already been connected to OMS via the new OpsMgr Self Maintenance OMS Add-On MP .**
