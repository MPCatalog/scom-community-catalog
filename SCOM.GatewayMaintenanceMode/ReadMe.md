
### SCOM Gateway Maintenance Mode

Created as a part of [HackASCOM 2021](https://scomathon.com/blog/automating-maintenance-mode-for-computers-behind-a-gateway-scom-management-pack-by-kevin-holman/) Kevin Holman's entry was based around automating the deployment of maintenance mode against agents with an unavailable gateway and take them out of maintenance mode when the gateway becomes available again.

The SCOM community wanted to have an MP that does the following: when there’s a gateway or network outage – either because the gateway goes down, or the link goes down – they want to suppress the alerts from the agents that report to the gateway. This would stop hundreds of heartbeat failures and computer unreachable alerts flooding in, which aren’t really true because there’s a singular problem with something like a network link.

So, the community wanted a gateway outage to trigger a maintenance mode for the agents behind the gateway then remove it once it’s available again.

This is what Kevin built. His management pack consists of:

- 3 Classes (Groups)
- 3 Relationships (Groups)
- 3 Discoveries (Groups)
- 1 Data source
- 1 Write Action
- 1 MonitorType
- 2 Recoveries
- 4 Views
- 1 Folder
- 5 PowerShell Scripts

The management pack uses a simple ping of each gateway to monitor for availability. If the monitor is unavailable, that turns the gateway ‘unhealthy’ which then triggers it to run a recovery to put the group behind the gateway into maintenance mode. This group can be dynamically populated with the right agents so maintenance mode is scheduled for the right agents only.

Once the ping recognises that the gateway is healthy again, another recovery is triggered to stop maintenance mode.

Authoring tip: It’s little known that it’s possible to run a recovery when a monitor goes back to healthy status. You have to write it in XML, but it is doable.

Within the management pack, you need to create a group for each gateway and the PowerShell script populates the group with agents assigned to that gateway. When maintenance mode is triggered, it’s triggered for that group.
