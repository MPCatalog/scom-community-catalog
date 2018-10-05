# OpsMgr GenericServiceMonitoring ManagementPack

## Introduction:
It is often necessary to monitor windows services across your entire SCOM environment. This MP gives you the ability to easily and quickly discover and monitor hundreds of services. The (*)wildcard notation allows great flexibility in discovering the services you are looking for.

The MP is tested in System Center Operations Manager 2012 R2 and 1807.

This ManagementPack is currently under development and may contain errors. Please always test it in a DEV environment first.

## Configuration:
##### 1. CSV File Schema:

   __ServiceName;Include;Exclude__

    Include: Comma separated List of Servername(ShortName)

    Exclude: Comma separated List of Servername(ShortName)

    *: Every Host in the "Microsoft.SystemCenter.ManagedComputerServer" Class

   __ServiceA;HostA,HostB;none__

    ServiceA is monitored for HostA and HostB. There is no exclusion.

  __ServiceB;*;none__

    ServiceB is monitored on every Host. There is no exclusion.

  __Service*;*;HostB__

    Service*(wildcard) is monitored on every Host and excluded for HostB.


##### 2. Start Sevice Ingest Task

   __Execute Task__

   1. The Task which starts the CSV ingestion process in found at the "Management Server View". Select the MS on which the CSV is located and execute the Task. (Views -> State View Management Server)
   2. Click "Override" to enter the path to the CSV.

![alt text](https://github.com/spa5603/OpsMgr.GenericServiceMonitoring/blob/master/Graphics/RunTask.jpg)

   3. Enter the path to the CSV file.

  ![alt text](https://github.com/spa5603/OpsMgr.GenericServiceMonitoring/blob/master/Graphics/OverrideParameter.jpg)


##### 3. Check discoverd Services
      The discovery is configured to run every 24h and detect newly processed servers. This setting can be changed to meet your requirements. So it can take up to 24 hours until the service can be discovered.

## Examples:

  1. CSV:

    ServiceA;HostA,HostB;none
    
    ServiceB;*;none

    Service*;*;HostB

    ServiceA;*;HostC,HostD


  2. ServiceFilePath:

    C:\SCOM\GenSerMon.csv
    

## Views:

##### State View Discoverd Services:
![alt text](https://github.com/spa5603/OpsMgr.GenericServiceMonitoring/blob/master/Graphics/StateView%20-%20Discovered%20Services.jpg)

##### State View Management Server
![alt text](https://github.com/spa5603/OpsMgr.GenericServiceMonitoring/blob/master/Graphics/StateView%20-%20Management%20Server.jpg)

## License Terms
OpsMgr GenericServiceMonitoring Copyright (C) 2018 Sebastian Pabst (spa5603)

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see http://www.gnu.org/licenses/.
