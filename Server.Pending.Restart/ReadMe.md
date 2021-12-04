#Introduction
Introducing the �Server Pending Restart Monitoring� management pack for System Center Operations Manager. (2012 R2 / 2016 / 1801 / 1807 / 2019).

##Background:

This management pack was inspired from an existing, and very popular, management pack from David Allen � 'SCOM Pending Reboot Management Pack'. This provides alerting when certain conditions on the monitored server are detected and requires the server to be restarted.

We wanted to build on this idea, but at same time, introduce an enhanced level of monitoring.

This management pack provides monitoring and alerting for multiple pending restart conditions. Each condition check can enabled / disabled via override to suit your monitoring requirements.

Pending restart condition detection:
* Component Based Servicing (CBS)
* Pending Computer Rename and/or Domain Join operations
* Pending File Rename Operations
* System Center Configuration Manager (SCCM)
* Windows Update / Auto Update

The "Server Pending Restart" management pack contains a monitor and a rule.

The monitor is enabled by default and is configured to change the 'Configuration' health state of the target Windows Server Operating System.
The rule, which is disabled by default has the exact same condition detection behaviour as the "Server Pending Restart Monitor". This rule can be enabled as an alternative to the "Server Pending Restart Monitor" when the presentation of health state changes is not required.

## Resources
Management Pack guide: https://web.archive.org/web/20200319004828/https://gallery.technet.microsoft.com/Server-Pending-Restart-New-2457a729/file/221038/1/Server%20Pending%20Restart%20MP%20Guide.pdf
ReadMe: https://github.com/gavspeed/ServerPendingRestart