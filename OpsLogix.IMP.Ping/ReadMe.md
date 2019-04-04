### The Ping Management Pack is our free contribution to the System Center community.

Here you can download Ping Management Pack for SCOM 2012 & 2016.?If you are using SCOM 2007R2, please download the 2007R2 version of the Ping Management Pack?[here](https://www.opslogix.com/download-ping-management-pack-2007r2).

Please provide your contact details to download Ping Management Pack. We will send your personal download link to the email address you provide us with.


**Change Log**
V 3.0.15.62
- Added: overrides for all properties.
- Fixed: When selected no Ping Source the add fill crash the console.
- Fixed: The timeout of a ping was not converted to milliseconds.
- Fixed: data types of the overrides.
- Fixed: if a ping target is unresolvable the first time you start the SCOM agent the monitoring of that target will be uninitialized.

V 3.0.15.6
- Fixed the bug where the setting for ignoring a number of ping non-replies was ignored (NumberOfNoRepliesAllowed)

V 3.0.15.4
- Fixed : If the ping host is running a different culture than english the monitoring can fail.

V 3.0.15.0
- Corrected spelling mistakes
- Corrected replacement strings for alerts

V 3.0.14.0
- Replaced the WMI with a managed module to be able to handle a larger load
- Added a performance monitor for average jitter
- Added a performance monitor for average latency
- Added A performance monitor for average packet loss
- Reworked all monitors so the TTL, Payload, and number of averaging point can be configured
- Improved configuration UI