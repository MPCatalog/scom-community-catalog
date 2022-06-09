### SQL RunAs Addendum

This is a SCOM management pack for Operations Manager which will ease the burden of SQL RunAs Accounts. Instead of using a domain credential, we will use a service SID and a special login to SQL to provide secure access for monitoring.

-   Version 7.0.36.1
    - Changed the server role to be added with AUTHORIZATION to support customers who rename SA account.
    - Changed to only add server role or DB role if they do not already exist to reduce errors displayed when re-running.
    - Added GRANT EXECUTE ON sys.xp_instance_regread TO [SCOM_HealthService];
    - Removed EXEC sp_addrolemember @rolename='PolicyAdministratorRole', @membername='SCOM_HealthService';
- Version 7.0.36.0
    - Added two tasks to be able to run a MOFCOMP repair of WMI for SQL namespace.
    - Added Alert view for discovery/monitoring errors
- Version 7.0.32.0
    - Updated SQL 2012+ script to add new requirements on MSDB database for SQL Agent Job discovery required for 7.0.32.0 of the SQL MP
    - Changed frequency of Healthservice SID is Enabled Monitor from 43200 seconds to 14400 seconds based on feedback
- Version 7.0.20.1
    - Changed frequency of Healthservice SID is Enabled Monitor from 60 seconds to 43200 seconds.
    - Added On-Demand recalculate capability to Healthservice SID is Enabled Monitor
- Version 7.0.20.0
    - Added SQL TcpPorts to configuration scripts to enable connecting to secured SQL environments
    - Version 7.0.15.2
    - Updated SQL 2012+ script to remove ALTER ANY DATABASE right, and add SELECT on sql db mirroring tables to fix discovery error when using older MP's
- Version 7.0.15.1
    - Fixed MP dependencies to support SCOM 2012R2
- Version 7.0.15.0
    - Original release of the addendum for the SQL Version Agnostic MP for SQL 2012 and later.
