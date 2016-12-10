---
layout: post
title: Introducing lxqt-build-tools, corresponding point releases
slug: introducing-lxqt-build-tools
date: 2016-11-01
promoted: true
categories: release
---

We would like to announce release 0.2.0, the first production release of lxqt-build-tools, as well as point releases of those components maintained by the LXQt project which had to be adjusted to lxqt-build-tools.   
These releases represent an effort to ease building and dependency management. They are not relevant for end-users.   


Repository [lxqt-build-tools](https://github.com/lxde/lxqt-build-tools) is summarizing several tools which are needed to build LXQt as well as some of the other components maintained by the project like [ComptonConf](https://github.com/lxde/compton-conf). These tools used to be spread over several other repositories and were now summarized in a single repository to ease building and dependency management. For details see file `README.md` of the [GitHub repository](https://github.com/lxde/lxqt-build-tools).   

Adjusting to lxqt-build-tools was needed in [lxqt-l10n](https://github.com/lxde/lxqt-l10n), [libsysstat](https://github.com/lxde/libsysstat), [liblxqt](https://github.com/lxde/liblxqt), [lxqt-qtplugin](https://github.com/lxde/lxqt-qtplugin), [libfm-qt](https://github.com/lxde/libfm-qt), [lxqt-common](https://github.com/lxde/lxqt-common), [pcmanfm-qt](https://github.com/lxde/pcmanfm-qt), [pavucontrol-qt](https://github.com/lxde/pavucontrol-qt), [qterminal](https://github.com/lxde/qterminal), [compton-conf](https://github.com/lxde/compton-conf), [obconf-qt](https://github.com/lxde/obconf-qt) and [lximage-qt](https://github.com/lxde/lximage-qt). All other components are depending on liblxqt which in turn is itself depending on lxqt-build-tools by now.   
While all those adjustments were introduced in these components' branch `master` and will hence be included in their next major or minor release we've decided to backport them to [release 0.11](http://lxqt.org/release/2016/09/24/lxqt-011-et-al/) as well. The latter is expected to remain in some distributions for up to several years and maintaining the corresponding point releases gets a lot easier by migrating release 0.11 to lxqt-build-tools.   

In order to switch current binary packages of release 0.11 to lxqt-build-tools one should obviously provide a package featuring lxqt-build-tools 0.2.0 and packages featuring the point releases as depicted above. But in addition all packages providing the unmodified components should be rebuilt against lxqt-build-tools and the point releases. Overall these steps should follow the order depicted [here](https://github.com/lxde/lxqt/wiki/Building-from-source#compiling).   