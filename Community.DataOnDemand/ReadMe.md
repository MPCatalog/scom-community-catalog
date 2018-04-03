[logo]: https://download.squaredup.com/images/logo.png

## What is the Data On Demand MP

The Data on Demand Management Packs contains several useful Microsoft System Center Operations Manager (SCOM) agent tasks, including the Netstat task required by Squared Up Visual Application Discovery & Analysis.

To make use of these Management packs, you will need SCOM installed and configured, monitoring your environment.  No other dependencies are required.

## Getting started

The sealed downloadable management packs can be found here:

<https://download.squaredup.com/#managementpacks>

To install the Data On Demand MPs you will need:

* SCOM 2012 R2 (earlier versions may be supported but are untested)
* SCOM Admin rights (only Administrators can import management packs)

### Install the SCOM Management Pack

Import the management packs into SCOM using the standard process.

The MPs will show up as `Data on Demand - Community Management Pack`.

The MPs adds a number of agent tasks to various computer classes, with the suffix `(Data On Demand)`. This can be viewed in the SCOM console under `Authoring > Management Pack Objects > Tasks`.

## Management Pack Contents

### Tasks

Display Name                       | Target           | Description
---------------------------------- | ---------------- | ----------------------
Get DNS Cache (Data On Demand)     | Windows Computer | Lists all entries in the server's DNS cache.
List Event Logs (Data On Demand)   | Windows Computer | Displays the last 4 entries in the system event log.
Get Netstat CSV (Data On Demand)   | Windows Computer | Displays established TCP connections using netstat.
List Processes (Data On Demand)    | Windows Computer | Lists the top 10 processes sorted by CPU usage.
List Services (Data On Demand)     | Windows Computer | Lists the name and status of services.
Resolve Addresses (Data On Demand) | Windows Computer | Looks up the specified IP Addresses or names using configured DNS settings on the target computer.

**Note:** Windows tasks support returning data in JSON, however this is only supported if PowerShell v3 or later are available on the target agent.

## Releases

While anyone is free to download and import these management pack projects, sealed and signed releases of these management packs will only be available via <https://download.squaredup.com/#managementpacks>.

Releases of these management packs will use semantic versioning, and will occur as and when warranted.

## Help and Assistance

These management packs are community packs originally developed by Squared Up (<http://www.squaredup.com>).

For help and advice, post questions on <http://community.squaredup.com/answers>.

If you have found a specific bug or issue with the tasks in one of the management packs, please raise an [issue](https://github.com/squaredup/Community.DataOnDemand.MP/issues) on GitHub.