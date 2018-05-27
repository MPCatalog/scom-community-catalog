### UNIX/Linux Docker Monitoring

This management pack allows you to monitor on-premise Docker containers hosted on UNIX/Linux computers. It has basic functionality:

-   Daemon state monitoring
-   Container state monitoring
-   Collects container CPU usage
-   Collects container memory usage

For montitoring your Docker infrastructure you should upgrade Operations Manager 2012 Agent for UNIX/Linux:

1.  Download latest Operations Manager Agent for Linux from the page <https://github.com/Microsoft/OMS-Agent-for-Linux>
2.  Copy it to UNIX/Linux hosts (as example with WinSCP)
3.  Upgrade it using command "sh <path to the downloaded agent> --upgrade --enable-opsmgr"