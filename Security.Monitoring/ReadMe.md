**Dependencies**:

*   SQL Management Pack (needed for an override).
*   Most of the Server OS MPs (for overrides).
*   [Windows Event Collector Discovery Management Pack](https://blogs.technet.microsoft.com/nathangau/2017/04/18/windows-event-collector-discovery-management-pack/).

**Discoveries:**

*   WEF Collector server discovery.  This allows for targeted rules to mine the forwarded event logs on event collectors for companies using Windows Event Forwarding.

**Rule Sets**:

*   App Locker rules ([requires GPO](https://blogs.technet.microsoft.com/nathangau/2017/05/01/security-monitoring-management-pack-gpo-summary/) for applocker rules).
    *   WCE
    *   Mimikatz
    *   PSExec
    *   Powersploit ([requires additional Power Shell logging GPO](https://blogs.technet.microsoft.com/nathangau/2017/05/01/security-monitoring-management-pack-gpo-summary/))
*   Domain Admin, Enterprise Admin, and Schema Admin Group change monitoring (requires GPO to turn on additional auditing).
*   [Pass the hash](https://blogs.technet.microsoft.com/nathangau/2016/10/14/using-scom-to-detect-successful-pass-the-hash-attacks-part-1/), [overpass the hash](https://blogs.technet.microsoft.com/nathangau/2016/12/15/using-scom-to-detect-overpass-the-hash-attacks/), and [pass the ticket](https://blogs.technet.microsoft.com/nathangau/2016/12/13/using-scom-to-detect-pass-the-ticket-attacks/) detection.  I ?ve created three rules, and I have enabled one of them.
    *   Potential Credential Swap in Progress: Enabled and targeted at all Windows Operating Systems.  This only activates in my lab when using mimikatz to swap credentials.
    *   Potential PtH in progress against tier 1:  Disabled and targeted at all Windows Operating Systems.  This also has an override for domain controllers and SQL servers as it is very noisy otherwise.  If you turn it on, you will probably want to have additional overrides against it (particularly IP address filtering).
    *   Potential PtH in progress against Domain Controllers:  Disabled and targeted at all Windows Domain Controllers.  Consider enabling using IP address filtering for your environment.
*   Detect clearing of security event logs (event ID 1102) and system event log (event ID 104).
*   Detect the creation of a service on a domain controller (event ID 7045 in the system log).  I ?ve also created and disabled this same rule targeting windows operating systems. This one would generate some noise under normal conditions, and as such, I ?ve left it off. 
*   Detect the creation of services tied to known remote execution tools (event ID 7045)
    *   PSEXECSVC
    *   WINEXE
    *   WCESERVICE
*   Local account created on a member server (event ID 4720 in security log).  [Requires GPO](https://blogs.technet.microsoft.com/nathangau/2017/05/01/security-monitoring-management-pack-gpo-summary/).
*   Local Admin Group modified on member server (event ID 4732 and 4733).  [Requires GPO](https://blogs.technet.microsoft.com/nathangau/2017/05/01/security-monitoring-management-pack-gpo-summary/).
*   Lynne Taggart ?s [Smart Card change monitor](https://blogs.technet.microsoft.com/allthat/2016/08/07/who-disabled-a-smartcard-for-logon/).  I would note that this enabled by default and targeted only to domain controllers.  There are a few differences here. Lynne ?s monitor will reset when the next event is detected where someone enables a smart card. Truthfully, this shouldn ?t happen much in an environment, but I ?m switching this to a rule so that you will see alerts each time a smart card is disabled for interactive logon. 
*   Modified Andres Naranjo ?s composite module to track GPO changes.  My modifications are noted below.
    *   [Part 1](//blogs.technet.microsoft.com/nathangau/2017/04/17/breaking-apart-the-gpo-modification-process-and-using-scom-to-detect-gpo-changes-part-1/)
    *   [Part 2](//blogs.technet.microsoft.com/nathangau/2017/04/19/breaking-apart-the-gpo-modification-process-and-using-scom-to-detect-gpo-changes-part-2/)
*   Rules sets for known threats that can be [detected off of 4688 events](https://blogs.technet.microsoft.com/nathangau/2017/04/20/using-scom-to-capture-suspicious-process-creation-events/).
*   [Scheduled task creation](https://blogs.technet.microsoft.com/nathangau/2017/03/17/using-scom-to-detect-scheduled-task-creation/).  (note that the task scheduler operational log needs to be enabled).
*   [Golden Ticket detection](https://blogs.technet.microsoft.com/nathangau/2017/03/08/using-scom-to-detect-golden-tickets/) (note this requires periodic reset of krgtgt account).
*   Disabled rule sets (these are off by default.  I don ?t recommend turning them on without some thought and planning).
    *   System shut down unexpectedly
    *   System was rebooted
    *   Software was installed on a server
    *   Software was removed from a server
    *   System was powered off.

**Monitors:**

*   Registry Monitor to detect change of UseLogonCredential registry key (for certain [Wdigest attacks](https://blogs.technet.microsoft.com/nathangau/2016/12/13/using-scom-to-detect-wdigest-enumeration/)).  I ?m not setting a GPO here because turning this on can break some legacy applications. Note that by disabling the monitor to ignore the noise, you are in essence allowing an attacker to mine clear text passwords out of the LSA.  On the other end, an attacker can potentially set this registry key to a different value to allow them to do it. This monitor would alert you to that possibility.
*   Registry Monitor to detect the existence of UseLogonCredential registry key.  No key (default setting) allows for exposure of Wdigest credentials in older Windows OS versions.  This is disabled for Server 2012 and Server 2016.  The key does not exist for these Operating Systems but is assumed to be set. I ?m still monitoring in case it is set and set to a different value, but this will reduce noise specific to these OS versions.
*   Kevin Holman ?s [failed RDP](https://blogs.technet.microsoft.com/kevinholman/2010/04/12/using-opsmgr-for-intrusion-detection-and-security-hardening/) attempts monitor.  I ?ve made some changes to this worth noting:
    *   The recovery is disabled by default.  I ?d note that the monitor only looks for rapid succession of logon attempts and at the 5th attempt, the recovery will update the firewall to block that IP.  It is, in theory, possible for it to block a legitimate IP if by chance the 5th attempt comes from something legitimate. I don ?t see that happening hardly at all, as it would be a highly improbable event, but worth noting.
    *   The alert generation from this is also disabled.
    *   The reason for disabling the alert is that Brad Watts wrote a module that collects and consolidates 4625 events by the IP address and will generate an alert in that capacity.  You should get an alert for each IP address doing this, allowing you to pass this on to a firewall team to block it at a hardware level or use Kevin ?s recovery if the Windows firewall is in use.
    *   Reports targeting this solution have also been added so that you can see a reports for failed logon and the IP addresses they are coming from.  While most attackers prefer targeted phishing, this is still useful for those that prefer to kick down the doors the old fashioned way.
*   System pending restart monitor (disabled by default).
*   Service monitor for windows event collector service (there ?s also a recovery here to restart it).

**Event Collection (WEF) Monitoring:**

[Configuration information is here.](https://blogs.technet.microsoft.com/nathangau/2017/05/05/event-forwarding-and-how-to-configure-it-for-the-security-monitoring-management-pack/)  These rules target the Forwarded events logs. It is generally recommended that desktops in particular have events forwarded to event collector servers. A SCOM agent can then be placed on the event collectors to monitor the forwarded event logs.  **This will only work if the event collectors are collecting the events specified in this section**.  I recommend forwarding security events, power shell logging events, Applocker events 8003 or 8004, as well as system event 7045.  [This link](https://technet.microsoft.com/itpro/windows/keep-secure/use-windows-event-forwarding-to-assist-in-instrusion-detection) contains what you need to know about Windows Event Forwarding.  Additional WEF links are [here](http://social.technet.microsoft.com/wiki/contents/articles/33895.windows-event-forwarding.aspx).  Note that most of these rules are configured for Alert Suppression based on logging computer.

*   Security log cleared (event ID 1102)
*   Powersploit use (note this still requires powershell logging. It also requires forwarding these to the event collectors.)
*   Special Logon in use.  [Event ID 4964 detection](https://blogs.technet.microsoft.com/jepayne/2015/11/26/tracking-lateral-movement-part-one-special-groups-and-specific-service-accounts/).  This will generate no noise by default unless you are actively attempting to determine account usage for defined special groups.  More info on this particular event ID [can be found here](https://technet.microsoft.com/en-us/itpro/windows/keep-secure/event-4964).
*   Detect Creation of new service:  This is disabled by default as it would generate noise in most environments.  Consider enabling in an environment where this would not be noisy.
*   Event ID 4732 or 4733 detection  ? A user added or removed from local admin group.
*   Detect the creation of services tied to remote execution tools (event ID 7045)
    *   PSEXECSVC
    *   WINEXE
    *   WCESERVICE
*   Pass the Hash Detection
    *   Potential Credential Swap in Progress
    *   Potential PtH Attack in Progress Against Tier 2  ? Note this is disabled by default since I ?m unable to filter the local host name.  This may generate unwanted noise if turned on.
*   Prohibited App in Use  ? Event ID 8003 from Applocker
*   4688 detections.

Should you choose to add additional event forwarding rules, please keep [this article](https://blogs.technet.microsoft.com/nathangau/2017/01/11/using-scom-to-capture-events-from-the-forwarded-events-log/) in mind.  They will not work out of the box unless the allow proxying tag is set in XML.

**Views:**

Intrusion Detection Alert View  ? keys in the value  ?Security Monitoring ? in name of all alerts.  All rules also have this value in custom field 10.

Threat Hunting Alert View  ? keys in on the value  ?Security Monitoring Threat Hunting ? name in alerts targeted towards detecting practices in need of mitigation.

Event Collector Alert View  ? Displays alerts for items found in the Forwarded Events log.

Event Collector State View  ? I only have one health monitor for event collectors and a recovery attached, so if there ?s any red here, they aren ?t working.

**Threat Hunting:**

The purpose of this section is to help you find vulnerabilities in your environment that can be addressed.  Note that this is something that can be a bit noisy.  I have event collection rules defined for these particular events which we can use reports to collect. I ?ve also got alert generating rules defined for these events if you want to respond to alerts.  Alerts that are potentially noisy, I ?ve disabled by default and I recommend that you use SCOM reporting to view this information.

*   Performance Collection:
    *   Event ID 4964
    *   Event ID 4624 logon type 4.  This type of logon leaves credentials exposed in the LSA.
    *   Event ID 4672 (disabled by default.  This can generate a lot of events that could cause issues with the DW).
*   Event ID 4769 result 0x1F.  This can be potentially used in a recovery to detect golden tickets in use in the environment, though to do so, the Kerberos [password will need to be reset twice](http://cert.europa.eu/static/WhitePapers/CERT-EU-SWP_14_07_PassTheGolden_Ticket_v1_1.pdf).  That said, this is a rare event and worth investigating. This will generate alerts.
*   [Event ID 4964 detection](https://blogs.technet.microsoft.com/jepayne/2015/11/26/tracking-lateral-movement-part-one-special-groups-and-specific-service-accounts/).  This will generate no noise by default unless you are actively attempting to determine account usage for defined special groups.  More info on this particular event ID [can be found here](https://technet.microsoft.com/en-us/itpro/windows/keep-secure/event-4964).
