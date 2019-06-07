### Microsoft Remote Access Management Pack
AP.Remote.Access (v19.5.5)
==========================

Microsoft Remote Access Management Pack (this is a conversion of Microsofts Remote Access 2012R2 Management Pack to make it compatible with 2012/2012R2/2016/2019.\
This is not my work merely a conversion of Microsoft Management pack with some tidying up!

Classes
-------

MicrosoftRemoteAccess\
RemoteAccessSite\
RemoteAccessServer\
VPNServer\
DirectAccessServer\
...6To4\
...DNS\
...DNS64\
...DomainController\
...HighAvailability (NLB)\
...IPHTTPS\
...ISATAP\
...Kerberos\
...ManagementServers\
...NAT64\
...NetworkAdapters\
...NetworkLocationServer\
...NetworkSecurity\
...OTP\
...Services\
...Teredo

Notes
-----

Install the Management Pack, a Profile will be created called "AP Remote Access Login", add a Login Account to this profiles and distribute to your Remote Access Servers, this should be a Domain Account that has rights to run the Powershell Command Get-RemoteAccess on the Remote Access Servers. Without this Account being correctly distributed Discovery won't happen! Don't forget if Running SCOM 2019 to give this account "Log on as a service" rights on the Remote Access Servers. Discovery Happens every 4 Hours, so be patient!

The Microsoft Management Pack only creates the Root Remote Access object and Sites if you are using Multisite, I have added a bit to the discovery script that will create a single site named your "ConnectTo" name if you aren't running Multi-Site this can be over-ridden on the Discovery, it's called CreateSingleSite, set this to false and behaviour reverts back to Standard Microsoft 2012.R2 Management Pack behaviour! Any Questions please don't hesitate to contact me!
