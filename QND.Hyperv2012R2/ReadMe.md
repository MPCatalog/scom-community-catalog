Community based Management Pack for Hyper-V 2012 R2 to overcome the limitations of the standard ones. Importing this MP disables the VM monitoring delivered by the Microsoft authored Hyper-V Management Pack.

Check for latest commits on hitgub??<https://github.com/brandubh/HypervMP>??

Current Version: 1.1.0.72 - 14/01/2017??

Added VM Tasks.

Some features of the MP.

-?????????????????? Comprehensive discovery with at least the same information you can get from the VMM integration, some properties discovered

-   OS and platform
-   Farm (very useful to create dashboards and groups)
-   Hardware configuration
-   Connected VHD(x)
-   Connected NICs

-?????????????????? An optimized discovery that is triggered when VMs are moved, started or stopped

-?????????????????? A complete replica monitoring scenario with diagnostics, recoveries (disabled by default) and tasks to resume replica

-?????????????????? A couple of monitor related to GPUs and remoteFX inherited from the MS provided MP, disabled by default since I consider them not useful. But in any case I didn't want to lose monitoring capabilities.

-?????????????????? Integration services obsolescence (only for Windows VMs since I don't know how to update *nix VMs now that MS isn't releasing anymore IS for platforms that have the services included in the kernel)

-?????????????????? VHD(x) fragmentation level monitoring, this one can be noisy, but if you have fragmented VHDs you better know it, since the performance impact can be significant

-?????????????????? VM uptime in % in the observation period (as you wish @Stas), this can useful to bill on uptime

-?????????????????? VM measures as performance counters for enabled virtual machines (Enable-VMMeasure)

More On GitHub:??<https://github.com/brandubh/HypervMP>

and on??[http://nocentdocent.wordpress.com](http://nocentdopcent.wordpress.com/)??search for Hyper-V and management pack.
