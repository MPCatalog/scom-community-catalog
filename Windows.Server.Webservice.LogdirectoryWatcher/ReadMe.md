## Monitor Webservers Log directories

Management Pack which monitors the webserver's log directory size and rotates the logs on demand.


### Introduction:
IIS, Apache and Tomcat can write log files. Often, these files occupy large space cause a disk filling up.
This Management Pack discovers log-folders and raises alerts based on thresholds. - Thresholds and alert behavior can be overridden as usual.



### State Views:
![StateView_WebSites](https://raw.githubusercontent.com/Juanito99/Windows.Server.Webservice.LogdirectoryWatcher/master/PicturesForGitWebSite/StateView.png)



### Alert Views:
![AlertView_WebSites](https://raw.githubusercontent.com/Juanito99/Windows.Server.Webservice.LogdirectoryWatcher/master/PicturesForGitWebSite/Alerts.png)


### Recoveries:
![Recoveries](https://raw.githubusercontent.com/Juanito99/Windows.Server.Webservice.LogdirectoryWatcher/master/PicturesForGitWebSite/Recoveries.png)


### Performance Rules:
![Recoveries](https://raw.githubusercontent.com/Juanito99/Windows.Server.Webservice.LogdirectoryWatcher/master/PicturesForGitWebSite/Rules.png)


### More information on:
[Documentation](https://github.com/Juanito99/Windows.Server.Webservice.LogdirectoryWatcher/blob/master/Documentation/MonitoringWebserversLogdirectorySizeWithSCOM.pdf)


### Downloads:
[ManagementPack-Sealed](https://github.com/Juanito99/Windows.Server.Webservice.LogdirectoryWatcher/blob/master/Windows.Server.Webservice.LogdirectoryWatcher/bin/Release/Windows.Server.Webservice.LogdirectoryWatcher.mpb) 

[ManagementPack-UnSealed](https://github.com/Juanito99/Windows.Server.Webservice.LogdirectoryWatcher/blob/master/Windows.Server.Webservice.LogdirectoryWatcher/bin/Release/Windows.Server.Webservice.LogdirectoryWatcher.xml) 

[Source for VSAE 2017](https://github.com/Juanito99/Windows.Server.Webservice.LogdirectoryWatcher/tree/master/Windows.Server.Webservice.LogdirectoryWatcher)



### Community Management Pack:
Keep this and many other management packs automatically up to date by installing the [Community Management Pack](https://squaredup.com/landing-pages/the-scom-community-mp-catalog)



### License Terms

Windows.Server.Webservice.LogdirectoryWatcher
Copyright (C) 2018 Ruben Zimmermann (Juanito99)

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
