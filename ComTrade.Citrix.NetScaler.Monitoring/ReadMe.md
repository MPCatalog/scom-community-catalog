### Citrix NetScaler Monitoring Library
Citrix SCOM Management Pack for NetScaler is an availability and performance management solution that extends end-to-end service monitoring capabilities of Microsoft System Center Operations Manager (SCOM) to include the Citrix NetScaler (NetScaler) infrastructure. It fully integrates topology, health, and performance data into SCOM, providing an end‐to‐end operations overview across the entire NetScaler estate and enabling delivery of effective business service management.

Some key benefits of Citrix SCOM Management Pack for NetScaler are:

Agentless monitoring architecture
Intuitive topology discovery of internal NetScaler components
Deep monitoring of key virtual servers and services
Enhanced infrastructure health
Quick deployment and simple upgrades
Functioning across physical and virtual NetScaler appliances
Easy identification and resolution of network-specific issues
Acceleration of problem resolution
Scaling management responsibility across your infrastructure and organization
Automation of routine administration to improve service levels, increase efficiencies, and achieve greater control of the IT environment
Topology discovery

Citrix SCOM Management Pack for NetScaler provides out-of-the-box discovery of the NetScaler configuration:

Automatically discovers and visualizes the topology of NetScaler devices. The discovery and visualization are based on a defined NetScaler device model. The discovered devices are used as a base for NetScaler component discovery.
Updates NetScaler topology in regular time intervals.
Discovered NetScaler appliance objects are divided into the following major components:

System
Shows system settings as well as licensed functionalities on NetScaler and memory pools.
Network
Provides details on IP addresses (IPv4 and IPv6), network interfaces, VLANs, channels, and bridge groups.
Access Gateway
Displays AG virtual servers and related authentication policies.
Traffic Management
Contains Load Balancing group which includes LB virtual servers, as well as LB services and service groups.
SSL
Covers SSL entities, namely policies, actions, and certificates.
Authentication Authorization Auditing
Divides authentication servers into three groups: LDAP, Radius, and TACACS.
Cloud Bridge
Contains information about Network Bridges that are configured.
Monitoring 

Citrix SCOM Management Pack for NetScaler monitors many components out-of-the-box and is designed to be extendable to meet custom monitoring requirements. Some out-of-the-box monitoring capabilities are: 

Settings in detail, monitors per object as well as monitoring of configuration changes. 
Detection of unusual session behavior. 
Detection of NetScaler service failures. 
Identification of internal NetScaler issues and non-responding services. 
Monitors are classified into the following groups: 

Appliance
Includes hardware and system information monitoring: 
CPU and memory usage 
Temperature 
Fan speed 
Power supply 
High availability node master state
General statistics for: 
Authentication, Authorization, and Auditing 
Access Gateway 
Protocols (IPv4, IPv6, SSL, TCP, UDP) 
Access Gateway Virtual Servers
Related to a specific virtual server and includes monitoring of: 
State 
Number of current users 
Requests rate 
Activity in terms of requests and responses 
Load Balancing
Monitors health states for LB related objects including: 
Virtual Server 
Service 
Service group 
Authentication
Detects the number of authentication failures in a given time interval for the following authentication protocols: 
LDAP 
Radius 
TACACS 
Network
Network-related monitors show: 
State change for interfaces and channels 
IP address conflicts for both IPv4 and IPv6 
SSL
SSL-specific monitors are used to monitor: 
Impending SSL certificate expiry 
Absence of SSL policy hits (no traffic to trigger the policy) 
Views 

Citrix SCOM Management Pack for NetScaler provides various out-of-the-box views that present alerts, the health state, tasks, and performance. 

There are a number of performance collection views: 

Appliance
The NetScaler appliance is the target. 
Authentication, Authorization, and Auditing (general) 
Access Gateway VPN (general) 
Application Firewall 
Integrated Cache 
Compression 
NetScaler Configuration Changes 
CPU 
Disk 
Memory 
HTTP Protocol 
IP Protocol 
SSL Protocol 
TCP Protocol 
UDP Protocol 
Temperature 
Network
One of the network components is the target. 
Channel 
Interface 
Access Gateway
The Access Gateway virtual server is the target. 
Load Balancing
Load Balancing service is the target. 
SSL
SSL policies or SSL actions are the target.
Tasks

Citrix SCOM Management Pack for NetScaler provides some tasks that can be easily extended:

Displays all NetScaler events.
Displays a current list of system sessions.
Displays a current list of ICA connections.
Displays all SSL virtual servers.