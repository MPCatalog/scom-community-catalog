### SQL RunAs Addendum

Updated 5-1-2018

This is a SCOM management pack for Operations Manager 2012 and 2016, which will ease the burden of SQL RunAs Accounts. ?Instead of using a domain credential, we will use a service SID and a special login to SQL to provide secure access for monitoring.
-   Version 7.0.0.0
    -   Added support for SQL 2017+ and simplified monitor and task names.
-   Version 6.7.31.0
    -   Disabled Monitor for SysAdmin role check by default
    -   Updated SQL Low Priv configuration tasks to be more reliable
-   Version 6.7.7.2
    -   Updated addendum views to fall under regular SQL presentation views
-   Version 6.7.7.1 - Update 10/18/2016
    -   Bug fixes for LOW PRIV script task to support offline DB's, read only, always ON, etc.
-   Version 6.7.2.0?-- Update
    -   Added?support for SQL 2016
    -   Added additional monitors to check for ability to connect to SQL?and sysadmin role check
    -   Removed any alerting by default.
    -   Added new task to configure Healthservice login for LOW PRIV to SQL
    -   Added folders, and state views to ease configuration and running tasks
-   Version 6.6.4.0?-- Original release of the addendum MP's
