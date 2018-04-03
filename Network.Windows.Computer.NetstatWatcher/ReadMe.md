## Monitor any network-connection or listening port with OpsMgr

Simple Management Pack which monitors specified listening ports or network connections.


### Introduction:
SCOM offers ‘wizards’ to monitor Windows services and processes. Most of the cases this is enough to ensure that an application works.
Sometimes however multiple connections are handled by a service or a process. 

Ready to use ‘port monitors’ help to identify if a port on a target machine responds.
There are cases however where connection attempts can irritate or even crash an application.

In hybrid scenarios part of the application runs in the cloud. – A windows machine might act as gateway for example. It would be good to know if the connection to endpoint in the cloud is still active.

This management pack which uses netstat and powershell can help.



### Diagram View:
![DiagramView](https://raw.githubusercontent.com/Juanito99/Network.Windows.Computer.NetstatWatcher/master/PicturesForGitWebSite/Diagram%20view%20showing%20monitored%20listening%20ports%20and%20tcp%20connections.png)

### State Views:
![StateView_Listen](https://raw.githubusercontent.com/Juanito99/Network.Windows.Computer.NetstatWatcher/master/PicturesForGitWebSite/stateview%20showing%20listeningPorts.png)

![StateView_Connection](https://raw.githubusercontent.com/Juanito99/Network.Windows.Computer.NetstatWatcher/master/PicturesForGitWebSite/stateview%20showing%20tcpConnections.png)


### More information on:
[Documentation](https://github.com/Juanito99/Network.Windows.Computer.NetstatWatcher/blob/master/Documentation/Monitor%20any%20network-connection%20or%20listening%20port%20with%20SCOM%20-%20Git.pdf)


### Downloads:
[ManagementPack-Sealed](https://github.com/Juanito99/Network.Windows.Computer.NetstatWatcher/blob/master/Network.Windows.Computer.NetstatWatcher/Network.Windows.Computer.NetstatWatcher/bin/Release/Network.Windows.Computer.NetstatWatcher.mpb) 

[ManagementPack-UnSealed](https://github.com/Juanito99/Network.Windows.Computer.NetstatWatcher/blob/master/Network.Windows.Computer.NetstatWatcher/Network.Windows.Computer.NetstatWatcher/bin/Debug/Network.Windows.Computer.NetstatWatcher.mpb) 

[Source for VSAE 2015](https://github.com/Juanito99/Network.Windows.Computer.NetstatWatcher/tree/master/Network.Windows.Computer.NetstatWatcher/Network.Windows.Computer.NetstatWatcher)




### License Terms

Network.Windows.Computer.NetstatWatcher
Copyright (C) 2017 Ruben Zimmermann (Juanito99)

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
