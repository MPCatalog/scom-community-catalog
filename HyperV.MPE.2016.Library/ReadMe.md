# Hyper-V Management Pack Extensions 2016

This Hyper-V Management Pack Extensions 2016 is intended to add performance monitoring to the existing Hyper-V Management Pack.

This MP has monitors, rules and views that are detailed below. To avoid huge database consumption most of the performance rules are disabled by default. You can use these rules for creating your environment baselines.

Monitors are enabled and ready to run on your SCOM environment.

The configured thresholds on the monitors should cover most common scenarios but you may need to tune some of them to cover your own needs.

## This Management Pack is provided "as is" without any official support from Microsoft.

## New features on release 3.0.0.30
* Support for Windows Server 2016 Hyper-V.
* New management pack structure in four files: Library, Discovery, Monitoring, Presentation and XML file to enable all performance rules (contains overrides Enable=True).
* New classes, discoveries, groups, monitors, rules and views for 2016 objects.
* Covered all features from the previous version (Hyper-V MP Extensions 2012 R2).
* Modified Integration Services monitor and class for VM Configuration Version (Hyper-V 2016)
* Added Product Knowledge for the majority of monitors.
* Added Hyper-V MPE 2016 Dynamic Memory Maximum Load Per Host monitor (Disabled by defualt).
* Minor code optimizations.

## Features on release 3.0.0.10 (included from previous release)
* Covered all features from the previous version (Hyper-V MP Extensions 2012 R2: https://github.com/dmrellan/Hyper-V-Management-Pack-Extensions-2012-2012-R2)

## Requirements
SCOM 2012 Operations Manager or higher.

Management Packs:
* Windows Server Hyper-V 2016 v10.0.8.0 or higher: https://www.microsoft.com/en-us/download/details.aspx?id=54918
* Windows Server 2016 Operating System v10.0.8.0 or higher: https://www.microsoft.com/en-us/download/details.aspx?id=54303
* Windows Server Cluster v10.0.6.0 or higher: https://www.microsoft.com/en-us/download/details.aspx?id=2268
