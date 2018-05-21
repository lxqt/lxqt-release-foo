[Template of a checklist we could copy in a release specific one when needed which in turn could be used to do the
actual work.]

# Preparation

## Code

* [ ] look for tags "Milestone" on Github, discuss which ones do need fixing and which can optionally be postponed
* [ ] update translations

## Release archives

* [ ] create
* signing
  * [ ] make sure the PGP key that's about to be used is publicly available (*.pool.sks-keyservers.net or so)
  * [ ] sign

## Documentation

* Changelogs
  * [ ] write
  * [ ] review
* release announcements
  * lxqt.org
    * [ ] write
    * [ ] review
  * mailing list
    * [ ] write
    * [ ] review

# Release itself

## Upload

* [ ] downloads.lxqt.org
* GitHub (github.com/lxqt/\<repository\>/releases)   
  * [ ] tag commit in question: has to be an annotated tag, so best tagged via CLI in a local checkout
  * [ ] turn the tagged commit in a release in terms of the Web-UI ("Draft a new release")
  * [ ] upload archive and PGP key with usual filenames \<component\>-\<version\>.\<extension\>{,.asc} via "Attach binaries.." of the Web-UI   

(Rationale of last two steps:   
Tagging commits results in links named `zip` and `tar.gz` at  github.com/\<project\>/\<repository\>/releases which point to
github.com/\<project\>/\<repository\>/archive/\<version\>.\<extension\>, see e. g.
[releases ≤ 0.10 of lxqt-panel](https://github.com/lxqt/lxqt-panel/releases). If tagged commits are turned into a release in terms of the GitHub Web-UI
there are links named `Source code (<extension>)` which point to github.com/\<project\>/\<repository\>/archive/v\<version\>.\<extension\>, see e. g.
[releases ≤ 0.9.4 of meteo-qt](https://github.com/dglent/meteo-qt/releases).   
Both flavours yield different results when handled by web browsers or CLI downloaders like wget or curl respectively. Clicking the links in a Browser yields an archive named \<component\>-\<version\>.\<extension\> but downloading by those CLI tools always results in a file \<version\>.\<extension\> only.
Obviously the latter isn't desirable for various reasons.   
To my knowledge the only way to allow for downloading files named \<component\>-\<version\>.\<extension\> from the command line and hence by scripts is
uploading files named that way as depicted above. This was e. g. implemented in [release 0.10 of lxqt-admin](https://github.com/lxde/lxqt-admin/releases)
and mandates creating a release in terms of the Web-UI besides this isn't needed otherwise.)

## Publish release announcements

* [ ] lxqt.org
* [ ] mailing list
