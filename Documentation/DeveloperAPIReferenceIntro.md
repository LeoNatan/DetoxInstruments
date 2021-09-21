# Developer API Reference

By integrating Detox Instruments in your app, many of the included instruments can automatically collect data. Some instruments require you to explicitly call the provided APIs so that specific data can be collected.

Before using the provided developer APIs, first complete the [Profiler Framework Integration Guide](XcodeIntegrationGuide.md).

### Programatic Profiler Recordings

In addition to profiling your app live with Detox Instruments, you can start recordings in code for finer-grained control and testing scenarios where live recording is not applicable, such as app launch. This can be achieved with the Profiler API.

See [Profiler API Reference for Objective C & Swift](DeveloperAPIReferenceProfilerObjCSwift.md)

### Events

The Events instrument lets you add lightweight instrumentation to your code for collection and visualization by Detox Instruments. You can specify interesting periods of time ('intervals') and single points in time ('events'). Each event can be marked as completed or errored, or as 12 different general-purpose categories, each displayed with its own color in the timeline pane.

See [Events API Reference for Objective C & Swift](DeveloperAPIReferenceEventsObjCSwift.md)
