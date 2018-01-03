### Remote file count monitoring
One of that questions is: *"Is it possible to monitor the count of files (with a specific extension) in a share?"*
The answer to this question is yes and no. There is a possibility to count files on Windows Servers that have an agent installed using this management pack: http://www.systemcentercentral.com/pack-catalog/file-system-management-pack-2/ but for shares located on non-Windows Servers, let’s say on a SAN for example I haven’t found a solution.

Therefore I created my own management pack to monitor the file count, independent of the location of the file share (Windows Server or not). In this post I describe how the management pack works. WIth the management pack you can count files with a specific extension (or no extension if everything should be counted) in a share (optionally also subfolders included). There is also the ability to add a specific age zo the given scenario is possible: Count if there are more then 20 files in a share (subfolders included) that are older then 10 minutes.

Configurable with the following parameters:
- ID: Must be unique per share
- Share: UNC path of the share
- Extension: The extension of the files that needs to be counted, leave empty to count all files in the share
- Count: How many files must be present for a critical state
- Time: This is the time in minutes of the maximum file age of file count
- Recurse: 0 = No need to count files in subfolders / 1 = Count also files in subfolders