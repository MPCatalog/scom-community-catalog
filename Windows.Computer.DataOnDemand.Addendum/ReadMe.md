## Data On Demand Addendum - Management Pack for Windows Computers
The MP named Windows.Computer.DataOnDemand.Addendum provides different kinds of Agent Tasks for direct use in the SCOM console or in a Dashboard Tool.



### Get-ComputerDescription:
Retrieves the computer's local description and the one from the Active Directory computer object. 

![Get-ComputerDescription](https://raw.githubusercontent.com/Juanito99/Windows.Computer.DataOnDemand.Addendum/master/PicturesForGitWebSite/Get-ComputerDescription.png)


### Get-ComputerLastChanges:
o	Displays the computers' last changes; last installed software, interactive logged on user, last boot, etc.

![Get-ComputerLastChanges](https://raw.githubusercontent.com/Juanito99/Windows.Computer.DataOnDemand.Addendum/master/PicturesForGitWebSite/Get-ComputerLastChanges.png)


### Get-SCOMNotificaitonConfiguration:
Displays the SCOM's notification configuration incl. subscription, subscribers, channel, etc. 
Task works only if selecting a Management Server!

![Get-SCOMNotificaitonConfiguration](https://raw.githubusercontent.com/Juanito99/Windows.Computer.DataOnDemand.Addendum/master/PicturesForGitWebSite/Get-SCOMNotificaitonConfiguration.png)


### Get-RemoteSOAPServiceInfo:
Queries a remote web service via SOAP / XML displays its data; before RESTful became standard, web services could be consumed via SOAP.

![Get-RemoteSOAPServiceInfo](https://raw.githubusercontent.com/Juanito99/Windows.Computer.DataOnDemand.Addendum/master/PicturesForGitWebSite/Get-RemoteSOAPServiceInfo.png)


### Get-MSGraphData / Get-MSGraphBetaData
Queries Microsoft’s Graph API by extending given OData functions

![Get-MSGraphData](https://raw.githubusercontent.com/Juanito99/Windows.Computer.DataOnDemand.Addendum/master/PicturesForGitWebSite/Get-MSGraphBetaData.png)


### Get-MSO365MgmtData
Queries Microsoft’s O365 Management API by extending given OData functions

![Get-MSO365MgmtData](https://raw.githubusercontent.com/Juanito99/Windows.Computer.DataOnDemand.Addendum/master/PicturesForGitWebSite/Get-MSO365MgmtData.png)



### More information on:
[Documentation](https://raw.githubusercontent.com/Juanito99/Windows.Computer.DataOnDemand.Addendum/master/Documentation/DataOnDemandAddendum_ManagementPack_for_WindowsComputers.pdf)




### Downloads:

[ManagementPack-Sealed](
https://github.com/Juanito99/Windows.Computer.DataOnDemand.Addendum/blob/master/Windows.Computer.DataOnDemand.Addendum/Windows.Computer.DataOnDemand.Addendum/bin/Debug/Windows.Computer.DataOnDemand.Addendum.mpb)

[ManagementPack-UnSealed](https://github.com/Juanito99/Windows.Computer.DataOnDemand.Addendum/blob/master/Windows.Computer.DataOnDemand.Addendum/Windows.Computer.DataOnDemand.Addendum/bin/Debug/Windows.Computer.DataOnDemand.Addendum.xml)

[Source for VSAE 2017](https://github.com/Juanito99/Windows.Computer.DataOnDemand.Addendum/blob/master/Windows.Computer.DataOnDemand.Addendum/)




### Community Management Pack:
Keep this and many other management packs automatically up to date by installing the [Community Management Pack](http://cookdown.com/scom-essentials/community-catalog/)



### License Terms

Windows.Computer.DataOnDemand.Addendum
Copyright (C) 2020 Ruben Zimmermann (Juanito99)

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
