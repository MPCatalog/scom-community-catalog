### ConfigMgr Client Monitoring

Version 1.2.0.0 has introduced a new feature that can monitor assigned DCM Compliance Baselines on a more granular level. Prior to this release, there is a unit monitor targeting the DCM agent class and monitor the overall baselines compliance status as a whole. Since version 1.2.0.0, each individual DCM baseline can be discovered and monitored separately.

By default, the discovery for DCM Baselines is disabled. It needs to be enabled on manually via overrides before DCM baselines can be monitored individually.

[![image](http://blog.tyang.org/wp-content/uploads/2014/10/image_thumb.png "image")](http://blog.tyang.org/wp-content/uploads/2014/10/image.png)

There are several groups can be used for overriding the DCM Baseline discovery: