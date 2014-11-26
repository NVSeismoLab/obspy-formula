obspy-formula
=============
Salt formula for ObsPy

About
-----
Provides a Salt state for installing the ObsPy python framework. The default is to install the latest stable release using the supported methods, and packages from official operating system repositories whenever possible. A version of this formula valid for the current stable release is available in the [ObsPy repository](https://github.com/obspy/obspy/tree/master/misc/installer/salt-formula).

For production deployments, obspy can be installed by simply adding the `obspy` state to your targets.

States
------
* `obspy` - resolves all dependencies and performs normal stable install
* `obspy.dependencies` - installs only dependencies from OS package repository
* `obspy.pip` - installs obspy via pip PyPI
* `obspy.git` - installs obspy master branch via git repo
* `obspy.testing` - force upgrade of git install via pip - Development ONLY!

Strategy
--------
### Debian/Ubuntu install
Adds deb repo with gpg key, and installs package automatically

### Red Hat/CentOS/Scientific Linux
The current behavior is to fall back to a PIP install. The package dependencies will be installed via yum. This assumes you have already set up the EPEL repo, and does not check for this. The salt program is found in EPEL, so if you installed from there, or used the bootstrap salt script, this should already be set up.

### Arch Linux
Experimental PIP install, same as RHEL, install dependencies from package, then use PIP for the rest. This is currently set up to install the latest ObsPy release, which is not yet Python 3, so the dependencies and pip install all use the `python2` Arch packages (The python (3) deps are stubbed out in `map.jinja` in anticipation of this release).


Examples
--------
Assuming this is installed in base path (e.g. '/srv/salt/obspy')

Using top file:
```
# Example top.sls file snippet
# Installs obspy on all Linux machines.
base:
    'G@kernel:Linux':
        - match: compound
        - obspy
```
Using shell (dry run):
From salt master
```shell
$ sudo salt -G 'kernel:Linux' state.sls obspy test=True
```

Local or masterless minion
```shell
$ sudo salt-call --local state.sls obspy
```

Copyright
---------
Mark C. Williams (2014)

This formula was donated to the ObsPy project and is released under the GNU Lesser General Public License, Version 3 (LGPLv3)

