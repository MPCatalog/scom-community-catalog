### **Create 100's of TCP monitors in minutes with?SCOM**

**By Jasper Van Damme**

As you may or may not know, creating TCP monitors in SCOM through use of the template is a fairly time intensive task, especially if you have to create a ton of TCP monitors. Furthermore, templates are fine for smaller scale Operations Manager environments but tend to create a lot of unnecessary groups, overrides, views etc.

So naturally I was looking for a more elegant solution as I did not want to go through creating 100's TCP monitors. My first thought was to google if anything exists already, and to my surprise, I did not find any immediate solutions. What I did find however was the following?[post](https://azurecloudai.blog/2015/12/01/scom-advanced-authoring-powershell-discovery-from-csv-file-explained-using-tcp-port-monitoring-scenario/)?(credits to?[Gowdhaman Karthikeyan](https://social.technet.microsoft.com/profile/Gowdhaman+Karthikeyan)).[\
](https://azurecloudai.blog/2015/12/01/scom-advanced-authoring-powershell-discovery-from-csv-file-explained-using-tcp-port-monitoring-scenario/)\
This post explains how you can use a PowerShell discovery with a comma separated file or 'CSV' to?add the proper TCP Port instances in SCOM. This has some significant advantages over using the template (as outlined in the blog post):

-   You can let other?teams add TCP monitors themselves, with minimum SCOM knowledge or access
-   It is more scalable, as it does not create any unnecessary groups, overrides, views compared to the template
-   It is a lot faster, as you dont have to go through the template for each TCP monitor you want to create
-   The information is centrally stored in the CSV
