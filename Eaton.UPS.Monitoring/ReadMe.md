## What's included in the Management Pack

* Eaton UPS power monitoring integrated directly into Microsoft Systems Center Operations Manager
* The Eaton SCOM Management Pack contains rules and monitors that collect and evaluate events and operations that are important to ensuring the health and efficiency of power devices.
* Simple management pack plug-in deployment
* Enable SCOM auto discovery of Eaton power devices
  * Eaton 5PX UPS
  * 9PX UPS
  * 93PM UPS

## Configuration

  1. Go to _Administration_ -> _Discovery Rules_.
  1. From the tasks list select _Discover Network Devices_.
  1. Configure SNMP monitoring for the UPS device.
  1. Run the network discovery.
  1. Once the network discovery has finished, you should see the devices showing up in _Monitoring_ pane in the _Eaton UPS Monitoring_ folder under _Network Devices_.