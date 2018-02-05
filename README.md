# logging-load-driver

The `loader` python program will generate a continuous sequence of lines
using the specified output method, either to stdout (default), a file,
or via syslog APIs.

Periodically, it will report statistics about the rate at which it has
generated the output. It offers an ability to adjust how often it
reports, and where to issue the reports. One can ask for reports to
stdout, to stderr, another file, or via syslog.

The size of the log lines is an optional parameter to the program, as
well as whether to generate them all of a fixed size, or using a
Gaussian distribution, with the size being the mean, optionally
providing the standard deviation.

One can provide a unique ID for the instance of the loader to embed in
the generated output. Without one provided the loader will generate a 32
character UUID by default.

The `verify-loader` program in turn accepts a sequence of lines as
emitted by one or more the `loader` programs, and verifies the emitted
lines are receives in order, without any duplicates or skipped lines.

## Example Usage:

Emit logging load to `/dev/null`:
```
$ ./loader --output=/dev/null --report=stderr
loader stat: 0000010000   1894.830   1894.830
loader stat: 0000020000   1903.279   1899.045
loader stat: 0000030000   1896.060   1898.049
loader stat: 0000040000   1900.117   1898.565
loader stat: 0000050000   1880.544   1894.934
```

Rate-limit to 10 per second, reporting every 40 logs entries:
```
$ ./loader --output=/dev/null --report=stderr --msgpersec=10 --report-interval=40
loader stat: 0000000040     10.242     10.242
loader stat: 0000000080     10.000     10.119
loader stat: 0000000120      9.998     10.079
loader stat: 0000000160     10.003     10.060
loader stat: 0000000200     10.006     10.049
```

Simple emission of lines to stdout and have the sequence verified:
```
$ ./loader | ./verify-loader
 8f8f2882e66643d08c205804f7f5540a : 100 0 0
 8f8f2882e66643d08c205804f7f5540a : 200 0 0
 8f8f2882e66643d08c205804f7f5540a : 300 0 0
 8f8f2882e66643d08c205804f7f5540a : 400 0 0
 8f8f2882e66643d08c205804f7f5540a : 500 0 0
.
.
.
```
