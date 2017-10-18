The Health Service Store Monitoring MP contails the following:

-   A Monitor to check the size of the Health Service database file
    -   Monitor name is "Health Service Store File Size Check"
    -   Targeted at the "Agent" class
    -   Disabled by default
    -   Warning Alert/State Change is generated if the file size is greater than the defined threshold
    -   File size threshold is 100mb by default and can be configured via override
-   A Rule to collect the size of the Health Service database file
    -   Rule name is "Collection: Health Service Database File Size"
    -   Targeted at the "Agent" class
    -   Collected performance counter is
        -   Object: Health Service Database
        -   Counter: File Size
        -   Instance: <Path to health service store file>
-   A Task to manually do an offline defrag of the Health Service database file
    -   Task name is "Health Service Database Offline Defrag"
    -   Targeted at the "Agent" class
-   A Recovery to automatically do an offline defrag of the Health Service database file when the monitor detects the size is over the defined threshold
    -   Disabled by default

Details of the workflows

-   The Monitor runs a PowerShell script that gets the Health Service State directory from the registry, then checks the size of the HealthServiceStore.edb file and compares against the defined threshold. The script returns a Property Bag to SCOM with the file path, size, threshold, and status (above/below threshold).
-   The Collection Rule uses the same script as the Monitor, and just uses the file size property and maps it to performance counter data.
-   The offline defrag Task and Recovery use a VBScript based on Matt Taylor's [task to restart SCOM Health Service](https://blogs.technet.microsoft.com/b/scom_atlas/archive/2015/05/21/task-to-restart-scom-health-service.aspx)script...all I did is modify it to run the offline defrag before restarting the service.

Screen shots from the Management Pack

Monitor

[![monitor](https://msdnshared.blob.core.windows.net/media/TNBlogsFS/prod.evol.blogs.technet.com/CommunityServer.Blogs.Components.WeblogFiles/00/00/00/66/99/metablogapi/monitor_thumb_52240F30.png "monitor")](https://msdnshared.blob.core.windows.net/media/TNBlogsFS/prod.evol.blogs.technet.com/CommunityServer.Blogs.Components.WeblogFiles/00/00/00/66/99/metablogapi/monitor_257633F5.png)

Rule

[![rule](https://msdnshared.blob.core.windows.net/media/TNBlogsFS/prod.evol.blogs.technet.com/CommunityServer.Blogs.Components.WeblogFiles/00/00/00/66/99/metablogapi/rule_thumb_495BB8F7.png "rule")](https://msdnshared.blob.core.windows.net/media/TNBlogsFS/prod.evol.blogs.technet.com/CommunityServer.Blogs.Components.WeblogFiles/00/00/00/66/99/metablogapi/rule_6AB63D31.png)

Task

[![task](https://msdnshared.blob.core.windows.net/media/TNBlogsFS/prod.evol.blogs.technet.com/CommunityServer.Blogs.Components.WeblogFiles/00/00/00/66/99/metablogapi/task_thumb_21DC78D3.png "task")](https://msdnshared.blob.core.windows.net/media/TNBlogsFS/prod.evol.blogs.technet.com/CommunityServer.Blogs.Components.WeblogFiles/00/00/00/66/99/metablogapi/task_11A8FEC7.png)

[![task](https://msdnshared.blob.core.windows.net/media/TNBlogsFS/prod.evol.blogs.technet.com/CommunityServer.Blogs.Components.WeblogFiles/00/00/00/66/99/metablogapi/task_thumb_6B26CFE1.png "task")](https://msdnshared.blob.core.windows.net/media/TNBlogsFS/prod.evol.blogs.technet.com/CommunityServer.Blogs.Components.WeblogFiles/00/00/00/66/99/metablogapi/task_209D0156.png)
