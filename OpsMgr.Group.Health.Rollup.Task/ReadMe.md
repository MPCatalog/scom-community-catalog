### Introduction

In OpsMgr, groups are frequently used when designing service level monitoring and dashboards. The group members' health rollup behaviours can be configured by creating various dependency monitors targeting against the group.

When creating groups, only instance groups can be created within the OpsMgr console. Unlike computer groups, instance groups do not inherit any dependent monitors from their base class. Therefore when an instance group is created in the OpsMgr console, by default, the health state of the group is "Not monitored" (Uninitialized):

[![SNAGHTML6ecbad9](http://blog.tyang.org/wp-content/uploads/2015/07/SNAGHTML6ecbad9_thumb.png "SNAGHTML6ecbad9")](http://blog.tyang.org/wp-content/uploads/2015/07/SNAGHTML6ecbad9.png)

In order to configure group members to rollup health state to the group object (so the group can be used in dashboards), one or more dependency monitors must be created manually after the group has been created. This manual process can be time consuming.