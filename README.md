# fuse_wait

`fuse_wait` is a tool distributed with [NTFS-3G for Mac OS X](http://macntfs-3g.blogspot.com/). It executes a specified MacFUSE mount program with all of its arguments and displays an error message in case the mount operation fails. Because of a change in Mac OS X 10.7, `fuse_wait` (NTFS-3G 2010.10.2) displays a timeout error every time a NTFS volume is mounted.

This is an unofficial version of `fuse_wait` for Mac OS X 10.7, that fixes the issue. NTFS-3G and other filesystems using the tool should no longer display an error message when a volume is mounted successfully. Please note that this patch is only intended as a workaround until a new official version of NTFS-3G is released.

## Installation

An installer package containing the patched version of `fuse_wait` can be obtained at https://github.com/bfleischer/fuse_wait/downloads. It replaces `fuse_wait` in `/usr/local/bin`. To revert to the original version, reinstall NTFS-3G.

## Manual Installation

Clone this repository and run the following commands to build and install this version of `fuse_wait` on Mac OS X 10.7. Please note that Xcode and also the 10.7 SDK has to be installed for this to work.

    sudo mv /usr/local/bin/fuse_wait /usr/local/bin/fuse_wait.orig
    ./build.sh . /tmp /

### Yosemite Installation
Please note that out of the box Yosemite+XCode can not run the build.sh script. Use build_yosemite.sh for Yosemite.

To revert to the original `fuse_wait` program, run the following command in Terminal:

    sudo mv -f /usr/local/bin/fuse_wait.orig /usr/local/bin/fuse_wait
