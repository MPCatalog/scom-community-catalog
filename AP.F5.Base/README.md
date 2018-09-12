# AP.F5
F5 SCOM Management Pack - A free alternative F5 Management Pack for System Center Operations Manager.

## AP.F5.Base.Discovery (Console Application)
* **F5 Devices**
* **F5 Device Hardware** - CPU, Memory, Fans, Temperature Sensors, Power Supplies.

This Application utilizes 2 csv files devices.csv and config.csv.
**device.csv** this is a list of; device ip, SNMP Community, SNMP Port, F5 UserName, F5 Password. 
There is a an example file called example_devices.csv included, rename this file to devices.csv and fill in your information, the header row is needed.
**config.csv** this currently just has the Management server that the discovery data will be sent to, if this file doesn't exist localhost will be used, useful if you are running it on a management server.  Again an example file is included.
I have this scheduled to run every 24 Hours, but as we are only discovering devices you can run it less frequently if you so desire.
Monitoring and Performance is gathered every 5 minutes, via SNMP, by the **AP.F5.Base** Management pack.

Also Containment relationships between are discovered by this app.

## AP.F5.Base (SCOM 2016 Management Pack)
* **Additional SNMP Discovery of volatile data is handled by this SCOM Management Pack.
* **SNMP Unit Monitors (Fan Status, Memory Percentages, Processor Usage, Temp. Sensor Temperature, Power Supply Status)
* **SNMP Performance Collection (Device Client-Side & Server Side Connection Count, Client-Side Inbound/Outbound Kb, Server-Side Inbound/Outbound Kb, RAM Free, RAM Used, Processor Usage, Temperatures )

For Additional LTM Based Information (Virtual Servers Pools etc.) please see AP.F5.LTM.

Download Installer from https://c22mort.github.io/
GitHub Repo : https://github.com/c22mort/AP.F5.Base
