---
layout: post
title: Release LXQt 0.12
slug: lxqt-012
date: 201n-nn-nn
promoted: true
categories: release
---

X


## General



The most important changes for users and developers/packagers respectively are summed up below.   

## Users

[reminder:] PCManFM-Qt vs. wallpapers on multi-monitor systems - outcome of https://github.com/lxde/lxqt/issues/1169 and https://github.com/lxde/lxqt/issues/1175 may be worth mentioning

In FreeBSD an issue impairing [xdg-user-dirs](https://www.freedesktop.org/wiki/Software/xdg-user-dirs/) when `$HOME` is a symbolic link was fixed [[PR](https://github.com/lxde/libqtxdg/pull/109)].   

## Developers / packagers

Several build tools were summarized in a new repository [lxqt-build-tools](https://github.com/lxde/lxqt-build-tools). So far these tools were spread over several other repositories and the corresponding components were hence a build dependency only because of those tools while not needed themselves. Complex dependencies like this, which were in particular affecting liblxqt, can be avoided by this new repository.   

The minimum required Qt version is now represented by CMake variable `QT_MINIMUM_VERSION` in file `CMakeLists.txt` of each repository.   
