### Main features

-   **Discovery**: Registry discovery of main Operations Manager 2016 server roles -- the RMS Emulator, other additional Management Servers (MS) and Gateway Servers (GW).
-   **Monitoring**: Monitors the registry value of all discovered Operations Manager server roles for the current version of the Operations Manager installation. If the version is anything other than 2016, the monitor will go into warning state.
-   **Upgrade State of Operations Manager Management Group**: To provide a high-level summary of the upgrade state of the Operations Manager Management Group based on the upgrade state of its core components (not including agents). The core components consist of the RMS Emulator, all Management Server and Gateway Server roles discovered in the management group.
-   **Dashboards:**  A visualization feature that allows the user to switch back and forth between a **Summary Dashboard** and an **Agent Detail Dashboard** to keep track of the overall upgrade state and health of the core components and Windows agents in the management group.
    -   The **Summary Dashboard** displays all the core Operations Manager 2016 components or server roles discovered, the overall upgrade state of the management group, and a text and an instance detail widget to contextually display important recommendations and instance property values based on the core component selected.
    -   The **Agent Detail Dashboard** displays the upgrade state, installation method, patch level, agent and computer health of all the Windows Agents in the management group. The **search feature** provides further filtering capabilities to allow the health and upgrade state of a specific agent and it's corresponding host server or computer to be identified and displayed.\
**Summary Dashboard**:

![](https://i1.gallery.technet.s-msft.com/sample-management-pack-fd15caa7/image/file/160585/1/gallery01.jpg)