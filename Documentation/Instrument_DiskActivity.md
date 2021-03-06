# Disk Activity Instrument

The Disk Activity instrument captures information about your app's disk reads and writes and open files.

![Disk Activity](Resources/Instrument_DiskActivity.png "Disk Activity")

### Discussion

Use the information captured by this instrument to inspect your app's general disk activity.

### Detail Pane

The detail pane includes your app's disk activity at the time of the sample; reads and writes are displayed in columns of delta as well as total.

![Disk Activity Detail Pane](Resources/Instrument_DiskActivity_DetailPane.png "Disk Activity Detail Pane")



### Inspector Pane

For each sample, the inspector pane shows the delta size of read and written data, as well as the total data read and written up to that sample. If the **Collect open file names** profiling preference was enabled during recording, the inspector pane will display the open files at the time of the sample.

![Disk Acitivy Inspector Pane](Resources/Instrument_DiskActivity_InspectorPane.png "Disk Acitivy Inspector Pane")

You can select the one or more file names and copy them for further investigation.