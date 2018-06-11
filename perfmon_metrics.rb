class PerfmonMetrics
  attr_accessor :metric_types, :metric_samples, :typeperf_error_msg, :thread_count

  def initialize
    @metric_samples = 1
    @typeperf_error_msg = "Error: No valid counters."
    @thread_count = 5

    @metric_types = Hash.new("ms")
    @metric_types["% 401 HTTP Response Sent"] = "%"
    @metric_types["% 403 HTTP Response Sent"] = "%"
    @metric_types["% 404 HTTP Response Sent"] = "%"
    @metric_types["% 500 HTTP Response Sent"] = "%"
    @metric_types["% Managed Processor Time (estimated)"] = "%"
    @metric_types["% Time in GC"] = "%"
    @metric_types["% Time in Jit"] = "%"
    @metric_types["% Time in RT checks"] = "%"
    @metric_types["% Time Loading"] = "%"
    @metric_types["% Time Sig. Authenticating"] = "%"
    @metric_types["Cache % Machine Memory Limit Used"] = "%"
    @metric_types["Cache % Process Memory Limit Used"] = "%"
    @metric_types["File Cache Hits %"] = "%"
    @metric_types["Kernel: URI Cache Hits %"] = "%"
    @metric_types["Metadata Cache Hits %"] = "%"
    @metric_types["Output Cache Current Hits %"] = "%"
    @metric_types["URI Cache Hits %"] = "%"
    @metric_types["Current appdomains"] = "appdomains"
    @metric_types["Rate of appdomains"] = "appdomains"
    @metric_types["Rate of appdomains unloaded"] = "appdomains"
    @metric_types["Total Appdomains"] = "appdomains"
    @metric_types["Total appdomains unloaded"] = "appdomains"
    @metric_types["Applications Running"] = "apps"
    @metric_types["ArrivalRate"] = "arrivals"
    @metric_types["Current Assemblies"] = "assemblies"
    @metric_types["Rate of Assemblies"] = "assemblies"
    @metric_types["Total Assemblies"] = "assemblies"
    @metric_types["Connection Attempts/sec"] = "attempts"
    @metric_types["ConnectionAttempts"] = "attempts"
    @metric_types["Logon Attempts/sec"] = "attempts"
    @metric_types["Total Connection Attempts (all instances)"] = "attempts"
    @metric_types["Total Logon Attempts"] = "attempts"
    @metric_types["WebSocket Connection Attempts / Sec"] = "attempts"
    @metric_types["# of Sink Blocks in use"] = "blocks"
    @metric_types["# Bytes in all Heaps"] = "bytes"
    @metric_types["# of IL Bytes Jitted"] = "bytes"
    @metric_types["# Total committed Bytes"] = "bytes"
    @metric_types["# Total reserved Bytes"] = "bytes"
    @metric_types["Allocated Bytes/sec"] = "bytes"
    @metric_types["Bytes in Loader Heap"] = "bytes"
    @metric_types["Bytes Received"] = "bytes"
    @metric_types["Bytes Received/sec"] = "bytes"
    @metric_types["Bytes Sent"] = "bytes"
    @metric_types["Bytes Sent/sec"] = "bytes"
    @metric_types["Bytes Total/sec"] = "bytes"
    @metric_types["BytesReceivedRate"] = "bytes"
    @metric_types["BytesSentRate"] = "bytes"
    @metric_types["BytesTransferredRate"] = "bytes"
    @metric_types["Current blocked bandwidth bytes."] = "bytes"
    @metric_types["Current File Cache Memory Usage"] = "bytes"
    @metric_types["Current Metadata Cached"] = "bytes"
    @metric_types["CurrentQueueSize"] = "bytes"
    @metric_types["Gen 0 heap size"] = "bytes"
    @metric_types["Gen 0 Promoted Bytes/Sec"] = "bytes"
    @metric_types["Gen 1 heap size"] = "bytes"
    @metric_types["Gen 1 Promoted Bytes/Sec"] = "bytes"
    @metric_types["Gen 2 heap size"] = "bytes"
    @metric_types["IL Bytes Jitted / sec"] = "bytes"
    @metric_types["Large Object Heap size"] = "bytes"
    @metric_types["Managed Memory Used (estimated)"] = "bytes"
    @metric_types["Maximum File Cache Memory Usage"] = "bytes"
    @metric_types["Measured Async I/O Bandwidth Usage"] = "bytes"
    @metric_types["Output Cache Current Memory Usage"] = "bytes"
    @metric_types["Promoted Finalization-Memory from Gen 0"] = "bytes"
    @metric_types["Promoted Memory from Gen 0"] = "bytes"
    @metric_types["Promoted Memory from Gen 1"] = "bytes"
    @metric_types["Request Bytes In Total"] = "bytes"
    @metric_types["Request Bytes In Total (WebSockets)"] = "bytes"
    @metric_types["Request Bytes Out Total"] = "bytes"
    @metric_types["Request Bytes Out Total (WebSockets)"] = "bytes"
    @metric_types["Total # of IL Bytes Jitted"] = "bytes"
    @metric_types["Total blocked bandwidth bytes."] = "bytes"
    @metric_types["Total Bytes Received"] = "bytes"
    @metric_types["Total Bytes Sent"] = "bytes"
    @metric_types["Total Bytes Transferred"] = "bytes"
    @metric_types["Total Flushed Metadata"] = "bytes"
    @metric_types["Total Metadata Cached"] = "bytes"
    @metric_types["Call Failed Per Second"] = "calls"
    @metric_types["Calls"] = "calls"
    @metric_types["Calls Failed"] = "calls"
    @metric_types["Calls Failed Per Second"] = "calls"
    @metric_types["Calls Faulted"] = "calls"
    @metric_types["Calls Faulted Per Second"] = "calls"
    @metric_types["Calls Outstanding"] = "calls"
    @metric_types["Calls Per Second"] = "calls"
    @metric_types["Percent Of Max Concurrent Calls"] = "calls"
    @metric_types["Remote Calls/sec"] = "calls"
    @metric_types["Security Calls Not Authorized"] = "calls"
    @metric_types["Security Calls Not Authorized Per Second"] = "calls"
    @metric_types["Total Remote Calls"] = "calls"
    @metric_types["# of CCWs"] = "CCWs"
    @metric_types["Active Listener Channels"] = "channels"
    @metric_types["Channels"] = "channels"
    @metric_types["# Link Time Checks"] = "checks"
    @metric_types["Total Runtime Checks"] = "checks"
    @metric_types["Context-Bound Classes Loaded"] = "classes"
    @metric_types["Current Classes Loaded"] = "classes"
    @metric_types["Rate of Classes Loaded"] = "classes"
    @metric_types["Total Classes Loaded"] = "classes"
    @metric_types["# Gen 0 Collections"] = "collections"
    @metric_types["# Gen 1 Collections"] = "collections"
    @metric_types["# Gen 2 Collections"] = "collections"
    @metric_types["# Induced GC"] = "collections"
    @metric_types["SqlClient: Total # failed commands"] = "commands"
    @metric_types["Compilations Total"] = "compilations"
    @metric_types["HardConnectsPerSecond"] = "connects"
    @metric_types["SoftConnectsPerSecond"] = "connects"
    @metric_types["SqlClient: Total # failed connects"] = "connects"
    @metric_types["Connections Accepted over net.pipe"] = "conns"
    @metric_types["Connections Accepted over net.tcp"] = "conns"
    @metric_types["Connections Dispatched over net.pipe"] = "conns"
    @metric_types["Connections Dispatched over net.tcp"] = "conns"
    @metric_types["Connections Established"] = "conns"
    @metric_types["Current CAL count for SSL connections"] = "conns"
    @metric_types["Current Connections"] = "conns"
    @metric_types["CurrentConnections"] = "conns"
    @metric_types["MaxConnections"] = "conns"
    @metric_types["Maximum CAL count for SSL connections"] = "conns"
    @metric_types["Maximum Connections"] = "conns"
    @metric_types["NumberOfActiveConnections"] = "conns"
    @metric_types["NumberOfFreeConnections"] = "conns"
    @metric_types["NumberOfNonPooledConnections"] = "conns"
    @metric_types["NumberOfPooledConnections"] = "conns"
    @metric_types["NumberOfReclaimedConnections"] = "conns"
    @metric_types["NumberOfStasisConnections"] = "conns"
    @metric_types["Session SQL Server connections total"] = "conns"
    @metric_types["Session State Server connections total"] = "conns"
    @metric_types["SqlClient: Current # pooled and nonpooled connections"] = "conns"
    @metric_types["SqlClient: Current # pooled connections"] = "conns"
    @metric_types["SqlClient: Peak # pooled connections"] = "conns"
    @metric_types["WebSocket Connections Accepted / Sec"] = "conns"
    @metric_types["WebSocket Connections Rejected / Sec"] = "conns"
    @metric_types["Contention Rate / sec"] = "contentions"
    @metric_types["Total # of Contentions"] = "contentions"
    @metric_types["Contexts"] = "contexts"
    @metric_types["Datagrams Received"] = "datagrams"
    @metric_types["Datagrams Sent"] = "datagrams"
    @metric_types["HardDisconnectsPerSecond"] = "disconnects"
    @metric_types["SoftDisconnectsPerSecond"] = "disconnects"
    @metric_types["Script Engines Cached"] = "engines"
    @metric_types["Active Flushed Entries"] = "entries"
    @metric_types["Cache API Entries"] = "entries"
    @metric_types["Cache Total Entries"] = "entries"
    @metric_types["Output Cache Entries"] = "entries"
    @metric_types["Errors During Compilation"] = "errors"
    @metric_types["Errors During Execution"] = "errors"
    @metric_types["Errors During Preprocessing"] = "errors"
    @metric_types["Errors During Script Runtime"] = "errors"
    @metric_types["Errors From ASP Preprocessor"] = "errors"
    @metric_types["Errors From Script Compilers"] = "errors"
    @metric_types["Errors Total"] = "errors"
    @metric_types["Errors Total/Sec"] = "errors"
    @metric_types["Errors Unhandled During Execution"] = "errors"
    @metric_types["Errors Unhandled During Execution/Sec"] = "errors"
    @metric_types["Errors/Sec"] = "errors"
    @metric_types["Locked Errors/sec"] = "errors"
    @metric_types["Not Found Errors/sec"] = "errors"
    @metric_types["Total Locked Errors"] = "errors"
    @metric_types["Total Not Found Errors"] = "errors"
    @metric_types["Application Lifetime Events"] = "events"
    @metric_types["Application Lifetime Events/Sec"] = "events"
    @metric_types["Audit Failure Events Raised"] = "events"
    @metric_types["Audit Success Events Raised"] = "events"
    @metric_types["Error Events Raised"] = "events"
    @metric_types["Error Events Raised/Sec"] = "events"
    @metric_types["Events Raised"] = "events"
    @metric_types["Events Raised/Sec"] = "events"
    @metric_types["Infrastructure Error Events Raised"] = "events"
    @metric_types["Infrastructure Error Events Raised/Sec"] = "events"
    @metric_types["Request Error Events Raised"] = "events"
    @metric_types["Request Error Events Raised/Sec"] = "events"
    @metric_types["Request Events Raised"] = "events"
    @metric_types["Request Events Raised/Sec"] = "events"
    @metric_types["# of Exceps Thrown / sec"] = "exceptions"
    @metric_types["# of TLB exports / sec"] = "exports"
    @metric_types["Dispatch Failures over net.pipe"] = "failures"
    @metric_types["Dispatch Failures over net.tcp"] = "failures"
    @metric_types["Forms Authentication Failure"] = "failures"
    @metric_types["Membership Authentication Failure"] = "failures"
    @metric_types["Protocol Failures over net.pipe"] = "failures"
    @metric_types["Protocol Failures over net.tcp"] = "failures"
    @metric_types["Rate of Load Failures"] = "failures"
    @metric_types["Recent Worker Process Failures"] = "failures"
    @metric_types["Security Validation and Authentication Failures"] = "failures"
    @metric_types["Security Validation and Authentication Failures Per Second"] = "failures"
    @metric_types["Standard Jit Failures"] = "failures"
    @metric_types["Time Since Last Worker Process Failure"] = "failures"
    @metric_types["Total # of Load Failures"] = "failures"
    @metric_types["Total Worker Process Failures"] = "failures"
    @metric_types["Total Worker Process Ping Failures"] = "failures"
    @metric_types["Total Worker Process Shutdown Failures"] = "failures"
    @metric_types["Total Worker Process Startup Failures"] = "failures"
    @metric_types["Viewstate MAC Validation Failure"] = "failures"
    @metric_types["Current Files Cached"] = "files"
    @metric_types["Files Received/sec"] = "files"
    @metric_types["Files Sent/sec"] = "files"
    @metric_types["Files/sec"] = "files"
    @metric_types["Total Files Cached"] = "files"
    @metric_types["Total Files Received"] = "files"
    @metric_types["Total Files Sent"] = "files"
    @metric_types["Total Files Transferred"] = "files"
    @metric_types["Total Flushed Files"] = "files"
    @metric_types["# of Filters / sec"] = "filters"
    @metric_types["# of Finallys / sec"] = "finallys"
    @metric_types["File Cache Flushes"] = "flushes"
    @metric_types["Kernel: URI Cache Flushes"] = "flushes"
    @metric_types["Metadata Cache Flushes"] = "flushes"
    @metric_types["Output Cache Total Flushes"] = "flushes"
    @metric_types["URI Cache Flushes"] = "flushes"
    @metric_types["UriCacheFlushes"] = "flushes"
    @metric_types["NumberOfActiveConnectionPoolGroups"] = "groups"
    @metric_types["NumberOfInactiveConnectionPoolGroups"] = "groups"
    @metric_types["Active Protocol Handlers"] = "handlers"
    @metric_types["# GC Handles"] = "handles"
    @metric_types["Cache API Hit Ratio"] = "hits"
    @metric_types["Cache API Hits"] = "hits"
    @metric_types["Cache Total Hit Ratio"] = "hits"
    @metric_types["Cache Total Hits"] = "hits"
    @metric_types["CacheHitRate"] = "hits"
    @metric_types["File Cache Hits"] = "hits"
    @metric_types["File Cache Hits / sec"] = "hits"
    @metric_types["In Memory Template Cache Hit Rate"] = "hits"
    @metric_types["Kernel: URI Cache Hits"] = "hits"
    @metric_types["Kernel: Uri Cache Hits/sec"] = "hits"
    @metric_types["Metadata Cache Hits"] = "hits"
    @metric_types["Metadata Cache Hits / sec"] = "hits"
    @metric_types["Output Cache Hit Ratio"] = "hits"
    @metric_types["Output Cache Hits"] = "hits"
    @metric_types["Output Cache Hits / sec"] = "hits"
    @metric_types["Output Cache Total Hits"] = "hits"
    @metric_types["Script Engine Cache Hit Rate"] = "hits"
    @metric_types["Template Cache Hit Rate"] = "hits"
    @metric_types["URI Cache Hits"] = "hits"
    @metric_types["Uri Cache Hits / sec"] = "hits"
    @metric_types["UriCacheHits"] = "hits"
    @metric_types["Process ID"] = "ignore"
    @metric_types["# of TLB imports / sec"] = "imports"
    @metric_types["Instances"] = "instances"
    @metric_types["Instances Created Per Second"] = "instances"
    @metric_types["Percent Of Max Concurrent Instances"] = "instances"
    @metric_types["Pipeline Instance Count"] = "instances"
    @metric_types["Output Cache Current Flushed Items"] = "items"
    @metric_types["Output Cache Current Items"] = "items"
    @metric_types["Output Cache Total Flushed Items"] = "items"
    @metric_types["Assembly Search Length"] = "length"
    @metric_types["Current Queue Length"] = "length"
    @metric_types["Queue Length / sec"] = "length"
    @metric_types["Queue Length Peak"] = "length"
    @metric_types["Stack Walk Depth"] = "levels"
    @metric_types["Throw To Catch Depth / sec"] = "levels"
    @metric_types["# of marshalling"] = "marshalling"
    @metric_types["Queued Messages Dropped"] = "messages"
    @metric_types["Queued Messages Dropped Per Second"] = "messages"
    @metric_types["Queued Messages Rejected"] = "messages"
    @metric_types["Queued Messages Rejected Per Second"] = "messages"
    @metric_types["Queued Poison Messages"] = "messages"
    @metric_types["Queued Poison Messages Per Second"] = "messages"
    @metric_types["Reliable Messaging Messages Dropped"] = "messages"
    @metric_types["Reliable Messaging Messages Dropped Per Second"] = "messages"
    @metric_types["Total Messages Sent to WAS"] = "messages"
    @metric_types["Total WAS Messages Received"] = "messages"
    @metric_types["# of Methods Jitted"] = "methods"
    @metric_types["Other Request Methods/sec"] = "methods"
    @metric_types["Total Other Request Methods"] = "methods"
    @metric_types["Cache API Misses"] = "misses"
    @metric_types["Cache Total Misses"] = "misses"
    @metric_types["File Cache Misses"] = "misses"
    @metric_types["File Cache Misses / sec"] = "misses"
    @metric_types["Kernel: URI Cache Misses"] = "misses"
    @metric_types["Metadata Cache Misses"] = "misses"
    @metric_types["Metadata Cache Misses / sec"] = "misses"
    @metric_types["Output Cache Misses"] = "misses"
    @metric_types["Output Cache Misses / sec"] = "misses"
    @metric_types["Output Cache Total Misses"] = "misses"
    @metric_types["URI Cache Misses"] = "misses"
    @metric_types["Uri Cache Misses / sec"] = "misses"
    @metric_types["UriCacheMisses"] = "misses"
    @metric_types["Average Workflow Load Time"] = "ms"
    @metric_types["Average Workflow Persist Time"] = "ms"
    @metric_types["Calls Duration"] = "ms"
    @metric_types["Current Application Pool Uptime"] = "ms"
    @metric_types["Health Ping Reply Latency"] = "ms"
    @metric_types["MaxQueueItemAge"] = "ms"
    @metric_types["Request Execution Time"] = "ms"
    @metric_types["Request Wait Time"] = "ms"
    @metric_types["Service Uptime"] = "ms"
    @metric_types["Session Duration"] = "ms"
    @metric_types["Total Application Pool Uptime"] = "ms"
    @metric_types["Engine Flush Notifications"] = "notifications"
    @metric_types["Template Notifications"] = "notifications"
    @metric_types["# of Pinned Objects"] = "objects"
    @metric_types["Context-Bound Objects Alloc / sec"] = "objects"
    @metric_types["Transacted Operations Aborted"] = "ops"
    @metric_types["Transacted Operations Aborted Per Second"] = "ops"
    @metric_types["Transacted Operations Committed"] = "ops"
    @metric_types["Transacted Operations Committed Per Second"] = "ops"
    @metric_types["Transacted Operations In Doubt"] = "ops"
    @metric_types["Transacted Operations In Doubt Per Second"] = "ops"
    @metric_types["Total Health Pings."] = "pings"
    @metric_types["NumberOfActiveConnectionPools"] = "pools"
    @metric_types["NumberOfInactiveConnectionPools"] = "pools"
    @metric_types["SqlClient: Current # connection pools"] = "pools"
    @metric_types["Current Worker Processes"] = "processes"
    @metric_types["Maximum Worker Processes"] = "processes"
    @metric_types["Total Worker Processes Created"] = "processes"
    @metric_types["Worker Processes Running"] = "processes"
    @metric_types["Context Proxies"] = "proxies"
    @metric_types["HardProcedureQueries"] = "queries"
    @metric_types["SoftProcedureQueries"] = "queries"
    @metric_types["Total Runtime Status Queries"] = "queries"
    @metric_types["Total Application Pool Recycles"] = "recycles"
    @metric_types["Registrations Active for net.pipe"] = "registrations"
    @metric_types["Registrations Active for net.tcp"] = "registrations"
    @metric_types["RejectionRate"] = "rejections"
    @metric_types["Active Requests"] = "requests"
    @metric_types["AllRequests"] = "requests"
    @metric_types["Anonymous Requests"] = "requests"
    @metric_types["Anonymous Requests/Sec"] = "requests"
    @metric_types["CGI Requests/sec"] = "requests"
    @metric_types["Copy Requests/sec"] = "requests"
    @metric_types["Current Blocked Async I/O Requests"] = "requests"
    @metric_types["Current CGI Requests"] = "requests"
    @metric_types["Current ISAPI Extension Requests"] = "requests"
    @metric_types["Debugging Requests"] = "requests"
    @metric_types["Delete Requests/sec"] = "requests"
    @metric_types["Get Requests/sec"] = "requests"
    @metric_types["GetRequests"] = "requests"
    @metric_types["Head Requests/sec"] = "requests"
    @metric_types["HeadRequests"] = "requests"
    @metric_types["HttpWebRequests Aborted/Sec"] = "requests"
    @metric_types["HttpWebRequests Average Lifetime"] = "requests"
    @metric_types["HttpWebRequests Average Queue Time"] = "requests"
    @metric_types["HttpWebRequests Created/Sec"] = "requests"
    @metric_types["HttpWebRequests Failed/Sec"] = "requests"
    @metric_types["HttpWebRequests Queued/Sec"] = "requests"
    @metric_types["ISAPI Extension Requests/sec"] = "requests"
    @metric_types["Lock Requests/sec"] = "requests"
    @metric_types["Maximum CGI Requests"] = "requests"
    @metric_types["Maximum ISAPI Extension Requests"] = "requests"
    @metric_types["Mkcol Requests/sec"] = "requests"
    @metric_types["Move Requests/sec"] = "requests"
    @metric_types["Options Requests/sec"] = "requests"
    @metric_types["Post Requests/sec"] = "requests"
    @metric_types["Propfind Requests/sec"] = "requests"
    @metric_types["Proppatch Requests/sec"] = "requests"
    @metric_types["Put Requests/sec"] = "requests"
    @metric_types["RejectedRequests"] = "requests"
    @metric_types["Requests / Sec"] = "requests"
    @metric_types["Requests Current"] = "requests"
    @metric_types["Requests Disconnected"] = "requests"
    @metric_types["Requests Executing"] = "requests"
    @metric_types["Requests Executing (WebSockets)"] = "requests"
    @metric_types["Requests Failed"] = "requests"
    @metric_types["Requests Failed (WebSockets)"] = "requests"
    @metric_types["Requests Failed Total"] = "requests"
    @metric_types["Requests In Application Queue"] = "requests"
    @metric_types["Requests In Native Queue"] = "requests"
    @metric_types["Requests Not Authorized"] = "requests"
    @metric_types["Requests Not Found"] = "requests"
    @metric_types["Requests Queued"] = "requests"
    @metric_types["Requests Rejected"] = "requests"
    @metric_types["Requests Succeeded"] = "requests"
    @metric_types["Requests Succeeded (WebSockets)"] = "requests"
    @metric_types["Requests Timed Out"] = "requests"
    @metric_types["Requests Total"] = "requests"
    @metric_types["Requests Total (WebSockets)"] = "requests"
    @metric_types["Requests/Sec"] = "requests"
    @metric_types["Search Requests/sec"] = "requests"
    @metric_types["Total Allowed Async I/O Requests"] = "requests"
    @metric_types["Total Blocked Async I/O Requests"] = "requests"
    @metric_types["Total CGI Requests"] = "requests"
    @metric_types["Total Copy Requests"] = "requests"
    @metric_types["Total count of failed CAL requests for authenticated users"] = "requests"
    @metric_types["Total count of failed CAL requests for SSL connections"] = "requests"
    @metric_types["Total Delete Requests"] = "requests"
    @metric_types["Total Get Requests"] = "requests"
    @metric_types["Total Head Requests"] = "requests"
    @metric_types["Total HTTP Requests Served"] = "requests"
    @metric_types["Total ISAPI Extension Requests"] = "requests"
    @metric_types["Total Lock Requests"] = "requests"
    @metric_types["Total Method Requests"] = "requests"
    @metric_types["Total Method Requests/sec"] = "requests"
    @metric_types["Total Mkcol Requests"] = "requests"
    @metric_types["Total Move Requests"] = "requests"
    @metric_types["Total Options Requests"] = "requests"
    @metric_types["Total Post Requests"] = "requests"
    @metric_types["Total Propfind Requests"] = "requests"
    @metric_types["Total Proppatch Requests"] = "requests"
    @metric_types["Total Put Requests"] = "requests"
    @metric_types["Total Rejected Async I/O Requests"] = "requests"
    @metric_types["Total Requests Served"] = "requests"
    @metric_types["Total Search Requests"] = "requests"
    @metric_types["Total Trace Requests"] = "requests"
    @metric_types["Total Unlock Requests"] = "requests"
    @metric_types["Trace Requests/sec"] = "requests"
    @metric_types["Unlock Requests/sec"] = "requests"
    @metric_types["WebSocket Active Requests"] = "requests"
    @metric_types["Application Restarts"] = "restarts"
    @metric_types["Worker Process Restarts"] = "restarts"
    @metric_types["Percent Of Max Concurrent Sessions"] = "sessions"
    @metric_types["Reliable Messaging Sessions Faulted"] = "sessions"
    @metric_types["Reliable Messaging Sessions Faulted Per Second"] = "sessions"
    @metric_types["Sessions Abandoned"] = "sessions"
    @metric_types["Sessions Active"] = "sessions"
    @metric_types["Sessions Current"] = "sessions"
    @metric_types["Sessions Timed Out"] = "sessions"
    @metric_types["Sessions Total"] = "sessions"
    @metric_types["State Server Sessions Abandoned"] = "sessions"
    @metric_types["State Server Sessions Active"] = "sessions"
    @metric_types["State Server Sessions Timed Out"] = "sessions"
    @metric_types["State Server Sessions Total"] = "sessions"
    @metric_types["Current Application Pool State"] = "state"
    @metric_types["# of Stubs"] = "stubs"
    @metric_types["Forms Authentication Success"] = "successes"
    @metric_types["Membership Authentication Success"] = "successes"
    @metric_types["Finalization Survivors"] = "survivors"
    @metric_types["In Memory Templates Cached"] = "templates"
    @metric_types["Templates Cached"] = "templates"
    @metric_types["# of current logical Threads"] = "threads"
    @metric_types["# of current physical Threads"] = "threads"
    @metric_types["# of current recognized threads"] = "threads"
    @metric_types["# of Exceps Thrown"] = "threads"
    @metric_types["# of total recognized threads"] = "threads"
    @metric_types["Active Threads Count"] = "threads"
    @metric_types["Maximum Threads Count"] = "threads"
    @metric_types["rate of recognized threads / sec"] = "threads"
    @metric_types["Total Threads"] = "threads"
    @metric_types["Transactions Aborted"] = "transactions"
    @metric_types["Transactions Committed"] = "transactions"
    @metric_types["Transactions Flowed"] = "transactions"
    @metric_types["Transactions Flowed Per Second"] = "transactions"
    @metric_types["Transactions Pending"] = "transactions"
    @metric_types["Transactions Total"] = "transactions"
    @metric_types["Transactions/Sec"] = "transactions"
    @metric_types["Cache API Trims"] = "trims"
    @metric_types["Cache Total Trims"] = "trims"
    @metric_types["Output Cache Trims"] = "trims"
    @metric_types["Cache API Turnover Rate"] = "turnovers"
    @metric_types["Cache Total Turnover Rate"] = "turnovers"
    @metric_types["Output Cache Turnover Rate"] = "turnovers"
    @metric_types["Current URIs Cached"] = "URIs"
    @metric_types["CurrentUrisCached"] = "URIs"
    @metric_types["Kernel: Current URIs Cached"] = "URIs"
    @metric_types["Kernel: Total Flushed URIs"] = "URIs"
    @metric_types["Kernel: Total URIs Cached"] = "URIs"
    @metric_types["Total Flushed URIs"] = "URIs"
    @metric_types["Total URIs Cached"] = "URIs"
    @metric_types["TotalFlushedUris"] = "URIs"
    @metric_types["TotalUrisCached"] = "URIs"
    @metric_types["Uris Registered for net.pipe"] = "URIs"
    @metric_types["Uris Registered for net.tcp"] = "URIs"
    @metric_types["Uris Unregistered for net.pipe"] = "URIs"
    @metric_types["Uris Unregistered for net.tcp"] = "URIs"
    @metric_types["Anonymous Users/sec"] = "users"
    @metric_types["Current Anonymous Users"] = "users"
    @metric_types["Current CAL count for authenticated users"] = "users"
    @metric_types["Current NonAnonymous Users"] = "users"
    @metric_types["Maximum Anonymous Users"] = "users"
    @metric_types["Maximum CAL count for authenticated users"] = "users"
    @metric_types["Maximum NonAnonymous Users"] = "users"
    @metric_types["NonAnonymous Users/sec"] = "users"
    @metric_types["Total Anonymous Users"] = "users"
    @metric_types["Total NonAnonymous Users"] = "users"
    @metric_types["Workflows Aborted"] = "workflows"
    @metric_types["Workflows Aborted Per Second"] = "workflows"
    @metric_types["Workflows Aborted/sec"] = "workflows"
    @metric_types["Workflows Completed"] = "workflows"
    @metric_types["Workflows Completed Per Second"] = "workflows"
    @metric_types["Workflows Completed/sec"] = "workflows"
    @metric_types["Workflows Created"] = "workflows"
    @metric_types["Workflows Created Per Second"] = "workflows"
    @metric_types["Workflows Created/sec"] = "workflows"
    @metric_types["Workflows Executing"] = "workflows"
    @metric_types["Workflows Idle Per Second"] = "workflows"
    @metric_types["Workflows Idle/sec"] = "workflows"
    @metric_types["Workflows In Memory"] = "workflows"
    @metric_types["Workflows Loaded"] = "workflows"
    @metric_types["Workflows Loaded Per Second"] = "workflows"
    @metric_types["Workflows Loaded/sec"] = "workflows"
    @metric_types["Workflows Pending"] = "workflows"
    @metric_types["Workflows Persisted"] = "workflows"
    @metric_types["Workflows Persisted Per Second"] = "workflows"
    @metric_types["Workflows Persisted/sec"] = "workflows"
    @metric_types["Workflows Runnable"] = "workflows"
    @metric_types["Workflows Suspended"] = "workflows"
    @metric_types["Workflows Suspended Per Second"] = "workflows"
    @metric_types["Workflows Suspended/sec"] = "workflows"
    @metric_types["Workflows Terminated"] = "workflows"
    @metric_types["Workflows Terminated Per Second"] = "workflows"
    @metric_types["Workflows Terminated/sec"] = "workflows"
    @metric_types["Workflows Unloaded"] = "workflows"
    @metric_types["Workflows Unloaded Per Second"] = "workflows"
    @metric_types["Workflows Unloaded/sec"] = "workflows"
    @metric_types["Free Megabytes"] = "megabytes"
    @metric_types["% Free Space"] = "%"
  end
end
