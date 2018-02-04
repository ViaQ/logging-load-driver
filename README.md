# logging-load-driver

The `loader` python program will generate a continuous sequence of lines
using the specified output method, either to stdout (default), a file,
or via syslog APIs.

Periodically, it will report statistics about the rate at which it has
generated the output. It offers an ability to adjust how often it
reports, and where to issue the reports. Once can ask for reports
inline, to stderr, another file, or via syslog.

The size of the log lines is a parameter to the program, as well as
whether to generate them all of the same size, or using a Gaussian
distribution with the size being the mean and a providing an optional
standard deviation.

One can provide a unique ID for the instance of the loader to embed in
the generated output, or it will generate a 32 character UUID by
default.

The `verify-loader` program in turn accepts a sequence of lines as
emitted by one or more the `loader` programs, and verifies they emitted
lines are receives in order, without any duplicates or skipped lines.
