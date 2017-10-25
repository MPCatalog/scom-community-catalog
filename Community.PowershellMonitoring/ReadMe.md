[logo]: https://download.squaredup.com/images/logo.png

## What is the PowerShell Monitoring MP

The PowerShell Monitoring Management pack extends Microsoft Systems Center Operations Manager (SCOM) to allow creation of PowerShell based monitors, rules, tasks, diagnostics and recoveries directly from the SCOM console using the Authoring tab.  No MP authoring knowledge is required to create these - authors can leverage their existing scripts and the UI contains the samples they need to modify them to work with SCOM.

To make use of this Management pack, you will need SCOM installed and configured, monitoring your environment.  From that point all you need is enough knowledge of PowerShell scripting to accomplish whatever monitoring tasks are required.

## Getting started

The sealed downloadable management packs can be found here:

<https://download.squaredup.com/#managementpacks>

To install the PowerShell Monitoring mp you will need:

* SCOM 2012 R2 (earlier versions may be supported but are untested)
* SCOM Admin rights (only administrators can import management packs)
* SCOM authoring rights provided to all users who need to create PowerShell-based workflows

### Install the SCOM Management Pack

Import the management pack into SCOM using the standard process.

The MP will show up as `PowerShell Monitoring - Community Management Pack`.

### Using the MP

The MPs add various templates to the appropriate _Create..._ wizards in the _Authoring_ tab of the SCOM console.  For example, right clicking on _Monitors_ and selecting _Create a Monitor_ -> _Unit Monitor_ will now include a _PowerShell Based_ folder under _Scripting_.

The following table displays all templates added by this management pack:

| Name | Type | Description |
|------|------|-------------|
| Run a PowerShell Script                       | Diagnostic | Runs a script as a diagnostic, returning text |
| PowerShell Script Three State Monitor         | Monitor    | Runs a script and reports Healthy, Warning, or Critical based on the script output |
| PowerShell Script Two State Monitor           | Monitor    | Runs a script and reports Healthy or Warning/Critical based on the script output |
| Run a PowerShell Script                       | Recovery   | Runs a script as a recovery, returning text |
| PowerShell Script Alert Generating Rule       | Rule       | Raises Alerts if the output of a PowerShell script matches a specified criteria |
| PowerShell Script Event Collection Rule       | Rule       | Collects events created and submitted by a PowerShell script |
| Run a PowerShell Script on an event           | Rule       | Runs a PowerShell script if a specified event is detected |
| PowerShell Script Performance Collection Rule | Rule       | Collects performance metrics created and submitted by a PowerShell script |
| Run a PowerShell Script                       | Rule       | Runs a PowerShell script on a routine interval |
| Run a PowerShell script                       | Task       | Runs a simple script as an agent task, returning text|

Each template allows you to specify a script, and dynamically insert arguments based on the workflow target.  Each template includes a sample script that already has the necessary boilerplate to work with the SCOM API, so no prior knowledge is necessary.  Scripts will not be checked for correctness by the template however, so ensure you have thoroughly tested them prior to using the templates.

Arguments are passed to the script as a _single string_, so if you need to pass multiple arguments you should use the `String` `.Split` method with an appropriate separator to convert `$Arguments` into an array.  Remember that you can also insert values from the Targeted class anywhere into the script (i.e. into unique variables in the script body) so the main purpose of injecting values via arguments is for overrides (since the Arguments value can be overridden in all templates).

### PowerShell Versions

The PowerShell MP does not define or control which version of PowerShell will execute any given script - this is determined at runtime by SCOM on each agent.  This means if all of your servers have PowerShell v4 installed you can write scripts with that minimum version in mind, otherwise you will need to target the lowest version in your environment. We would suggest testing any scripts you may write against that version to ensure the widest compatibility, prior to adding them to SCOM.

As a reminder, Windows Server 2008 R2 shipped with PowerShell v2 installed and enabled by default, so that is generally a good target.

### Performance and Scaling

The workflows created by this management pack support a SCOM feature called [Cookdown](https://technet.microsoft.com/en-gb/library/ff381335.aspx) which enables scripts (or any data source) which would be run many times to instead be run once, and the output data shared. In order for this to function however, all instances of that script must be *exactly* the same, and have *exactly the same input values* (including schedule, overrides etc).

In practice what this means is that if you need to monitor a class that appears multiple times on an agent (such as a database), and collect performance information as well, you should ensure your script supports Cookdown.  To do this, rather than having your script make use of identifiers (such as the DB name, either hard-coded or via a `$Target/` reference) instead have the script locate and provide data for *all* instances at the same time (making sure to provide the ID of each item along with the monitoring data).

This can then safely be filtered outside the script, in the Criteria/Mapper sections of the templates, so that each instance of the monitor only examines the health state of it's appropriate object.

## Samples

The `Samples` folder on [github](https://github.com/squaredup/Community.PowerShellMonitoring.MP) contains example scripts you could use in your own SCOM workflows.  These are not included in the management pack, and dependencies may vary from script to script.

## Releases

While anyone is free to download and import these management pack projects, sealed and signed releases of these management packs will only be available via [https://download.squaredup.com/#managementpacks](https://download.squaredup.com/#managementpacks).

Releases of these management packs will use semantic versioning, and will occur as and when warranted.

## Help and Assistance

These management packs are community packs originally developed by Squared Up ([https://www.squaredup.com](https://www.squaredup.com)) and inspired by [Wei Lim](https://blogs.msdn.microsoft.com/wei_out_there_with_system_center/).

For help and advice, post questions on [http://community.squaredup.com/answers](http://community.squaredup.com/answers).

If you have found a specific bug or issue with the templates in this management pack, please raise an [issue](https://github.com/squaredup/Community.PowerShellMonitoring.MP/issues) on GitHub.

## Contributions

If you want to suggest some fixes or improvements to the management pack, raise an issue on [the GitHub issues page](https://github.com/squaredup/Community.DataOnDemand.MP/issues), or better, submit the suggested change as a [Pull Request](https://github.com/squaredup/Community.PowerShellMonitoring.MP/pulls).

If you have an awesome script that you would like to share with people, feel free to submit a pull request and add the script to the `samples` folder (making sure to include some context in the script help for what/how it can be used).
