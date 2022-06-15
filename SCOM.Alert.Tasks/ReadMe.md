### SCOM Alert Tasks

Many of my IT colleagues in our company use the SCOM console to work with alerts from their systems. Most of them work in the role of SCOM operator. As a SCOM admin, I often receive requests from them to change the monitor or rule configuration. The problem is that as SCOM operators, they cannot view their current configuration in the SCOM console because they do not have permission to do so, not even for read-only viewing. Therefore, they send screenshots within their requirements, which is not very comfortable for me. The display names of individual monitors or rules are sometimes the same for many of them, eg in MPs for different OS versions. So I decided to provide colleagues with several SCOM console tasks that will allow accurate identification of the monitor or rules and further show them their configuration, targeting, etc. All tasks show the system names of the monitors, rules, targets and parameters as well as its display names in parentheses.

## Available Tasks:

* **Get Alert Details** - it simply displays alert attributes just like the Get-SCOMAlert cmdlet

* **Get Overrides** - shows all overidable parameters for given monitor or rule, its default values and current overrides 

* **Get Effective Setting** - shows effective setting of individual targets for given monitor or rule

* **Get Targets** - shows all targets for given monitor or rule

## Version History:

* 1.0.0.5 - Initial Release