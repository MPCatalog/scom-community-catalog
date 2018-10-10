**Part of: Azure Addendum Management Pack**

This management pack suite extends the Azure Monitoring Management Pack integrating:

-Log Analytics

-Azure Backup

-Azure Backup Server

-Azure Automation

-Azure Storage

-Azure Monitoring

-Azure AD COnnect Health

Version 1705 is the latest with support of ASM workloads, starting from version 1712 only ARM worklaods are supported. Version 1712 introduced significant changes and thus is not backward compatible. While I know this is far from optimum, the breaking changes were needed to:

remove the dependency to the Monitor Azure Wizard in Operations Manager
remove all the dependency to ASM artifacts
