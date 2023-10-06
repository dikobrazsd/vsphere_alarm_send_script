# vsphere alarm send script

Script for passing VMWARE_ALARM environment to endpoint as JSON.

Script can be enabled on vSphere Alarm menu.

# Important

You might face the issue then script is not invoked. This is caused by vCenter  internal throttling. To disable it follow the official documentation: https://kb.vmware.com/s/article/57315

```
Connect to the vCenter server using powerCLI VI-Connect cmdlet, see Basic connecting to vCenter or a vSphere Host. 
To list all the alarm definitions:
Get-AlarmDefinition|format-list
Select an Alarm to modify using ID or Name. Here using a sample ID (Alarm-alarm-97)
Get the .NET view object for the alarm:
$AlarmtoUpdate=get-view -id (get-alarmDefinition -ID Alarm-alarm-97).id
To see the current value of Reporting Frequency parameters:
echo $AlarmtoUpdate.info.Setting
Copy the alarm info item to a spec variable:
$specNewAlarmInfo = $AlarmToUpdate.Info
modify Reporting Frequency value in the spec variable 
$specNewAlarmInfo.Setting.ReportingFrequency = <value in seconds(NOT minute) 0-3600>
Once the spec variable is updated, it can be written back to the alarm definition:
$AlarmtoUpdate.ReconfigureAlarm($specNewAlarmInfo)
To validate the changes:
$AlarmtoUpdate=get-view -id (get-alarmDefinition -ID Alarm-alarm-97).id
echo $AlarmtoUpdate.info.Setting
```
