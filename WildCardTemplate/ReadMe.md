Using SCOM – Microsoft System Center Operations Manager?

Probably you encountered the Service monitoring request from the client.

What if the client is requesting to monitor deferent services that have deferent names but all under the same application?

Probably you used the Windows Service Template and selected one service at a time.

NO MORE!
from now on use WMI query to monitor all of the services under one class and one discovery.

I created a new Template under SCOM authoring management pack templates with the name “Windows Service Wildcard Monitor”



It now gets a WMI query from you with all the services that you want to monitor, just select your query and the group and vulla!