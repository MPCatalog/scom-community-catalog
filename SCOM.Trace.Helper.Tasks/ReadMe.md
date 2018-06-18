**Description:**

Allows operators/admins to work with SCOM tracing right from the operations console without connecting to the agent-managed computer (where the user probably will have no access to).

It offers the following tasks right in the console on Health Service class level (for instance in the right view under Monitoring, Operations Manager, Agent Details, Agent Health State): 
1. Stop Trace, 
2. Delete Old Traces, 
3. Start Trace, 
4. Stop Trace, 
5. Format New Trace, 
6. Copy New Trace, 
7. Delete New Traces.  

The tasks are in the right order as they are supposed to be performed. That is why Stop/Delete is redundant here. Of course, between step 3 and 4 you are supposed to reproduce the issue you'd like to trace.

"Copy new Trace" expects a hidden share named "scom$" on the Management or Gateway Server the agent is managed from. You have to give "Domain Computers" write permissions to the share and the folder as well. If the agent is running with an user account, you have to give this user the permissions.

**Updates:**
14.06.2018: added workflow traces ([Requires override](https://blogs.technet.microsoft.com/momteam/2013/10/31/how-to-analyze-a-workflow-when-the-opsmgr-workflow-analyzer-doesnt-work/))


## Resources

*   https://gallery.technet.microsoft.com/MP-SCOM-Trace-Helper-Tasks-70380ca4
*   https://blogs.technet.microsoft.com/momteam/2013/10/31/how-to-analyze-a-workflow-when-the-opsmgr-workflow-analyzer-doesnt-work/
