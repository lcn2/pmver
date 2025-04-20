# pmver

Determine paths and the versions of perl modules.

Given one or more perl module names (with ::'s between components), print

- path to the pm file
- color (":")
- perl module version

This tool will search for pm files in common locations.  To see which paths are being searched, use `-v 3`.


# To install

```sh
sudo make install
```


# Examples

Search for `IO::Compress::Base` perl modules, and sub-modules:

```sh
$ /usr/local/bin/pmver IO::Compress::Base
```

Search for  `IO::Compress::Base` perl modules, and display the paths being searched:

```sh
$ /usr/local/bin/pmver -v 3 Compress::Gzip
```


# To use

```
/usr/local/bin/pmver [-h] [-v level] [-V] [-N] module ...

    -h          print help message and exit
    -v level    set verbosity level (def level: 0)
    -V          print version string and exit

    -N          do not process anything, just parse arguments (def: process something)

    module	perl module name with ::'s between components

Exit codes:
     0         all OK
     1         some internal tool exited non-zero
     2         -h and help string printed or -V and version string printed
     3         command line error
     4	       cannot find directories with perl modules
 >= 10         internal error

pmver version: 1.8.1 2025-03-26
```


# Reporting Security Issues

To report a security issue, please visit "[Reporting Security Issues](https://github.com/lcn2/pmver/security/policy)".
