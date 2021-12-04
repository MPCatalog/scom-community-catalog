## MultiHome.ManagementGroup.Automator

A simple Management Pack to help add and remove Management Groups to/from agents.

Hello, just fulfilling a quick ask with this one. With SCOM 2012 we were given the ability to manage agent Management Group configuration using the Agent Config Manager Object or AgentConfigManager.MgmtSvcCfg. It can be leveraged in VBS or PowerShell to Add, Remove, and List SCOM management groups configured on the agent. This isn?t groundbreaking news and the methods are well documented, and plenty of community examples exists already.

That said, I see it asked frequently about what the best method of running a script to modify MG settings against their agent install base. SCCM and remote PowerShell are common solutions, but with this last go-around, I thought why not leverage SCOM itself (assuming it?s not an all-out removal).

Below is a link to a VSAE project for a Management Pack that contains two disabled rules and a script-based data source (VBS) to help automate the addition and removal of management groups for agents. The rules can be overridden and enabled to Add a MG w/a Management Server, or remove a MG.

I?ve done my best to include logging and protections against bad things (like removing the last MG on an agent), but please be cautious as this MP could be dangerous and easily break every agent. As always:

This is provided AS-IS, as an example only, and contains no warranty. The MP should not be used in a production environment without careful review and planning.

Have fun!

<https://docs.microsoft.com/en-us/archive/blogs/cchamp/multi-home-management-group-automation-mp>
