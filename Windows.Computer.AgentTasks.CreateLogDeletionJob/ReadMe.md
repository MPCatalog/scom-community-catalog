## SCOM Agent Task - Create Log Deletion Job

‘Create Log Deletion Job’ is a Management Pack that contains two SCOM – Agent Tasks to tame logfile growth.
* Create Log Deletion Job creates a scheduled task that deletes log files older than N days on the monitored computer. 
* Create Log Compress ( + Deletion ) Job creates a scheduled task that compresses files older than N days and optionally also deletes the compressed files older than M days on the monitored computer.
It works on SCOM 2012 R2 and later.


### Introduction:
Many applications and services which run on a server are creating logs. Some are doing it by default and some others are configured to do so by an Administrator or Developer.
To prevent that the logs, occupy the complete disk space either the concerned developer implemented a smart log handling which rotates the files or the Administrator added a
scheduled script to do so. This Management Pack provides a convenient way to create a log deletion job directly out of the SCOM console


### Pictures:
Log Compress Task in the SCOM Console:
![Task_In_the_Console](https://raw.githubusercontent.com/Juanito99/Windows.Computer.AgentTasks.CreateLogDeletionJob/master/PicturesForGitWebSite/MonitoringPaneShowTaskCompress.png)

Log Deletion Task in the SCOM Console:
![Task_In_the_Console](https://raw.githubusercontent.com/Juanito99/Windows.Computer.AgentTasks.CreateLogDeletionJob/master/PicturesForGitWebSite/MonitoringPaneShowTask.png)




### More information on:
[Documentation](https://github.com/Juanito99/Windows.Computer.AgentTasks.CreateLogDeletionJob/blob/master/Documentation/SCOM%20-%20Agent%20Tasks%20-%20Create%20Log%20Compress%20(%20+%20Deletion%20)%20Job.pdf)
