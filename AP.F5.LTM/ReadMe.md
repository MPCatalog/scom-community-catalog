# AP.F5
F5 SCOM Management Pack - A free alternative F5 Management Pack for System Center Operations Manager.

## AP.F5.LTM.Discovery (Console Application)
* **F5 SyncFailoverGroups** - Sync Failover Groups are discovered (Stand-Alone F5 Devices are put in a device group, called by their own name)
* **F5 Virtual Servers** - All Virtual Servers in each SyncFailover Group
* **F5 Nodes** - All Nodes in each SyncFailover Group
* **F5 Pools** - All Pools in each SyncFailover Group
* **F5 Pool Members** - All Pool Members in each Pool
* **F5 Client SSL Profiles** - All Client SSL Profiles in each SyncFailover Group (used to tie Certificate to Virtual Server)
* **F5 Server SSL Profiles** - All Server SSL Profiles in each SyncFailover Group (used to tie Certificate to Virtual Server)
* **F5 Certificate** - All Client SSL Profiles in each SyncFailover Group (used to tie Certificate to Virtual Server)

This Application utilizes 2 csv files devices.csv and config.csv.
**device.csv** this is a list of; device ip, SNMP Community, SNMP Port, F5 UserName, F5 Password. 
There is a an example file called example_devices.csv included, rename this file to devices.csv and fill in your information, the header row is needed.
**config.csv** this currently just has the Management server that the discovery data will be sent to, if this file doesn't exist localhost will be used, useful if you are running it on a management server.  Again an example file is included.
I have this scheduled to run every 24 Hours, but as we are only discovering devices you can run it less frequently if you so desire.
Monitoring and Performance is gathered every 5 minutes, via SNMP, by the **AP.F5.Base** Management pack.

Also Containment relationships between Certificates->Profiles->Virtual Servers are discovered by this app.

## AP.F5.LTM (SCOM 2016 Management Pack)
SNMP Monitoring & Performance Collection for LTM Objects is handled by this SCOM Management Pack (details to follow)

* Certificate Expiration Status
* Traffic Group Status
* Client SSL Profile Status
* Server SSL Profile Status
* Virtual Server Enabled Status
* Virtual Server Availability Status
* Node Enabled Status
* Node Availability Status
* Pool Enabled State
* Pool Availability State
* Pool Member Enabled State
* Pool Member Availability State

Download Installer from https://c22mort.github.io/
GitHub Repo : https://github.com/c22mort/AP.F5.LTM
