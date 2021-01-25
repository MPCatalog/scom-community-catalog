# Hyper-V Management Pack Extensions 2019

This Hyper-V Management Pack Extensions 2019 is intended to add performance monitoring to the existing Hyper-V Management Pack.

This MP has monitors, rules and views that are detailed below. To avoid huge database consumption most of the performance rules are disabled by default. You can use these rules for creating your environment baselines.

Monitors are enabled and ready to run on your SCOM environment.

The configured thresholds on the monitors should cover most common scenarios but you may need to tune some of them to cover your own needs.

## This Management Pack is provided "as is" without any official support from Microsoft.

## New features on release 3.0.0.40
* Support for Windows Server 2019 Hyper-V.
* Minor code optimizations.

## Requirements
SCOM 2019 Operations Manager or higher.

Management Packs:
*	Microsoft System Center 2019 Management Pack for Hyper-V v11.0.1.0 or higher: https://www.microsoft.com/en-us/download/details.aspx?id=101312
*	Microsoft System Center Management Pack for Windows Server Operating System 2016 and 1709 Plus v10.1.0.2 or higher: https://www.microsoft.com/en-us/download/details.aspx?id=54303
*	Microsoft System Center Management Pack for Windows Server Cluster 2016 and 1709 Plus v10.1.0.0 or higher: https://www.microsoft.com/en-us/download/details.aspx?id=54701 


## Credits
This MP is based on the Hyper-V Management Pack Extensions 2016: https://github.com/dmrellan/Hyper-V-Management-Pack-Extensions-2016
