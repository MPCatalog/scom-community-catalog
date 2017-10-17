# Nutanix SCOM Management Pack
-------------------------------

The management packs collect information about software (cluster) elements through SNMP and hardware??elements through ipmiutil??[(Intelligent Platform Management Interface Utility)](https://en.wikipedia.org/wiki/Intelligent_Platform_Management_Interface)??and REST API calls and then package that information for SCOM to digest.??*Note:??The Hardware Elements Management Pack leverages the ipmiutil program to gather information from Nutanix block for Fans, Power Supply and Temperature.*

**[![SCOM01 Nutanix SCOM Management Pack](https://i2.wp.com/www.netwatch.me/wp-content/uploads/2015/06/scom01.png?resize=584%2C264)](https://i2.wp.com/www.netwatch.me/wp-content/uploads/2015/06/scom01.png)**

Nutanix provides two management packs:
======================================

-   **Cluster Management Pack --??**This management pack collects information about software elements of a??cluster including Controller VMs, storage pools, and containers.
-   **Hardware Management Pack --**This management pack collects information about hardware elements of??a cluster including fans, power supplies, disks, and nodes.
